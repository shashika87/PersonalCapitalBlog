//
//  BlogCollectionViewController.h
//  PersonalCapitalBlog
//
//  Created by Shashi Kant on 12/5/19.
//  Copyright © 2019 Shashi Kant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BlogResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface BlogCollectionViewController : UICollectionViewController<NSXMLParserDelegate>
@property(nonatomic,strong) UIImageView *imageBlog;
@property(nonatomic, strong) BlogResponse *blogResponse;
@property(nonatomic,strong) NSMutableArray *blogResponseArray;
@property(nonatomic,strong) NSMutableArray *blogResponseSectionArray;
@property(nonatomic,strong) NSMutableString *elementValue;
@property(nonatomic,strong) NSString *strCurrentElement;
@property(nonatomic,strong) NSString *parentElement;
@property(nonatomic,strong) NSString *directoryBlogImagePath;
@property(nonatomic,strong) UIView *viewBlogLoading;
@property(nonatomic,strong) UIActivityIndicatorView *activityLoadView;







@end

NS_ASSUME_NONNULL_END
