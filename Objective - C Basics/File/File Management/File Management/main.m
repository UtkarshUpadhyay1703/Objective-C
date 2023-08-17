//
//  main.m
//  File Management
//
//  Created by admin on 5/3/23.
//

#import <Foundation/Foundation.h>
#import "Employee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
//        NSFileManager *manager=[[NSFileManager alloc]init];
//        NSString *path=@"/Users/admin/Desktop/Codes/File/File.txt";
//        NSURL * url=[NSURL fileURLWithPath:path];
//        if(manager )
//        if ([manager fileExistsAtPath:path]) {
//            NSLog(@"present");
//            NSDictionary *dictionary=[manager attributesOfItemAtPath:path error:nil];
//            for(NSString *key in dictionary){
//                NSLog(@"KEY = %@ and VALUE = %@",key,[dictionary objectForKey:key]);
//            }
//        }else NSLog(@"NOT present");
//        [manager release];
        
        
//        NSURL * fileURL=[NSURL fileURLWithPath:@"/Users/admin/Desktop/Codes/File/File.txt"];
//        NSString *text=[NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:nil];
//        NSLog(@" Text = %@",text);
        
//        text = [text stringByAppendingString:@" here is some good"];
//        text =[text stringByAppendingString:@" very good, here is some more good"];
//        [text writeToURL:fileURL atomically:YES encoding:NSUTF8StringEncoding error:nil];
//        NSString *textNew=[NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:nil];
//        NSLog(@" Text = %@",textNew);
        
        
        Employee *emp=[[Employee alloc]init];
        [emp setName:@"Utkarsh Upadhyay"];
        [emp setGrade:74];
        [emp setCompanyName:@"Aloha Technology"];
        NSLog(@"%@",emp);
        //SAVE
        //here the archiver will find the encodeWithCoder method in the class and archive the object and save it to the file.
        
        [NSKeyedArchiver archiveRootObject:emp toFile:@"/Users/admin/Desktop/emp.plist"];
        
        // To unArchive
        Employee *employee=[NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/admin/Desktop/emp.plist"];
        NSLog(@"%@",employee);
        
    }
    return 0;
}
