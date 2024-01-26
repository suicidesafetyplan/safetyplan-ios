//
//  GuideResources2ViewController.m
//  Safety Plan
//
//

#import "GuideResources2ViewController.h"

@interface GuideResources2ViewController ()

@end

@implementation GuideResources2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if ([[[NSProcessInfo processInfo] arguments] containsObject:@"--safetyPlanScreenshots"]) {
        // We are in testing mode, make arrangements if needed
        [UIView setAnimationsEnabled:false];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)helpguide1buttonpress:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.helpguide.org/articles/suicide-prevention/are-you-feeling-suicidal.htm"] options:@{} completionHandler:nil];

}
- (IBAction)helpguide2buttonpress:(id)sender {
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.helpguide.org/articles/suicide-prevention/suicide-prevention.htm"] options:@{} completionHandler:nil];
}
- (IBAction)metanoiabuttonpress:(id)sender {
          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.metanoia.org/suicide/"] options:@{} completionHandler:nil];
}
- (IBAction)wikihowbuttonpress:(id)sender {
          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.wikihow.com/Cope-With-Suicidal-Thoughts"] options:@{} completionHandler:nil];
}

@end
