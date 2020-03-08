//
//  EditReasonsToLiveViewController.m
//  SafetyPlan
//
//

#import "EditReasonsToLiveViewController.h"

@interface EditReasonsToLiveViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *savebutton;
@property (weak, nonatomic) IBOutlet UITextField *textview3;
@property (weak, nonatomic) IBOutlet UITextField *textview2;
@property (weak, nonatomic) IBOutlet UITextField *textview1;
@property (weak, nonatomic) IBOutlet UITextField *textview4;
@property (weak, nonatomic) IBOutlet UITextField *textview5;
@property (weak, nonatomic) IBOutlet UITextField *textview6;
@property (weak, nonatomic) IBOutlet UITextField *textview7;
@property (weak, nonatomic) IBOutlet UITextField *textview8;
@property (weak, nonatomic) IBOutlet UITextField *textview9;
@property (weak, nonatomic) IBOutlet UIButton *addanotherbutton;
- (IBAction)addanotherbuttonpress:(id)sender;
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

@implementation EditReasonsToLiveViewController

int rtlcounter = 0;

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
    
    
    NSString *reasonstolive1 = [defaults objectForKey:@"reasonstolive1"];
    NSString *reasonstolive2 = [defaults objectForKey:@"reasonstolive2"];
    NSString *reasonstolive3 = [defaults objectForKey:@"reasonstolive3"];
    NSString *reasonstolive4 = [defaults objectForKey:@"reasonstolive4"];
    NSString *reasonstolive5 = [defaults objectForKey:@"reasonstolive5"];
    NSString *reasonstolive6 = [defaults objectForKey:@"reasonstolive6"];
    NSString *reasonstolive7 = [defaults objectForKey:@"reasonstolive7"];
    NSString *reasonstolive8 = [defaults objectForKey:@"reasonstolive8"];
    NSString *reasonstolive9 = [defaults objectForKey:@"reasonstolive9"];
    
    
    _textview1.text = reasonstolive1;
    _textview2.text = reasonstolive2;
    _textview3.text = reasonstolive3;
    _textview4.text = reasonstolive4;
    _textview5.text = reasonstolive5;
    _textview6.text = reasonstolive6;
    _textview7.text = reasonstolive7;
    _textview8.text = reasonstolive8;
    _textview9.text = reasonstolive9;
    
    
    rtlcounter = 0;
    if(!([reasonstolive1 length] == 0)) rtlcounter++;
    if(!([reasonstolive2 length] == 0)) rtlcounter++;
    if(!([reasonstolive3 length] == 0)) rtlcounter++;
    if(!([reasonstolive4 length] == 0)) rtlcounter++;
    if(!([reasonstolive5 length] == 0)) rtlcounter++;
    if(!([reasonstolive6 length] == 0)) rtlcounter++;
    if(!([reasonstolive7 length] == 0)) rtlcounter++;
    if(!([reasonstolive8 length] == 0)) rtlcounter++;
    if(!([reasonstolive9 length] == 0)) rtlcounter++;
    
    if(rtlcounter == 9) {
        _addanotherbutton.hidden = YES;
    }
    if(rtlcounter < 9) {
        _height9.constant = 0;
    }
    if(rtlcounter < 8) {
        _height8.constant = 0;
    }
    if(rtlcounter < 7) {
        _height7.constant = 0;
    }
    if(rtlcounter < 6) {
        _height6.constant = 0;
    }
    if(rtlcounter < 5) {
        _height5.constant = 0;
    }
    if(rtlcounter < 4) {
        _height4.constant = 0;
    }
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if (sender != self.savebutton) return;
    //Get strings from the uitextviews
    NSString *reasonstolive1 = [_textview1 text];
    NSString *reasonstolive2 = [_textview2 text];
    NSString *reasonstolive3 = [_textview3 text];
    NSString *reasonstolive4 = [_textview4 text];
    NSString *reasonstolive5 = [_textview5 text];
    NSString *reasonstolive6 = [_textview6 text];
    NSString *reasonstolive7 = [_textview7 text];
    NSString *reasonstolive8 = [_textview8 text];
    NSString *reasonstolive9 = [_textview9 text];
    
    
    //Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:reasonstolive1 forKey:@"reasonstolive1"];
    [defaults setObject:reasonstolive2 forKey:@"reasonstolive2"];
    [defaults setObject:reasonstolive3 forKey:@"reasonstolive3"];
    [defaults setObject:reasonstolive4 forKey:@"reasonstolive4"];
    [defaults setObject:reasonstolive5 forKey:@"reasonstolive5"];
    [defaults setObject:reasonstolive6 forKey:@"reasonstolive6"];
    [defaults setObject:reasonstolive7 forKey:@"reasonstolive7"];
    [defaults setObject:reasonstolive8 forKey:@"reasonstolive8"];
    [defaults setObject:reasonstolive9 forKey:@"reasonstolive9"];
    [defaults synchronize];

}

- (IBAction)addanotherbuttonpress:(id)sender {
    
    
    //Get the rtlcounter value
    if(rtlcounter < 4) { //show textview4 & set rtlcounter to 4
        _height4.constant = 30;
        rtlcounter = 4;
    }
    else if(rtlcounter == 4) {
        rtlcounter = 5;
        _height5.constant = 30;
    }
    else if(rtlcounter == 5) {
        rtlcounter = 6;
        _height6.constant = 30;
    }
    else if(rtlcounter == 6) {
        rtlcounter = 7;
        _height7.constant = 30;
    }
    else if(rtlcounter == 7) {
        rtlcounter = 8;
        _height8.constant = 30;
    }
    else if(rtlcounter == 8) {
        rtlcounter = 9;
        _height9.constant = 30;
        _addanotherbutton.hidden = YES;
    }

    
}
@end
