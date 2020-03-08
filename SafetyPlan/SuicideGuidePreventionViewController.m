//
//  SuicideGuidePreventionViewController.m
//  SafetyPlan
//
//

#import "SuicideGuidePreventionViewController.h"

@interface SuicideGuidePreventionViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation SuicideGuidePreventionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.textView scrollRangeToVisible:NSMakeRange(0, 0)];
}

- (void)viewDidLayoutSubviews {
    [self.textView setContentOffset:CGPointMake(0.0, 0.0) animated:NO];
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
