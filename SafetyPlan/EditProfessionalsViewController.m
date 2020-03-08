//
//  EditProfessionalsViewController.m
//  SafetyPlan
//
//

#import "EditProfessionalsViewController.h"

//THIS PAGE IS ACTUALLY NOW 'OTHER'. NOT EDIT PROFESSIONALS! AND I'M TOO LAZY TO MAKE A WHOLE OTHER PAGE!
@interface EditProfessionalsViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *savebutton;
@property (weak, nonatomic) IBOutlet UITextView *psychiatristtextview;




@end

@implementation EditProfessionalsViewController

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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *other = [defaults objectForKey:@"other"];
    
    _psychiatristtextview.text = other;
    _psychiatristtextview.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    _psychiatristtextview.layer.borderWidth = 0.6f;
    _psychiatristtextview.layer.cornerRadius = 6.0f;
    
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
    NSString *other = [_psychiatristtextview text];
    
    //Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:other forKey:@"other"];
    [defaults synchronize];
}


@end
