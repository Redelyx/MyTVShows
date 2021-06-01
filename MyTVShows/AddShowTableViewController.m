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
@property (weak, nonatomic) IBOutlet UILabel *platformField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *linkField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *scoreSegment;
@property (weak, nonatomic) IBOutlet UITextField *snumberField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) NSString *imageName;
@property (nonatomic, strong) NSMutableArray *platforms;
@property (nonatomic, strong) NSMutableString *platformsString;
@end

@implementation AddShowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _categoryPicker.delegate = self;
    _categoryPicker.dataSource = self;
    _platformPicker.delegate = self;
    _platformPicker.dataSource = self;
    _platforms = [[NSMutableArray alloc]init];
    _platformsString = [[NSMutableString alloc] init];
    self.platformField.text = @"";
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignKeyboard)];
    
    [self.tableView addGestureRecognizer:gestureRecognizer];

    [self.scoreSegment addTarget:self
                          action:@selector(updateSegmentImage)
                forControlEvents:UIControlEventValueChanged];
       

}

#pragma mark - Table view data source
-(void)updateUI{

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

#pragma mark - Picker views data source
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    switch(thePickerView.tag){
        case 0: return [Category allCategories].count;
        case 1: return [Platform allPlatforms].count;
        default: return 0;
    }
}

-(NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    if(thePickerView.tag == 0){
        Category *cat = [[Category allCategories] objectAtIndex:row];
        return cat.name;
    }
    else{
        Platform *plat = [[Platform allPlatforms] objectAtIndex:row];
        return plat.name;
    }
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

    if (!([self.nameField.text isEqualToString:@""] || [TVShow existShowOfName:self.nameField.text] || [self.snumberField.text isEqualToString:@""] || self.scoreSegment.selectedSegmentIndex == UISegmentedControlNoSegment)) {
        NSString *selectedCategory = [self pickerView:_categoryPicker
                                          titleForRow:[_categoryPicker selectedRowInComponent:0]
                                         forComponent:0];
        
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle =NSNumberFormatterDecimalStyle;
        
        NSNumber *n = [f numberFromString:self.snumberField.text];
        
        NSMutableArray *plats = [[NSMutableArray alloc] init];
        
        for(Platform *plat in self.platforms){
            [plats addObject:plat];
        }
        
       
        [TVShow initWithName:self.nameField.text
                    category:[Category categoryOfName:selectedCategory]
                   platforms:plats
                        link:self.linkField.text
                       notes:self.descriptionField.text
                       score:[NSNumber numberWithLong:self.scoreSegment.selectedSegmentIndex+1]
                       image:self.imageView.image
             numberOfSeasons:n];

        [self.nameField setText:@""];
        [self.descriptionField setText:@""];
        [self.linkField setText:@""];
        [self.snumberField setText:@""];
        [self.platformField setText:@""];
        
        [self.navigationController popViewControllerAnimated:YES];
        
        
    } else {
        [self.nameField setPlaceholder:@"Insert a name"];
        [self.descriptionField setPlaceholder:@"Insert a description"];
        [self.snumberField setPlaceholder:@"Insert n of seasons"];
    }
    

}

- (IBAction)addPlatform:(id)sender {
    NSString *selectedPlatform = [self pickerView:_platformPicker
                                      titleForRow:[_platformPicker selectedRowInComponent:0]
                                     forComponent:0];
    if(![self.platformsString containsString:selectedPlatform]){
        [self.platforms addObject:[Platform platformOfName:selectedPlatform]];
        [self.platformsString appendString:[NSString stringWithFormat:@"%@ ", selectedPlatform]];
        _platformField.text = self.platformsString;
    }
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
