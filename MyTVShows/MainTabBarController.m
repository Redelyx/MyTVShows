//
//  MainTabBarController.m
//  MyTVShows
//
//  Created by Alice on 03/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@property (weak, nonatomic) IBOutlet UITabBar *myTabBar;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self setMyTabBar:self.myTabBar];
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if([viewController isKindOfClass:[MainNavigationController class]]){
        MainNavigationController *navigationController = (MainNavigationController *)viewController;
        navigationController.viewType = [[NSNumber numberWithUnsignedLong:self.selectedIndex] intValue];
    }
}

-(void)setMyTabBar:(UITabBar *)myTabBar{
    UITabBarItem *item0 = myTabBar.items[0];
    item0.image = [UIImage systemImageNamed:@"folder"];
    item0.selectedImage = [UIImage systemImageNamed:@"folder"];
    item0.title = @"All";
    UITabBarItem *item1 = myTabBar.items[1];
    item1.image = [UIImage systemImageNamed:@"bookmark"];
    item1.selectedImage = [UIImage systemImageNamed:@"bookmark"];
    item1.title = @"Categories";
    UITabBarItem *item2 = myTabBar.items[2];
    item2.image = [UIImage systemImageNamed:@"bookmark"];
    item2.selectedImage = [UIImage systemImageNamed:@"bookmark"];
    item2.title = @"Platforms";
    UITabBarItem *item3 = myTabBar.items[3];
    item3.image = [UIImage systemImageNamed:@"star"];
    item3.selectedImage = [UIImage systemImageNamed:@"star"];
    item3.title = @"Score";
}


@end
