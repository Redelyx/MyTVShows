//
//  Season+CoreDataProperties.h
//  MyTVShows
//
//  Created by Alice on 01/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "Season+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Season (CoreDataProperties)

+ (NSFetchRequest<Season *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSOrderedSet<Episode *> *episodes;
@property (nullable, nonatomic, retain) TVShow *show;

@end

@interface Season (CoreDataGeneratedAccessors)

- (void)insertObject:(Episode *)value inEpisodesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromEpisodesAtIndex:(NSUInteger)idx;
- (void)insertEpisodes:(NSArray<Episode *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeEpisodesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInEpisodesAtIndex:(NSUInteger)idx withObject:(Episode *)value;
- (void)replaceEpisodesAtIndexes:(NSIndexSet *)indexes withEpisodes:(NSArray<Episode *> *)values;
- (void)addEpisodesObject:(Episode *)value;
- (void)removeEpisodesObject:(Episode *)value;
- (void)addEpisodes:(NSOrderedSet<Episode *> *)values;
- (void)removeEpisodes:(NSOrderedSet<Episode *> *)values;

@end

NS_ASSUME_NONNULL_END
