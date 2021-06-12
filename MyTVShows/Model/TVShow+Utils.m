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

-(void)deleteTVShow{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    //delete seasons
    NSMutableArray *allSeasons = [[self.seasons array] mutableCopy];
    for (Season *selectedSeasons in allSeasons) {
        NSMutableArray *allEpisodes = [[selectedSeasons.episodes array] mutableCopy];
        //delete episodes
        for (Episode *selectedEpisodes in allEpisodes) {
            [context deleteObject:selectedEpisodes];
        }
        [context deleteObject:selectedSeasons];
    }
    [context deleteObject:self];
    [appDelegate saveContext];
}


+(NSMutableArray *)allShows{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
    [request setSortDescriptors:@[[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES]]];
    NSMutableArray *allShows = [[context executeFetchRequest:request error:nil] mutableCopy];
    return allShows;
}

+(NSMutableArray *)allShowsOfCategory:(Category *)category{
    NSMutableArray *shows = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"category == %@", category]];
    shows = [[appDelegate.context executeFetchRequest:request error:nil] mutableCopy];
    return shows;
}

+(NSMutableArray *)allShowsOfPlatform:(Platform *)platform{
    NSMutableArray *shows = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"platform == %@", platform]];
    shows = [[appDelegate.context executeFetchRequest:request error:nil] mutableCopy];
    return shows;
}

+(NSMutableArray *)allShowsThatSatisfyPredicate:(NSPredicate *)predicate{
    NSMutableArray *shows = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
    [request setPredicate:predicate];
    shows = [[appDelegate.context executeFetchRequest:request error:nil] mutableCopy];
    return shows;
}
 
+(NSMutableArray *)allShowsWithScore:(NSNumber *)score{
    NSMutableArray *shows = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"score == %i", [score intValue]]];
    shows = [[appDelegate.context executeFetchRequest:request error:nil] mutableCopy];
    return shows;
}

+(BOOL)existShowOfName:(NSString *)name{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name == %@", name]];
    NSMutableArray *shows = [[appDelegate.context executeFetchRequest:request error:nil] mutableCopy];
    if(shows.count == 0){
        return NO;
    }else{
        return YES;
    }
}

-(NSNumber *)countSeasons{
    return [NSNumber numberWithUnsignedLong: self.seasons.count];
}

-(UIImage *)realImage{
    return [UIImage imageWithData:self.image];
}

-(NSMutableString *)printShowPlatforms{
    NSMutableString *string = [NSMutableString stringWithFormat:@""];

    for(Platform *plat in self.platforms){
        [string appendString:[NSString stringWithFormat:@" %@", plat.name]];
    }
    return string;
}

-(void)addSeason{
    int n = [self.countSeasons intValue];
    
    for(int i = n; i<1+n; i++){
        Season *s = [Season initWithName:[NSString stringWithFormat:@"Season %i", i+1] show:self];
        [self addSeasonsObject:s];
    }
}

-(NSString *)scoreString{
    return [NSString stringWithFormat:@"%@/5", [NSNumber numberWithLong:self.score]];
}

-(NSString *)platformsString{
    return [Platform platformsString:self.platforms];
}

-(NSString *)showCSVString{
    NSMutableString *record = [[NSString stringWithFormat:@"%@, %@, %@, %@, %lld,", self.name, self.category.name,self.link, self.notes, self.score] mutableCopy];
    NSMutableArray *arr = [[self.platforms allObjects] mutableCopy];
    for(int i = 0; i<self.platforms.count; i++){
        Platform *plat = arr[i];
        [record appendFormat:@" %@", plat.name];
        if(i != self.platforms.count-1){
            [record appendString:@","];
        }
    }
    [record appendString:@"\n"];
    return record;
}
@end
