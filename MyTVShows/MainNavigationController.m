//
//  mainNavigationController.m
//  MyTVShows
//
//  Created by Alice on 03/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    

    // Do any additional setup after loading the view.
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if([viewController isKindOfClass:[ShowListTableViewController class]]){
        ShowListTableViewController *vController = (ShowListTableViewController *)viewController;
        vController.viewType = self.viewType;
        //NSLog(@"NC %@",self.viewType);
        //vController.title = [self setTitle];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ListChanged!" object:self];
    }

}
-(NSString *)setTitle{
    switch([self.viewType intValue]){
        case 1:return @"Category";
        case 2:return @"Score";
        default:return @"MyTVShow";
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
