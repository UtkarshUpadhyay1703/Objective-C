//
//  main.m
//  DictionaryToFileManagment
//
//  Created by admin on 15/05/23.
//

#import <Foundation/Foundation.h>
#import "Book.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Aniket",@"2",
            @"Somesh",@"1",@"Omkar",@"3",nil];
        
        NSString *path =@"/Users/admin/Documents/Objective C/NewDictionaryFile.plist";
        
        BOOL iswritten = [dictionary writeToFile:path atomically:YES];
        if(iswritten){
            NSLog(@"Data is add to file");
        }
        else{
            NSLog(@"Data is not add to file");
        }
//        NSError *error = nil;
        NSDictionary *newDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
        
        if(newDictionary){
            for(NSString *key in newDictionary){
                NSLog(@"%@ :- %@",key,[newDictionary valueForKey:key]);
            }
        }
        else{
            NSLog(@"Can't Read the Data");
        }
        
        NSLog(@"========================");
        Book *book1 = [[Book alloc]initWithTitle:@"Atomic Habits" author:@"James"];
        Book *book2 = [[Book alloc]initWithTitle:@"Think like a Monk" author:@"Harry"];
        
        NSString *filePath = @"/Users/admin/Documents/Objective C/DictionaryBookList.plist";
        NSDictionary *allBook = [NSDictionary dictionaryWithObjectsAndKeys:book1,@"1", book2, @"2", nil];
        NSError *error = nil;
        NSData *newData = [NSKeyedArchiver archivedDataWithRootObject:allBook requiringSecureCoding:YES error:&error];
        if(error){
            NSLog(@"descriptuon of error %@",error.localizedDescription);
        }
         
        
        BOOL isSaved = [newData writeToFile:filePath atomically:YES];
        if(isSaved){
            NSLog(@"Data is add to file");
        }
        else{
            NSLog(@"Data is not add to file");
        }
        
        NSData * newData1 = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *newDictionary1 = [NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:[NSString class] objectsOfClass:[Book class] fromData:newData1 error:&error];
        
        
        if(newDictionary1){
            NSLog(@"%@",newDictionary1);
        }
        else{
            NSLog(@"Data is not add to file");
        }
            
        
        
        
        
        
        
    }
    return 0;
}
