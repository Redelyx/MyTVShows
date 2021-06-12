//
//  Category+Utils.h
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Category+CoreDataClass.h"
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface Category (Utils)

+(Category *)initWithName:(NSString *)name;
+(NSMutableArray *)allCategories;
+(Category *)categoryOfName:(NSString *)name;
-(void)deleteCategory;
-(NSMutableArray *)allShows;
-(void)setNewName:(NSString *)name;
-(void)deleteElement;
+(Category *)elementOfName:(NSString *)name;
-(NSString *)displayName;


@end

NS_ASSUME_NONNULL_END
