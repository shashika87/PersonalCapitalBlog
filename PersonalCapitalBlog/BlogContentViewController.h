//
//  ViewController.h
//  PersonalCapitalBlog
//
//  Created by Shashi Kant on 12/5/19.
//  Copyright © 2019 Shashi Kant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface BlogContentViewController : UIViewController<WKNavigationDelegate>
@property(nonatomic,strong) NSString *blogContent;
@property(nonatomic,strong) NSString *blogArticleLink;
@property(nonatomic,strong) IBOutlet WKWebView *wkWebView;
@property(nonatomic,strong) UIActivityIndicatorView *activityLoadView;


@end

