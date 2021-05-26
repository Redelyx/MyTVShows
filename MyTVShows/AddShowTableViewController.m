//
//  AddShowTableViewController.m
//  MyTVShows
//
//  Created by Alice on 24/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "AddShowTableViewController.h"

@interface AddShowTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UITextField *platformField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *linkField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *scoreSegment;
@property (weak, nonatomic) IBOutlet UIStepper *episodesStepper;




@end

@implementation AddShowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _categoryPicker.delegate = self;
    _categoryPicker.dataSource = self;
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignKeyboard)];
    
    [self.tableView addGestureRecognizer:gestureRecognizer];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}
-(IBAction)addShow{
    NSString *selectedSport = [self pickerView:_categoryPicker
                                   titleForRow:[_categoryPicker selectedRowInComponent:0]
                                  forComponent:0];
    NSLog(@"%@",selectedSport);
    

    if (![_nameField.text isEqualToString:@""]){
        NSString *selectedCategory = [self pickerView:_categoryPicker titleForRow:[_categoryPicker selectedRowInComponent:0] forComponent:0];
    }
        
    /*if (!([_nameField.text isEqualToString:@""] || [_surnameField.text isEqualToString:@""])) {
        NSString *selectedSport = [self pickerView:_sportPicker titleForRow:[_sportPicker selectedRowInComponent:0] forComponent:0];
        
        [Athlete addAthleteWithName:_nameField.text surname:_surnameField.text favSport:selectedSport];
        
        [_nameField setText:@""];
        [_surnameField setText:@""];
        [_sportPicker selectRow:0 inComponent:0 animated:YES];
    } else {
        [_nameField setPlaceholder:@"Insert a name"];
        [_surnameField setPlaceholder:@"Insert a surname"];
    }*/
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return 8;
}

-(NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    NSArray *categories = [NSArray arrayWithObjects:@"Action", @"Comedy", @"Documentary", @"Drama", @"Sci-fi", @"Fantasy", @"Romantic", @"Thriller", nil];
    return [categories objectAtIndex:row];
}

-(void)resignKeyboard {
    [_nameField resignFirstResponder];
    [_platformField resignFirstResponder];
    [_descriptionField resignFirstResponder];
    [_linkField resignFirstResponder];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
