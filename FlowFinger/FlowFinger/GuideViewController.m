//
//  GuideViewController.m
//  FlowFinger
//
//  Created by apple on 16/9/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GuideViewController.h"

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

@interface GuideViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *pictureArr;



@end

@implementation GuideViewController

- (instancetype)init{
    if (self = [super init]) {
        UIImage *image1 = [UIImage imageNamed:@"引导页1"];
        UIImage *image2 = [UIImage imageNamed:@"引导页2"];
        UIImage *image3 = [UIImage imageNamed:@"引导页3"];
        
        self.pictureArr = @[image1,image2,image3];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height)];
    self.scrollView.contentSize = CGSizeMake(SCREEN_SIZE.width*3, SCREEN_SIZE.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    for (int i = 0; i < _pictureArr.count; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width*i, 0, SCREEN_SIZE.width, SCREEN_SIZE.height)];
        imgView.image = _pictureArr[i];
        
        [self.scrollView addSubview:imgView];
    }
    
    [self.view addSubview:self.scrollView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setPictureArr:(NSArray *)pictureArr{
    _pictureArr = pictureArr;
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;{
    if (scrollView ==_scrollView)
    {
        NSInteger p = _scrollView.contentOffset.x/SCREEN_SIZE.width;
        
        NSLog(@"%lf",_scrollView.contentOffset.x);
        [_scrollView setContentOffset:CGPointMake(SCREEN_SIZE.width*(p), 0)];
        
    }
}

@end
