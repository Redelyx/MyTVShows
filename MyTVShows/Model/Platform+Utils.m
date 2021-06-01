//
//  Platform+Utils.m
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "Platform+Utils.h"

@implementation Platform (Utils)

+(Platform *)initWithName:(NSString *)name{
    //if(![Platform existPlatformOfName:name]){
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        Platform *platform = [[Platform alloc] initWithContext:appDelegate.context];
        platform.name = name;
        [appDelegate saveContext];
        return platform;
    //}
    //else return nil;
}

+(NSMutableArray *)allPlatforms{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allPlatforms = [[appDelegate.context executeFetchRequest:[Platform fetchRequest] error:nil] mutableCopy];
    return allPlatforms;
}

+(BOOL)existPlatformOfName:(NSString *)name{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allPlatforms = [[appDelegate.context executeFetchRequest:[Platform fetchRequest] error:nil] mutableCopy];
    for (Platform *selectedPlatform in allPlatforms) {
        if ([selectedPlatform.name isEqualToString:name]) {
            return YES;
        }
    }
    return NO;
}

+(Platform *)platformOfName:(NSString *)name{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allPlatforms = [[appDelegate.context executeFetchRequest:[Platform fetchRequest] error:nil] mutableCopy];
    for (Platform *selectedPlatform in allPlatforms) {
        if ([selectedPlatform.name isEqualToString:name]) {
            return selectedPlatform;
        }
    }
    return nil;
}

+(void)deletePlatform:(Platform *)platform{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    [context deleteObject:platform];
    [appDelegate saveContext];
}

+(NSString *)platformsString:(NSSet *)platforms{
    NSMutableString *platformStringList = [[NSMutableString alloc] init];
    platformStringList = [NSMutableString stringWithFormat:@""];
    for(Platform *plat in platforms){
            [platformStringList appendString:[NSString stringWithFormat:@"%@ ", plat.name]];
    }
    return platformStringList;
}

@end
