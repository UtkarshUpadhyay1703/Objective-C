//
//  main.m
//  Sorting
//
//  Created by admin on 5/16/23.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        //We are creating 2 objects of student class
        Student *student1 = [[Student alloc]init];
        [student1 setName:@"Suraj"];
        [student1 setStandard:@10];
        Student *student2 = [[Student alloc]init];
        [student2 setName:@"Aniket"];
        [student2 setStandard:@11];
        NSLog(@" %@",[student1 favSubject:@"Maths"]);
        NSLog(@"  %@",[student2 favSubject:@"Science"]);
        NSArray *studs = [[NSArray alloc]initWithObjects:student1,student2, nil];
        
        for(Student *s in studs){
            NSLog(@"name = %@",[s name]);
        }
        
        //Using ternary operator
        (student1.name>student2.name) ? (NSLog(@"Yes %@",student1.name)) : (NSLog(@"No %@",[student2 name]));
        
        
        //Sorting an normal array with sorting descriptor
//        NSArray *arr= [[NSArray alloc]initWithObjects:@"A",@"C",@"F",@"B", nil];
//        NSSortDescriptor *sd = [[NSSortDescriptor alloc]initWithKey:nil ascending:YES];
//        NSArray *so=[NSArray alloc];
//        so=[arr sortedArrayUsingDescriptors:@[sd]];
//        for(Student *s in so){
//            NSLog(@"name = %@",s);
//        }
        
        
        
        //Sorting an Object array with sorting descriptor on name bases that is NSString
//        NSSortDescriptor *sd = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
//        NSArray *so=[NSArray alloc];
//        so=[studs sortedArrayUsingDescriptors:@[sd]];
//        for(Student *s in so){
//            NSLog(@"name = %@",s.name);
//        }
        
        
        
        
        //Sorting an Object array with sorting descriptor on standard bases that is NSNumber
//        NSSortDescriptor *sd = [[NSSortDescriptor alloc]initWithKey:@"standard" ascending:YES];
//        NSArray *so=[NSArray alloc];
//        so=[studs sortedArrayUsingDescriptors:@[sd]];
//        for(Student *s in so){
//            NSLog(@"name = %@",s.standard);
//        }
        
        NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:student1,@"infoway",student2,@"iet", nil];
//        NSSortDescriptor *sd=[[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
//        NSArray *sortKey=[[dic allKeys] sortedArrayUsingDescriptors:@[sd]];
//
//        for(Student *s in sortKey){
//            NSLog(@"name = %@ institute name = %@",[[dic valueForKey:s]name],s);
//        }
        
//        NSArray *sortedKey=[dic keysSortedByValueUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        NSArray *sortedKey=[dic keysSortedByValueUsingSelector:@selector(compare:)];
                for(Student *s in sortedKey){
                    NSLog(@"name = %@ institute name = %@",[[dic valueForKey:s]name],s);
                }
    }
    return 0;
}
