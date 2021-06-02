//
//  ShowListTableViewController.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "ShowListTableViewController.h"

@interface ShowListTableViewController () 

@property (nonatomic, strong) NSMutableArray *shows;
@property (nonatomic, strong) AppDelegate *delegate;
@end

@implementation ShowListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MyTVShows";
    self.shows = [TVShow allShows];
    
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                           selector:@selector(updateUI)
                                               name:NSManagedObjectContextObjectsDidChangeNotification
                                             object:_delegate.context];
    
}

-(void)updateUI{
    self.shows = [TVShow allShows];
    [self.tableView reloadData];
    NSLog(@"Updated data in ShowListTableViewController!");
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shows.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TVShowCell" forIndexPath:indexPath];
    
    // Configure the cell...
    TVShow *s = [self.shows objectAtIndex:indexPath.row];
    
    cell.textLabel.text = s.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ season(s)",[s countSeasons]];
    
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/
        

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"ShowShowDetail"]){
        if([segue.destinationViewController isKindOfClass:[ShowDetailTableViewController class]]){
            ShowDetailTableViewController *vc = (ShowDetailTableViewController *)segue.destinationViewController;
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            vc.theShow = [self.shows objectAtIndex:indexPath.row];
        }
    }
}


@end
