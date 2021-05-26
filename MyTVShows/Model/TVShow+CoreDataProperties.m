//
//  TVShow+CoreDataProperties.m
//  MyTVShows
//
//  Created by Alice on 26/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "TVShow+CoreDataProperties.h"

@implementation TVShow (CoreDataProperties)

+ (NSFetchRequest<TVShow *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
}

@dynamic name;
@dynamic category;
@dynamic link;
@dynamic notes;
@dynamic score;
@dynamic image;
@dynamic seasons;

@end
