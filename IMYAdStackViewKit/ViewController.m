//
//  ViewController.m
//  IMYAdStackViewKit
//
//  Created by 戴惠香 on 2019/6/10.
//  Copyright © 2019 戴惠香. All rights reserved.
//

#import "ViewController.h"
#import "AdViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    UIStackView *_stackView;
}
@property (nonatomic,strong)NSArray *adsArray;
@property (nonatomic,strong)UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readJsonData];
    
}

- (void)readJsonData
{
    NSString *jsonFile = [[NSBundle mainBundle] pathForResource:@"AdsUI" ofType:@"geojson"];
    if (jsonFile) {
        NSData *jsonData = [NSData dataWithContentsOfFile:jsonFile];
        if (jsonData) {
            NSError *error = nil;
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
            if (jsonDict) {
                NSArray *ads = [jsonDict objectForKey:@"ads"];
                if (ads.count > 0) {
                    self.adsArray = ads;
                    [self setupTableView];
                }
            }
        }
    }
}

- (void)setupTableView
{
    UITableView *tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    self.tableview = tableview;
}

#pragma mark - tableview datasource & delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.adsArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary *cellDict = [self.adsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@",cellDict[@"postion"],cellDict[@"type"]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *cellDict = [self.adsArray objectAtIndex:indexPath.row];
    AdViewController *adVC = [[AdViewController alloc] init];
    [adVC setupAdWithDict:cellDict];
    adVC.title = [cellDict objectForKey:@"type"];
    
    [self.navigationController pushViewController:adVC animated:YES];
}
@end
