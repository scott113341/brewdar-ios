#import "ViewController.h"
#import "Device.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RLMArray *devices = [Device allObjects];
    NSLog(@"%lu devices", (unsigned long)devices.count);
    
    Device *device = [Device thisDevice];
    NSLog(@"thisDevice: %@", device);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
