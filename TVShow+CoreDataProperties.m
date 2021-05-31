//
//  TVShow+CoreDataProperties.m
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "TVShow+CoreDataProperties.h"

@implementation TVShow (CoreDataProperties)

+ (NSFetchRequest<TVShow *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"TVShow"];
}

@dynamic name;
@dynamic link;
@dynamic notes;
@dynamic score;
@dynamic image;
@dynamic seasons;
@dynamic category;
@dynamic platforms;

@end
