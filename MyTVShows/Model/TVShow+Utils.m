//
//  TVShow+Utils.m
//  MyTVShows
//
//  Created by Alice on 26/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "TVShow+Utils.h"

@implementation TVShow (Utils)

+(TVShow *)initWithName:(NSString *)name
               category:(Category *)category
              platforms:(NSMutableArray *)platforms
                   link:(NSString *)link
                  notes:(NSString *)notes
                  score:(NSNumber *)score
                  image:(UIImage *)image
        numberOfSeasons:(NSNumber *)sNumber{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
    //TVShow *show = [[TVShow alloc] initWithContext:appDelegate.context];
        
    TVShow *show = [NSEntityDescription insertNewObjectForEntityForName:@"TVShow" inManagedObjectContext:appDelegate.context];
    
    show.name = name;
    [category addShowsObject:show];
    show.category = category;
    for(int i = 0; i<platforms.count; i++){
        [platforms[i] addShowsObject:show];
    }
    [show addPlatforms:[NSSet setWithArray:platforms]];
    show.link = link;
    show.notes = notes;
    show.score = [score intValue];
    show.image = UIImageJPEGRepresentation(image, 1);
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for(int i = 0; i<[sNumber intValue]; i++){
        Season *s = [Season initWithName:[NSString stringWithFormat:@"Season %i", i+1] show:show];
        [array addObject:s];
    }
    show.seasons = [NSOrderedSet orderedSetWithArray:array];
    
    [appDelegate saveContext];
    
    return show;
}

+(void)deleteTVShow:(TVShow *)show{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    //delete seasons
    NSMutableArray *allSeasons = [[context executeFetchRequest:[Season fetchRequest] error:nil] mutableCopy];
    for (Season *selectedSeasons in allSeasons) {
        if ([selectedSeasons.show.name isEqualToString:show.name]){
            NSMutableArray *allEpisodes = [[context executeFetchRequest:[Episode fetchRequest] error:nil] mutableCopy];
            //delete episodes
            for (Episode *selectedEpisodes in allEpisodes) {
                if ([selectedEpisodes.season.name isEqualToString:selectedSeasons.name]){
                    [context deleteObject:selectedEpisodes];
                }
            }
            [context deleteObject:selectedSeasons];
        }
    }
    [context deleteObject:show];
    [appDelegate saveContext];
}


+(NSMutableArray *)allShows{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    NSMutableArray *allShows = [[context executeFetchRequest:[TVShow fetchRequest] error:nil] mutableCopy];
    return allShows;
}

+(NSMutableArray *)allShowsOfCategory:(Category *)category{
    NSMutableArray *shows = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allShows = [[appDelegate.context executeFetchRequest:[TVShow fetchRequest] error:nil] mutableCopy];
    for (TVShow *selectedShows in allShows) {
        if ([selectedShows.category.name isEqualToString:category.name]) {
            [shows insertObject:selectedShows atIndex:shows.count];
        }
    }
    return shows;
}
 
+(NSMutableArray *)allShowsWithScore:(NSNumber *)score{
    NSMutableArray *shows = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allShows = [[appDelegate.context executeFetchRequest:[TVShow fetchRequest] error:nil] mutableCopy];
    for (TVShow *selectedShows in allShows) {
        if (selectedShows.score == [score intValue]){
            [shows insertObject:selectedShows atIndex:shows.count];
        }
    }
    return shows;
}

+(BOOL)existShowOfName:(NSString *)name{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allShows = [[appDelegate.context executeFetchRequest:[TVShow fetchRequest] error:nil] mutableCopy];
    for (TVShow *selectedShows in allShows) {
        if ([selectedShows.name isEqualToString:name]) {
            return YES;
        }
    }
    return NO;
}

-(NSNumber *)countSeasons{
    return [NSNumber numberWithUnsignedLong: self.seasons.count];
}

+(UIImage *)realImage:(NSData *)data{
    return [UIImage imageWithData:data];
}

-(NSMutableString *)printShowPlatforms{
    NSMutableString *string = [NSMutableString stringWithFormat:@""];

    for(Platform *plat in self.platforms){
        [string appendString:[NSString stringWithFormat:@" %@", plat.name]];
    }
    return string;
}
@end
