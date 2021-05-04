//
//  Tree.m
//  Coding
//
//  Created by Dunty Vinay Raj  on 04/05/21.
//

#import "Tree.h"

@interface Tree()
@property Tree *left;
@property Tree *right;
@property int data;
@end

@implementation Tree

- (instancetype)initWithData:(int)data left:(Tree *)left right:(Tree *)right
{
    if (self = [super init]) {
        _left = left;
        _right = right;
        _data = data;
    }
    return self;
}

@end
