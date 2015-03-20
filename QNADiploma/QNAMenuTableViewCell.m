//
//  QNAMenuTableViewCell.m
//  QNADiploma
//
//  Created by Zhanserik Kenes on 21.02.15.
//  Copyright (c) 2015 Zhans Inc. All rights reserved.
//

#import "QNAMenuTableViewCell.h"
@interface QNAMenuTableViewCell()

@property (nonatomic) UIImageView *iconImageView;
@end

@implementation QNAMenuTableViewCell

@synthesize iconImage = _iconImage;
@synthesize iconImageView = _iconImageView;
@synthesize textLabel = _textLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _iconImageView = [UIImageView new];
        _iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.contentView addSubview:_iconImageView];
        
        _textLabel = [UILabel new];
        _textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _textLabel.textColor = [UIColor darkGrayColor];
        _textLabel.numberOfLines = 0;
        
        [self.contentView addSubview:_textLabel];
        
        self.contentView.contentMode = UIViewContentModeScaleToFill;
    }
    return self;
}

- (void) layoutSubviews{
    [super layoutSubviews];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_iconImageView]-10-[_textLabel]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:NSDictionaryOfVariableBindings(_iconImageView, _textLabel)]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_textLabel]-0-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:NSDictionaryOfVariableBindings(_textLabel)]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_iconImageView]-5-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:NSDictionaryOfVariableBindings(_iconImageView)]];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_iconImageView
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:_iconImageView
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1.0
                                                                  constant:0.0]];
}

- (void) setIconImage:(UIImage *)iconImage{
    _iconImage = iconImage;
    _iconImageView.image = _iconImage;
}
- (UIImage *) iconImage{
    return _iconImage;
}
@end
