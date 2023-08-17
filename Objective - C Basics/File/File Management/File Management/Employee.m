//
//  Employee.m
//  File Management
//
//  Created by admin on 5/3/23.
//

#import "Employee.h"

@implementation Employee
@synthesize name,grade,companyName;

//This method is for Archive the object
-(void) encodeWithCoder: (NSCoder *) coder{
    [coder encodeObject:name forKey:@"empName"];
    NSNumber *numberGrade=[NSNumber numberWithInt:grade];//We have done this because we have to change the primitive int to the NSNumber this is called as Upcasting with Boxing.
    [coder encodeObject:numberGrade forKey:@"empGrade"];
    [coder encodeObject:companyName forKey:@"empCompanyName"];
}
//This method is for UnArchive the object
-(id) initWithCoder:(NSCoder *) coder{
    name = [coder decodeObjectForKey:@"empName"];//not included retain
    NSNumber *numberGrade=[coder decodeObjectForKey:@"empGrade"];
    grade = (int) [numberGrade integerValue];
    companyName = [coder decodeObjectForKey:@"empCompanyName"];
    return self;
}

-(NSString *) description{
    NSString *desc =
    [NSString stringWithFormat:@"Employee name = %@, Garde = %i, Company Name = %@",name,grade,companyName];
    return  desc;
}
@end
