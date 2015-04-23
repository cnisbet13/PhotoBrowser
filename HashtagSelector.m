//
//  HashtagSelector.m
//  PuppyBombs
//
//  Created by Calvin Nisbet on 2015-03-17.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "HashtagSelector.h"

@implementation HashtagSelector

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
    return 1;
}

- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item
{
//    return [self.array count];
}


@end
