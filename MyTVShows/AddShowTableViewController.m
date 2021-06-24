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
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *linkField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *scoreSegment;
@property (weak, nonatomic) IBOutlet UITextField *sNumberField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property (nonatomic, strong) AppDelegate *delegate;
@property (nonatomic, strong) NSMutableArray *platforms;
@property (nonatomic, strong) NSMutableArray *flags;
@property (nonatomic, strong) NSMutableArray *platformsTmp;


@end

@implementation AddShowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categoryPicker.delegate = self;
    self.categoryPicker.dataSource = self;
    self.nameField.delegate = self;
    self.descriptionField.delegate = self;
    self.linkField.delegate = self;
    self.sNumberField.delegate = self;
    
    self.errorLabel.text = @"";
    
    self.platforms = [Platform allPlatforms];
    self.platformsTmp = [[NSMutableArray alloc]init];
    
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    self.flags = [[NSMutableArray alloc]init];
    
    for(int i = 0; i<self.platforms.count; i++){
        self.flags[i] = [NSNumber numberWithInt:0];
    }
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                           selector:@selector(updateUI)
                                               name:NSManagedObjectContextObjectsDidChangeNotification
                                             object:self.delegate.context];
    
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                      action:@selector(resignKeyboard)];
    [self.tableView addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
    
    [self.scoreSegment addTarget:self
                          action:@selector(updateSegmentImage)
                forControlEvents:UIControlEventValueChanged];
       

}

#pragma mark - Table view data source
-(void)updateUI{
    [self.categoryPicker reloadAllComponents];
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [Platform allPlatforms].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"platformCell" forIndexPath:indexPath];
    
    Platform *s = [self.platforms objectAtIndex:indexPath.row];
    
    cell.textLabel.text = s.name;
    
    if([self.flags[indexPath.row] intValue] == 0){
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", indexPath.row);
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryCheckmark){
        cell.accessoryType = UITableViewCellAccessoryNone;
        self.flags[indexPath.row] = [NSNumber numberWithInt:0];
    }else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.flags[indexPath.row] = [NSNumber numberWithInt:1];
    }
}

#pragma mark - Picker views data source
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return [Category allCategories].count;
}

-(NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    Category *cat = [[Category allCategories] objectAtIndex:row];
    return cat.name;
}

//ImageView
- (IBAction)pickImage:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(nonnull NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)updateSegmentImage{
    for(int i = 0; i<= self.scoreSegment.selectedSegmentIndex; i++){
        [self.scoreSegment setImage:[UIImage systemImageNamed:@"star.fill"] forSegmentAtIndex:i];
    }
    for(int i = (int)self.scoreSegment.numberOfSegments-1; i> self.scoreSegment.selectedSegmentIndex; i--){
        [self.scoreSegment setImage:[UIImage systemImageNamed:@"star"] forSegmentAtIndex:i];
    }
}

//Action buttons implementation
- (IBAction)addShow{

    for(int i = 0; i < self.flags.count; i++){
        if([self.flags[i] intValue] == 1){
            Platform *plat = self.platforms[i];
            [self.platformsTmp addObject:plat];
        }
    }
    if ([self.nameField.text isEqualToString:@""] || [TVShow existShowOfName:self.nameField.text] ||  [self.descriptionField.text isEqualToString:@""] || [self.sNumberField.text isEqualToString:@""] || self.scoreSegment.selectedSegmentIndex == UISegmentedControlNoSegment || self.platformsTmp.count == 0) {
            if([self.nameField.text isEqualToString:@""] || [TVShow existShowOfName:self.nameField.text]) self.errorLabel.text = @"Insert another name!";
            if(self.scoreSegment.selectedSegmentIndex == UISegmentedControlNoSegment) self.errorLabel.text = @"Insert a score!";
            if(self.platformsTmp.count == 0) self.errorLabel.text = @"Insert at least one platform!";
            if([self.descriptionField.text isEqualToString:@""]) self.errorLabel.text = @"Insert a description!";
            if([self.sNumberField.text isEqualToString:@""]) self.errorLabel.text = @"Insert numebr of Seasons!";
            self.errorLabel.text = @"Insert all info!";
            [self.nameField setPlaceholder:@"Insert a name"];
            [self.descriptionField setPlaceholder:@"Insert a description"];
            [self.sNumberField setPlaceholder:@"Insert n of seasons"];
    } else {

        NSString *selectedCategory = [self pickerView:self.categoryPicker
                                          titleForRow:[self.categoryPicker selectedRowInComponent:0]
                                         forComponent:0];
        
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle =NSNumberFormatterDecimalStyle;
        NSNumber *n = [f numberFromString:self.sNumberField.text];
        
        [TVShow initWithName:self.nameField.text
                    category:[Category categoryOfName:selectedCategory]
                   platforms:self.platformsTmp
                        link:self.linkField.text
                       notes:self.descriptionField.text
                       score:[NSNumber numberWithLong:self.scoreSegment.selectedSegmentIndex+1]
                       image:self.imageView.image
             numberOfSeasons:n];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}

//keyboard

-(void)resignKeyboard {
    [self.nameField resignFirstResponder];
    [self.descriptionField resignFirstResponder];
    [self.linkField resignFirstResponder];
    [self.sNumberField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.nameField){
        [self.descriptionField becomeFirstResponder];
    }
    else if (textField == self.descriptionField){
        [self.linkField becomeFirstResponder];
    }
    else if(textField == self.linkField){
        [self.sNumberField becomeFirstResponder];
    }
    [textField resignFirstResponder];
    return YES;
}
@end
