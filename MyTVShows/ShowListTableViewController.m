//
//  ShowListTableViewController.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "ShowListTableViewController.h"

@interface ShowListTableViewController () 

@property (strong, nonatomic) IBOutlet UITableView *searchBar;
@property (nonatomic, strong) AppDelegate *delegate;
@end

@implementation ShowListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                           selector:@selector(updateUI)
                                               name:NSManagedObjectContextObjectsDidChangeNotification
                                             object:_delegate.context];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                           selector:@selector(updateUI)
                                               name:@"ListChanged!"
                                             object:nil];
    
}
-(NSMutableArray *)pickList{
    if(self.element ||  self.showAll){
        if([self.element respondsToSelector:@selector(name)]){
            if([Category categoryOfName:[self.element name]] || [Platform platformOfName:[self.element name]]){
                return [self.element allShows];
            }else{
                [self.navigationController popViewControllerAnimated:YES];
                return [[NSArray arrayWithObject:@"Empty"]mutableCopy];
            }
        }else{
            if([self.element isKindOfClass:[NSNumber class]]){
                return [TVShow allShowsWithScore:self.element];
            }
            else return [TVShow allShows];
        }
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
        return [[NSArray arrayWithObject:@"Empty"]mutableCopy];
    }
    /*switch (self.viewType) {

        case 1:
            if([Category categoryOfName:self.category.name] == nil)
                [self.navigationController popViewControllerAnimated:YES];
            else{
                return [self.category allShows];
            }
            
        case 2:
            if([Platform platformOfName:self.platform.name] == nil)
                [self.navigationController popViewControllerAnimated:YES];
            else{
                return [self.platform allShows];
            }
            
        case 3: return [TVShow allShowsWithScore:[NSNumber numberWithInt:self.score]];
            
        default: return [TVShow allShows];
    }*/
}

-(void)setTitle{
    switch(self.viewType){
        case 1:self.title = @"Category"; break;
        case 2:self.title = @"Platform"; break;
        case 3:self.title = @"Score"; break;
        default:self.title = @"MyTVShow"; break;
    }
}
-(void)updateUI{
    self.shows = [self pickList];
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shows.count+1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addTVShowCell" forIndexPath:indexPath];
        return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TVShowCell" forIndexPath:indexPath];
        
        TVShow *s = [self.shows objectAtIndex:indexPath.row - 1];
        
        cell.textLabel.text = s.name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu season(s)", s.seasons.count];
        
        return cell;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowShowDetail"]){
        if([segue.destinationViewController isKindOfClass:[ShowDetailTableViewController class]]){
            ShowDetailTableViewController *vc = (ShowDetailTableViewController *)segue.destinationViewController;
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            vc.theShow = [self.shows objectAtIndex:indexPath.row - 1];
        }
    }
    if([segue.identifier isEqualToString:@"ShowOptions"]){
        if([segue.destinationViewController isKindOfClass:[OptionsTableViewController class]]){
            OptionsTableViewController *vc = (OptionsTableViewController *)segue.destinationViewController;
            vc.category = self.category;
            vc.platform = self.platform;
            vc.viewType = self.viewType;
            vc.shows = self.shows;
        }
    }
}


@end
