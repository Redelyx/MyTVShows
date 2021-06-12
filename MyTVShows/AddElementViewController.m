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
    switch (self.elementType) {
        case 1:
            if([self.category allShows].count == 0){
                [self.category deleteCategory];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else self.errorLabel.text = @"Category is not empty!";
            break;
        case 2:
            if([self.platform allShows].count == 0){
                [self.platform deletePlatform];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else self.errorLabel.text = @"Platform is not empty!";
            break;
        default:
            break;
    }
}

-(void)updateUI{
    if(self.viewType == 0){
        [self.trashButton setEnabled:NO];
        
        switch (self.elementType) {
            case 1: self.addLabel.text = @"Add new Category name:"; break;
            case 2: self.addLabel.text = @"Add new Platform name:"; break;
            default: break;
        }
    }
    else{
        [self.trashButton setEnabled:YES];
        switch (self.elementType) {
            case 1: self.addLabel.text = @"Edit Category name:";
                self.nameField.text = self.category.name; break;
            case 2: self.addLabel.text = @"Edit Platform name:";
                self.nameField.text = self.platform.name;break;
            default: break;
        }
    }
    self.errorLabel.text = @"";
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)saveRequest:(id)sender {
    if (!([self.nameField.text isEqualToString:@""])){
        if(self.viewType == 0){
                switch (self.elementType) {
                    case 1: if([Category categoryOfName:self.nameField.text] == nil){
                        [Category initWithName:self.nameField.text];
                        [self dismissViewControllerAnimated:YES completion:nil];
                    }
                    else self.errorLabel.text = @"Category already exists!"; break;
                    case 2:
                        if([Platform platformOfName:self.nameField.text] == nil){
                            [Platform initWithName:self.nameField.text];
                            [self dismissViewControllerAnimated:YES completion:nil];
                        }
                        else self.errorLabel.text = @"Platform already exists!"; break;
                    default: self.errorLabel.text = @"Error!"; break;
                }
        }
        else{
            switch (self.elementType) {
                case 1:
                    if([Category categoryOfName:self.nameField.text] == nil){
                        [self.category setNewName:self.nameField.text];
                        [self dismissViewControllerAnimated:YES completion:nil];
                    }
                    else self.errorLabel.text = @"Category already exists!"; break;
                case 2:
                    if([Platform platformOfName:self.nameField.text] == nil){
                        [self.platform setNewName:self.nameField.text];
                        [self dismissViewControllerAnimated:YES completion:nil];
                    }
                    else self.errorLabel.text = @"Platform already exists!"; break;
                default: self.errorLabel.text = @"Error!"; break;
            }
        }
    }
    else {
        self.errorLabel.text = @"Insert a name!";
    }
}


@end
