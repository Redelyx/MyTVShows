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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    Category *category = [[Category alloc] initWithContext:appDelegate.context];
    category.name = name;
    [appDelegate saveContext];
    return category;
}

+(NSMutableArray *)allCategories{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSMutableArray *allCategories = [[appDelegate.context executeFetchRequest:[Category fetchRequest] error:nil] mutableCopy];
    return allCategories;
}

+(BOOL)existElementOfName:(NSString *)name;{
    if(![self categoryOfName:name]) return NO;
    else return YES;
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

-(void)deleteCategory{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    [context deleteObject:self];
    [appDelegate saveContext];
}

-(NSMutableArray *)allShows{
    return [[self.shows allObjects] mutableCopy];
}

-(void)setNewName:(NSString *)name{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    self.name = name;
    
    [appDelegate saveContext];
}

-(void)deleteElement{
    [self deleteCategory];
}

+(Category *)elementOfName:(NSString *)name{
    return [Category categoryOfName:name];
}

-(NSString *)objectName{
    return @"Category";
}

-(NSString *)displayName{
    return self.name;
}

@end
