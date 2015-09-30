//
//  ShotViewController2.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/22/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "ShotViewController.h"
#import "ShotModel.h"
#import "NetworkClient.h"
#import "DetailTableViewDataSource.h"
#import "DetailViewController.h"
#import "NSString+StripHTML.h"
#import "ShotModelContainer.h"
#import "ShotTableViewDataSource.h"
#import "ShareHelper.h"


@interface ShotViewController()

@property (strong, nonatomic) ShotTableViewDataSource* tableViewDataSource;
@property (strong, nonatomic) DetailTableViewDataSource* detailDataSource;
@property (weak, nonatomic) IBOutlet UITableView *shotTable;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) ShotModel *shot;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;

@property (strong, nonatomic) ShotModelContainer *modelContainer;

@end

@implementation ShotViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        self.navigationItem.rightBarButtonItem = nil;
    }
    
    [self refreshView];
    
    self.modelContainer.pageCount = 1;
    
    [self setUpTableView];
}

-(ShotModelContainer*)modelContainer{
    if(!_modelContainer)
        _modelContainer = [ShotModelContainer new];
    return _modelContainer;
}

-(void)setUpTableView{
    
    self.tableViewDataSource = [[ShotTableViewDataSource alloc] initWithModelContainer:self.modelContainer];
    self.tableViewDataSource.shotViewController = self;
    self.shotTable.dataSource = self.tableViewDataSource;
    self.shotTable.delegate = self.tableViewDataSource;
    [self loadPosts:self.modelContainer.pageCount];
}

-(void)setUpDetailView:(ShotModel*)shot{
    self.detailDataSource = [[DetailTableViewDataSource alloc] initWithShot:shot];
    self.detailTable.dataSource = self.detailDataSource;
    self.detailTable.delegate = self.detailDataSource;
}

-(void)setupDatasourceEmptyState{
    if (self.shot == nil){
        self.shot = [self.modelContainer.items objectAtIndex:0];
        [self setUpDetailView:self.shot];
        [self.detailTable reloadData];
    }
}

-(void) loadPosts:(NSInteger)page{

    id sucessBlock = ^(NSArray *shots) {
        NSMutableArray *posts = [[NSMutableArray alloc] initWithArray:self.modelContainer.items];
        [posts addObjectsFromArray:shots];
        self.modelContainer.items = posts;
        [self.shotTable reloadData];
        [self setupDatasourceEmptyState];
        [self.refreshControl endRefreshing];
    };
    
    
    id failureBlock = ^(NSError *erro) {
        [self.refreshControl endRefreshing];
        NSLog(@"%@",erro);
    };
    
    
    [self.refreshControl beginRefreshing];
    NSDictionary *parameters = @{@"page": [@(page) stringValue]};
    [[NetworkClient sharedInstance] getShotsWithParameters:parameters
                                                          success:sucessBlock
                                                          failure:failureBlock];
    

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
    self.modelContainer.items = [NSArray new];
    [self.shotTable reloadData];
    self.modelContainer.pageCount = 1;
    [self loadPosts:self.modelContainer.pageCount];
}

#pragma mark - Metodos de transição
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailsSegue"])
    {
        NSIndexPath *indexPath = [self.shotTable indexPathForSelectedRow];
        DetailViewController *dvc = segue.destinationViewController;
        dvc.shot = [self.modelContainer.items objectAtIndex:indexPath.row];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    return UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad;
}



- (IBAction)share:(id)sender {
    ShareHelper *helper = [ShareHelper new];
    NSArray *items = [helper activityItems:self.shot];
    
    UIActivityViewController *share = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    
    NSArray *exclude = @[UIActivityTypeAddToReadingList,UIActivityTypeAirDrop,UIActivityTypeAssignToContact,UIActivityTypeCopyToPasteboard,UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypePostToFlickr,UIActivityTypePostToTencentWeibo,UIActivityTypePostToVimeo,UIActivityTypePostToWeibo,UIActivityTypePrint,UIActivityTypeSaveToCameraRoll];
    
    share.excludedActivityTypes = exclude;

        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:share];
        [popup presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}


@end
