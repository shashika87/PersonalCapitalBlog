//
//  BlogCollectionViewCell.m
//  PersonalCapitalBlog
//
//  Created by Shashi Kant on 12/6/19.
//  Copyright © 2019 Shashi Kant. All rights reserved.
//

#import "BlogCollectionViewCell.h"
#import "AppDelegate.h"
#import "LabelBlog.h"

@implementation BlogCollectionViewCell




- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
    
    self.imageBlog = [[UIImageView alloc]init];
     [self.imageBlog  setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.imageBlog];
    self.widthImageConstraint = [NSLayoutConstraint constraintWithItem:self.imageBlog
    attribute:NSLayoutAttributeWidth
    relatedBy:NSLayoutRelationEqual
    toItem:nil
    attribute:NSLayoutAttributeWidth
    multiplier:1
    constant:frame.size.width];
    
     [self.contentView addConstraint:self.widthImageConstraint];
     
    self.heightImageConstarint = [NSLayoutConstraint constraintWithItem:self.imageBlog
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeHeight
                                                                multiplier:1
                                                               constant:171];
    
     [self.contentView addConstraint: self.heightImageConstarint];

     
     [self.contentView addConstraint:
      [NSLayoutConstraint constraintWithItem:self.imageBlog
                          attribute:NSLayoutAttributeCenterX
                          relatedBy:0
                          toItem:self.contentView
                          attribute:NSLayoutAttributeCenterX
                          multiplier:1
                          constant:0]];

     [self.contentView addConstraint:
      [NSLayoutConstraint constraintWithItem:self.imageBlog
                          attribute:NSLayoutAttributeTop
                          relatedBy:0
                          toItem:self.contentView
                          attribute:NSLayoutAttributeTop
                          multiplier:1
                          constant:0]];
    
    self.imageActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleLarge)];
       [self.imageActivityIndicatorView  setTranslatesAutoresizingMaskIntoConstraints:NO];
       self.imageActivityIndicatorView.hidden=NO;
       [self.imageActivityIndicatorView setColor:[UIColor grayColor]];
       [self.contentView addSubview:self.imageActivityIndicatorView];
       
       [self.contentView addConstraint:
        [NSLayoutConstraint constraintWithItem:self.imageActivityIndicatorView
                            attribute:NSLayoutAttributeCenterX
                            relatedBy:0
                            toItem:self.contentView
                            attribute:NSLayoutAttributeCenterX
                            multiplier:1
                            constant:0]];

       [self.contentView addConstraint:
        [NSLayoutConstraint constraintWithItem:self.imageActivityIndicatorView
                            attribute:NSLayoutAttributeCenterY
                            relatedBy:0
                            toItem:self.contentView
                            attribute:NSLayoutAttributeCenterY
                            multiplier:1
                            constant:0]];
       
       [self.imageActivityIndicatorView addConstraint:
        [NSLayoutConstraint constraintWithItem:self.imageActivityIndicatorView
                            attribute:NSLayoutAttributeWidth
                            relatedBy:NSLayoutRelationEqual
                            toItem:nil
                            attribute:NSLayoutAttributeWidth
                            multiplier:1
                            constant:50]];

       [self.imageActivityIndicatorView addConstraint:
       [NSLayoutConstraint constraintWithItem:self.imageActivityIndicatorView
                           attribute:NSLayoutAttributeHeight
                           relatedBy:NSLayoutRelationEqual
                           toItem:nil
                           attribute:NSLayoutAttributeHeight
                           multiplier:1
                           constant:50]];
    
    
    
    self.labelBlogTitle = [[LabelBlog alloc]init];
    self.labelBlogTitle.numberOfLines = 2;
     [self.labelBlogTitle  setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.labelBlogTitle];
    self.widthLabelTitleConstraint = [NSLayoutConstraint constraintWithItem:self.labelBlogTitle
    attribute:NSLayoutAttributeWidth
    relatedBy:NSLayoutRelationEqual
    toItem:nil
    attribute:NSLayoutAttributeWidth
    multiplier:1
    constant:frame.size.width];
    [self.contentView addConstraint:self.widthLabelTitleConstraint];
    
     [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:self.labelBlogTitle
     attribute:NSLayoutAttributeHeight
     relatedBy:NSLayoutRelationEqual
        toItem:nil
     attribute:NSLayoutAttributeHeight
       multiplier:1
      constant:35]];

     
     [self.contentView addConstraint:
      [NSLayoutConstraint constraintWithItem:self.labelBlogTitle
                          attribute:NSLayoutAttributeCenterX
                          relatedBy:0
                          toItem:self.contentView
                          attribute:NSLayoutAttributeCenterX
                          multiplier:1
                          constant:0]];

     [self.contentView addConstraint:
      [NSLayoutConstraint constraintWithItem:self.labelBlogTitle
                          attribute:NSLayoutAttributeTop
                          relatedBy:0
                          toItem:self.imageBlog
                          attribute:NSLayoutAttributeBottom
                          multiplier:1
                          constant:5]];
    
    
    //label description
    
    self.labelBlogDecription = [[LabelBlog alloc]init];
       self.labelBlogDecription.numberOfLines = 2;
        [self.labelBlogDecription  setTranslatesAutoresizingMaskIntoConstraints:NO];
       [self.contentView addSubview:self.labelBlogDecription];
       self.widthLabelDescConstraint = [NSLayoutConstraint constraintWithItem:self.labelBlogDecription
       attribute:NSLayoutAttributeWidth
       relatedBy:NSLayoutRelationEqual
       toItem:nil
       attribute:NSLayoutAttributeWidth
       multiplier:1.0
       constant:frame.size.width];
       
        [self.contentView addConstraint:self.widthLabelDescConstraint];
       
        [self.labelBlogDecription addConstraint: [NSLayoutConstraint constraintWithItem:self.labelBlogDecription
        attribute:NSLayoutAttributeHeight
        relatedBy:NSLayoutRelationEqual
           toItem:nil
        attribute:NSLayoutAttributeHeight
          multiplier:1
         constant:50]];
    
    [self.labelBlogDecription addConstraint: [NSLayoutConstraint constraintWithItem:self.labelBlogDecription
    attribute:NSLayoutAttributeHeight
    relatedBy:NSLayoutRelationEqual
       toItem:nil
    attribute:NSLayoutAttributeHeight
      multiplier:1
     constant:50]];

    
    [self.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.labelBlogDecription
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:0
                         toItem:self.contentView
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1
                         constant:0]];

    [self.contentView addConstraint:
     [NSLayoutConstraint constraintWithItem:self.labelBlogDecription
                         attribute:NSLayoutAttributeTop
                         relatedBy:0
                         toItem:self.labelBlogTitle
                         attribute:NSLayoutAttributeBottom
                         multiplier:1
                         constant:5]];
    
    
      

    
    //label previous
       
       self.labelBlogPreviousArticle = [[LabelBlog alloc]init];
        self.labelBlogPreviousArticle.text = @"Previous Articles";
    [self.labelBlogPreviousArticle setTextAlignment:NSTextAlignmentLeft];
           [self.labelBlogPreviousArticle  setTranslatesAutoresizingMaskIntoConstraints:NO];
          [self.contentView addSubview:self.labelBlogPreviousArticle];
        
           [self.labelBlogPreviousArticle addConstraint:[NSLayoutConstraint constraintWithItem:self.labelBlogPreviousArticle
           attribute:NSLayoutAttributeWidth
           relatedBy:NSLayoutRelationEqual
           toItem:nil
           attribute:NSLayoutAttributeWidth
           multiplier:1
           constant:200]];
          
           [self.labelBlogPreviousArticle addConstraint: [NSLayoutConstraint constraintWithItem:self.labelBlogPreviousArticle
           attribute:NSLayoutAttributeHeight
           relatedBy:NSLayoutRelationEqual
              toItem:nil
           attribute:NSLayoutAttributeHeight
             multiplier:1
            constant:50]];
       

       
       [self.contentView addConstraint:
        [NSLayoutConstraint constraintWithItem:self.labelBlogPreviousArticle
                            attribute:NSLayoutAttributeLeft
                            relatedBy:0
                            toItem:self.contentView
                            attribute:NSLayoutAttributeLeft
                            multiplier:1
                            constant:10]];

       [self.contentView addConstraint:
        [NSLayoutConstraint constraintWithItem:self.labelBlogPreviousArticle
                            attribute:NSLayoutAttributeTop
                            relatedBy:0
                            toItem:self.labelBlogDecription
                            attribute:NSLayoutAttributeBottom
                            multiplier:1
                            constant:30]];
       
    
    
    return self;
}

- (void)prepareForReuse{
    [super prepareForReuse];
    
}

- (void)drawRect:(CGRect)rect{
    if(self.blogId==1 && self.shapeLineLayer==nil){
        UIBezierPath *path = [UIBezierPath bezierPath];
        
            [path moveToPoint:CGPointMake(0.0, self.frame.size.height-55)];
            [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height-55)];
            
            self.shapeLineLayer = [CAShapeLayer layer];
            self.shapeLineLayer.path = [path CGPath];
            self.shapeLineLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
            self.shapeLineLayer.lineWidth = 1.0;
            self.shapeLineLayer.fillColor = [[UIColor clearColor] CGColor];
            [self.layer addSublayer:self.shapeLineLayer];
    }
    else{
        for(CAShapeLayer *layer in self.layer.sublayers ){
            if ([layer isKindOfClass:[CAShapeLayer class]]) {
                    [layer removeFromSuperlayer];
            }
                    
        }
    }


    
}



@end
