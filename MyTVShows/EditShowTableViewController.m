//
//  EditShowTableViewController.m
//  MyTVShows
//
//  Created by Alice on 13/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "EditShowTableViewController.h"

@interface EditShowTableViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *linkField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *scoreSegment;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property (nonatomic, strong) NSMutableArray *platforms;
@property (nonatomic, strong) NSMutableArray *categories;
@property (nonatomic, strong) NSMutableArray *flags;
@property (nonatomic, strong) NSMutableArray *platformsTmp;

@end

@implementation EditShowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categoryPicker.delegate = self;
    self.categoryPicker.dataSource = self;
    self.nameField.delegate = self;
    self.descriptionField.delegate = self;
    self.linkField.delegate = self;
    
    self.platforms = [Platform allPlatforms];
    self.platformsTmp = [[NSMutableArray alloc]init];
    self.categories = [Category allCategories];
    
    self.flags = [[NSMutableArray alloc]init];
        
    [self updateUI];
    
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                      action:@selector(resignKeyboard)];
    [self.tableView addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
    [self.scoreSegment addTarget:self
                          action:@selector(updateSegmentImage)
                forControlEvents:UIControlEventValueChanged];
       
}

-(void)updateUI{
    self.errorLabel.text = @"";
    self.imageView.image = [self.theShow realImage];
    self.nameField.text = self.theShow.name;
    self.descriptionField.text = self.theShow.notes;
    self.linkField.text = self.theShow.link;
    self.scoreSegment.selectedSegmentIndex = self.theShow.score - 1;
    [self.categoryPicker reloadAllComponents];
    [self setFlags];
    [self setPicker];
    [self.tableView reloadData];
    [self updateSegmentImage];
}
-(void)setPicker{
    //[self.view addSubview:self.categoryPicker];
    for(int i = 0; i<self.categories.count; i++){
        Category *cat = self.categories[i];
        if([cat.name isEqualToString:self.theShow.category.name]){
            [self.categoryPicker selectRow:i inComponent:0 animated:YES];
        }
    }
}

-(void)setFlags{
    for(int i = 0; i<self.platforms.count; i++){
        if([self.theShow isOnPlatform:self.platforms[i]]){
            self.flags[i] = [NSNumber numberWithInt: 1];
        }else{
            self.flags[i] = [NSNumber numberWithInt: 0];
        }
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.platforms.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"platformCell" forIndexPath:indexPath];
    
    Platform *p = [self.platforms objectAtIndex:indexPath.row];
    
    cell.textLabel.text = p.name;
    
    if([self.flags[indexPath.row] intValue] == 0){
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
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
    return self.categories.count;
}

-(NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    Category *cat = [self.categories objectAtIndex:row];
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
- (IBAction)editShow{

    for(int i = 0; i < self.flags.count; i++){
        if([self.flags[i] intValue] == 1){
            Platform *plat = self.platforms[i];
            [self.platformsTmp addObject:plat];
        }
    }
    if ([self.nameField.text isEqualToString:@""] || [self.descriptionField.text isEqualToString:@""] || self.scoreSegment.selectedSegmentIndex == UISegmentedControlNoSegment || self.platformsTmp.count == 0 || [self.descriptionField.text isEqualToString:@""] || (self.theShow.name != self.nameField.text && [TVShow existShowOfName:self.nameField.text])){
            if([self.nameField.text isEqualToString:@""] || (self.theShow.name != self.nameField.text && [TVShow existShowOfName:self.nameField.text])) self.errorLabel.text = @"Insert another name!";
            if(self.scoreSegment.selectedSegmentIndex == UISegmentedControlNoSegment) self.errorLabel.text = @"Insert a score!";
            if(self.platformsTmp.count == 0) self.errorLabel.text = @"Insert at least one platform!";
            if([self.descriptionField.text isEqualToString:@""]) self.errorLabel.text = @"Insert a description!";
            [self.nameField setPlaceholder:@"Insert a name"];
            [self.descriptionField setPlaceholder:@"Insert a description"];

    } else {
        NSString *selectedCategory = [self pickerView:self.categoryPicker
                                          titleForRow:[self.categoryPicker selectedRowInComponent:0]
                                         forComponent:0];

        [self.theShow editWithName:self.nameField.text
                    category:[Category categoryOfName:selectedCategory]
                   platforms:self.platformsTmp
                        link:self.linkField.text
                       notes:self.descriptionField.text
                       score:[NSNumber numberWithLong:self.scoreSegment.selectedSegmentIndex+1]
                       image:self.imageView.image];

        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

//keyboard

-(void)resignKeyboard {
    [self.nameField resignFirstResponder];
    [self.descriptionField resignFirstResponder];
    [self.linkField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.nameField){
        [self.descriptionField becomeFirstResponder];
    }
    else if (textField == self.descriptionField){
        [self.linkField becomeFirstResponder];
    }
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
