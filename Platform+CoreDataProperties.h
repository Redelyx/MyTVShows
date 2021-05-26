//
//  Platform+CoreDataProperties.h
//  MyTVShows
//
//  Created by Alice on 26/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "Platform+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Platform (CoreDataProperties)

+ (NSFetchRequest<Platform *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<TVShow *> *shows;

@end

@interface Platform (CoreDataGeneratedAccessors)

- (void)addShowsObject:(TVShow *)value;
- (void)removeShowsObject:(TVShow *)value;
- (void)addShows:(NSSet<TVShow *> *)values;
- (void)removeShows:(NSSet<TVShow *> *)values;

@end

NS_ASSUME_NONNULL_END
