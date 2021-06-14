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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    Platform *platform = [[Platform alloc] initWithContext:appDelegate.context];
    platform.name = name;
    [appDelegate saveContext];
    return platform;
}

+(NSMutableArray *)allPlatforms{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allPlatforms = [[appDelegate.context executeFetchRequest:[Platform fetchRequest] error:nil] mutableCopy];
    return allPlatforms;
}

+(BOOL)existElementOfName:(NSString *)name;{
    if(![self platformOfName:name]) return NO;
    else return YES;
}

+(Platform *)platformOfName:(NSString *)name{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Platform"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name == %@", name]];
    NSMutableArray *platforms = [[appDelegate.context executeFetchRequest:request error:nil] mutableCopy];
    if (platforms.count == 0) {
        return nil;
    }else{
        return platforms[0];
    }
}

-(void)deletePlatform{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    [context deleteObject:self];
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

-(NSMutableArray *)allShows{
    return [[self.shows allObjects] mutableCopy];
}

-(void)setNewName:(NSString *)name{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    self.name = name;
    
    [appDelegate saveContext];
}

-(void)deleteElement{
    [self deletePlatform];
}

+(Platform *)elementOfName:(NSString *)name{
    return [Platform platformOfName:name];
}

-(NSString *)objectName{
    return @"Platform";
}

-(NSString *)displayName{
    return self.name;
}

@end
