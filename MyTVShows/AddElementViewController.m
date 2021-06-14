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
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UIButton *trashButton;

@end

@implementation AddElementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
    
}

- (IBAction)trash:(id)sender {
    if([self.element allShows].count == 0){
        [self.element deleteElement];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else self.errorLabel.text = [NSString stringWithFormat: @"%@ is not empty!",[self.element objectName]];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ElementDeleted!" object:nil];
}

-(void)updateUI{
    if(self.viewType == 0){
        [self.trashButton setEnabled:NO];
        if(self.elementType == 1) self.element = [[Category alloc]init];
        else self.element = [[Platform alloc]init];
        self.addLabel.text = [NSString stringWithFormat: @"Add new %@ name:",[self.element objectName]] ;
    }
    else{
        [self.trashButton setEnabled:YES];
        self.addLabel.text = [NSString stringWithFormat: @"Edit %@ name:",[self.element objectName]];
        self.nameField.text = [self.element displayName];
    }
    self.errorLabel.text = @"";
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)saveRequest:(id)sender {
    if (!([self.nameField.text isEqualToString:@""])){
        if(self.viewType == 0){
            if(![[self.element class] existElementOfName:self.nameField.text]){
                [[self.element class] initWithName:self.nameField.text];
                NSLog(@"%@", [self.element class]);
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else self.errorLabel.text = [NSString stringWithFormat: @"%@ already exists!",[self.element objectName]];
        }
        else{
            if(![[self.element class] existElementOfName:self.nameField.text]){
                [self.element setNewName:self.nameField.text];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else self.errorLabel.text = [NSString stringWithFormat: @"%@ already exists!",[self.element objectName]];
        }
    }
    else {
        self.errorLabel.text = @"Insert a name!";
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ElementDeleted!" object:nil];

}


@end
