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
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.helpguide.org/articles/suicide-prevention/suicide-help-dealing-with-your-suicidal-thoughts-and-feelings.htm"]];
}
- (IBAction)helpguide2buttonpress:(id)sender {
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.helpguide.org/articles/suicide-prevention/suicide-prevention-helping-someone-who-is-suicidal.htm"]];
}
- (IBAction)metanoiabuttonpress:(id)sender {
          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.metanoia.org/suicide/"]];
}
- (IBAction)wikihowbuttonpress:(id)sender {
          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.wikihow.com/Cope-With-Suicidal-Thoughts"]];
}

@end
