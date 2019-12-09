//
//  BlogCollectionViewController.m
//  PersonalCapitalBlog
//
//  Created by Shashi Kant on 12/5/19.
//  Copyright © 2019 Shashi Kant. All rights reserved.
//

#import "BlogCollectionViewController.h"
#import "BlogCollectionViewCell.h"
#import "BlogContentViewController.h"
#import "AppDelegate.h"

@interface BlogCollectionViewController ()

@end

@implementation BlogCollectionViewController{
        void(^callbackCompletion)(NSString *filePath);

}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.title = @"Research & Insights";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor blackColor],
    NSFontAttributeName:[UIFont systemFontOfSize:21]}];
    
    UIBarButtonItem *barButtonRefresh = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:(UIBarButtonSystemItemRefresh) target:self action:@selector(barButtonRefresh_Click:)];
    self.navigationItem.rightBarButtonItem = barButtonRefresh;

    [self setupActivityView];
    [self loadBlogs];
    
}

-(void)barButtonRefresh_Click:(id)sender{
    [self loadBlogs];
}


-(void)setupActivityView{
    self.viewBlogLoading = [[UIView alloc]init];
    [self.viewBlogLoading  setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.viewBlogLoading setBackgroundColor:[UIColor grayColor]];
   [self.navigationController.view addSubview:self.viewBlogLoading];

    [self.navigationController.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.viewBlogLoading
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:nil
                         attribute:NSLayoutAttributeWidth
                         multiplier:1
                         constant:self.view.frame.size.width]];
    
    [self.navigationController.view addConstraint:
    [NSLayoutConstraint constraintWithItem:self.viewBlogLoading
                        attribute:NSLayoutAttributeHeight
                        relatedBy:NSLayoutRelationEqual
                        toItem:nil
                        attribute:NSLayoutAttributeHeight
                        multiplier:1
                        constant:self.view.frame.size.height]];

    
    [self.navigationController.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.viewBlogLoading
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:0
                         toItem:self.navigationController.view
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1
                         constant:0]];

    [self.navigationController.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.viewBlogLoading
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:0
                         toItem:self.navigationController.view
                         attribute:NSLayoutAttributeCenterY
                         multiplier:1
                         constant:0]];
    
    
    self.activityLoadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleLarge)];
    [self.activityLoadView  setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.activityLoadView.hidden=NO;
    [self.activityLoadView setColor:[UIColor whiteColor]];
    [self.viewBlogLoading addSubview:self.activityLoadView];
    
    [self.viewBlogLoading addConstraint:
     [NSLayoutConstraint constraintWithItem:self.activityLoadView
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:0
                         toItem:self.viewBlogLoading
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1
                         constant:0]];

    [self.viewBlogLoading addConstraint:
     [NSLayoutConstraint constraintWithItem:self.activityLoadView
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:0
                         toItem:self.viewBlogLoading
                         attribute:NSLayoutAttributeCenterY
                         multiplier:1
                         constant:0]];
    
    
    
    [self.viewBlogLoading addConstraint:
     [NSLayoutConstraint constraintWithItem:self.activityLoadView
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:nil
                         attribute:NSLayoutAttributeWidth
                         multiplier:1
                         constant:50]];

    [self.viewBlogLoading addConstraint:
    [NSLayoutConstraint constraintWithItem:self.activityLoadView
                        attribute:NSLayoutAttributeHeight
                        relatedBy:NSLayoutRelationEqual
                        toItem:nil
                        attribute:NSLayoutAttributeHeight
                        multiplier:1
                        constant:50]];
}

-(void)loadBlogs{
    
    self.viewBlogLoading.hidden = NO;
    [self.activityLoadView startAnimating];
    self.parentElement = nil;
    
    self.blogResponseArray = [[NSMutableArray alloc]init];
    self.blogResponseSectionArray = [[NSMutableArray alloc]init];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
    NSURL *url = [[NSURL alloc] initWithString:@"https://www.personalcapital.com/blog/feed/"];
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    xmlparser.delegate = (id)self;
    BOOL success = [xmlparser parse];

    if(success){
        NSLog(@"XML blog loaded");
    }
    
    NSString *directoryBlogImagePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"BlogPhoto"];
    NSFileManager *fileManager= [NSFileManager defaultManager];
    NSError * error;
    if([fileManager fileExistsAtPath:directoryBlogImagePath]){
        [fileManager removeItemAtPath:directoryBlogImagePath error:&error];
    }
    if(![fileManager fileExistsAtPath:directoryBlogImagePath isDirectory:nil]){
           if(![fileManager createDirectoryAtPath:directoryBlogImagePath withIntermediateDirectories:YES attributes:nil error:NULL]){
               NSLog(@"Error: Create folder failed %@", directoryBlogImagePath);
               
           }
    }
    self.directoryBlogImagePath = directoryBlogImagePath;
    });
    
}

