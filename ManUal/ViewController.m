//
//  ViewController.m
//  ManUal
//
//  Created by Gabriel on 11/8/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self clearAllAction];
    
    // Initialize objects
    self.manu = [[Manual alloc] init];
    self.foll = [[FollowUp alloc] init];
    self.enca = [[Encasements alloc] init];
    self.inte = [[Interceptors alloc] init];
    self.wall = [[Wall alloc] init];
    self.floo = [[Floor alloc] init];
    self.unit = [[Units alloc] init];
    
    self.totalButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.totalButton.layer.borderWidth = 0.6f;
    self.totalButton.layer.cornerRadius = 10.0f;
    self.totalButton.layer.backgroundColor = [UIColor orangeColor].CGColor;
 
    self.mtotalButton.layer.borderColor = [UIColor blueColor].CGColor;
    self.mtotalButton.layer.borderWidth = 0.6f;
    self.mtotalButton.layer.cornerRadius = 10.0f;
    self.mtotalButton.layer.backgroundColor = [UIColor orangeColor].CGColor;
    self.multiSwitchStatus = @"ON";

    
    
    //[self.floorButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 2.0, 0.0, 2.0)];
    //[self.wallButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 2.0, 0.0, 2.0)];
    
    // Trying to follow: http://stackoverflow.com/questions/1126726/how-to-make-a-uitextfield-move-up-when-keyboard-is-present
    self.scrollView.frame = [self.mainView.layer.presentationLayer frame];
    
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
    
    int currentHeight = [[UIScreen mainScreen] bounds].size.height;
    int currentWidth = [[UIScreen mainScreen] bounds].size.width;
    
    _keyboardIsShown = NO;
    //make contentSize bigger than your scrollSize (you will need to figure out for your own use case)
    CGSize scrollContentSize = CGSizeMake(currentWidth, currentHeight);
    self.scrollView.contentSize = scrollContentSize;
    
    currentHeight = currentHeight + 80;
    [self.mainView setFrame:CGRectMake(0, 0, currentWidth, currentHeight)];
    
    [self.multiSwitch addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
    
    
    //    self.manu.length = 20;
    //    self.manu.width = 50;
    
    self.foll.amount = 150;
    //    self.foll.visits = 2;
    
    //    self.enca.encasements = 1;
    self.enca.amount = 50;
    
    //    self.inte.interceptors = 1;
    
    self.inte.amount = 5;
    
    self.wall.amount = 75;
    
    self.floo.amount = 75;
    
    //    NSLog(@"%.0fx%.0f", self.manu.length, self.ther.width);
    //    NSLog(@"Area: %.0f", [self.manu calculateArea]);
    //
    //    NSLog(@"Cost: %.2f", [self.manu calculateCost]);
    //    float followUpTotal = [self.foll calculateCost];
    //    float totalCost = [self.manu calculateCost] + [self.foll calculateCost];
    //    NSLog(@"Total Cost: %.2f+%.2f = %.2f", [self.manu calculateCost], followUpTotal, totalCost);
    
    // self.totalLabel.text = [NSString stringWithFormat:@"%.2f", totalCost];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}

- (void)keyboardWillHide:(NSNotification *)n
{
    NSDictionary* userInfo = [n userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    // resize the scrollview
    CGRect viewFrame = self.scrollView.frame;
    // I'm also subtracting a constant kTabBarHeight because my UIScrollView was offset by the UITabBar so really only the portion of the keyboard that is leftover pass the UITabBar is obscuring my UIScrollView.
    viewFrame.size.height += (keyboardSize.height);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    // The kKeyboardAnimationDuration I am using is 0.3
    [UIView setAnimationDuration:0.3];
    [self.scrollView setFrame:viewFrame];
    [UIView commitAnimations];
    
    _keyboardIsShown = NO;
}

- (void)keyboardWillShow:(NSNotification *)n
{
    // This is an ivar I'm using to ensure that we do not do the frame size adjustment on the `UIScrollView` if the keyboard is already shown.  This can happen if the user, after fixing editing a `UITextField`, scrolls the resized `UIScrollView` to another `UITextField` and attempts to edit the next `UITextField`.  If we were to resize the `UIScrollView` again, it would be disastrous.  NOTE: The keyboard notification will fire even when the keyboard is already shown.
    if (_keyboardIsShown) {
        return;
    }
    
    NSDictionary* userInfo = [n userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // resize the noteView
    CGRect viewFrame = self.scrollView.frame;
    // I'm also subtracting a constant kTabBarHeight because my UIScrollView was offset by the UITabBar so really only the portion of the keyboard that is leftover pass the UITabBar is obscuring my UIScrollView.
    viewFrame.size.height -= (keyboardSize.height);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    // The kKeyboardAnimationDuration I am using is 0.3
    [UIView setAnimationDuration:0.3];
    [self.scrollView setFrame:viewFrame];
    [UIView commitAnimations];
    
    _keyboardIsShown = YES;
}

- (IBAction)calculateTotal:(id)sender {
    
    // Get values out of input fields
    self.manu.length = [self.lengthTextField.text floatValue];
    self.manu.width = [self.widthTextField.text floatValue];
    self.foll.visits = [self.followupTextField.text floatValue];
    self.enca.encasements = [self.encasementsTextField. text floatValue];
    self.inte.interceptors = [self.interceptorsTextField. text floatValue];
    self.wall.wall = [self.wallTextField. text floatValue];
    self.floo.floor = [self.floorTextField. text floatValue];
    self.unit.units = [self.unitsTextField. text floatValue];
    
    
    // Process calculations and save to temporary variables
    float manualCost = [self.manu calculateCost];
    float followupCost = [self.foll calculateCost];
    float encasementsCost = [self.enca calculateCost];
    float interceptorsCost = [self.inte calculateCost];
    float wallCost = [self.wall calculateCost];
    float floorCost = [self.floo calculateCost];
    float extraCosts = encasementsCost + interceptorsCost + wallCost + floorCost;
    float totalCosts = manualCost + followupCost + extraCosts;
    float subtotalCosts = manualCost + followupCost;
    float mtotalCosts = self.unit.units * subtotalCosts + encasementsCost + interceptorsCost + wallCost + floorCost;
    
    // Output results to labels
    self.manualcostLabel.text = [NSString stringWithFormat:@"%.2f",manualCost];
    self.followupcostLabel.text = [NSString stringWithFormat:@"%.2f",followupCost];
    self.extracostsLabel.text = [NSString stringWithFormat:@"%.2f",extraCosts];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f",totalCosts];
    self.mtotalLabel.text = [NSString stringWithFormat:@"%.2f", mtotalCosts];
    
}


- (IBAction)clearAll:(id)sender {
    
    [self clearAllAction];
    
}

- (void)clearAllAction {
    
    // Reset input fields to nada
    self.lengthTextField.text = @"";
    self.widthTextField.text = @"";
    self.followupTextField.text = @"";
    self.encasementsTextField.text = @"";
    self.interceptorsTextField.text = @"";
    self.wallTextField.text = @"";
    self.floorTextField.text = @"";
    self.unitsTextField.text = @"";
    
    // Reset totals to nada
    self.manualcostLabel.text = @"0.00";
    self.followupcostLabel.text = @"0.00";
    self.extracostsLabel.text = @"0.00";
    self.totalLabel.text = @"0.00";
    self.mtotalLabel.text = @"0.00";
    
}

- (void)changeSwitch:(id)sender{
    if([sender isOn]){
        // Execute any code when the switch is ON
        NSLog(@"Switch is ON");
        [self.mtotalLabel setEnabled:YES];
        [self.unitsTextField setEnabled:YES];
        [self.mtotalButton setEnabled: YES];
        [self.wallTextField setEnabled: YES];
        [self.floorTextField setEnabled: YES];
        [self.totalButton setEnabled:NO];
        [self.totalLabel setEnabled:YES];
        self.unitsTextField.textColor = [UIColor blackColor];
        self.unitsTextLabel.textColor = [UIColor blackColor];
        self.mtotalButton.titleLabel. textColor = [UIColor blackColor];
        self.mtotalLabel.textColor = [UIColor blackColor];
        self.wallTextLabel.textColor = [UIColor blackColor];
        self.floorTextLabel.textColor = [UIColor blackColor];
        self.totalButton.titleLabel. textColor = [UIColor whiteColor];
        self.totalLabel.textColor = [UIColor grayColor];
        self.multiSwitchStatus = @"ON";
        
    } else{
        // Execute any code when the switch is OFF
        NSLog(@"Switch is OFF");
        [self.totalButton setEnabled:YES];
        [self.mtotalLabel setEnabled: YES];
        [self.unitsTextField setEnabled: NO];
        [self.mtotalButton setEnabled: NO];
        [self.wallTextField setEnabled: YES];
        [self.floorTextField setEnabled: YES];
        self.unitsTextField.textColor = [UIColor grayColor];
        self.unitsTextLabel.textColor = [UIColor grayColor];
        self.mtotalButton.titleLabel. textColor = [UIColor whiteColor];
        self.mtotalLabel.textColor = [UIColor whiteColor];
        self.wallTextLabel.textColor = [UIColor blackColor];
        self.floorTextLabel.textColor = [UIColor blackColor];
        self.totalButton.titleLabel. textColor = [UIColor blackColor];
        self.totalLabel.textColor = [UIColor blackColor];
        self.multiSwitchStatus = @"OFF";
        
    
    }
}




- (IBAction)multiSwitched:(id)sender {
    

}

- (IBAction)calculatemTotal:(id)sender {
}

- (IBAction)manualEmailButton:(id)sender {
//put variables
    NSString *length = self.lengthTextField.text;
    NSString *width = self.widthTextField.text;
    NSString *follow = self.followupTextField.text;
    NSString *encasement = self.encasementsTextField.text;
    NSString *interceptors = self.interceptorsTextField.text;
    NSString *wall = self.wallTextField.text;
    NSString *floor = self.floorTextField.text;
    NSString *manualcost = self.manualcostLabel.text;
    NSString *followcost = self.followupcostLabel.text;
    NSString *extracost = self.extracostsLabel.text;
    NSString *totalcost = self.totalLabel.text;
    NSString *multiswitch = self.multiSwitchStatus;
    NSString *mtotal = self.mtotalLabel.text;
    
    //email subject
    NSString *emailTitle = @"Estimate";
    
    
    //email content
    NSString *messageBody = @"<h1>Manual Estimate</h1><h3>Please add estimate to PestPac!</h3>";
    
    messageBody =
    [[[[[[[[[[[[[[[@"<h1>Manual Estimate</h1><h3>Please add estimate to PestPac!</h3><p>Length: "
              stringByAppendingString: length]
             stringByAppendingString:@"<br />Width: "]
            stringByAppendingString: width]
           stringByAppendingString:@"<br /><br />Number of follow-ups: "]
          stringByAppendingString: follow]
         stringByAppendingString:@"<br />Number of encasements: "]
        stringByAppendingString: encasement]
       stringByAppendingString:@"<br />Number of interceptors: "]
      stringByAppendingString: interceptors]
     stringByAppendingString:@"<br /><br />"]
    stringByAppendingString:@"<br />Number of floor barriers: "]
    stringByAppendingString: floor]
    stringByAppendingString:@"<br />Number of wall barriers: "]
     stringByAppendingString: wall]
     stringByAppendingString:@"<br /><br />"];
    

    messageBody = [[[[[[[[[messageBody stringByAppendingString:@"<br /><strong>Manual cost:</strong> "]
                          stringByAppendingString: manualcost]
                         stringByAppendingString:@"<br /><strong>Follow-up cost:</strong> "]
                        stringByAppendingString: followcost]
                       stringByAppendingString:@"<br /><strong>Extra cost:</strong> "]
                      stringByAppendingString: extracost]
                     stringByAppendingString:@"</p><h4>Total: "]
                    stringByAppendingString: totalcost]
                   stringByAppendingString:@"</h4>"];
    
    if ([multiswitch isEqual: @"ON"]) {  //was multiSwitchStatus
        messageBody = [[[messageBody stringByAppendingString:@"<h4>Multi-total: "] stringByAppendingString: mtotal] stringByAppendingString:@"</h4>"];
    }
    
    //to address
    NSArray *toRecipents = [NSArray arrayWithObjects:@"gabriel@pestecipm.com", nil];
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:YES];
    [mc setToRecipients:toRecipents];
    
    //present email to view controller

    [self presentViewController:mc animated:YES completion: NULL];
    
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error;
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}




- (IBAction)mtotalButton:(UIButton *)sender {
}
@end




