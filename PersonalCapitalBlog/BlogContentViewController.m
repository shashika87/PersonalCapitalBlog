//
//  ViewController.m
//  PersonalCapitalBlog
//
//  Created by Shashi Kant on 12/5/19.
//  Copyright © 2019 Shashi Kant. All rights reserved.
//

#import "BlogContentViewController.h"

@interface BlogContentViewController ()

@end

@implementation BlogContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //WkWebView
    
    self.wkWebView = [[WKWebView alloc] init];
    [self.wkWebView  setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:self.wkWebView];
    
    self.wkWebView.navigationDelegate = self;
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.wkWebView
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:0
                         toItem:self.view
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1
                         constant:0]];

    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.wkWebView
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:0
                         toItem:self.view
                         attribute:NSLayoutAttributeCenterY
                         multiplier:1
                         constant:0]];
    
    
    
    [self.wkWebView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.wkWebView
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:nil
                         attribute:NSLayoutAttributeWidth
                         multiplier:1
                         constant:self.view.frame.size.width]];

    [self.wkWebView addConstraint:
    [NSLayoutConstraint constraintWithItem:self.wkWebView
                        attribute:NSLayoutAttributeHeight
                        relatedBy:NSLayoutRelationEqual
                        toItem:nil
                        attribute:NSLayoutAttributeHeight
                        multiplier:1
                        constant:self.view.frame.size.height]];
   
    
    
    
    
    self.activityLoadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleLarge)];
    [self.activityLoadView  setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.activityLoadView.hidden=NO;
    [self.activityLoadView setColor:[UIColor blackColor]];
    [self.wkWebView addSubview:self.activityLoadView];
    
    self.wkWebView.navigationDelegate = self;
    
    [self.wkWebView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.activityLoadView
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:0
                         toItem:self.wkWebView
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1
                         constant:0]];

    [self.wkWebView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.activityLoadView
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:0
                         toItem:self.wkWebView
                         attribute:NSLayoutAttributeCenterY
                         multiplier:1
                         constant:0]];
    
    
    
    [self.wkWebView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.activityLoadView
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:nil
                         attribute:NSLayoutAttributeWidth
                         multiplier:1
                         constant:50]];

    [self.wkWebView addConstraint:
    [NSLayoutConstraint constraintWithItem:self.activityLoadView
                        attribute:NSLayoutAttributeHeight
                        relatedBy:NSLayoutRelationEqual
                        toItem:nil
                        attribute:NSLayoutAttributeHeight
                        multiplier:1
                        constant:50]];
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?displayMobileNavigation=0",self.blogArticleLink]];
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.activityLoadView startAnimating];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
   
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    [self.activityLoadView stopAnimating];
}


@end
