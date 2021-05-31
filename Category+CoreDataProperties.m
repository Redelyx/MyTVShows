//
//  Category+CoreDataProperties.m
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//
//

#import "Category+CoreDataProperties.h"

@implementation Category (CoreDataProperties)

+ (NSFetchRequest<Category *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Category"];
}

@dynamic name;
@dynamic shows;

@end
