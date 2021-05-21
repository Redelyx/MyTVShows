//
//  ShowListTableViewController.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "ShowListTableViewController.h"
#import "ShowDetailTableViewController.h"
#import "TVShowList.h"
#import "Season.h"
#import "Episode.h"

@interface ShowListTableViewController ()

@property (nonatomic, strong) TVShowList *shows;

@end

@implementation ShowListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MyTVShows";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.shows = [[TVShowList alloc] init];
    
    Episode *e = [[Episode alloc] initWithScore:[NSNumber numberWithInt:0]];
    NSArray *es = [NSArray arrayWithObjects:e, e, e, e, e, e, e, e, e, e, e, nil];
    Season *se = [[Season alloc]initWithEpisodes:es];
    TVShow *s = [[TVShow alloc] initWithName:@"Fargo"
                                    category:@"Action"
                                   platforms:[NSArray arrayWithObjects:@"PrimeVideo", nil]
                                        link:@"www.primevideo.com"
                                       notes:@"fargo è una serie tv dei fratelli cohen 	ispirata al film fargo, non sono veramente accadute le cose che dice"
                                       score:[NSNumber numberWithInt:4]
                                     seasons:[NSArray arrayWithObjects:se, nil]];

    [self.shows add:s];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shows.size;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TVShowCell" forIndexPath:indexPath];
    
    // Configure the cell...
    TVShow *s = [self.shows getAtIndex:indexPath.row];
    
    cell.textLabel.text = s.displayName;
    
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
            TVShow *s = [self.shows getAtIndex:indexPath.row];
            vc.theShow = s;
        }
    }
}


@end
