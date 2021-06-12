//
//  AddEpisodesViewController.m
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "AddEpisodesViewController.h"

@interface AddEpisodesViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nEpisodesField;


@end

@implementation AddEpisodesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)saveRequest:(id)sender {
    if (!([self.nEpisodesField.text isEqualToString:@""])){
        
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle =NSNumberFormatterDecimalStyle;
        NSNumber *n = [f numberFromString:self.nEpisodesField.text];
        
        [self.theSeason addNumberOfEpisodes:n];
     
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.nEpisodesField setPlaceholder:@"Insert a number"];
    }
    
}

@end
