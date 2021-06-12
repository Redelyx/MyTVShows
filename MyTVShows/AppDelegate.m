//
//  AppDelegate.m
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "AppDelegate.h"
#import "AddShowTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.context = self.persistentContainer.viewContext;
    //[AppDelegate emptyData];
    //[self createData];
    //[self createSample];
    [self dataSize];
    return YES;
}

-(void)dataSize{
    NSMutableArray *shows = [TVShow allShows];
    NSLog(@"shows: %lu", shows.count);
    NSMutableArray *plats = [Platform allPlatforms];
    NSLog(@"platforms: %lu", plats.count);
    NSMutableArray *cats = [Category allCategories];
    NSLog(@"categories: %lu", cats.count);
}

+(void)emptyData{
    NSMutableArray *shows = [TVShow allShows];
    for(TVShow *show in shows){
        [show deleteTVShow];
    }
    NSLog(@"shows: %lu", shows.count);
    
    
    NSMutableArray *plats = [Platform allPlatforms];
    for(Platform *plat in plats){
        [plat deletePlatform];
    }
    NSLog(@"plats: %lu", plats.count);
    
    NSMutableArray *cats = [Category allCategories];
    for(Category *cat in cats){
        [cat deleteCategory];
    }
    NSLog(@"cats: %lu", cats.count);

    NSLog(@"Data deleted!");
}


-(void)createSample{
    if(![TVShow existShowOfName:@"Fargo"]){
        Category *cat = [Category categoryOfName:@"Action"];
        Platform *plat = [Platform platformOfName:@"PrimeVideo"];
        Platform *plat1 = [Platform platformOfName:@"HBO"];
        [TVShow initWithName:@"Fargo"
                    category:cat
                   platforms:[NSMutableArray arrayWithObjects:plat, plat1, nil]
                        link:@"www.primevideo.com"
                       notes:@"Fargo is a Tv series based on the film Fargo. Despite all of the disclaimers not all the stories in the series are true."
                       score:[NSNumber numberWithInt:4]
                       image:[UIImage imageNamed:@""]
             numberOfSeasons:[NSNumber numberWithInt:4]];
    }
}

-(void)createData{
    
    NSArray *categories = [NSArray arrayWithObjects:@"Action", @"Comedy", @"Documentary", @"Drama", @"Sci-fi", @"Fantasy", @"Romantic", @"Thriller", nil];
    for(NSString *cat in categories){
        [Category initWithName:cat];
    }
    
    NSArray *platforms = [NSArray arrayWithObjects:@"Netflix", @"PrimeVideo", @"RaiPlay", @"Sky", @"HBO", @"Hulu", @"Disney+", nil];
    for(NSString *plat in platforms){
        [Platform initWithName:plat];
    }
}

-(void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


-(void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


-(void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


-(void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

-(void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"MyTVShow"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSError *error = nil;
    if ([self.context hasChanges] && ![self.context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}


@end
