//
//  QNAMenuViewController.m
//  QNADiploma
//
//  Created by Zhanserik Kenes on 21.02.15.
//  Copyright (c) 2015 Zhans Inc. All rights reserved.
//

#import "QNAMenuViewController.h"
#import "QNAMenuItem.h"
#import "QNAMenuTableViewCell.h"
#import "SlideNavigationController.h"

@interface QNAMenuViewController() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSArray *itemList;
@end

@implementation QNAMenuViewController

@synthesize tableView = _tableView;
@synthesize itemList = _itemList;

#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    _tableView = [UITableView new];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 44;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:_tableView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_tableView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_tableView)]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tableView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(_tableView)]];
    
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor clearColor];
    headerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 20);
    
    _tableView.tableHeaderView = headerView;
    
    QNAMenuItem *item0 = [QNAMenuItem new];
    item0.title = @"My Home";
    item0.storyboardIdentifier = @"QNAHomeViewController";
    item0.image = [UIImage imageNamed:@"rituals_icon.png"];
    
    QNAMenuItem *item1 = [QNAMenuItem new];
    item1.title = @"My Questions";
    item1.storyboardIdentifier = @"QNAMyQuestionsViewController";
    item1.image = [UIImage imageNamed:@"rituals_icon.png"];
    
    QNAMenuItem *item2 = [QNAMenuItem new];
    item2.title = @"My Answers";
    item2.storyboardIdentifier = @"QNAMyAnswersViewController";
    item2.image = [UIImage imageNamed:@"store_icon.png"];
    
    QNAMenuItem *item4 = [QNAMenuItem new];
    item4.title = @"My profile";
    item4.storyboardIdentifier = @"QNAMyProfileViewController";
    item4.image = [UIImage imageNamed:@"rituals_icon.png"];
    
    
    _itemList = @[item4, item0, item1, item2];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableView Delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QNAMenuItem *item = _itemList[indexPath.row];
    
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:item.storyboardIdentifier];
    
    [[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:controller
                                                                    withCompletion:nil];
}

#pragma mark - UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_itemList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"UITableViewCell";
    
    QNAMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        cell = [[QNAMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                           reuseIdentifier:identifier];
    }
    QNAMenuItem *item = _itemList[indexPath.row];
    
    cell.iconImage = item.image;
    cell.textLabel.text = item.title;
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

@end
