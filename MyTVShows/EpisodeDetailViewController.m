//
//  EpisodeDetailViewController.m
//  MyTVShows
//
//  Created by Alice on 25/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "EpisodeDetailViewController.h"

@interface EpisodeDetailViewController ()

@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *scoreSegment;
@property (nonatomic, strong) AppDelegate *delegate;
@property (nonatomic) BOOL localFlag;
@end

@implementation EpisodeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.title = self.theEpisode.name;
    [self updateUI];
    
    [self.scoreSegment addTarget:self
                          action:@selector(updateSegmentImage)
                forControlEvents:UIControlEventValueChanged];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                           selector:@selector(updateUI)
                                               name:NSManagedObjectContextObjectsDidChangeNotification
                                             object:_delegate.context];
    self.localFlag = self.theEpisode.watched;
}


-(void)updateUI{
    if(self.theEpisode.watched){
        [self.checkButton setImage:[UIImage systemImageNamed:@"checkmark"] forState:UIControlStateNormal];
    }else{
        [self.checkButton setImage:[UIImage systemImageNamed:@" "] forState:UIControlStateNormal];
    }
    
    if(self.theEpisode.score<=5 && self.theEpisode.score>=0){
        self.scoreSegment.selectedSegmentIndex = self.theEpisode.score-1;
    }
    
    [self updateSegmentImage];
}

- (IBAction)watchedCheck:(id)sender{
    if(self.localFlag){
        [self.checkButton setImage:[UIImage systemImageNamed:@" "] forState:UIControlStateNormal];
    }else{
        [self.checkButton setImage:[UIImage systemImageNamed:@"checkmark"] forState:UIControlStateNormal];
    }
    self.localFlag = !self.localFlag;
}

- (void)updateSegmentImage{
    for(int i = 0; i<= self.scoreSegment.selectedSegmentIndex; i++){
        [self.scoreSegment setImage:[UIImage systemImageNamed:@"star.fill"] forSegmentAtIndex:i];
    }
    for(int i = (int)self.scoreSegment.numberOfSegments-1; i> self.scoreSegment.selectedSegmentIndex; i--){
        [self.scoreSegment setImage:[UIImage systemImageNamed:@"star"] forSegmentAtIndex:i];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.theEpisode setScoreFromIndex:self.scoreSegment.selectedSegmentIndex];
    [self.theEpisode setWatchedFlag:self.localFlag];
}

@end
