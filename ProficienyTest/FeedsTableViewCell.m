//
//  FeedsTableViewCell.m
//  ProficienyTest
//
//  Created by Kanika Varma on 12/03/2015.
//  Copyright (c) 2015 Kanika Varma. All rights reserved.
//

#import "FeedsTableViewCell.h"
#import <PureLayout/PureLayout.h>

@interface FeedsTableViewCell ()

#define kLabelHorizontalInsets      15.0f
#define kLabelVerticalInsets        10.0f

@property (nonatomic,assign) BOOL didSetupConstraints;

@end

@implementation FeedsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.headLine = [[UILabel newAutoLayoutView] autorelease];
        [self.headLine setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.headLine setNumberOfLines:1];
        [self.headLine setTextAlignment:NSTextAlignmentLeft];
        [self.headLine setTextColor:[UIColor blueColor]];
        self.headLine.font = [UIFont fontWithName:@"arial" size:16.];
        [self.contentView addSubview:self.headLine];
        
        
        self.slugLine = [[UILabel newAutoLayoutView] autorelease];
        [self.slugLine setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.slugLine setNumberOfLines:0];
        [self.slugLine setTextAlignment:NSTextAlignmentLeft];
        [self.slugLine setTextColor:[UIColor blackColor]];
        self.slugLine.font = [UIFont fontWithName:@"arial" size:14.];
        self.slugLine.text = @"";
        [self.contentView addSubview:self.slugLine];
        
        //self.headLine.backgroundColor = [UIColor blueColor];
        //self.slugLine.backgroundColor = [UIColor blackColor];
        
        self.img = [[UIImageView newAutoLayoutView] autorelease];
        self.img.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.img];
        //self.img.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:0.1];
        
        //self.contentView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
    }
    return self;
}

- (void) updateConstraints {
    if (!self.didSetupConstraints) {
        
        [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.headLine autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.headLine autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLabelVerticalInsets];
        [self.headLine autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets];
        [self.headLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        
        [self.slugLine autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headLine withOffset:kLabelVerticalInsets relation:NSLayoutRelationGreaterThanOrEqual];
        
        [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.slugLine autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.slugLine autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets];
        [self.slugLine autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:55.];
        [self.slugLine autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kLabelVerticalInsets];
        
        [self.img autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5.];
        [self.img autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headLine withOffset:-20. relation:NSLayoutRelationGreaterThanOrEqual];
        [self.img autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.slugLine withOffset:5. relation:NSLayoutRelationGreaterThanOrEqual];
        [self.img autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kLabelVerticalInsets];
        
        
        self.didSetupConstraints=YES;
    }
    [super updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    self.slugLine.preferredMaxLayoutWidth = CGRectGetWidth(self.slugLine.frame);
    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
}


@end
