//
//  TVShow+CoreDataClass.h
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Category, Platform, Season;

NS_ASSUME_NONNULL_BEGIN

@interface TVShow : NSManagedObject

@end

NS_ASSUME_NONNULL_END

#import "TVShow+CoreDataProperties.h"
