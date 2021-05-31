//
//  Episode+CoreDataProperties.m
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "Episode+CoreDataProperties.h"

@implementation Episode (CoreDataProperties)

+ (NSFetchRequest<Episode *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Episode"];
}

@dynamic name;
@dynamic score;
@dynamic watched;
@dynamic season;

@end
