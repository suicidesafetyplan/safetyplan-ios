//
//  EditCopingViewController.m
//  SafetyPlan
//
//

#import "EditCopingViewController.h"

@interface EditCopingViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *savebutton;
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

@implementation EditCopingViewController

int ccounter = 0;


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
    
    
    NSString *coping1 = [defaults objectForKey:@"coping1"];
    NSString *coping2 = [defaults objectForKey:@"coping2"];
    NSString *coping3 = [defaults objectForKey:@"coping3"];
    NSString *coping4 = [defaults objectForKey:@"coping4"];
    NSString *coping5 = [defaults objectForKey:@"coping5"];
    NSString *coping6 = [defaults objectForKey:@"coping6"];
    NSString *coping7 = [defaults objectForKey:@"coping7"];
    NSString *coping8 = [defaults objectForKey:@"coping8"];
    NSString *coping9 = [defaults objectForKey:@"coping9"];
    
    
    _textview1.text = coping1;
    _textview2.text = coping2;
    _textview3.text = coping3;
     _textview4.text = coping4;
     _textview5.text = coping5;
     _textview6.text = coping6;
     _textview7.text = coping7;
     _textview8.text = coping8;
     _textview9.text = coping9;
    
    
    ccounter = 0;
    if(!([coping1 length] == 0)) ccounter++;
    if(!([coping2 length] == 0)) ccounter++;
    if(!([coping3 length] == 0)) ccounter++;
    if(!([coping4 length] == 0)) ccounter++;
    if(!([coping5 length] == 0)) ccounter++;
    if(!([coping6 length] == 0)) ccounter++;
    if(!([coping7 length] == 0)) ccounter++;
    if(!([coping8 length] == 0)) ccounter++;
    if(!([coping9 length] == 0)) ccounter++;
    
    if(ccounter == 9) {
        //hide the button
        _addanotherbutton.hidden = YES;
    }
    if(ccounter < 9) {
        //hide textview9
        //[_textview9 addConstraint:[NSLayoutConstraint constraintWithItem:_textview9 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0]];
        _height9.constant = 0;
    }
    if(ccounter < 8) {
        //hide textview8
         // [_textview8 addConstraint:[NSLayoutConstraint constraintWithItem:_textview8 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0]];
        _height8.constant = 0;
    }
    if(ccounter < 7) {
        //hide textview7
         // [_textview7 addConstraint:[NSLayoutConstraint constraintWithItem:_textview7 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0]];
        _height7.constant = 0;
    }
    if(ccounter < 6) {
        //hide textview6
          //[_textview6 addConstraint:[NSLayoutConstraint constraintWithItem:_textview6 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0]];
        _height6.constant = 0;
    }
    if(ccounter < 5) {
        //hide textview5
         // [_textview5 addConstraint:[NSLayoutConstraint constraintWithItem:_textview5 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0]];
        _height5.constant = 0;
    }
    if(ccounter < 4) {
        //hide textview4
         // [_textview4 addConstraint:[NSLayoutConstraint constraintWithItem:_textview4 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0]];
        _height4.constant = 0;
    }
    
    
    
}


- (IBAction)addanotherbuttonpress:(id)sender {
    //Get the ccounter value
    if(ccounter < 4) { //show textview4 & set ccounter to 4
        _height4.constant = 30;
        ccounter = 4;
    }
    else if(ccounter == 4) {
        ccounter = 5;
        _height5.constant = 30;
    }
    else if(ccounter == 5) {
        ccounter = 6;
        _height6.constant = 30;
    }
    else if(ccounter == 6) {
        ccounter = 7;
        _height7.constant = 30;
    }
    else if(ccounter == 7) {
        ccounter = 8;
        _height8.constant = 30;
    }
    else if(ccounter == 8) {
        ccounter = 9;
        _height9.constant = 30;
        _addanotherbutton.hidden = YES;
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
    NSString *coping1 = [_textview1 text];
    NSString *coping2 = [_textview2 text];
    NSString *coping3 = [_textview3 text];
    NSString *coping4 = [_textview4 text];
    NSString *coping5 = [_textview5 text];
    NSString *coping6 = [_textview6 text];
    NSString *coping7 = [_textview7 text];
    NSString *coping8 = [_textview8 text];
    NSString *coping9 = [_textview9 text];

    
    //Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:coping1 forKey:@"coping1"];
    [defaults setObject:coping2 forKey:@"coping2"];
    [defaults setObject:coping3 forKey:@"coping3"];
    [defaults setObject:coping4 forKey:@"coping4"];
    [defaults setObject:coping5 forKey:@"coping5"];
    [defaults setObject:coping6 forKey:@"coping6"];
    [defaults setObject:coping7 forKey:@"coping7"];
    [defaults setObject:coping8 forKey:@"coping8"];
    [defaults setObject:coping9 forKey:@"coping9"];
    [defaults synchronize];
    
}


@end
