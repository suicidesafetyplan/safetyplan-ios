//
//  EditFriendsandFamilyViewController.m
//  SafetyPlan
//
//

#import "EditFriendsandFamilyViewController.h"

@interface EditFriendsandFamilyViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *savebutton;
- (IBAction)importcontactbuttonpress:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addanotherbutton;
- (IBAction)addanotherbuttonpress:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *textview1;
@property (weak, nonatomic) IBOutlet UITextField *textview2;
@property (weak, nonatomic) IBOutlet UITextField *textview3;
@property (weak, nonatomic) IBOutlet UITextField *textview1b;
@property (weak, nonatomic) IBOutlet UITextField *textview2b;
@property (weak, nonatomic) IBOutlet UITextField *textview3b;
@property (weak, nonatomic) IBOutlet UITextField *textview4;
@property (weak, nonatomic) IBOutlet UITextField *textview4b;
@property (weak, nonatomic) IBOutlet UITextField *textview5;
@property (weak, nonatomic) IBOutlet UITextField *textview5b;
@property (weak, nonatomic) IBOutlet UITextField *textview6;
@property (weak, nonatomic) IBOutlet UITextField *textview6b;
@property (weak, nonatomic) IBOutlet UITextField *textview7;
@property (weak, nonatomic) IBOutlet UITextField *textview7b;
@property (weak, nonatomic) IBOutlet UITextField *textview8;
@property (weak, nonatomic) IBOutlet UITextField *textview8b;
@property (weak, nonatomic) IBOutlet UITextField *textview9;
@property (weak, nonatomic) IBOutlet UITextField *textview9b;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height4b;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height5;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height5b;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height6;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height6b;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height7;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height7b;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height8;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height8b;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height9;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height9b;

@end

@implementation EditFriendsandFamilyViewController
int ffcounter = 0;

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

    
    
    _textview1.text = name1;
      _textview2.text = name2;
      _textview3.text = name3;
      _textview4.text = name4;
      _textview5.text = name5;
      _textview6.text = name6;
      _textview7.text = name7;
      _textview8.text = name8;
      _textview9.text = name9;

    
    
    _textview1b.text = number1;
    _textview2b.text = number2;
    _textview3b.text = number3;
    _textview4b.text = number4;
    _textview5b.text = number5;
    _textview6b.text = number6;
    _textview7b.text = number7;
    _textview8b.text = number8;
    _textview9b.text = number9;
    
    ffcounter = 0;
    if(!([name1 length] == 0)) ffcounter++;
    if(!([name2 length] == 0)) ffcounter++;
    if(!([name3 length] == 0)) ffcounter++;
    if(!([name4 length] == 0)) ffcounter++;
    if(!([name5 length] == 0)) ffcounter++;
    if(!([name6 length] == 0)) ffcounter++;
    if(!([name7 length] == 0)) ffcounter++;
    if(!([name8 length] == 0)) ffcounter++;
    if(!([name9 length] == 0)) ffcounter++;

    if(ffcounter == 9) {
        _addanotherbutton.hidden = YES;
    }
    if(ffcounter < 9) {
        _height9.constant = 0;
         _height9b.constant = 0;
    }
    if(ffcounter < 8) {
        _height8.constant = 0;
         _height8b.constant = 0;
    }
    if(ffcounter < 7) {
        _height7.constant = 0;
        _height7b.constant = 0;
    }
    if(ffcounter < 6) {
        _height6.constant = 0;
        _height6b.constant = 0;
    }
    if(ffcounter < 5) {
        _height5.constant = 0;
         _height5b.constant = 0;
    }
    if(ffcounter < 4) {
        _height4.constant = 0;
          _height4b.constant = 0;
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
    NSString *name1 = [_textview1 text];
    NSString *name2 = [_textview2 text];
    NSString *name3 = [_textview3 text];
    NSString *name4 = [_textview4 text];
    NSString *name5 = [_textview5 text];
    NSString *name6 = [_textview6 text];
    NSString *name7 = [_textview7 text];
    NSString *name8 = [_textview8 text];
    NSString *name9 = [_textview9 text];
    
    NSString *number1 = [_textview1b text];
    NSString *number2 = [_textview2b text];
    NSString *number3 = [_textview3b text];
    NSString *number4 = [_textview4b text];
    NSString *number5 = [_textview5b text];
    NSString *number6 = [_textview6b text];
    NSString *number7 = [_textview7b text];
    NSString *number8 = [_textview8b text];
    NSString *number9 = [_textview9b text];


    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:name1 forKey:@"name1"];
    [defaults setObject:name2 forKey:@"name2"];
    [defaults setObject:name3 forKey:@"name3"];
    [defaults setObject:name4 forKey:@"name4"];
    [defaults setObject:name5 forKey:@"name5"];
    [defaults setObject:name6 forKey:@"name6"];
    [defaults setObject:name7 forKey:@"name7"];
    [defaults setObject:name8 forKey:@"name8"];
    [defaults setObject:name9 forKey:@"name9"];
    [defaults setObject:number1 forKey:@"number1"];
    [defaults setObject:number2 forKey:@"number2"];
    [defaults setObject:number3 forKey:@"number3"];
    [defaults setObject:number4 forKey:@"number4"];
    [defaults setObject:number5 forKey:@"number5"];
    [defaults setObject:number6 forKey:@"number6"];
    [defaults setObject:number7 forKey:@"number7"];
    [defaults setObject:number8 forKey:@"number8"];
    [defaults setObject:number9 forKey:@"number9"];

    [defaults synchronize];
}

