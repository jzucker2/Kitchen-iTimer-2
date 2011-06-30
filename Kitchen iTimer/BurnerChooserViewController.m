//
//  BurnerChooserViewController.m
//  Kitchen iTimer
//
//  Created by Jordan Zucker on 6/21/11.
//  Copyright 2011 University of Illinois. All rights reserved.
//

#import "BurnerChooserViewController.h"
#import "PlacardView.h"

#import <QuartzCore/QuartzCore.h>


@implementation BurnerChooserViewController

@synthesize delegate=_delegate;
@synthesize placardView;


// start of placard animations

/*
 If the view is stored in the nib file, when it's unarchived it's sent -initWithCoder:.
 This is the case in the example as provided.  See also initWithFrame:.
 */
- (id)initWithCoder:(NSCoder *)coder {
	
	self = [super initWithCoder:coder];
	if (self) {
		[self setUpPlacardView];
	}
	return self;
}


- (void)setUpPlacardView {
    
    NSLog(@"inside setupplacardview");
    
	// Create the placard view -- its init method calculates its frame based on its image
	PlacardView *aPlacardView = [[PlacardView alloc] init];
	self.placardView = aPlacardView;
	[aPlacardView release];
	placardView.center = pic.center;
	[pic addSubview:placardView];
    [pic bringSubviewToFront:placardView];
}



- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    placardView.center = location;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesBegan:touches withEvent:event];
}




- (void) resetPlacardView {
    
    NSLog(@"inside resetplacardview");
    
    placardView.transform = CGAffineTransformIdentity;
    pic.userInteractionEnabled = YES;
}


// end of placard animations

//@synthesize pic;



- (void)dealloc
{
    [placardView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/stove.jpg"];
    
    NSLog(@"jpgPath is %@", jpgPath);
    
    
    //UIImage *img = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString: jpgPath]]];
    
    //UIImage *image = [UIImage imageNamed: @"stove.jpg"];
    
    //[BurnerChooserViewController.pic setImage:[UIImage imageNamed:value]];
    
    //NSLog(@"img is %@", img);
    
    //pic.image = [UIImage imageNamed:@"stove.jpg"];
    
    UIImage *image = [UIImage imageWithContentsOfFile: jpgPath];
    
    //NSLog(@"image is %@", image);
    
    //[self.pic.imgView setImage:img];
    
    //NSLog(@"image is %@", image);
    
    [pic setImage:image];
    
    //[pic setHidden: NO];
    
    NSError *error;
    
    // Let's check to see if files were successfully written...
    // You can try this when debugging on-device
    
    // Create file manager
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    // Point to Document directory
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    // Write out the contents of home directory to console
    NSLog(@"Documents directory: %@", [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error]);
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma Actions

- (IBAction)back:(id)sender
{
    [self.delegate burnerChooserViewControllerDidFinish:self];
}

- (IBAction) addTimer:(id)sender {
    [self setUpPlacardView];
}

/*
- (void) setURL {
    
    NSError *error;
    
    // Let's check to see if files were successfully written...
    // You can try this when debugging on-device
    
    // Create file manager
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    // Point to Document directory
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    // Write out the contents of home directory to console
    NSLog(@"Documents directory: %@", [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error]);
}
 */



@end
