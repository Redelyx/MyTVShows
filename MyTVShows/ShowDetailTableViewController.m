//
//  ShowDetailTableViewController.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "ShowDetailTableViewController.h"
#import "SeasonDetailTableViewController.h"

@interface ShowDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *platformsLabel;
@property (weak, nonatomic) IBOutlet UITextView *linkTextView;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ShowDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.theShow.name;
    
    self.imageView.image = [TVShow realImage:self.theShow.image];
    self.categoryLabel.text = self.theShow.category.name;
    self.platformsLabel.text = [Platform platformsString:self.theShow.platforms];
    self.linkTextView.editable = NO;
    self.linkTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.linkTextView.text = self.theShow.link;
    self.notesLabel.text = self.theShow.notes;
    self.scoreLabel.text = [NSString stringWithFormat:@"%@/5", [NSNumber numberWithLong:self.theShow.score]];
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
    return [[self.theShow countSeasons] intValue];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"seasonCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Season *s = [self.theShow.seasons objectAtIndex:indexPath.row];
    
    
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
    if([segue.identifier isEqualToString:@"ShowSeasonDetail"]){
        if([segue.destinationViewController isKindOfClass:[SeasonDetailTableViewController class]]){
            SeasonDetailTableViewController *vc = (SeasonDetailTableViewController *)segue.destinationViewController;
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Season *s = [self.theShow.seasons objectAtIndex:indexPath.row];
            //NSLog([NSString stringWithFormat:@"%ld, %@", indexPath.row, s.name]);
            
            vc.theSeason = s;
        }
    }
}


@end
