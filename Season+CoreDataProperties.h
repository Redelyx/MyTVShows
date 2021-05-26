//
//  Season+CoreDataProperties.h
//  MyTVShows
//
//  Created by Alice on 26/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "Season+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Season (CoreDataProperties)

+ (NSFetchRequest<Season *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) TVShow *show;
@property (nullable, nonatomic, retain) NSOrderedSet<Episode *> *episodes;

@end

@interface Season (CoreDataGeneratedAccessors)

- (void)addEpisodesObject:(Episode *)value;
- (void)removeEpisodesObject:(Episode *)value;
- (void)addEpisodes:(NSOrderedSet<Episode *> *)values;
- (void)removeEpisodes:(NSOrderedSet<Episode *> *)values;

@end

NS_ASSUME_NONNULL_END