//
//  SuicideSafetyPlanTabViewController.m
//  SafetyPlan
//
//

#import "SuicideSafetyPlanTabViewController.h"
#import "Safety_Plan-Swift.h"

@interface SuicideSafetyPlanTabViewController () <SafetyPlanViewControllerActions>

@end

@implementation SuicideSafetyPlanTabViewController

- (void)viewDidLoad;
{
    [super viewDidLoad];
    
    // At this point, we should have SafetyPlanViewController in the stack.
    // This is a brittle solution. It will break if we change the tab bar order.
    // We will deal with that later.
    UINavigationController *navController = (UINavigationController *)self.viewControllers.firstObject;
    SafetyPlanViewController *viewController = (SafetyPlanViewController *)navController.topViewController;
    viewController.delegate = self;
}

- (void)editSafetyPlanUsing:(enum ItemType)using from:(SafetyPlanViewController *)from;
{
    EditSafetyPlanItemViewController *controller = [EditSafetyPlanItemViewController newFromStoryboardWithType:using
                                                                                               refreshDelegate:from];
    [from presentViewController:controller
                       animated:true
                     completion:nil];
}

@end
