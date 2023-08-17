//
//  Employee.m
//  File+Dictionary+tableView
//
//  Created by admin on 5/29/23.
//

#import "Employee.h"

@implementation Employee
-(id) initWithAll : (NSString *) name age1:(NSNumber *)age comp:(NSString *)companyName{
    self = [super init];
    if(self){
    self.tempName = name;
    self.tempAge = age;
    self.tempCompanyName = companyName;
    }
    return self;
}

+(BOOL) supportsSecureCoding{
    return  YES;
}

-(instancetype) initWithCoder:(NSCoder *)decoder{
    self = [super init];
    if(self){
        self.tempName = [decoder decodeObjectForKey:@"name"];
        self.tempAge = [decoder decodeObjectForKey:@"age"];
        self.tempCompanyName = [decoder decodeObjectForKey:@"companyName"];
    }
    return  self;
}

-(void) encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.tempName forKey:@"name"];
    [encoder encodeObject:self.tempAge forKey:@"age"];
    [encoder encodeObject:self.tempCompanyName forKey:@"companyName"];
}

@end
