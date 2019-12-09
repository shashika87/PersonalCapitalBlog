//
//  BlogResponse.h
//  PersonalCapitalBlog
//
//  Created by Shashi Kant on 12/6/19.
//  Copyright © 2019 Shashi Kant. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlogResponse : NSObject
@property(nonatomic,strong) NSString *blogImagePath;
@property(nonatomic,strong) NSString *blogTitle;
@property(nonatomic,strong) NSString *blogDecription;
@property(nonatomic,strong) NSString *blogImageUrl;
@property(nonatomic,strong) NSString *blogContent;
@property(nonatomic,strong) NSString *blogArticleLink;
@property int blogId;
@property int blogImageWidth;
@property int blogImageHeight;

- (instancetype) initWithId:(int)blogId withImagePath:(NSString*)blogImagePath withblogTitle: (NSString*)blogTitle withDescription: (NSString*)blogDecription withImageUrl: (NSString*)blogImageUrl withContent: (NSString*)blogContent withArticleLink: (NSString*)blogArticleLink;
@end

NS_ASSUME_NONNULL_END
