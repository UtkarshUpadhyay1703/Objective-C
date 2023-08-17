//
//  Employee.m
//  File+Read+TableView
//
//  Created by admin on 5/29/23.
//

#import "Employee.h"

@implementation Employee

-(id) initWithAll : (NSString *) name age1:(NSNumber *)age comp:(NSString *)companyName{
    self=[super init];
    if(self) {
        _tempName = name;
        _tempAge = age;
        _tempCompanyName = companyName;
    }
    return self;
}

+(BOOL) supportsSecureCoding{
    return YES;
}

-(instancetype) initWithCoder:(NSCoder *)decoder{
    self = [super init];
    if(self){
    self.tempName = [decoder decodeObjectForKey:@"name"];
    self.tempAge = [decoder decodeObjectForKey:@"age"];
    self.tempCompanyName = [decoder decodeObjectForKey:@"comp"];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.tempName forKey:@"name"];
    [encoder encodeObject:self.tempAge forKey:@"age"];
    [encoder encodeObject:self.tempCompanyName forKey:@"comp"];
}


@end
