//
//  Person.m
//  File Operations
//
//  Created by admin on 5/12/23.
//

#import "Person.h"

@implementation Person
//-(id) initWithNameAndAge:(NSString *)name (NSNumber *) age{
//    self=[super init];
//    if(self){
//        self.name=name;
//        self.age = age;
//    }
//}
+(BOOL) supportsSecureCoding{
    return YES;
}

-(instancetype) initWithCoder:(NSCoder *) decoder{
    self=[super init];
    if(self){
        self.name=[decoder decodeObjectForKey:@"name"];
        self.age=[decoder decodeObjectForKey:@"age"];
    }
    return self;
}
-(void) encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.age forKey:@"age"];
}

@end
