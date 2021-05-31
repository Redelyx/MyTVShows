//
//  SeasonDetailTableViewController.m
//  MyTVShows
//
//  Created by Alice on 25/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "SeasonDetailTableViewController.h"
#import "EpisodeDetailViewController.h"
#import "AddEpisodesViewController.h"
#import "TVShow+Utils.h"
@interface SeasonDetailTableViewController ()


@end

@implementation SeasonDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.theSeason.name;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Season countEpisodesOfSeason:(Season *)self.theSeason] intValue];;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"episodeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Episode *s = [self.theSeason.episodes objectAtIndex:indexPath.row];
    
    
    cell.textLabel.text = s.name;
    
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
    if([segue.identifier isEqualToString:@"ShowEpisodeDetail"]){
        if([segue.destinationViewController isKindOfClass:[EpisodeDetailViewController class]]){
            EpisodeDetailViewController *vc = (EpisodeDetailViewController *)segue.destinationViewController;
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Episode *s = [self.theSeason.episodes objectAtIndex:indexPath.row];
            vc.theEpisode = s;
        }
    }
    
    if([segue.identifier isEqualToString:@"ShowAddEpisodes"]){
        if([segue.destinationViewController isKindOfClass:[AddEpisodesViewController class]]){
            AddEpisodesViewController *vc = (AddEpisodesViewController *)segue.destinationViewController;
                
            vc.theSeason = self.theSeason;
        }
    }
}


@end
