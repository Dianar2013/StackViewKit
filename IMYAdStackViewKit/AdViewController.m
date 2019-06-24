//
//  AdViewController.m
//  IMYAdAssembleViewKit
//
//  Created by 戴惠香 on 2019/5/7.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "AdViewController.h"
#import "IMYAdAssembleView.h"
#import "Masonry.h"

@interface AdViewController ()
@property (nonatomic,strong) UIView *contentView;
@end

@implementation AdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)es_addSubviews{
    
    UIStackView *main = [self rowsWithMargin:UIEdgeInsetsMake(15, 15, 15, 15) spacing:10];
    [self.contentView addSubview:main];
    [main mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
    }];
    
    UIStackView *headBar = [self colsWithMargin:UIEdgeInsetsMake(0, 0, 0, 0) spacing:10];
    [main addArrangedSubview:headBar];
    
    UIView *icon = [self box];
    icon.layer.cornerRadius = 18;
    
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(36);
    }];
    
    [headBar addArrangedSubview:icon];
    
    UIStackView *userInfo = [self rowsWithMargin:UIEdgeInsetsMake(0, 0, 0, 0) spacing:5];
    [headBar addArrangedSubview:userInfo];
    [userInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(51);
    }];
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:17];
    label.text = @"用户小宝";
    label.textColor = [UIColor blueColor];
    label.textAlignment = NSTextAlignmentCenter;
    [userInfo addArrangedSubview:label];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.font = [UIFont systemFontOfSize:13];
    label2.text = @"12:04 北京";
    label2.textColor = [UIColor colorWithWhite:0.7 alpha:1];
    label2.textAlignment = NSTextAlignmentCenter;
    [userInfo addArrangedSubview:label2];
    
    
    UIStackView *heartStack = [self colsWithMargin:UIEdgeInsetsMake(0, 0, 0, 0) spacing:5];
    [headBar addArrangedSubview:heartStack];
    [headBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
    }];
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"ad_btn_callout.png"] forState:UIControlStateNormal];
    [heartStack addArrangedSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(36);
    }];
    
    
    UIStackView *labelStack = [self colsWithMargin:UIEdgeInsetsMake(0, 0, 0, 0) spacing:0 ];
    [main addArrangedSubview:labelStack];
    UILabel *label3 = [[UILabel alloc] init];
    label3.font = [UIFont systemFontOfSize:18];
    label3.text = @"之前来中国席卷票房的《碟中谍6》，让56岁依然亲身上阵各种高危动作戏的老帅哥汤姆?克鲁斯又火了一把。年过半百，汤帅依然身材干练，飞车、开直升机丝毫不怵。";
    label3.textColor = [UIColor colorWithWhite:0.1 alpha:1];
    label3.numberOfLines = 0;
    [labelStack addArrangedSubview:label3];
    
    UIStackView *imagebox = [self colsWithMargin:UIEdgeInsetsMake(0, 0, 0, 0) spacing:5];
    
    int cout = ceil(rand()%3) + 1;
    
    CGFloat w = floor(([UIScreen mainScreen].bounds.size.width - 30 - 10)/3);
    
    for (int i = 0; i<cout; i++) {
        
        UIView *img = [self box];
        
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(w * (4 - cout));
        }];
        
        [imagebox addArrangedSubview:img];
    }
    
    [main addArrangedSubview:imagebox];
    
}

- (UIStackView *)divWithAxis:(UILayoutConstraintAxis)layoutConstraintAxis margin:(UIEdgeInsets)marin spacing:(NSUInteger)spacing{
    UIStackView *div = [[UIStackView alloc] init];
    div.axis = layoutConstraintAxis;
    div.spacing = spacing;
    div.alignment = UIStackViewAlignmentLeading;
    div.distribution = UIStackViewDistributionEqualSpacing;
    div.layoutMargins = marin;
    div.layoutMarginsRelativeArrangement = YES;
    return div;
}

- (UIStackView *)rowsWithMargin:(UIEdgeInsets)marin spacing:(NSUInteger)spacing{
    return [self divWithAxis:UILayoutConstraintAxisVertical margin:marin spacing:spacing];
}


- (UIStackView *)colsWithMargin:(UIEdgeInsets)marin spacing:(NSUInteger)spacing{
    return [self divWithAxis:UILayoutConstraintAxisHorizontal margin:marin spacing:spacing];
}

- (UIView *)box{
    UIView * view = [[UIView alloc] init];
    
    view.backgroundColor = [self rndColor];
    //    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideView:)];
    view.userInteractionEnabled = YES;
    //    [view addGestureRecognizer:tap];
    return view;
}

- (UIColor *)rndColor{
    return [UIColor colorWithRed:rand()%256/255.0 green:rand()%256/255.0 blue:rand()%256/255.0 alpha:1];
}


- (void)setupAdWithDict:(NSDictionary*)adDict
{
    UIView *view = [IMYAdAssembleView createViewWithDict:adDict];
    
    _contentView = [[UIView alloc] init];
//    [self es_addSubviews];
    [_contentView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
    }];
    
    CGSize headerSize = [self.contentView  systemLayoutSizeFittingSize:CGSizeMake(self.view.bounds.size.width - 20, 0) withHorizontalFittingPriority:UILayoutPriorityRequired verticalFittingPriority:UILayoutPriorityDefaultLow];
    _contentView.frame = CGRectMake(10,80,headerSize.width,headerSize.height);
 
    [self.view addSubview:_contentView];
    _contentView.layer.borderColor = [UIColor redColor].CGColor;
    _contentView.layer.borderWidth = 1.0;
    
    NSLog(@"adDict=%@",adDict);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
