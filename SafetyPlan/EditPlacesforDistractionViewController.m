//
//  EditPlacesforDistractionViewController.m
//  SafetyPlan
//
//

#import "EditPlacesforDistractionViewController.h"

@interface EditPlacesforDistractionViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *savebutton;
@property (weak, nonatomic) IBOutlet UITextField *textview1;
@property (weak, nonatomic) IBOutlet UITextField *textview3;
@property (weak, nonatomic) IBOutlet UITextField *textview2;
@property (weak, nonatomic) IBOutlet UITextField *textview4;
@property (weak, nonatomic) IBOutlet UITextField *textview5;
@property (weak, nonatomic) IBOutlet UITextField *textview6;
@property (weak, nonatomic) IBOutlet UITextField *textview7;
@property (weak, nonatomic) IBOutlet UITextField *textview8;
@property (weak, nonatomic) IBOutlet UITextField *textview9;
@property (weak, nonatomic) IBOutlet UIButton *addanotherbutton;
- (IBAction)addanotherbuttonpress:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height5;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height6;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height7;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height8;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height9;

@end

@implementation EditPlacesforDistractionViewController

int pfdcounter = 0;

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
    
    
    NSString *placesfordistraction1 = [defaults objectForKey:@"placesfordistraction1"];
    NSString *placesfordistraction2 = [defaults objectForKey:@"placesfordistraction2"];
    NSString *placesfordistraction3 = [defaults objectForKey:@"placesfordistraction3"];
    NSString *placesfordistraction4 = [defaults objectForKey:@"placesfordistraction4"];
    NSString *placesfordistraction5 = [defaults objectForKey:@"placesfordistraction5"];
    NSString *placesfordistraction6 = [defaults objectForKey:@"placesfordistraction6"];
    NSString *placesfordistraction7 = [defaults objectForKey:@"placesfordistraction7"];
    NSString *placesfordistraction8 = [defaults objectForKey:@"placesfordistraction8"];
    NSString *placesfordistraction9 = [defaults objectForKey:@"placesfordistraction9"];
    
    
    _textview1.text = placesfordistraction1;
    _textview2.text = placesfordistraction2;
    _textview3.text = placesfordistraction3;
    _textview4.text = placesfordistraction4;
    _textview5.text = placesfordistraction5;
    _textview6.text = placesfordistraction6;
    _textview7.text = placesfordistraction7;
    _textview8.text = placesfordistraction8;
    _textview9.text = placesfordistraction9;
    
    
    pfdcounter = 0;
    if(!([placesfordistraction1 length] == 0)) pfdcounter++;
    if(!([placesfordistraction2 length] == 0)) pfdcounter++;
    if(!([placesfordistraction3 length] == 0)) pfdcounter++;
    if(!([placesfordistraction4 length] == 0)) pfdcounter++;
    if(!([placesfordistraction5 length] == 0)) pfdcounter++;
    if(!([placesfordistraction6 length] == 0)) pfdcounter++;
    if(!([placesfordistraction7 length] == 0)) pfdcounter++;
    if(!([placesfordistraction8 length] == 0)) pfdcounter++;
    if(!([placesfordistraction9 length] == 0)) pfdcounter++;
    
    if(pfdcounter == 9) {
        _addanotherbutton.hidden = YES;
    }
    if(pfdcounter < 9) {
        _height9.constant = 0;
    }
    if(pfdcounter < 8) {
        _height8.constant = 0;
    }
    if(pfdcounter < 7) {
        _height7.constant = 0;
    }
    if(pfdcounter < 6) {
        _height6.constant = 0;
    }
    if(pfdcounter < 5) {
        _height5.constant = 0;
    }
    if(pfdcounter < 4) {
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
    NSString *placesfordistraction1 = [_textview1 text];
    NSString *placesfordistraction2 = [_textview2 text];
    NSString *placesfordistraction3 = [_textview3 text];
    NSString *placesfordistraction4 = [_textview4 text];
    NSString *placesfordistraction5 = [_textview5 text];
    NSString *placesfordistraction6 = [_textview6 text];
    NSString *placesfordistraction7 = [_textview7 text];
    NSString *placesfordistraction8 = [_textview8 text];
    NSString *placesfordistraction9 = [_textview9 text];
    
    
    //Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:placesfordistraction1 forKey:@"placesfordistraction1"];
    [defaults setObject:placesfordistraction2 forKey:@"placesfordistraction2"];
    [defaults setObject:placesfordistraction3 forKey:@"placesfordistraction3"];
    [defaults setObject:placesfordistraction4 forKey:@"placesfordistraction4"];
    [defaults setObject:placesfordistraction5 forKey:@"placesfordistraction5"];
    [defaults setObject:placesfordistraction6 forKey:@"placesfordistraction6"];
    [defaults setObject:placesfordistraction7 forKey:@"placesfordistraction7"];
    [defaults setObject:placesfordistraction8 forKey:@"placesfordistraction8"];
    [defaults setObject:placesfordistraction9 forKey:@"placesfordistraction9"];
    [defaults synchronize];

}


- (IBAction)addanotherbuttonpress:(id)sender {
    
    //Get the pfdcounter value
    if(pfdcounter < 4) { //show textview4 & set pfdcounter to 4
        _height4.constant = 30;
        pfdcounter = 4;
    }
    else if(pfdcounter == 4) {
        pfdcounter = 5;
        _height5.constant = 30;
    }
    else if(pfdcounter == 5) {
        pfdcounter = 6;
        _height6.constant = 30;
    }
    else if(pfdcounter == 6) {
        pfdcounter = 7;
        _height7.constant = 30;
    }
    else if(pfdcounter == 7) {
        pfdcounter = 8;
        _height8.constant = 30;
    }
    else if(pfdcounter == 8) {
        pfdcounter = 9;
        _height9.constant = 30;
        _addanotherbutton.hidden = YES;
    }

    
}
@end
