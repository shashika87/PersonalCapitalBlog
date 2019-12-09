//
//  BlogResponse.m
//  PersonalCapitalBlog
//
//  Created by Shashi Kant on 12/6/19.
//  Copyright © 2019 Shashi Kant. All rights reserved.
//

#import "BlogResponse.h"

@implementation BlogResponse

- (instancetype) initWithId:(int)blogId withImagePath:(NSString*)blogImagePath withblogTitle: (NSString*)blogTitle withDescription: (NSString*)blogDecription withImageUrl: (NSString*)blogImageUrl withContent: (NSString*)blogContent withArticleLink: (NSString*)blogArticleLink
{
    self = [super init];
    if (self) {
        self.blogId = blogId;
        self.blogImagePath = blogImagePath;
        self.blogTitle = blogTitle;
        self.blogDecription = blogDecription;
        self.blogImageUrl = blogImageUrl;
        self.blogContent = blogContent;
        self.blogArticleLink = blogArticleLink;
        
    }
    return self;
}

@end
