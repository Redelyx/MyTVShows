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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *modifyButton;
@property (nonatomic, strong) AppDelegate *delegate;

@end

@implementation EpisodeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [self updateUI];
    
    self.modifyButton.title = @"Edit";
    
    [self.scoreSegment setEnabled:NO];
    [self.checkButton setEnabled:NO];
    
    [self.scoreSegment addTarget:self
                          action:@selector(updateSegmentImage)
                forControlEvents:UIControlEventValueChanged];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                           selector:@selector(updateUI)
                                               name:NSManagedObjectContextObjectsDidChangeNotification
                                             object:_delegate.context];
    
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
    NSLog(@"Updated data in EpisodeDetailViewController!");
}

- (IBAction)watchedCheck:(id)sender{
    [self.theEpisode setWatched];
}

- (IBAction)enableModify:(id)sender {
    if([self.scoreSegment isEnabled]){
        [self.scoreSegment setEnabled:NO];
        [self.checkButton setEnabled:NO];
        self.modifyButton.title = @"Edit";
        [self.theEpisode setScoreFromIndex:self.scoreSegment.selectedSegmentIndex];
        
    }
    else{
        [self.scoreSegment setEnabled:YES];
        [self.checkButton setEnabled:YES];
        self.modifyButton.title = @"Save";
    }
}

- (void)updateSegmentImage{
    for(int i = 0; i<= self.scoreSegment.selectedSegmentIndex; i++){
        [self.scoreSegment setImage:[UIImage systemImageNamed:@"star.fill"] forSegmentAtIndex:i];
    }
    for(int i = (int)self.scoreSegment.numberOfSegments-1; i> self.scoreSegment.selectedSegmentIndex; i--){
        [self.scoreSegment setImage:[UIImage systemImageNamed:@"star"] forSegmentAtIndex:i];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)scoreSegment:(id)sender {
}

@end
