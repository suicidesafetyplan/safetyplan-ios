//
//  SafetyPlanViewController.m
//  SafetyPlan
//
//

#import "SafetyPlanViewController.h"

@interface SafetyPlanViewController ()
@property (weak, nonatomic) IBOutlet UILabel *warningsignlabel;
@property (weak, nonatomic) IBOutlet UILabel *copinglabel;
@property (weak, nonatomic) IBOutlet UILabel *reasonstolivelabel;
@property (weak, nonatomic) IBOutlet UILabel *otherlabel;
@property (weak, nonatomic) IBOutlet UILabel *contactslabel;
@property (weak, nonatomic) IBOutlet UILabel *placesfordistractionlabel;
- (IBAction)homebutton:(id)sender;



@end

@implementation SafetyPlanViewController

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
    // Do any additional setup after loading the view.
    
    //HIDE THE CRISIS BAR if device not a phone OR if the device is not in the uniteed states
       // get country code, e.g. ES (Spain), FR (France), etc.

  
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode];
    NSString *deviceType = [UIDevice currentDevice].model;
    
    //if the device is not an iphone or if it is not located in the US...
    
    if(![deviceType isEqualToString:@"iPhone"] || ![countryCode isEqualToString:@"US"])
    {
    NSMutableArray *tabbarViewControllers = [NSMutableArray arrayWithArray: [self.tabBarController viewControllers]];
    [tabbarViewControllers removeObjectAtIndex:2];
        //UNCOMMENT THE BELOW STRING BEFORE PUBLISHING
    [self.tabBarController setViewControllers: tabbarViewControllers ];
    }
    
    
   
   
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    //Code that updates friends & family -> contacts
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"contactscombined"] == nil) {
        //Do something
        [defaults setObject:@"done" forKey:@"contactscombined"]; //Set it so that this code is never run again
        NSString *friendsandfamily1 = [defaults objectForKey:@"friendsandfamily1"];
        NSString *friendsandfamily2 = [defaults objectForKey:@"friendsandfamily2"];
        NSString *friendsandfamily3 = [defaults objectForKey:@"friendsandfamily3"];
        NSString *therapistnumber = [defaults objectForKey:@"therapistnumber"];
        NSString *psychiatristnumber = [defaults objectForKey:@"psychiatristnumber"];
        int number = 0;

        if(!([friendsandfamily1 length] == 0)) {
            [defaults setObject:friendsandfamily1 forKey:@"name1"];
            number = number + 1;
            
        };
        if(!([friendsandfamily2 length] == 0)) {
            if(number == 1) {
                [defaults setObject:friendsandfamily2 forKey:@"name2"];}
            else if(number == 0) {
                [defaults setObject:friendsandfamily2 forKey:@"name1"];
            }
            number = number + 1;
        }
        if(!([friendsandfamily3 length] == 0)) {
            if(number == 0) [defaults setObject:friendsandfamily3 forKey:@"name1"];
            else if(number == 1) [defaults setObject:friendsandfamily3 forKey:@"name2"];
            else if(number == 2) [defaults setObject:friendsandfamily3 forKey:@"name3"];
            number = number + 1;
            }
        if(!([therapistnumber length] == 0)) {
            if(number == 0) {
                [defaults setObject:@"Therapist" forKey:@"name1"];
                [defaults setObject:therapistnumber forKey:@"number1"];
            }
            else if(number == 1) {
                [defaults setObject:@"Therapist" forKey:@"name2"];
                [defaults setObject:therapistnumber forKey:@"number2"];
            }
            else if(number == 2) {
                [defaults setObject:@"Therapist" forKey:@"name3"];
                [defaults setObject:therapistnumber forKey:@"number3"];
            }
            else if(number == 3) {
                [defaults setObject:@"Therapist" forKey:@"name4"];
                [defaults setObject:therapistnumber forKey:@"number4"];
            }
            number = number + 1;
        }
        if(!([psychiatristnumber length] == 0)) {
            if(number == 0) {
                [defaults setObject:@"Psychiatrist" forKey:@"name1"];
                [defaults setObject:psychiatristnumber forKey:@"number1"];
            }
            else if(number == 1) {
                [defaults setObject:@"Psychiatrist" forKey:@"name2"];
                [defaults setObject:psychiatristnumber forKey:@"number2"];
            }
            else if(number == 2) {
                [defaults setObject:@"Psychiatrist" forKey:@"name3"];
                [defaults setObject:psychiatristnumber forKey:@"number3"];
            }
            else if(number == 3) {
                [defaults setObject:@"Psychiatrist" forKey:@"name4"];
                [defaults setObject:psychiatristnumber forKey:@"number4"];
            }
            else if(number == 4) {
                [defaults setObject:@"Psychiatrist" forKey:@"name5"];
                [defaults setObject:psychiatristnumber forKey:@"number5"];
            }
        }
        [defaults synchronize];
    }

    
    
    NSString *warningsign1 = [defaults objectForKey:@"warningsign1"];
    NSString *warningsign2 = [defaults objectForKey:@"warningsign2"];
    NSString *warningsign3 = [defaults objectForKey:@"warningsign3"];
    NSString *warningsign4 = [defaults objectForKey:@"warningsign4"];
    NSString *warningsign5 = [defaults objectForKey:@"warningsign5"];
    NSString *warningsign6 = [defaults objectForKey:@"warningsign6"];
    NSString *warningsign7 = [defaults objectForKey:@"warningsign7"];
    NSString *warningsign8 = [defaults objectForKey:@"warningsign8"];
    NSString *warningsign9 = [defaults objectForKey:@"warningsign9"];
    NSString *warningsign;
    
    if(!([warningsign1 length]==0)) warningsign = [NSString stringWithFormat:@" • %@", warningsign1];
    if(!([warningsign2 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign2];
    if(!([warningsign3 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign3];
    if(!([warningsign4 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign4];
    if(!([warningsign5 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign5];
    if(!([warningsign6 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign6];
    if(!([warningsign7 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign7];
    if(!([warningsign8 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign8];
    if(!([warningsign9 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign9];

    if([warningsign length]==0) { //If the length is still 0
    warningsign = @"Press the button above to add warning signs that a crisis may occur";
            }
    
    _warningsignlabel.text = warningsign;
    
    NSString *coping1 = [defaults objectForKey:@"coping1"];
    NSString *coping2 = [defaults objectForKey:@"coping2"];
    NSString *coping3 = [defaults objectForKey:@"coping3"];
    NSString *coping4 = [defaults objectForKey:@"coping4"];
    NSString *coping5 = [defaults objectForKey:@"coping5"];
    NSString *coping6 = [defaults objectForKey:@"coping6"];
    NSString *coping7 = [defaults objectForKey:@"coping7"];
    NSString *coping8 = [defaults objectForKey:@"coping8"];
    NSString *coping9 = [defaults objectForKey:@"coping9"];
    NSString *coping;
    
    if(!([coping1 length]==0)) coping = [NSString stringWithFormat:@" • %@", coping1];
    if(!([coping2 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping2];
    if(!([coping3 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping3];
    if(!([coping4 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping4];
    if(!([coping5 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping5];
    if(!([coping6 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping6];
    if(!([coping7 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping7];
    if(!([coping8 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping8];
    if(!([coping9 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping9];
    
    if([coping length]==0) { //If the length is still 0
        coping = @"Press the button above to add coping strategies";
    }
    
    _copinglabel.text = coping;

    
    NSString *reasonstolive1 = [defaults objectForKey:@"reasonstolive1"];
    NSString *reasonstolive2 = [defaults objectForKey:@"reasonstolive2"];
    NSString *reasonstolive3 = [defaults objectForKey:@"reasonstolive3"];
    NSString *reasonstolive4 = [defaults objectForKey:@"reasonstolive4"];
    NSString *reasonstolive5 = [defaults objectForKey:@"reasonstolive5"];
    NSString *reasonstolive6 = [defaults objectForKey:@"reasonstolive6"];
    NSString *reasonstolive7 = [defaults objectForKey:@"reasonstolive7"];
    NSString *reasonstolive8 = [defaults objectForKey:@"reasonstolive8"];
    NSString *reasonstolive9 = [defaults objectForKey:@"reasonstolive9"];
    NSString *reasonstolive;
    
    if(!([reasonstolive1 length]==0)) reasonstolive = [NSString stringWithFormat:@" • %@", reasonstolive1];
    if(!([reasonstolive2 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive2];
    if(!([reasonstolive3 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive3];
    if(!([reasonstolive4 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive4];
    if(!([reasonstolive5 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive5];
    if(!([reasonstolive6 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive6];
    if(!([reasonstolive7 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive7];
    if(!([reasonstolive8 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive8];
    if(!([reasonstolive9 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive9];
    
    if([reasonstolive length]==0) { //If the length is still 0
        reasonstolive = @"Press the button above to add things that are worth living for";
    }
    
    _reasonstolivelabel.text = reasonstolive;

    
    NSString *name1 = [defaults objectForKey:@"name1"];
    NSString *name2 = [defaults objectForKey:@"name2"];
    NSString *name3 = [defaults objectForKey:@"name3"];
    NSString *name4 = [defaults objectForKey:@"name4"];
    NSString *name5 = [defaults objectForKey:@"name5"];
    NSString *name6 = [defaults objectForKey:@"name6"];
    NSString *name7 = [defaults objectForKey:@"name7"];
    NSString *name8 = [defaults objectForKey:@"name8"];
    NSString *name9 = [defaults objectForKey:@"name9"];
    NSString *name;
    
    if(!([name1 length]==0)) name = [NSString stringWithFormat:@" • %@", name1];
    if(!([name2 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name2];
    if(!([name3 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name3];
    if(!([name4 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name4];
    if(!([name5 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name5];
    if(!([name6 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name6];
    if(!([name7 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name7];
    if(!([name8 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name8];
    if(!([name9 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name9];
    
    if([name length]==0) { //If the length is still 0
        name = @"Press the button above to add any people, professionals, or other numbers that you can contact during a crisis";
    }
    
    _contactslabel.text = name;

    
    NSString *placesfordistraction1 = [defaults objectForKey:@"placesfordistraction1"];
    NSString *placesfordistraction2 = [defaults objectForKey:@"placesfordistraction2"];
    NSString *placesfordistraction3 = [defaults objectForKey:@"placesfordistraction3"];
    NSString *placesfordistraction4 = [defaults objectForKey:@"placesfordistraction4"];
    NSString *placesfordistraction5 = [defaults objectForKey:@"placesfordistraction5"];
    NSString *placesfordistraction6 = [defaults objectForKey:@"placesfordistraction6"];
    NSString *placesfordistraction7 = [defaults objectForKey:@"placesfordistraction7"];
    NSString *placesfordistraction8 = [defaults objectForKey:@"placesfordistraction8"];
    NSString *placesfordistraction9 = [defaults objectForKey:@"placesfordistraction9"];
    NSString *placesfordistraction;
    
    if(!([placesfordistraction1 length]==0)) placesfordistraction = [NSString stringWithFormat:@" • %@", placesfordistraction1];
    if(!([placesfordistraction2 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction2];
    if(!([placesfordistraction3 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction3];
    if(!([placesfordistraction4 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction4];
    if(!([placesfordistraction5 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction5];
    if(!([placesfordistraction6 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction6];
    if(!([placesfordistraction7 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction7];
    if(!([placesfordistraction8 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction8];
    if(!([placesfordistraction9 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction9];
    
    if([placesfordistraction length]==0) { //If the length is still 0
        placesfordistraction = @"Press the button above to add places that can distract you";
    }
    
    _placesfordistractionlabel.text = placesfordistraction;

    
    NSString *other = [defaults objectForKey:@"other"];
    if([other length] == 0) {
         other = @"Press the button above to add any additional notes that could be helpful";
    }
    
    _otherlabel.text = other;

}

- (void)viewWillAppear {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)unwindToPlan:(UIStoryboardSegue *)segue {
    //TODO: Copy all of the code in ViewDidLoad here! Gotta refresh all of the information.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    //Code that updates friends & family -> contacts
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"contactscombined"] == nil) {
        //Do something
        [defaults setObject:@"done" forKey:@"contactscombined"]; //Set it so that this code is never run again
        NSString *friendsandfamily1 = [defaults objectForKey:@"friendsandfamily1"];
        NSString *friendsandfamily2 = [defaults objectForKey:@"friendsandfamily2"];
        NSString *friendsandfamily3 = [defaults objectForKey:@"friendsandfamily3"];
        NSString *therapistnumber = [defaults objectForKey:@"therapistnumber"];
        NSString *psychiatristnumber = [defaults objectForKey:@"psychiatristnumber"];
        int number = 0;
        
        if(!([friendsandfamily1 length] == 0)) {
            [defaults setObject:friendsandfamily1 forKey:@"name1"];
            number = number + 1;
            
        };
        if(!([friendsandfamily2 length] == 0)) {
            if(number == 1) {
                [defaults setObject:friendsandfamily2 forKey:@"name2"];}
            else if(number == 0) {
                [defaults setObject:friendsandfamily2 forKey:@"name1"];
            }
            number = number + 1;
        }
        if(!([friendsandfamily3 length] == 0)) {
            if(number == 0) [defaults setObject:friendsandfamily3 forKey:@"name1"];
            else if(number == 1) [defaults setObject:friendsandfamily3 forKey:@"name2"];
            else if(number == 2) [defaults setObject:friendsandfamily3 forKey:@"name3"];
            number = number + 1;
        }
        if(!([therapistnumber length] == 0)) {
            if(number == 0) {
                [defaults setObject:@"Therapist" forKey:@"name1"];
                [defaults setObject:therapistnumber forKey:@"number1"];
            }
            else if(number == 1) {
                [defaults setObject:@"Therapist" forKey:@"name2"];
                [defaults setObject:therapistnumber forKey:@"number2"];
            }
            else if(number == 2) {
                [defaults setObject:@"Therapist" forKey:@"name3"];
                [defaults setObject:therapistnumber forKey:@"number3"];
            }
            else if(number == 3) {
                [defaults setObject:@"Therapist" forKey:@"name4"];
                [defaults setObject:therapistnumber forKey:@"number4"];
            }
            number = number + 1;
        }
        if(!([psychiatristnumber length] == 0)) {
            if(number == 0) {
                [defaults setObject:@"Psychiatrist" forKey:@"name1"];
                [defaults setObject:psychiatristnumber forKey:@"number1"];
            }
            else if(number == 1) {
                [defaults setObject:@"Psychiatrist" forKey:@"name2"];
                [defaults setObject:psychiatristnumber forKey:@"number2"];
            }
            else if(number == 2) {
                [defaults setObject:@"Psychiatrist" forKey:@"name3"];
                [defaults setObject:psychiatristnumber forKey:@"number3"];
            }
            else if(number == 3) {
                [defaults setObject:@"Psychiatrist" forKey:@"name4"];
                [defaults setObject:psychiatristnumber forKey:@"number4"];
            }
            else if(number == 4) {
                [defaults setObject:@"Psychiatrist" forKey:@"name5"];
                [defaults setObject:psychiatristnumber forKey:@"number5"];
            }
        }
        [defaults synchronize];
    }
    
    
    
    NSString *warningsign1 = [defaults objectForKey:@"warningsign1"];
    NSString *warningsign2 = [defaults objectForKey:@"warningsign2"];
    NSString *warningsign3 = [defaults objectForKey:@"warningsign3"];
    NSString *warningsign4 = [defaults objectForKey:@"warningsign4"];
    NSString *warningsign5 = [defaults objectForKey:@"warningsign5"];
    NSString *warningsign6 = [defaults objectForKey:@"warningsign6"];
    NSString *warningsign7 = [defaults objectForKey:@"warningsign7"];
    NSString *warningsign8 = [defaults objectForKey:@"warningsign8"];
    NSString *warningsign9 = [defaults objectForKey:@"warningsign9"];
    NSString *warningsign;
    
    if(!([warningsign1 length]==0)) warningsign = [NSString stringWithFormat:@" • %@", warningsign1];
    if(!([warningsign2 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign2];
    if(!([warningsign3 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign3];
    if(!([warningsign4 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign4];
    if(!([warningsign5 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign5];
    if(!([warningsign6 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign6];
    if(!([warningsign7 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign7];
    if(!([warningsign8 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign8];
    if(!([warningsign9 length]==0)) warningsign = [NSString stringWithFormat:@"%@\r • %@", warningsign, warningsign9];
    
    if([warningsign length]==0) { //If the length is still 0
        warningsign = @"Press the button above to add warning signs that a crisis may occur";
    }
    
    _warningsignlabel.text = warningsign;
    
    NSString *coping1 = [defaults objectForKey:@"coping1"];
    NSString *coping2 = [defaults objectForKey:@"coping2"];
    NSString *coping3 = [defaults objectForKey:@"coping3"];
    NSString *coping4 = [defaults objectForKey:@"coping4"];
    NSString *coping5 = [defaults objectForKey:@"coping5"];
    NSString *coping6 = [defaults objectForKey:@"coping6"];
    NSString *coping7 = [defaults objectForKey:@"coping7"];
    NSString *coping8 = [defaults objectForKey:@"coping8"];
    NSString *coping9 = [defaults objectForKey:@"coping9"];
    NSString *coping;
    
    if(!([coping1 length]==0)) coping = [NSString stringWithFormat:@" • %@", coping1];
    if(!([coping2 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping2];
    if(!([coping3 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping3];
    if(!([coping4 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping4];
    if(!([coping5 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping5];
    if(!([coping6 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping6];
    if(!([coping7 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping7];
    if(!([coping8 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping8];
    if(!([coping9 length]==0)) coping = [NSString stringWithFormat:@"%@\r • %@", coping, coping9];
    
    if([coping length]==0) { //If the length is still 0
        coping = @"Press the button above to add coping strategies";
    }
    
    _copinglabel.text = coping;
    
    
    NSString *reasonstolive1 = [defaults objectForKey:@"reasonstolive1"];
    NSString *reasonstolive2 = [defaults objectForKey:@"reasonstolive2"];
    NSString *reasonstolive3 = [defaults objectForKey:@"reasonstolive3"];
    NSString *reasonstolive4 = [defaults objectForKey:@"reasonstolive4"];
    NSString *reasonstolive5 = [defaults objectForKey:@"reasonstolive5"];
    NSString *reasonstolive6 = [defaults objectForKey:@"reasonstolive6"];
    NSString *reasonstolive7 = [defaults objectForKey:@"reasonstolive7"];
    NSString *reasonstolive8 = [defaults objectForKey:@"reasonstolive8"];
    NSString *reasonstolive9 = [defaults objectForKey:@"reasonstolive9"];
    NSString *reasonstolive;
    
    if(!([reasonstolive1 length]==0)) reasonstolive = [NSString stringWithFormat:@" • %@", reasonstolive1];
    if(!([reasonstolive2 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive2];
    if(!([reasonstolive3 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive3];
    if(!([reasonstolive4 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive4];
    if(!([reasonstolive5 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive5];
    if(!([reasonstolive6 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive6];
    if(!([reasonstolive7 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive7];
    if(!([reasonstolive8 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive8];
    if(!([reasonstolive9 length]==0)) reasonstolive = [NSString stringWithFormat:@"%@\r • %@", reasonstolive, reasonstolive9];
    
    if([reasonstolive length]==0) { //If the length is still 0
        reasonstolive = @"Press the button above to add things that are worth living for";
    }
    
    _reasonstolivelabel.text = reasonstolive;
    
    
    NSString *name1 = [defaults objectForKey:@"name1"];
    NSString *name2 = [defaults objectForKey:@"name2"];
    NSString *name3 = [defaults objectForKey:@"name3"];
    NSString *name4 = [defaults objectForKey:@"name4"];
    NSString *name5 = [defaults objectForKey:@"name5"];
    NSString *name6 = [defaults objectForKey:@"name6"];
    NSString *name7 = [defaults objectForKey:@"name7"];
    NSString *name8 = [defaults objectForKey:@"name8"];
    NSString *name9 = [defaults objectForKey:@"name9"];
    NSString *name;
    
    if(!([name1 length]==0)) name = [NSString stringWithFormat:@" • %@", name1];
    if(!([name2 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name2];
    if(!([name3 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name3];
    if(!([name4 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name4];
    if(!([name5 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name5];
    if(!([name6 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name6];
    if(!([name7 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name7];
    if(!([name8 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name8];
    if(!([name9 length]==0)) name = [NSString stringWithFormat:@"%@\r • %@", name, name9];
    
    if([name length]==0) { //If the length is still 0
        name = @"Press the button above to add any people, professionals, or other numbers that you can contact during a crisis";
    }
    
    _contactslabel.text = name;
    
    
    NSString *placesfordistraction1 = [defaults objectForKey:@"placesfordistraction1"];
    NSString *placesfordistraction2 = [defaults objectForKey:@"placesfordistraction2"];
    NSString *placesfordistraction3 = [defaults objectForKey:@"placesfordistraction3"];
    NSString *placesfordistraction4 = [defaults objectForKey:@"placesfordistraction4"];
    NSString *placesfordistraction5 = [defaults objectForKey:@"placesfordistraction5"];
    NSString *placesfordistraction6 = [defaults objectForKey:@"placesfordistraction6"];
    NSString *placesfordistraction7 = [defaults objectForKey:@"placesfordistraction7"];
    NSString *placesfordistraction8 = [defaults objectForKey:@"placesfordistraction8"];
    NSString *placesfordistraction9 = [defaults objectForKey:@"placesfordistraction9"];
    NSString *placesfordistraction;
    
    if(!([placesfordistraction1 length]==0)) placesfordistraction = [NSString stringWithFormat:@" • %@", placesfordistraction1];
    if(!([placesfordistraction2 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction2];
    if(!([placesfordistraction3 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction3];
    if(!([placesfordistraction4 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction4];
    if(!([placesfordistraction5 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction5];
    if(!([placesfordistraction6 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction6];
    if(!([placesfordistraction7 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction7];
    if(!([placesfordistraction8 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction8];
    if(!([placesfordistraction9 length]==0)) placesfordistraction = [NSString stringWithFormat:@"%@\r • %@", placesfordistraction, placesfordistraction9];
    
    if([placesfordistraction length]==0) { //If the length is still 0
        placesfordistraction = @"Press the button above to add places that can distract you";
    }
    
    _placesfordistractionlabel.text = placesfordistraction;
    
    
    NSString *other = [defaults objectForKey:@"other"];
    if([other length] == 0) {
        other = @"Press the button above to add any additional notes that could be helpful";
    }
    
    _otherlabel.text = other;
}

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
