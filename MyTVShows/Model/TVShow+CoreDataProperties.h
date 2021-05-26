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
@property (nullable, nonatomic, copy) NSString *category;
@property (nullable, nonatomic, copy) NSString *link;
@property (nullable, nonatomic, copy) NSString *notes;
@property (nonatomic) int16_t score;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSSet<Season *> *seasons;

@end

@interface TVShow (CoreDataGeneratedAccessors)

- (void)addSeasonsObject:(Season *)value;
- (void)removeSeasonsObject:(Season *)value;
- (void)addSeasons:(NSSet<Season *> *)values;
- (void)removeSeasons:(NSSet<Season *> *)values;

@end

NS_ASSUME_NONNULL_END