#pragma mark - NSXMLParser
-(void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    self.strCurrentElement=elementName;
    if([elementName isEqualToString:@"channel"]) {
        self.blogResponse = [[BlogResponse alloc] initWithId:1 withImagePath:@"" withblogTitle:@"" withDescription:@"" withImageUrl:@"" withContent:@"" withArticleLink:@""];
        self.blogResponse.blogId = 1;
    }
    else if([elementName isEqualToString:@"image"]) {
        self.parentElement = elementName;
    }
    else if([elementName isEqualToString:@"item"]) {
          self.parentElement = elementName;
          int blogId = self.blogResponse.blogId+1;
          self.blogResponse = [[BlogResponse alloc] initWithId:blogId withImagePath:@"" withblogTitle:@"" withDescription:@"" withImageUrl:@"" withContent:@"" withArticleLink:@""];
      }
    
    else if([elementName isEqualToString:@"title"]) {
    }
    else if([elementName isEqualToString:@"media:content"]) {
        self.blogResponse.blogImageUrl = [attributeDict valueForKey:@"url"];
        self.blogResponse.blogImageWidth = [[attributeDict valueForKey:@"width"] intValue];
        self.blogResponse.blogImageHeight = [[attributeDict valueForKey:@"height"] intValue];
        
    }
    
    else if([elementName isEqualToString:@"description"]) {

    }
    
    
    else if([elementName isEqualToString:@"generator"]) {
       
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if( ([self.parentElement isEqualToString:@"image"] || [self.parentElement isEqualToString:@"item"]) && ([self.strCurrentElement isEqualToString:@"title"])){
        self.blogResponse.blogTitle = [NSString stringWithFormat:@"%@%@",self.blogResponse.blogTitle,string];
        self.blogResponse.blogTitle =[self.blogResponse.blogTitle stringByTrimmingCharactersInSet:
        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    else if([self.parentElement isEqualToString:@"image"] && ([self.strCurrentElement isEqualToString:@"url"])){
        self.blogResponse.blogImageUrl = [NSString stringWithFormat:@"%@%@",self.blogResponse.blogImageUrl,string];
        self.blogResponse.blogImageUrl =[self.blogResponse.blogImageUrl stringByTrimmingCharactersInSet:
        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
       }
    else if([self.parentElement isEqualToString:@"image"] && ([self.strCurrentElement isEqualToString:@"width"])){
        self.blogResponse.blogImageWidth = [string intValue];
    }
    else if([self.parentElement isEqualToString:@"image"] && ([self.strCurrentElement isEqualToString:@"height"])){
        self.blogResponse.blogImageHeight = [string intValue];
    }
    else if(self.parentElement == nil && ([self.strCurrentElement isEqualToString:@"description"])){

        self.blogResponse.blogDecription = [NSString stringWithFormat:@"%@%@",self.blogResponse.blogDecription,string];
        self.blogResponse.blogDecription =[self.blogResponse.blogDecription stringByTrimmingCharactersInSet:
        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
    }
    else if(([self.strCurrentElement isEqualToString:@"link"])){
        self.blogResponse.blogArticleLink = [NSString stringWithFormat:@"%@%@",self.blogResponse.blogArticleLink,string];
        self.blogResponse.blogArticleLink =[self.blogResponse.blogArticleLink stringByTrimmingCharactersInSet:
        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
       }
}



- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

    if([elementName isEqualToString:@"item"]){
        //self.blogResponseSectionArray = [[NSMutableArray alloc]init];
        [self.blogResponseSectionArray addObject: self.blogResponse];

    }
    else if([elementName isEqualToString:@"image"]){
        [self.blogResponseSectionArray addObject: self.blogResponse];
        [self.blogResponseArray addObject:self.blogResponseSectionArray];
         self.blogResponseSectionArray = [[NSMutableArray alloc]init];
        
    }
    
    else if([elementName isEqualToString:@"channel"]){
        [self.blogResponseArray addObject:self.blogResponseSectionArray];
        //NSLog(@"self.blogResponseArray=%@",self.blogResponseArray);
        dispatch_async(dispatch_get_main_queue(), ^(void){
            self.viewBlogLoading.hidden = YES;
            [self.collectionView reloadData];
            [self.activityLoadView stopAnimating];
        });
        
    }
        
}

//XML parsing end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return [self.blogResponseArray count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    NSMutableArray *arraySection = [self.blogResponseArray objectAtIndex:section];
    
    if(section==0){
        return [arraySection count];
    }
    else{
        return [arraySection count];
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BlogCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSMutableArray *arraySection = [self.blogResponseArray objectAtIndex:indexPath.section];
    BlogResponse *blogResponse = [arraySection objectAtIndex:indexPath.row];
    if(indexPath.section == 0 &&  indexPath.row==0){
        [cell.labelBlogTitle setFont:[UIFont systemFontOfSize:17.0f weight:0.2]];
        cell.widthImageConstraint.constant = collectionView.frame.size.width;
        cell.widthLabelDescConstraint.constant = collectionView.frame.size.width-20.0f;
        cell.widthViewSepratorConstraint.constant = collectionView.frame.size.width;
        cell.heightImageConstarint.constant = 200;
        cell.widthLabelTitleConstraint.constant = collectionView.frame.size.width-20.0f;
        cell.contentView.layer.borderWidth = 0.0f;
        cell.labelBlogDecription.text = blogResponse.blogDecription;
        [cell.labelBlogDecription setFont:[UIFont systemFontOfSize:17.0]];
    }
    else if(indexPath.section == 1){
        
        cell.widthImageConstraint.constant = cell.contentView.frame.size.width;
        cell.heightImageConstarint.constant = 100.0f;
        cell.widthLabelTitleConstraint.constant = cell.contentView.frame.size.width-20.0f;
        [cell.labelBlogTitle setFont:[UIFont systemFontOfSize:15.0f]];
       cell.contentView.layer.borderWidth = 1.0f;
       cell.contentView.layer.borderColor = [[UIColor grayColor] CGColor];
        cell.labelBlogDecription.text = @"";
    }
    
    
    cell.labelBlogTitle.text = blogResponse.blogTitle;
   
        cell.imageBlog.image = nil;
        cell.imageActivityIndicatorView.hidden=NO;
        [cell.imageActivityIndicatorView startAnimating];
        //__weak BlogCollectionViewCell *weakcell = cell;
        [self downloadImage:blogResponse.blogImageUrl withBlogId:blogResponse.blogId withCell:(BlogCollectionViewCell*)cell withCallBack:^(NSString *strFilePath) {
            BlogCollectionViewCell *blogCell = (BlogCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
            if(blogCell){
                [blogCell.imageActivityIndicatorView stopAnimating];
                blogCell.imageActivityIndicatorView.hidden=YES;
                blogCell.imageBlog.image = [UIImage imageNamed:strFilePath];
            }
            else{
                blogCell.imageBlog.image = nil;
            }
        }];
        
    cell.tag=indexPath.row;
    cell.backgroundView.backgroundColor = [UIColor redColor];
     
    cell.layer.borderColor=[UIColor blueColor].CGColor;
    // Configure the cell
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSMutableArray *arraySection = [self.blogResponseArray objectAtIndex:indexPath.section];
    BlogResponse *blogResponse = [arraySection objectAtIndex:indexPath.row];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BlogContentViewController *blogContentViewController = (BlogContentViewController*)[sb instantiateViewControllerWithIdentifier:@"BlogContent_VC"];
    blogContentViewController.blogArticleLink = blogResponse.blogArticleLink;
    [self.navigationController pushViewController:blogContentViewController animated:YES];
}

-(void)downloadImage:(NSString*)strURL withBlogId:(int)blogId withCell:(BlogCollectionViewCell*)cell withCallBack:(void(^)(NSString *filePath))handler{

    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
         NSString *filePath = [self.directoryBlogImagePath stringByAppendingPathComponent:[NSString stringWithFormat: @"blog_%d.jpg",blogId]];
        
        if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
            dispatch_async(dispatch_get_main_queue(), ^(void){
                           handler(filePath);
            });
            return;
        }
           
           NSURL *url = [NSURL URLWithString:strURL];
           NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
            downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
               
               NSString *filePathStr = [self.directoryBlogImagePath stringByAppendingPathComponent:[NSString stringWithFormat: @"blog_%d.jpg",blogId]];
               [[NSData dataWithContentsOfURL:location] writeToFile:filePathStr atomically:YES];
               dispatch_async(dispatch_get_main_queue(), ^(void){
                   handler(filePathStr);
               });
             
           }];
        
        [downloadPhotoTask resume];
    });
   

    
}



#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView
                layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellWidth = collectionView.frame.size.width/2-16;
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        cellWidth = collectionView.frame.size.width/3-16;
    }
    
    if(indexPath.row==0 && indexPath.section==0){
            
        return CGSizeMake(collectionView.frame.size.width, 350);
    }
    else if(indexPath.section==1){
        return CGSizeMake(cellWidth, 160);
    }
    else{
            return CGSizeMake(cellWidth, 160);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if(section==0){
               
           return UIEdgeInsetsMake(0, 0, 0, 0);
       }
    else{
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    
}
@end
