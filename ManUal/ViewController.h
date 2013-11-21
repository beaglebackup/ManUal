//
//  ViewController.h
//  ManUal
//
//  Created by Gabriel on 11/8/13.
//  Copyright (c) 2013 Gabriel. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Manual.h"
#import "FollowUp.h"
#import "Encasements.h"
#import "Interceptors.h"
#import "FloorBarrier.h"
#import "WallBarrier.h"
#import "MultiUnits.h"
#import <MessageUI/MessageUI.h>


@interface ViewController : UIViewController <UITextFieldDelegate> {
    BOOL _keyboardIsShown;
}

// UI Elements
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIButton *clear;
@property (strong, nonatomic) IBOutlet UITextField *lengthTextField;
@property (strong, nonatomic) IBOutlet UITextField *widthTextField;
@property (strong, nonatomic) IBOutlet UITextField *followupTextField;
@property (strong, nonatomic) IBOutlet UITextField *encasementsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interceptorsTextField;
@property (strong, nonatomic) IBOutlet UISwitch *multiSwitch;
@property (strong, nonatomic) IBOutlet UILabel *manualcostLabel;
@property (strong, nonatomic) IBOutlet UILabel *followupcostLabel;
@property (strong, nonatomic) IBOutlet UILabel *extracostsLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UIButton *totalButton;
@property (strong, nonatomic) IBOutlet UITextField *floorTextField;
@property (strong, nonatomic) IBOutlet UITextField *wallTextField;
// Multi Units
@property (strong, nonatomic) IBOutlet UILabel *unitsTextLabel;
@property (strong, nonatomic) IBOutlet UITextField *unitsTextField;
@property (strong, nonatomic) IBOutlet UILabel *mtotalLabel;
@property (strong, nonatomic) IBOutlet UIButton *mtotalButton;
@property (strong, nonatomic) IBOutlet UILabel *floorTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *wallTextLabel;




// elements that are calculation
@property (strong, nonatomic) Manual *manu;
@property (strong, nonatomic) FollowUp *foll;
@property (strong, nonatomic) Encasements *enca;
@property (strong, nonatomic) Interceptors *inte;
@property (strong, nonatomic) Floor *floo;
@property (strong, nonatomic) Wall *wall;
@property (strong, nonatomic) Units *unit;
@property (strong, nonatomic) NSString *multiSwitchStatus;



// Action
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)keyboardWillHide:(NSNotification *)n;
- (void)keyboardWillShow:(NSNotification *)n;


- (IBAction)calculateTotal:(id)sender;
- (IBAction)clearAll:(id)sender;
- (void)clearAllAction;
- (void)changeSwitch:(id)sender;
- (IBAction)multiSwitched:(id)sender;
- (IBAction)calculatemTotal:(id)sender;
- (IBAction)manualEmailButton:(id)sender;




@end


    
    
    
    
    
    
    
    
