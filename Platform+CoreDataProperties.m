//
//  Platform+CoreDataProperties.m
//  MyTVShows
//
//  Created by Alice on 01/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "Platform+CoreDataProperties.h"

@implementation Platform (CoreDataProperties)

+ (NSFetchRequest<Platform *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Platform"];
}

@dynamic name;
@dynamic shows;

@end
