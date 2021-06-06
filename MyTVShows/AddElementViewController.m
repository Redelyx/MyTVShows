//
//  AddElementViewController.m
//  MyTVShows
//
//  Created by Alice on 04/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "AddElementViewController.h"

@interface AddElementViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *addLabel;

@end

@implementation AddElementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self updateUI];

    NSLog(@" element %@", self.elementType);
}

-(void)updateUI{
    if(self.elementType == [NSNumber numberWithInt: 0]){
        self.addLabel.text = @"Add new Platform name:";
    }else{
        self.addLabel.text = @"Add new Category name:";
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)saveRequest:(id)sender {
    if (!([self.nameField.text isEqualToString:@""])){
        if(self.elementType == [NSNumber numberWithInt: 0]){
            [Platform initWithName:self.nameField.text];
        }else{
            [Category initWithName:self.nameField.text];
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.nameField setPlaceholder:@"Insert a name!"];
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
