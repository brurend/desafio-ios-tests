//
//  DetailViewController.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/24/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "DetailViewController.h"
#import "ShareHelper.h"
#import "DetailTableViewDataSource.h"


@interface DetailViewController ()

@property (strong, nonatomic) DetailTableViewDataSource *detailDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation DetailViewController

-(void)viewDidLoad{
    [super viewDidLoad];

    
    [self setUpTableView];
}

-(void)setUpTableView{
    
    self.detailDataSource = [[DetailTableViewDataSource alloc] initWithShot:self.shot];
    self.tableView.dataSource = self.detailDataSource;
    self.tableView.delegate = self.detailDataSource;
}

#pragma mark - Metodos botoes navBar
- (IBAction)shareButton:(id)sender {
    ShareHelper *helper = [ShareHelper new];
    NSArray *items = [helper activityItems:self.shot];
    
    UIActivityViewController *share = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    
    NSArray *exclude = @[UIActivityTypeAddToReadingList,UIActivityTypeAirDrop,UIActivityTypeAssignToContact,UIActivityTypeCopyToPasteboard,UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypePostToFlickr,UIActivityTypePostToTencentWeibo,UIActivityTypePostToVimeo,UIActivityTypePostToWeibo,UIActivityTypePrint,UIActivityTypeSaveToCameraRoll];
    
    share.excludedActivityTypes = exclude;
    
    [self presentViewController:share animated:YES completion:nil];

    
}

@end
