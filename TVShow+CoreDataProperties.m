//
//  TVShow+CoreDataProperties.m
//  MyTVShows
//
//  Created by Alice on 01/06/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "TVShow+CoreDataProperties.h"

@implementation TVShow (CoreDataProperties)

+ (NSFetchRequest<TVShow *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
}

@dynamic image;
@dynamic link;
@dynamic name;
@dynamic notes;
@dynamic score;
@dynamic category;
@dynamic platforms;
@dynamic seasons;

@end
