//
//  AppDelegate.h
//  MyTVShows
//
//  Created by Alice on 19/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "TVShow+Utils.h"
#import "Category+Utils.h"
#import "Platform+Utils.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (nonatomic)NSManagedObjectContext *context;

- (void)saveContext;
+ (void)emptyData;


@end

