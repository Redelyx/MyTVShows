//
//  SeasonDetailTableViewController.m
//  MyTVShows
//
//  Created by Alice on 25/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "SeasonDetailTableViewController.h"

@interface SeasonDetailTableViewController ()
@property (nonatomic, strong) AppDelegate *delegate;

@end

@implementation SeasonDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.theSeason.name;
    
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];

    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(updateUI)
                                                name:NSManagedObjectContextObjectsDidChangeNotification
                                              object:self.delegate.context];
}

-(void)updateUI{
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.theSeason countEpisodes] intValue];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"episodeCell" forIndexPath:indexPath];
    
    NSOrderedSet *eps = self.theSeason.episodes;
    
    Episode *s = [eps objectAtIndex:indexPath.row];
    
    cell.textLabel.text = s.name;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"ShowEpisodeDetail"]){
        if([segue.destinationViewController isKindOfClass:[EpisodeDetailViewController class]]){
            EpisodeDetailViewController *vc = (EpisodeDetailViewController *)segue.destinationViewController;
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            NSOrderedSet *eps = self.theSeason.episodes;
            Episode *s = [eps objectAtIndex:indexPath.row];
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
