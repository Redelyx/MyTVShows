//
//  Season+CoreDataProperties.m
//  MyTVShows
//
//  Created by Alice on 26/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "Season+CoreDataProperties.h"

@implementation Season (CoreDataProperties)

+ (NSFetchRequest<Season *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Season"];
}

@dynamic name;
@dynamic show;
@dynamic episodes;

@end
