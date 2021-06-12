//
//  Episode+Utils.m
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "Episode+Utils.h"

@implementation Episode (Utils)

+(Episode *) initWithName:(NSString *)name
                   season:(Season *)season{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    Episode *episode = [NSEntityDescription insertNewObjectForEntityForName:@"Episode" inManagedObjectContext:context];
    
    episode.name = name;
    episode.season = season;
    episode.score = -1;
    episode.watched = NO;
    
    [appDelegate saveContext];
        
    return episode;
}

-(void)setWatchedFlag:(BOOL)flag{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.watched = flag;
    [appDelegate saveContext];
}

-(void)setScoreFromIndex:(NSInteger)index{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    self.score = index+1;
    
    [appDelegate saveContext];
}


@end
