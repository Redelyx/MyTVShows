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
    switch (self.elementType) {
        case 0: [self.editCell setHidden:YES]; break;
        case 3: [self.editCell setHidden:YES]; break;
        default:
            if(![[self.element class] existElementOfName:[self.element displayName]])
                [self.navigationController popViewControllerAnimated:YES];
            else{
                self.editCell.textLabel.text = [NSString stringWithFormat:@"Edit %@: %@", [self.element objectName], [self.element displayName]];
            }
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
    if([segue.identifier isEqualToString:@"editElement"]){
        if([segue.destinationViewController isKindOfClass:[AddElementViewController class]]){
            AddElementViewController *vc = (AddElementViewController *)segue.destinationViewController;
            
            vc.elementType = self.elementType;
            vc.element = self.element;
            vc.viewType = 1;

        }
    }
}


@end