- (IBAction)addanotherbuttonpress:(id)sender {
    
    //Get the ffcounter value
    if(ffcounter < 4) { //show textview4 & set ffcounter to 4
        _height4.constant = 30;
        _height4b.constant = 30;
        ffcounter = 4;
    }
    else if(ffcounter == 4) {
        ffcounter = 5;
        _height5.constant = 30;
        _height5b.constant = 30;
    }
    else if(ffcounter == 5) {
        ffcounter = 6;
        _height6.constant = 30;
        _height6b.constant = 30;
    }
    else if(ffcounter == 6) {
        ffcounter = 7;
        _height7.constant = 30;
        _height7b.constant = 30;
    }
    else if(ffcounter == 7) {
        ffcounter = 8;
        _height8.constant = 30;
        _height8b.constant = 30;
    }
    else if(ffcounter == 8) {
        ffcounter = 9;
        _height9.constant = 30;
        _height9b.constant = 30;
        _addanotherbutton.hidden = YES;
    }
}


    
    
    - (IBAction)importcontactbuttonpress:(id)sender {
       ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
        picker.peoplePickerDelegate = self;
        
        [self presentModalViewController:picker animated:YES];
       
     
        
        
    }

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person{
    
    //[self peoplePickerNavigationController:peoplePicker shouldContinueAfterSelectingPerson:person property:property identifier:identifier];
    
    
    NSString *contactName = CFBridgingRelease(ABRecordCopyCompositeName(person));
   // self.nameField.text = [NSString stringWithFormat:@"%@", contactName ? contactName : @"No Name"];


    
    
    ABMultiValueRef phoneRecord = ABRecordCopyValue(person, kABPersonPhoneProperty);
    CFStringRef phoneNumber = ABMultiValueCopyValueAtIndex(phoneRecord, 0);
    if(![_textview1 hasText] && ![_textview1b hasText]) {
         _textview1.text = [NSString stringWithFormat:@"%@", contactName ? contactName : @"No Name"];
        _textview1b.text = (__bridge_transfer NSString *)phoneNumber;

    }
    else if(![_textview2 hasText] && ![_textview2b hasText]) {
        _textview2.text = [NSString stringWithFormat:@"%@", contactName ? contactName : @"No Name"];
        _textview2b.text = (__bridge_transfer NSString *)phoneNumber;
        
    }
    else if(![_textview3 hasText] && ![_textview3b hasText]) {
        _textview3.text = [NSString stringWithFormat:@"%@", contactName ? contactName : @"No Name"];
        _textview3b.text = (__bridge_transfer NSString *)phoneNumber;
        
    }
    else if(![_textview4 hasText] && ![_textview4b hasText]) {
        _textview4.text = [NSString stringWithFormat:@"%@", contactName ? contactName : @"No Name"];
        _textview4b.text = (__bridge_transfer NSString *)phoneNumber;
        if(ffcounter < 4) { //show textview4 & set ffcounter to 4
            _height4.constant = 30;
            _height4b.constant = 30;
            ffcounter = 4;
        }
    }
    else if(![_textview5 hasText] && ![_textview5b hasText]) {
        _textview5.text = [NSString stringWithFormat:@"%@", contactName ? contactName : @"No Name"];
        _textview5b.text = (__bridge_transfer NSString *)phoneNumber;
        if(ffcounter == 4) {
            ffcounter = 5;
            _height5.constant = 30;
            _height5b.constant = 30;
        }
    }
    else if(![_textview6 hasText] && ![_textview6b hasText]) {
        _textview6.text = [NSString stringWithFormat:@"%@", contactName ? contactName : @"No Name"];
        _textview6b.text = (__bridge_transfer NSString *)phoneNumber;
        if(ffcounter == 5) {
            ffcounter = 6;
            _height6.constant = 30;
            _height6b.constant = 30;
        }
    }
    else if(![_textview7 hasText] && ![_textview7b hasText]) {
        _textview7.text = [NSString stringWithFormat:@"%@", contactName ? contactName : @"No Name"];
        _textview7b.text = (__bridge_transfer NSString *)phoneNumber;
        if(ffcounter == 6) {
            ffcounter = 7;
            _height7.constant = 30;
            _height7b.constant = 30;
        }
    }
    else if(![_textview8 hasText] && ![_textview8b hasText]) {
        _textview8.text = [NSString stringWithFormat:@"%@", contactName ? contactName : @"No Name"];
        _textview8b.text = (__bridge_transfer NSString *)phoneNumber;
        if(ffcounter == 7) {
            ffcounter = 8;
            _height8.constant = 30;
            _height8b.constant = 30;
        }
    }
    else if(![_textview9 hasText] && ![_textview9b hasText]) {
        _textview9.text = [NSString stringWithFormat:@"%@", contactName ? contactName : @"No Name"];
        _textview9b.text = (__bridge_transfer NSString *)phoneNumber;
        if(ffcounter == 8) {
            ffcounter = 9;
            _height9.constant = 30;
            _height9b.constant = 30;
                  _addanotherbutton.hidden = YES;
        }
    }




    [self dismissViewControllerAnimated:YES completion:nil];
    CFRelease(phoneRecord);
}


/*
-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    [self dismissViewControllerAnimated:YES completion:nil];
    return NO; }

*/




/*
- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissModalViewControllerAnimated:YES];
}


- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
    
    [self displayPerson:person];
    [self dismissModalViewControllerAnimated:YES];
    
    return NO;
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}

- (void)displayPerson:(ABRecordRef)person
{
    NSString* name = (__bridge_transfer NSString*)ABRecordCopyValue(person,
                                                                    kABPersonFirstNameProperty);
    
    NSString* phone = nil;
    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person,
                                                     kABPersonPhoneProperty);
    if (ABMultiValueGetCount(phoneNumbers) > 0) {
        phone = (__bridge_transfer NSString*)
        ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
    } else {
        phone = @"[None]";
    }
    
    
    if(![_textview1 hasText] && ![_textview1b hasText]) {
    _textview1.text = name;
    _textview1b.text = phone;
    }
    CFRelease(phoneNumbers);
}
*/
    
    

@end
