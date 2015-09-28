//
//  DetailViewController.m
//  desafio-ios-tests
//
//  Created by Bruno Rendeiro on 9/24/15.
//  Copyright © 2015 Bruno Rendeiro. All rights reserved.
//

#import "DetailViewController.h"
#import "ShotModel.h"

@interface DetailViewController ()

@property (strong, nonatomic) DetailTableViewDataSource *detailDataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation DetailViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 500.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.navigationItem.title = @"Shots view";
    
    [self setUpTableView];
}

-(void)setUpTableView{
    
    self.detailDataSource = [[DetailTableViewDataSource alloc] initWithShot:self.shot];
    self.tableView.dataSource = self.detailDataSource;
}

#pragma mark - Metodos botoes navBar
- (IBAction)shareButton:(id)sender {
    
    NSString *title = self.shot.title;
    if ([title length] == 0) title = @"";
    NSString *desc = self.shot.desc;
    if ([desc length] == 0) desc = @"";
    NSURL *url = self.shot.image;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    if (image == nil) image = [UIImage imageNamed:placeholder];
    NSArray *activityItems = @[title,desc,image];
    NSMutableArray *Items = [NSMutableArray arrayWithArray:activityItems];
    
    UIActivityViewController *share = [[UIActivityViewController alloc] initWithActivityItems:Items applicationActivities:nil];
    
    NSArray *exclude = @[UIActivityTypeAddToReadingList,UIActivityTypeAirDrop,UIActivityTypeAssignToContact,UIActivityTypeCopyToPasteboard,UIActivityTypeMail,UIActivityTypeMessage,UIActivityTypePostToFlickr,UIActivityTypePostToTencentWeibo,UIActivityTypePostToVimeo,UIActivityTypePostToWeibo,UIActivityTypePrint,UIActivityTypeSaveToCameraRoll];
    
    share.excludedActivityTypes = exclude;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [self presentViewController:share animated:YES completion:nil];
    }
    else {
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:share];
        [popup presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    }
    
}

@end
