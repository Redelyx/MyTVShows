//
//  Season+Utils.m
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "Season+Utils.h"

@implementation Season (Utils)
    
+(Season *) initWithName:(NSString *)name
                    show:(TVShow *)show{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    Season *season = [NSEntityDescription insertNewObjectForEntityForName:@"Season" inManagedObjectContext:context];
    
    season.name = name;
    season.show = show;
    [appDelegate saveContext];
        
    return season;
}

-(NSNumber *)countEpisodes{
    return [NSNumber numberWithUnsignedLong: self.episodes.count];
}

-(void)addNumberOfEpisodes:(NSNumber *)number{
    int n = [[self countEpisodes] intValue];
    
    for(int i = n; i<[number intValue]+n; i++){
        Episode *e = [Episode initWithName:[NSString stringWithFormat:@"Episode %i", i+1] season:self];
        [self addEpisodesObject:e];
    }
}

@end
