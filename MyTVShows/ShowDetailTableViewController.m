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
@property (nonatomic, strong) AppDelegate *delegate;


@end

@implementation ShowDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.theShow.name;
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                           selector:@selector(updateUI)
                                               name:NSManagedObjectContextObjectsDidChangeNotification
                                             object:self.delegate.context];
    
    self.imageView.image = [self.theShow realImage];
    self.categoryLabel.text = self.theShow.category.name;
    self.platformsLabel.text = [self.theShow platformsString];
    self.linkTextView.editable = NO;
    self.linkTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.linkTextView.text = self.theShow.link;
    self.notesLabel.text = self.theShow.notes;
    self.scoreLabel.text = [self.theShow scoreString];
}

-(void)updateUI{
    [self.tableView reloadData];
}

- (IBAction)deleteShow:(id)sender {
    [self.theShow deleteTVShow];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addSeason:(id)sender {
    NSLog(@"Add Episode pressed");
    [self.theShow addSeason];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.theShow countSeasons] intValue] + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addSeasonCell" forIndexPath:indexPath];
        return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"seasonCell" forIndexPath:indexPath];
        
        Season *s = [self.theShow.seasons objectAtIndex:indexPath.row-1];
        
        cell.textLabel.text = s.name;
        
        return cell;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowSeasonDetail"]){
        if([segue.destinationViewController isKindOfClass:[SeasonDetailTableViewController class]]){
            SeasonDetailTableViewController *vc = (SeasonDetailTableViewController *)segue.destinationViewController;
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            Season *s = [self.theShow.seasons objectAtIndex:indexPath.row-1];
            
            vc.theSeason = s;
        }
    }

}


@end
