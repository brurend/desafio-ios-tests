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
#import "DetailTableViewDataSource.h"
#import "DetailViewController.h"

#import "DetailsCell.h"

@interface ShotViewController2 ()

@property (strong, nonatomic) ShotTableViewDataSource* tableViewDataSource;
@property (strong, nonatomic) DetailTableViewDataSource* detailDataSource;
@property (weak, nonatomic) IBOutlet UITableView *detailTable;

@property (weak, nonatomic) IBOutlet UITableView *shotTable;
//@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *posts;
@property int pageCount;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) ShotModel *shot;

@end

@implementation ShotViewController2

-(void)viewDidLoad{
    [super viewDidLoad];
    self.detailTable.estimatedRowHeight = 500.0f;
    self.navigationItem.title = @"Shots view";
    
    self.posts = [[NSMutableArray alloc] init];
    [self refreshView];
    self.pageCount = 1;
    
    [self setUpTableView];
}

-(void)setUpTableView{
    
    self.tableViewDataSource = [[ShotTableViewDataSource alloc] initWithItems:self.posts];
    self.shotTable.dataSource = self.tableViewDataSource;
    self.shotTable.delegate = self;
    [self loadPosts:self.pageCount];
}

-(void)setUpDetailView:(ShotModel*)shot{
    self.detailDataSource = [[DetailTableViewDataSource alloc] initWithShot:shot];
    self.detailTable.dataSource = self.detailDataSource;
    self.detailTable.delegate = self;
}

-(void) loadPosts:(int)page{
    [self.refreshControl beginRefreshing];
    
    NSString *json = @"https://api.dribbble.com/shots/popular";
    
    NSDictionary *parameters = @{@"page": [@(page) stringValue]};
    
    [[NetworkingController sharedInstance]getShot:json parameters:parameters success:^(NSArray *shot) {
        [self.posts addObjectsFromArray:shot];
        [self.shotTable reloadData];
        if(self.shot == nil){
            self.shot = [shot objectAtIndex:0];
            [self setUpDetailView:self.shot];
            [self.detailTable reloadData];
        }
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
    [self.shotTable addSubview:self.refreshControl];
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
        NSIndexPath *indexPath = [self.shotTable indexPathForSelectedRow];
        DetailViewController *dvc = segue.destinationViewController;
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
    if (indexPath.row == [self.posts count]-3 && self.pageCount <= 50 && tableView.tag == 1){
        [self loadPosts:self.pageCount++];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:self.shotTable]) return 250.0f;
    else return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 1 && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        [self setUpDetailView:[self.posts objectAtIndex:indexPath.row]];
        [self.detailTable reloadData];
    }
}




@end
