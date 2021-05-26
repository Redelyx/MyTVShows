//
//  TVShow+CoreDataProperties.h
//  MyTVShows
//
//  Created by Alice on 26/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "TVShow+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TVShow (CoreDataProperties)

+ (NSFetchRequest<TVShow *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *link;
@property (nullable, nonatomic, copy) NSString *notes;
@property (nonatomic) int64_t score;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSOrderedSet<Season *> *seasons;
@property (nullable, nonatomic, retain) Category *category;
@property (nullable, nonatomic, retain) NSSet<Platform *> *platforms;

@end

@interface TVShow (CoreDataGeneratedAccessors)

- (void)addSeasonsObject:(Season *)value;
- (void)removeSeasonsObject:(Season *)value;
- (void)addSeasons:(NSOrderedSet<Season *> *)values;
- (void)removeSeasons:(NSOrderedSet<Season *> *)values;

- (void)addPlatformsObject:(Platform *)value;
- (void)removePlatformsObject:(Platform *)value;
- (void)addPlatforms:(NSSet<Platform *> *)values;
- (void)removePlatforms:(NSSet<Platform *> *)values;

@end

NS_ASSUME_NONNULL_END
