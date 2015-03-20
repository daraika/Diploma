//
//  QNAQuestionTableViewCell.m
//  QNADiploma
//
//  Created by Zhanserik Kenes on 21.02.15.
//  Copyright (c) 2015 Zhans Inc. All rights reserved.
//

#import "QNAQuestionTableViewCell.h"

@implementation QNAQuestionTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.textLabel.numberOfLines = 0;
        
        self.detailTextLabel.textColor = [UIColor lightGrayColor];
        self.detailTextLabel.numberOfLines = 0;
     
        
        self.contentView.contentMode = UIViewContentModeScaleToFill;
    }
    return self;
}
@end
