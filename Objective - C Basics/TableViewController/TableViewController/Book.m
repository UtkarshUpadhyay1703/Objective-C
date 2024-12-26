//
//  Book.m
//  TableViewController
//
//  Created by admin on 10/05/23.
//

#import "Book.h"

@implementation Book

-(instancetype)initWithTitle:(NSString *)_title author:(NSString *) _author pageCount:(int)_pageCount {
    self = [super init];
    
    if(self){
        self.title = _title;
        self.author = _author;
        self.pageCount = _pageCount;
    }
    return self;
}

@end
