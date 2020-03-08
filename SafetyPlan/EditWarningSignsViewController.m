//
//  EditWarningSignsViewController.m
//  SafetyPlan
//
//

#import "EditWarningSignsViewController.h"

@interface EditWarningSignsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textview1;
@property (weak, nonatomic) IBOutlet UITextField *textview2;
@property (weak, nonatomic) IBOutlet UITextField *textview3;
@property (weak, nonatomic) IBOutlet UITextField *textview4;
@property (weak, nonatomic) IBOutlet UITextField *textview5;
@property (weak, nonatomic) IBOutlet UITextField *textview6;
@property (weak, nonatomic) IBOutlet UITextField *textview7;
@property (weak, nonatomic) IBOutlet UITextField *textview8;
@property (weak, nonatomic) IBOutlet UITextField *textview9;
@property (weak, nonatomic) IBOutlet UIButton *addanotherbutton;
- (IBAction)addanotherbuttonpress:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *savebutton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height5;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height6;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height7;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height8;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height9;


@end

@implementation EditWarningSignsViewController

int wscounter = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //BAR COLOR CODE
    [self.navigationController.navigationBar setTranslucent:NO];
    //set title and title color
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    //set back button color
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    //set back button arrow color
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *warningsign1 = [defaults objectForKey:@"warningsign1"];
    NSString *warningsign2 = [defaults objectForKey:@"warningsign2"];
    NSString *warningsign3 = [defaults objectForKey:@"warningsign3"];
    NSString *warningsign4 = [defaults objectForKey:@"warningsign4"];
    NSString *warningsign5 = [defaults objectForKey:@"warningsign5"];
    NSString *warningsign6 = [defaults objectForKey:@"warningsign6"];
    NSString *warningsign7 = [defaults objectForKey:@"warningsign7"];
    NSString *warningsign8 = [defaults objectForKey:@"warningsign8"];
    NSString *warningsign9 = [defaults objectForKey:@"warningsign9"];
    
    
    _textview1.text = warningsign1;
    _textview2.text = warningsign2;
    _textview3.text = warningsign3;
    _textview4.text = warningsign4;
    _textview5.text = warningsign5;
    _textview6.text = warningsign6;
    _textview7.text = warningsign7;
    _textview8.text = warningsign8;
    _textview9.text = warningsign9;
    
    
    wscounter = 0;
    if(!([warningsign1 length] == 0)) wscounter++;
    if(!([warningsign2 length] == 0)) wscounter++;
    if(!([warningsign3 length] == 0)) wscounter++;
    if(!([warningsign4 length] == 0)) wscounter++;
    if(!([warningsign5 length] == 0)) wscounter++;
    if(!([warningsign6 length] == 0)) wscounter++;
    if(!([warningsign7 length] == 0)) wscounter++;
    if(!([warningsign8 length] == 0)) wscounter++;
    if(!([warningsign9 length] == 0)) wscounter++;
    
    if(wscounter == 9) {
        _addanotherbutton.hidden = YES;
    }
    if(wscounter < 9) {
        _height9.constant = 0;
    }
    if(wscounter < 8) {
        _height8.constant = 0;
    }
    if(wscounter < 7) {
        _height7.constant = 0;
    }
    if(wscounter < 6) {
        _height6.constant = 0;
    }
    if(wscounter < 5) {
        _height5.constant = 0;
    }
    if(wscounter < 4) {
        _height4.constant = 0;
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
 - (IBAction)save:(id)sender
 {
 //Get strings from the uitextviews
 NSString *warningsign1 = [_textview1 text];
 NSString *warningsign2 = [_textview2 text];
 NSString *warningsign3 = [_textview3 text];
 
 //Store the data
 NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 [defaults setObject:warningsign1 forKey:@"warningsign1"];
 [defaults setObject:warningsign2 forKey:@"warningsign2"];
 [defaults setObject:warningsign3 forKey:@"warningsign3"];
 [defaults synchronize];
 
 [self dismissViewControllerAnimated:YES completion:nil];
 
 }
 */

//Somehow take care of textview changing!


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if (sender != self.savebutton) return;
    //Get strings from the uitextviews
    NSString *warningsign1 = [_textview1 text];
    NSString *warningsign2 = [_textview2 text];
    NSString *warningsign3 = [_textview3 text];
    NSString *warningsign4 = [_textview4 text];
    NSString *warningsign5 = [_textview5 text];
    NSString *warningsign6 = [_textview6 text];
    NSString *warningsign7 = [_textview7 text];
    NSString *warningsign8 = [_textview8 text];
    NSString *warningsign9 = [_textview9 text];
    
    
    //Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:warningsign1 forKey:@"warningsign1"];
    [defaults setObject:warningsign2 forKey:@"warningsign2"];
    [defaults setObject:warningsign3 forKey:@"warningsign3"];
    [defaults setObject:warningsign4 forKey:@"warningsign4"];
    [defaults setObject:warningsign5 forKey:@"warningsign5"];
    [defaults setObject:warningsign6 forKey:@"warningsign6"];
    [defaults setObject:warningsign7 forKey:@"warningsign7"];
    [defaults setObject:warningsign8 forKey:@"warningsign8"];
    [defaults setObject:warningsign9 forKey:@"warningsign9"];
    [defaults synchronize];
    
    
}


- (IBAction)addanotherbuttonpress:(id)sender {
    //Get the wscounter value
    if(wscounter < 4) { //show textview4 & set wscounter to 4
        _height4.constant = 30;
        wscounter = 4;
    }
    else if(wscounter == 4) {
        wscounter = 5;
        _height5.constant = 30;
    }
    else if(wscounter == 5) {
        wscounter = 6;
        _height6.constant = 30;
    }
    else if(wscounter == 6) {
        wscounter = 7;
        _height7.constant = 30;
    }
    else if(wscounter == 7) {
        wscounter = 8;
        _height8.constant = 30;
    }
    else if(wscounter == 8) {
        wscounter = 9;
        _height9.constant = 30;
        _addanotherbutton.hidden = YES;
    }
    
    
    
}
@end

