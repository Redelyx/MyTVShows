//
//  TVShow+Utils.m
//  MyTVShows
//
//  Created by Alice on 26/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "TVShow+Utils.h"

@implementation TVShow (Utils)

+(TVShow *)initWithName:(NSString *)name category:(Category *)category platforms:(NSMutableArray *)platforms link:(NSString *)link notes:(NSString *)notes score:(NSNumber *)score image:(UIImage *)image seasons:(NSMutableArray *)seasons{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    TVShow *show = [NSEntityDescription insertNewObjectForEntityForName:@"TVShow" inManagedObjectContext:context];
    
    show.name = name;
    show.category = category;
    show.platforms = [NSSet setWithArray:platforms];
    show.link = link;
    show.notes = notes;
    show.score = [score intValue];
    //show.image = image;
    show.seasons = [NSOrderedSet orderedSetWithArray:seasons];
    
    return show;
}

+(void)deleteTVShow:(TVShow *)show{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    [context deleteObject:show];
    [appDelegate saveContext];
}

+(NSMutableArray *)allShowsOfCategory:(Category *)category{
    NSMutableArray *shows = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [TVShow fetchRequest];
    NSMutableArray *allShows = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    for (TVShow *selectedShows in allShows) {
        if ([selectedShows.category.name isEqualToString:category.name]) {
            [shows insertObject:selectedShows atIndex:shows.count];
        }
    }
    return shows;
}
 
+(NSMutableArray *)allShowsWithScore:(NSNumber *)score{
    
}


@end
