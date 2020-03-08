//
//  CrisisViewController.m
//  SafetyPlan
//
//

#import "CrisisViewController.h"


@interface CrisisViewController ()
- (IBAction)homebutton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *call1textview;
@property (weak, nonatomic) IBOutlet UILabel *call2textview;
@property (weak, nonatomic) IBOutlet UILabel *call3textview;
@property (weak, nonatomic) IBOutlet UILabel *call4textview;
@property (weak, nonatomic) IBOutlet UILabel *call5textview;
@property (weak, nonatomic) IBOutlet UILabel *call6textview;
@property (weak, nonatomic) IBOutlet UILabel *call7textview;
@property (weak, nonatomic) IBOutlet UILabel *call8textview;
@property (weak, nonatomic) IBOutlet UILabel *call9textview;

@end

@implementation CrisisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //BAR COLOR CODE
    [self.navigationController.navigationBar setTranslucent:NO];
    //set title and title color
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    //set back button color
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    //set back button arrow color
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    // This will remove extra separators from tableview**********************
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
     [self.tableView reloadData];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *call = @"Call ";
    NSString *name1 = [NSString stringWithFormat: @"%@%@", call , [defaults objectForKey:@"name1"]];
    NSString *name2 = [NSString stringWithFormat: @"%@%@", call , [defaults objectForKey:@"name2"]];
    NSString *name3 = [NSString stringWithFormat: @"%@%@", call , [defaults objectForKey:@"name3"]];
    NSString *name4 = [NSString stringWithFormat: @"%@%@", call , [defaults objectForKey:@"name4"]];
    NSString *name5 = [NSString stringWithFormat: @"%@%@", call , [defaults objectForKey:@"name5"]];
    NSString *name6 = [NSString stringWithFormat: @"%@%@", call , [defaults objectForKey:@"name6"]];
    NSString *name7 = [NSString stringWithFormat: @"%@%@", call , [defaults objectForKey:@"name7"]];
    NSString *name8 = [NSString stringWithFormat: @"%@%@", call , [defaults objectForKey:@"name8"]];
    NSString *name9 = [NSString stringWithFormat: @"%@%@", call , [defaults objectForKey:@"name9"]];
    
    
    _call1textview.text = name1;
    _call2textview.text = name2;
    _call3textview.text = name3;
    _call4textview.text = name4;
    _call5textview.text = name5;
    _call6textview.text = name6;
    _call7textview.text = name7;
    _call8textview.text = name8;
    _call9textview.text = name9;
  
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 14;
}


- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    //This code is called when something is tapped!
    
    if(indexPath.row == 0) { //SELECTS THE FIRST TABLEVIEW - CALL EMERGENCY NUMBER

        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Call"
                                      message:@"Call 911?"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 NSString *phoneNumber = [@"tel://" stringByAppendingString:@"911"];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    if(indexPath.row == 1) { //When "Call Helpline" is pushed
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Call"
                                      message:@"Call National Suicide Prevention Lifeline?"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 NSString *phoneNumber = [@"tel://" stringByAppendingString:@"18002738255"];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    if(indexPath.row == 2) { //when Text Crisis Text Line is pushed
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Text Crisis Text Line"
                                      message:@"Text 741741?"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 NSString *sms = @"sms:+741741";
                                 NSString *url = [sms stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
                                 
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    if(indexPath.row == 3) { //When Call #1 is pushed
        //Step 1. Retrieve string from storage somehow
        //Step 2. If it exists, then do the following code by putting in that string
        
       //ORIGINAL CODE
        /*NSString *number1 = [defaults objectForKey:@"number1"];
        NSString *phonenumber1 = [@"tel://" stringByAppendingString:number1];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonenumber1]];*/

        //NEW CODE
        NSString *number1 = [defaults objectForKey:@"number1"];
        NSString *phonenumber1 = [@"tel://" stringByAppendingString:number1];
        NSString *name1 = [NSString stringWithFormat: @"%@ %@", @"Call" , [defaults objectForKey:@"name1"]];
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:name1
                                      message:number1
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonenumber1]];
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    
    }
    if(indexPath.row == 4) { //When Call #2 is pushed

        NSString *number2 = [defaults objectForKey:@"number2"];
        NSString *phonenumber2 = [@"tel://" stringByAppendingString:number2];
        NSString *name2 = [NSString stringWithFormat: @"%@ %@", @"Call" , [defaults objectForKey:@"name2"]];
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:name2
                                      message:number2
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonenumber2]];
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];


        
    }
    if(indexPath.row == 5) { //When Call #3
        NSString *number3 = [defaults objectForKey:@"number3"];
        NSString *phonenumber3 = [@"tel://" stringByAppendingString:number3];
        NSString *name3 = [NSString stringWithFormat: @"%@ %@", @"Call" , [defaults objectForKey:@"name3"]];
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:name3
                                      message:number3
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonenumber3]];
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];

    }
    if(indexPath.row == 6) {
        NSString *number4 = [defaults objectForKey:@"number4"];
        NSString *phonenumber4 = [@"tel://" stringByAppendingString:number4];
        NSString *name4 = [NSString stringWithFormat: @"%@ %@", @"Call" , [defaults objectForKey:@"name4"]];
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:name4
                                      message:number4
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonenumber4]];
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];

        

    }
    if(indexPath.row == 7) {
        NSString *number5 = [defaults objectForKey:@"number5"];
        NSString *phonenumber5 = [@"tel://" stringByAppendingString:number5];
        NSString *name5 = [NSString stringWithFormat: @"%@ %@", @"Call" , [defaults objectForKey:@"name5"]];
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:name5
                                      message:number5
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonenumber5]];
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];

        

    }
    if(indexPath.row == 8) {
        NSString *number6 = [defaults objectForKey:@"number6"];
        NSString *phonenumber6 = [@"tel://" stringByAppendingString:number6];
        NSString *name6 = [NSString stringWithFormat: @"%@ %@", @"Call" , [defaults objectForKey:@"name6"]];
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:name6
                                      message:number6
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonenumber6]];
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];

        

    }
    if(indexPath.row == 9) {
        NSString *number7 = [defaults objectForKey:@"number7"];
        NSString *phonenumber7 = [@"tel://" stringByAppendingString:number7];
        NSString *name7 = [NSString stringWithFormat: @"%@ %@", @"Call" , [defaults objectForKey:@"name7"]];
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:name7
                                      message:number7
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonenumber7]];
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];

        

    }
    if(indexPath.row == 10) {
        NSString *number8 = [defaults objectForKey:@"number8"];
        NSString *phonenumber8 = [@"tel://" stringByAppendingString:number8];
        NSString *name8 = [NSString stringWithFormat: @"%@ %@", @"Call" , [defaults objectForKey:@"name8"]];
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:name8
                                      message:number8
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonenumber8]];
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];

        

    }
    if(indexPath.row == 11) {
        NSString *number9 = [defaults objectForKey:@"number9"];
        NSString *phonenumber9 = [@"tel://" stringByAppendingString:number9];
        NSString *name9 = [NSString stringWithFormat: @"%@ %@", @"Call" , [defaults objectForKey:@"name9"]];
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:name9
                                      message:number9
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phonenumber9]];
                             }];
        UIAlertAction* cancel = [UIAlertAction
                                 actionWithTitle:@"Cancel"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        [alert addAction:cancel];
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];

        

    }
    if(indexPath.row == 12) { //When 'Find Urgent Care' is pushed
        
        /*GoogleMapDefinition *definition = [[GoogleMapDefinition alloc] init];
        definition.queryString = @"Urgent Care";
        [[OpenInGoogleMapsController sharedInstance] openMap:definition];*/
        
        if ([[UIApplication sharedApplication] canOpenURL:
             [NSURL URLWithString:@"comgooglemaps://"]]) {
            [[UIApplication sharedApplication] openURL:
             [NSURL URLWithString:@"comgooglemaps://?q=Urgent+Care"]];
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.google.com/maps/search/Urgent+Care"]];
        }
        
    }
    if(indexPath.row == 13) { //When 'Find Emergency Departments' is pushed
        if ([[UIApplication sharedApplication] canOpenURL:
             [NSURL URLWithString:@"comgooglemaps://"]]) {
            [[UIApplication sharedApplication] openURL:
             [NSURL URLWithString:@"comgooglemaps://?q=Emergency+Department"]];
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.google.com/maps/search/Emergency+Department"]];
        }
    }
    
      [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //THE CODE IN THIS SECTION HIDES ROWS IF THEY HAVE NO NAME / NUMBER IN THEM!
    float heightForRow = 60;
    
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name1 = [defaults objectForKey:@"name1"];
     NSString *name2 = [defaults objectForKey:@"name2"];
     NSString *name3 = [defaults objectForKey:@"name3"];
     NSString *name4 = [defaults objectForKey:@"name4"];
     NSString *name5 = [defaults objectForKey:@"name5"];
     NSString *name6 = [defaults objectForKey:@"name6"];
     NSString *name7 = [defaults objectForKey:@"name7"];
     NSString *name8 = [defaults objectForKey:@"name8"];
     NSString *name9 = [defaults objectForKey:@"name9"];
    NSString *number1 = [defaults objectForKey:@"number1"];
    NSString *number2 = [defaults objectForKey:@"number2"];
    NSString *number3 = [defaults objectForKey:@"number3"];
    NSString *number4 = [defaults objectForKey:@"number4"];
    NSString *number5 = [defaults objectForKey:@"number5"];
    NSString *number6 = [defaults objectForKey:@"number6"];
    NSString *number7 = [defaults objectForKey:@"number7"];
    NSString *number8 = [defaults objectForKey:@"number8"];
    NSString *number9 = [defaults objectForKey:@"number9"];

    if(indexPath.row == 3) {//Call #1
        if(([name1 length] > 0) && ([number1 length] > 0)) return heightForRow;
        else return 0;
    }
    else if(indexPath.row == 4) {
        if(([name2 length] > 0) && ([number2 length] > 0)) return heightForRow;
        else return 0;
    }
    else if(indexPath.row == 5) {
        if(([name3 length] > 0) && ([number3 length] > 0)) return heightForRow;
        else return 0;
    }
    else if(indexPath.row == 6) {
        if(([name4 length] > 0) && ([number4 length] > 0)) return heightForRow;
        else return 0;
    }
    else if(indexPath.row == 7) {
        if(([name5 length] > 0) && ([number5 length] > 0)) return heightForRow;
        else return 0;
    }
    else if(indexPath.row == 8) {
        if(([name6 length] > 0) && ([number6 length] > 0)) return heightForRow;
        else return 0;
    }
    else if(indexPath.row == 9) {
        if(([name7 length] > 0) && ([number7 length] > 0)) return heightForRow;
        else return 0;
    }
    else if(indexPath.row == 10) {
        if(([name8 length] > 0) && ([number8 length] > 0)) return heightForRow;
        else return 0;
    }
    else if(indexPath.row == 11) {
        if(([name9 length] > 0) && ([number9 length] > 0)) return heightForRow;
        else return 0;
    }
    else {
        return heightForRow;
    }
    
}




- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == [alertView cancelButtonIndex]){
        //cancel clicked ...do your action
    }else{
        //reset clicked
    }
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)homebutton:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* ViewController = [storyboard instantiateInitialViewController];
    
    ViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:ViewController animated:YES completion:nil];
}
@end
