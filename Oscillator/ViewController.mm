//
//  ViewController.m
//  Oscillator
//
//  Created by Stanford Laptop Orchestra on 8/13/12.
//  Copyright (c) 2012 Stanford Laptop Orchestra. All rights reserved.
//

#import "ViewController.h"
#import "Audio.h"

@interface ViewController ()
{
    Audio * audio;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    audio = new Audio();
}


- (IBAction)changeFreq:(id)sender
{
    UISlider *myslider=(UISlider*)sender;
    audio->setFreq(myslider.value);
}

- (IBAction)switchToggled:(id)sender
{    
    UISwitch *mySwitch=(UISwitch*)sender;
    
    bool isSwitchOn = [mySwitch isOn];

    float myNewGain = 0.0;
    
    if ( isSwitchOn )
        myNewGain = 1.0;
    else
        myNewGain = 0.0;
        
    audio->setGain(myNewGain);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
