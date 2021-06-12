//
//  OptionsTableViewController.m
//  MyTVShows
//
//  Created by Alice on 04/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "OptionsTableViewController.h"

@interface OptionsTableViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *editCell;
@property (nonatomic, strong) AppDelegate *appDelegate;
@end

@implementation OptionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                           selector:@selector(updateUI)
                                               name:NSManagedObjectContextObjectsDidChangeNotification
                                             object:self.appDelegate.context];
    
    [self updateUI];
}

-(void)updateUI{
    switch (self.viewType) {
        case 0: [self.editCell setHidden:YES]; break;
        case 1:
            if([Category categoryOfName:self.category.name] == nil)
                [self.navigationController popViewControllerAnimated:YES];
            else{
                self.editCell.textLabel.text = [NSString stringWithFormat:@"Edit category: %@", self.category.name];
            }
            break;
        case 2:
            if([Platform platformOfName:self.platform.name] == nil)
                [self.navigationController popViewControllerAnimated:YES];
            else {
                self.editCell.textLabel.text = [NSString stringWithFormat:@"Edit platform: %@", self.platform.name];
            }
            break;
        case 3: [self.editCell setHidden:YES]; break;
        default: [self.editCell setHidden:YES]; break;
    }
}

-(void)saveFileAsCSV{
    NSString *root = [self dataFilePath];
    
    NSMutableString *file = [[NSMutableString alloc]initWithString:@""];

    for(TVShow *show in self.shows){
        [file appendString:[show showCSVString]];
    }
    NSLog(@"%@",root);
    [file writeToFile:root atomically:YES encoding:NSUTF8StringEncoding error:NULL];
}

-(NSString *)dataFilePath {
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"shows.csv"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return 2;
        default: return 1;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 1){
        [self saveFileAsCSV];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
       
    if([segue.identifier isEqualToString:@"showPlatforms"]){
        if([segue.destinationViewController isKindOfClass:[ManageElementTableViewController class]]){
            ManageElementTableViewController *vc = (ManageElementTableViewController *)segue.destinationViewController;

                vc.elementType = 2;
                [[NSNotificationCenter defaultCenter]postNotificationName:@"ElementChanged!" object:nil];            
        }
    }
    if([segue.identifier isEqualToString:@"showCategories"]){
        if([segue.destinationViewController isKindOfClass:[ManageElementTableViewController class]]){
            ManageElementTableViewController *vc = (ManageElementTableViewController *)segue.destinationViewController;
            
                vc.elementType = 1;
                [[NSNotificationCenter defaultCenter]postNotificationName:@"ElementChanged!" object:nil];
        }
    }
    if([segue.identifier isEqualToString:@"editElement"]){
        if([segue.destinationViewController isKindOfClass:[AddElementViewController class]]){
            AddElementViewController *vc = (AddElementViewController *)segue.destinationViewController;
            
            vc.elementType = self.viewType;
            vc.platform = self.platform;
            vc.category = self.category;
            vc.viewType = 1;

        }
    }
}


@end
