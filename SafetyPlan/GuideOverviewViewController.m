//
//  GuideOverviewViewController.m
//  SafetyPlan
//
//

#import "GuideOverviewViewController.h"

@interface GuideOverviewViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation GuideOverviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if ([[[NSProcessInfo processInfo] arguments] containsObject:@"--safetyPlanScreenshots"]) {
        // We are in testing mode, make arrangements if needed
        [UIView setAnimationsEnabled:false];
    }

    [self.textView scrollRangeToVisible:NSMakeRange(0, 0)];
    self.textView.scrollEnabled = YES;
    self.textView.contentSize = [self.textView sizeThatFits:self.textView.frame.size];
    
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
