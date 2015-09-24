//
//  ShotViewController2.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/22/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "ShotViewController2.h"
#import "ShotModel.h"
#import "ShotCell.h"
#import "NetworkingController.h"
#import "DetailsViewController.h"

#import "DetailsCell.h"

@interface ShotViewController2 ()

@property (strong, nonatomic) ShotTableViewDataSource* tableViewDataSource;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *posts;
@property int pageCount;
@property (strong, nonatomic) UIRefreshControl *refreshControl;


@end

@implementation ShotViewController2

-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 250;
    self.navigationItem.title = @"Shots view";
    
    self.posts = [[NSMutableArray alloc] init];
    [self refreshView];
    self.pageCount = 1;
    [self loadPosts:self.pageCount];
}

-(void)setUpTableView{
    
    self.tableViewDataSource = [[ShotTableViewDataSource alloc] initWithItems:self.posts];
    self.tableView.dataSource = self.tableViewDataSource;
    self.tableView.delegate = self.tableViewDataSource;
    [self loadPosts:self.pageCount];
}

-(void) loadPosts:(int)page{
    [self.refreshControl beginRefreshing];
    
    NSString *json = @"https://api.dribbble.com/shots/popular";
    
    NSDictionary *parameters = @{@"page": [@(page) stringValue]};
    
    [[NetworkingController sharedInstance]getShot:json parameters:parameters success:^(NSArray *shot) {
        [self.posts addObjectsFromArray:shot];
        [self.tableView reloadData];
    } failure:^(NSError *erro) {
        NSLog(@"%@",erro);
    }];
    
    [self.refreshControl endRefreshing];
}

#pragma mark - Metodos do pull to refresh
//Prepara o Pull to refresh
-(void)refreshView
{
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}

//Executa o Pull to refresh
-(void)refreshAction
{
    [self.posts removeAllObjects];
    self.pageCount = 1;
    [self loadPosts:self.pageCount];
}

#pragma mark - Metodos de transição
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailsSegue"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailsViewController *dvc = segue.destinationViewController;
        dvc.shot = [self.posts objectAtIndex:indexPath.row];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        return NO;
    }
    else
        return YES;
}

#pragma mark UITableViewDelegateMethods
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.tableView numberOfRowsInSection:1]-3 && self.pageCount <= 50){
        [self loadPosts:self.pageCount++];
    }
}




@end
