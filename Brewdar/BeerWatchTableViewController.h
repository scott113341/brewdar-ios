#import <UIKit/UIKit.h>
#import "BeerWatch.h"

@interface BeerWatchTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property RLMArray *beerWatches;

@end
