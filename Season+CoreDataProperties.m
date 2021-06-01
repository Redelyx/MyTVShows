//
//  Season+CoreDataProperties.m
//  MyTVShows
//
//  Created by Alice on 01/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "Season+CoreDataProperties.h"

@implementation Season (CoreDataProperties)

+ (NSFetchRequest<Season *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Season"];
}

@dynamic name;
@dynamic episodes;
@dynamic show;

@end
