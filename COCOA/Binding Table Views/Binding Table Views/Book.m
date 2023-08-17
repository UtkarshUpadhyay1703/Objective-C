//
//  Book.m
//  Binding Table Views
//
//  Created by admin on 5/9/23.
//

#import "Book.h"

@implementation Book
-(id) init{
    self=[super init];
    if(self){
        self.author=@"Swami Vivekananda";
        self.title=@"Raja Yoga";
        self.pageCount=166;
    }
    return self;
}

@end
