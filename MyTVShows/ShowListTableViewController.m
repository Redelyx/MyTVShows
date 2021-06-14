//
//  ShowListTableViewController.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "ShowListTableViewController.h"

@interface ShowListTableViewController () 

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
-(void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSMutableArray *)pickList{
    switch (self.elementType) {
        case 0: return [TVShow allShows];
        case 3: return [TVShow allShowsWithScore:[NSNumber numberWithInt:self.score]];
        default:
            if(![[self.element class] existElementOfName:[self.element displayName]])
                [self.navigationController popViewControllerAnimated:YES];
                return [self.element allShows];
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
            vc.element = self.element;
            vc.elementType = self.elementType;
            vc.shows = self.shows;
        }
    }
}


@end
