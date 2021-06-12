//
//  mainNavigationController.m
//  MyTVShows
//
//  Created by Alice on 03/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if([viewController isKindOfClass:[ShowListTableViewController class]]){
        ShowListTableViewController *vController = (ShowListTableViewController *)viewController;
        vController.viewType = self.viewType;
        vController.shows = [TVShow allShows];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ListChanged!" object:self];
    }
    if([viewController isKindOfClass:[ManageElementTableViewController class]]){
        ManageElementTableViewController *vController = (ManageElementTableViewController *)viewController;
        vController.elementType = self.viewType;
        switch(self.viewType){
            case 1: vController.elements = [Category allCategories]; vController.title = [self setTitle]; break;
            case 2: vController.elements = [Platform allPlatforms]; vController.title = [self setTitle]; break;
            case 3: vController.elements = [self myIntArray]; vController.title = [self setTitle]; break;
            default: vController.elements = [NSMutableArray arrayWithObject:@"Error"]; vController.title = [self setTitle]; break;
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ListChanged!" object:self];
    }

}

- (NSMutableArray *)myIntArray{
    NSMutableArray *myInt = [[NSMutableArray alloc]init];
    for(NSInteger i = 1; i<=5; i++){
        [myInt addObject:[NSNumber numberWithInteger:i]];
    }
    return myInt;
}

-(NSString *)setTitle{
    switch(self.viewType){
        case 1:return @"Categories";
        case 2:return @"Platforms";
        case 3:return @"Score";
        default:return @"MyTVShow";
    }
}

@end
