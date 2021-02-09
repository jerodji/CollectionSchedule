//
//  MKClassTimeCell.m
//  CollectionSchedule
//
//  Created by Jerod on 2021/2/9.
//

#import "MKClassTimeCell.h"

@implementation MKClassTimeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.textLabel.frame = CGRectMake(0, 0, 100, 50);
    [self.contentView addSubview:self.textLabel];
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
    }
    return _textLabel;
}

@end
