//
//  BoxMaxStack.m
//  Coding
//
//  Created by Dunty Vinay Raj  B M on 08/05/21.
//

#import "BoxMaxStack.h"

@interface BoxMaxStack()
@property int max;
@property int inclusive;
@property int exclusive;
@end

@implementation BoxMaxStack

- (int)generateMaxStack:(NSArray *)boxes {
    int max = [self maxStackRec:boxes index:0];
    return max;
}

- (BOOL)canStackBox:(NSDictionary *)box1 onBox:(NSDictionary *)box2 {
    
    int box1W = ((NSNumber *)box1[@"W"]).intValue;
    int box2W = ((NSNumber *)box2[@"W"]).intValue;
    
    int box1H = ((NSNumber *)box1[@"H"]).intValue;
    int box2H = ((NSNumber *)box2[@"H"]).intValue;
    
    return (box1W <= box2W && box1H <= box2H);
}

- (int) maxStackRec:(NSArray *)boxes index:(int)index {
    if (index == boxes.count) {
        return 1;
    }
    
    int incl = 1;
    int nextSelection = [self nextPossibleBoxIndexToStack:boxes selectedIndex:index];
    if (nextSelection != -1) {
        incl = incl + [self maxStackRec:boxes index:nextSelection];
    }
    
    int exclusive = [self maxStackRec:boxes index:index+1];
    
    int max = ( incl > exclusive ) ? incl : exclusive;
    return max;
}

- (int) nextPossibleBoxIndexToStack:(NSArray *) boxes
                      selectedIndex:(int) index {
    
    NSDictionary *selectedBox = boxes[index];
    for (int i=index+1; i<boxes.count; i++) {
        NSDictionary *toSelect = boxes[i];
        if ([self canStackBox:toSelect onBox:selectedBox]) {
            return i;
        }
    }
    return -1;
}

@end
