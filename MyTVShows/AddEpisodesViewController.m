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
    // Do any additional setup after loading the view.
}
- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)saveRequest:(id)sender {
    if (!([self.nEpisodesField.text isEqualToString:@""])){
        
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle =NSNumberFormatterDecimalStyle;
        NSNumber *n = [f numberFromString:self.nEpisodesField.text];
        
        [Season addEpisodesWithNumber:n toSeason:self.theSeason];
     
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.nEpisodesField setPlaceholder:@"Insert a number"];
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

@end
