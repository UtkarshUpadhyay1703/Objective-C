//
//  Book.m
//  DictionaryToFileManagment
//
//  Created by admin on 15/05/23.
//

#import "Book.h"

@implementation Book

+ (BOOL)supportsSecureCoding
{
    return  YES;
}

-(instancetype)initWithTitle:(NSString *)_title author:(NSString *)_author{
    self=[super init];
    if(self){
        self.title = _title;
        self.author = _author;
    }
    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Title  %@ Author %@",self.title, [self author]];
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.author forKey:@"author"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.title = [coder decodeObjectForKey:@"title"];
        self.author = [coder decodeObjectForKey:@"author"];
    }
    return self;
}

@end
