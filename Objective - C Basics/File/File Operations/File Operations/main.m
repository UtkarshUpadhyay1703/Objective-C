//
//  main.m
//  File Operations
//
//  Created by admin on 5/12/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"
//#import "Person.m"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
//        NSURL *url=[[NSURL alloc]initWithString:@"/Users/admin/Desktop/intro.txt"];
//        NSFileManager *manager = [[NSFileManager alloc]init];
//        if([manager fileExistsAtPath:[url path]]){
//            NSLog(@"Yes Present");
//            NSData *data=[manager contentsAtPath:[url path]];
//            NSLog(@"%@",data);
            
//            NSFileManager *filemgr;
//            NSData *databuffer;
//
//            filemgr = [NSFileManager defaultManager];
//
//            databuffer = [filemgr contentsAtPath: [url path] ];
//            NSLog(@"%@",databuffer);
            
//            NSString * name = @"utkarsh";
//            NSNumber * age = @(23);
//            NSDictionary * person1 = @{@"name":name,@"age":age};
            
            //OR
            
            Person *person=[[Person alloc]init];
            [person setName:@"Utkarsh"];
            [person setAge:@(23)];
        
            //For serialization
            NSError *error =nil;
            
            NSData *serializedData = [NSKeyedArchiver archivedDataWithRootObject:person requiringSecureCoding:YES error:&error];
            if(serializedData ==nil){
                NSLog(@"Error occured %@",error.localizedDescription);
            }else{
                NSString * filePath=@"/Users/admin/Desktop/intro.plist";
                if(![serializedData writeToFile:filePath atomically:YES]){
                    NSLog(@"Error writing serialized data to file");
                }
                
                //For reading the serialized data
                NSData *readData = [NSData dataWithContentsOfFile:filePath];
                
                //deserialize the data
                NSError *error =nil;
                Person *deserializedPerson = [NSKeyedUnarchiver unarchivedObjectOfClass:[Person class] fromData:readData error:&error];
                if(deserializedPerson == nil) NSLog(@"Error deserilizing the data: %@",error.localizedDescription);
                else{
                    NSLog(@"Name = %@ age = %@",deserializedPerson.name,deserializedPerson.age);
                }
            }
//    }
    return 0;
}
}
