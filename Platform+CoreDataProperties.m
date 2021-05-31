//
//  Platform+CoreDataProperties.m
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
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
