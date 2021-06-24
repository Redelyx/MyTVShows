//
//  ManageElementTableViewController.m
//  MyTVShows
//
//  Created by Alice on 06/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "ManageElementTableViewController.h"

@interface ManageElementTableViewController ()

@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation ManageElementTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(updateUI)
                                                name:NSManagedObjectContextObjectsDidChangeNotification
                                              object:_appDelegate.context];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(updateUI)
                                                name:@"ElementChanged!"
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(updateUI)
                                                name:@"ElementDeleted!"
                                              object:nil];

}


-(void)updateUI{
    switch(self.elementType){
        case 1: self.elements = [Category allCategories]; break;
        case 2: self.elements = [Platform allPlatforms];  break;
        case 3: self.elements = [self myIntArray]; break;
        default: self.elements = [NSMutableArray arrayWithObject:@"Error"]; break;
    }
    [self.tableView reloadData];
}
    
- (NSMutableArray *)myIntArray{
    NSMutableArray *myInt = [[NSMutableArray alloc]init];
    for(NSInteger i = 1; i<=5; i++){
        [myInt addObject:[NSNumber numberWithInteger:i]];
    }
    return myInt;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (self.elementType) {
        case 3:return self.elements.count;
        default:return self.elements.count + 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.elementType == 3){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"elementCell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld star", indexPath.row + 1];
        return cell;
    }
    else{
        if(indexPath.row == 0){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addElementCell" forIndexPath:indexPath];
            return cell;
        }
        else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"elementCell" forIndexPath:indexPath];
            id e = [self.elements objectAtIndex:indexPath.row - 1];
            cell.textLabel.text = [e displayName];
            return cell;
        }
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"addElement"]){
        if([segue.destinationViewController isKindOfClass:[AddElementViewController class]]){
            AddElementViewController *vc = (AddElementViewController *)segue.destinationViewController;
            vc.elementType = self.elementType;
            vc.viewType = 0;
            NSLog(@"%i", self.elementType);
        }
    }
    if([segue.identifier isEqualToString:@"ShowMyTVShowList"]){
        if([segue.destinationViewController isKindOfClass:[ShowListTableViewController class]]){
            ShowListTableViewController *vc = (ShowListTableViewController *)segue.destinationViewController;
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            if(self.elementType == 1 || self.elementType == 2){
                vc.element = [self.elements objectAtIndex:indexPath.row - 1];
                vc.shows = [vc.element allShows];
                vc.title = [vc.element displayName];
            }else{
                vc.score = (int)indexPath.row + 1;
                [TVShow allShowsWithScore:[NSNumber numberWithInt:vc.score]];
                vc.title = [NSString stringWithFormat:@"%d star", vc.score];
            }
            vc.elementType = self.elementType;
        }
    }
    
}


@end
