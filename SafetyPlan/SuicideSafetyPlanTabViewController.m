//
//  SuicideSafetyPlanTabViewController.m
//  SafetyPlan
//
//

#import "SuicideSafetyPlanTabViewController.h"

@interface SuicideSafetyPlanTabViewController ()

@end

@implementation SuicideSafetyPlanTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if CommandLine.arguments.contains("--safetyPlanScreenshots") {
        // We are in testing mode, make arrangements if needed
        UIView.setAnimationsEnabled(false)
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

@end
