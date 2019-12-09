//
//  BlogCollectionViewCell.h
//  PersonalCapitalBlog
//
//  Created by Shashi Kant on 12/6/19.
//  Copyright © 2019 Shashi Kant. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlogCollectionViewCell : UICollectionViewCell;
@property(nonatomic,weak) IBOutlet UILabel *labelBlogTitle;
@property(nonatomic,weak) IBOutlet UILabel *labelBlogDecription;
@property(nonatomic,weak) IBOutlet UIImageView *imageBlog;
@property(nonatomic,weak) IBOutlet UIView *sepratorView;
@property(nonatomic,weak) IBOutlet UIActivityIndicatorView *imageActivityIndicatorView;
@property(nonatomic,weak) IBOutlet NSLayoutConstraint *widthImageConstraint;
@property(nonatomic,weak) IBOutlet NSLayoutConstraint *widthLabelTitleConstraint;
@property(nonatomic,weak) IBOutlet NSLayoutConstraint *widthLabelDescConstraint;
@property(nonatomic,weak) IBOutlet NSLayoutConstraint *widthViewSepratorConstraint;
@property(nonatomic,weak) IBOutlet NSLayoutConstraint *heightImageConstarint;
@property(nonatomic,weak) IBOutlet NSLayoutConstraint *bottomImageConstraint;
@end

NS_ASSUME_NONNULL_END
