//
//  Category+Utils.m
//  MyTVShows
//
//  Created by Alice on 27/05/2021.
//  Copyright © 2021 Alice. All rights reserved.
//

#import "Category+Utils.h"

@implementation Category (Utils)

+(Category *)initWithName:(NSString *)name{
    //if(![Category existCategoryOfName:name]){
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        Category *category = [[Category alloc] initWithContext:appDelegate.context];
        category.name = name;
        [appDelegate saveContext];
        return category;
    //}
    //else return nil;

}

+(NSMutableArray *)allCategories{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allCategories = [[appDelegate.context executeFetchRequest:[Category fetchRequest] error:nil] mutableCopy];
    return allCategories;
}

+(BOOL)existCategoryOfName:(NSString *)name{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allCategories = [[appDelegate.context executeFetchRequest:[Category fetchRequest] error:nil] mutableCopy];
    for (Category *selectedCategory in allCategories) {
        if ([selectedCategory.name isEqualToString:name]) {
            return YES;
        }
    }
    return NO;
}

+(Category *)categoryOfName:(NSString *)name{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allCategories = [[appDelegate.context executeFetchRequest:[Category fetchRequest] error:nil] mutableCopy];
    for (Category *selectedCategory in allCategories) {
        if ([selectedCategory.name isEqualToString:name]) {
            return selectedCategory;
        }
    }
    return nil;
}

+(void)deleteCategory:(Category *)category{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    [context deleteObject:category];
    [appDelegate saveContext];
}


@end
