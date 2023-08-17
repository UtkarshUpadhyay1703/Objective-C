//
//  main.m
//  File Operations
//
//  Created by admin on 5/12/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Declaring the objects of person class inside the NSDictionary.
        Person *person1 = [[Person alloc]initWithNameAndAge:@"Utkarsh" arg2:@23];
        Person * person2 = [[Person alloc]initWithNameAndAge:@"John" arg2:@43];
        NSDictionary *dictionary=[[NSDictionary  alloc]initWithObjectsAndKeys:person1,@"Utkarsh",person2,@"John", nil];
//declaring the file path
        NSString *filePath=@"/Users/admin/Desktop/intro.plist";
        
        
        // declaring the NSData for serialization
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dictionary requiringSecureCoding:YES error:nil];
                        if(data == nil) NSLog(@"error in serilizing");
                        else{
                            if(![data writeToFile:filePath atomically:YES]) NSLog(@"Error in writing the data inside the file");
                        }
//        BOOL isSaved=[data writeToFile:filePath atomically:YES];
//        if(isSaved)NSLog(@"Data is saved to file successfully");
//        else NSLog(@"Data is not saved to file ");
                
        // declaring the NSData for deserialization
        NSData *read = [NSData dataWithContentsOfFile:filePath];
        
                        //deserialize the data
        NSError *error =nil;
        NSDictionary *newDic = [NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:[NSString class] objectsOfClass:[Person class] fromData:read error:&error];
        if(newDic == nil) NSLog(@"Error deserilizing the data: %@",error.localizedDescription);
                        else{
                            for(NSDictionary *p in newDic){
                                NSLog(@" key = %@ Name = %@ age = %@",p,[[newDic valueForKey:p]name],[[newDic valueForKey:p]age]);
                            }
                        }
        
    return 0;
}
}
