//
//  FeedsTableViewController.h
//  ProficienyTest
//
//  Created by Kanika Varma on 11/03/2015.
//  Copyright (c) 2015 Kanika Varma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <dispatch/dispatch.h>

@interface FeedsTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{    
    NSOperationQueue* queue;
}
@property(nonatomic, strong)NSDictionary* jsonDict;

@end
