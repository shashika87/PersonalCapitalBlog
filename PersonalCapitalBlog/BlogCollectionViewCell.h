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
@property(nonatomic,strong) IBOutlet UILabel *labelBlogTitle;
@property(nonatomic,strong) IBOutlet UILabel *labelBlogDecription;
@property(nonatomic,strong) IBOutlet UILabel *labelBlogPreviousArticle;
@property(nonatomic,strong) IBOutlet UIImageView *imageBlog;
@property(nonatomic,strong) IBOutlet UIView *sepratorView;
@property(nonatomic,strong) IBOutlet UIActivityIndicatorView *imageActivityIndicatorView;
@property(nonatomic,strong) IBOutlet NSLayoutConstraint *widthImageConstraint;
@property(nonatomic,strong) IBOutlet NSLayoutConstraint *widthLabelTitleConstraint;
@property(nonatomic,strong) IBOutlet NSLayoutConstraint *widthLabelDescConstraint;
@property(nonatomic,strong) IBOutlet NSLayoutConstraint *widthViewSepratorConstraint;
@property(nonatomic,strong) IBOutlet NSLayoutConstraint *heightImageConstarint;
@property(nonatomic,strong) IBOutlet NSLayoutConstraint *bottomImageConstraint;
@property int blogId;
@property(nonatomic,strong) CAShapeLayer *shapeLineLayer;
@end

NS_ASSUME_NONNULL_END
