//
//  Episode+CoreDataProperties.h
//  MyTVShows
//
//  Created by Alice on 01/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "Episode+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Episode (CoreDataProperties)

+ (NSFetchRequest<Episode *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int64_t score;
@property (nonatomic) BOOL watched;
@property (nullable, nonatomic, retain) Season *season;

@end

NS_ASSUME_NONNULL_END
