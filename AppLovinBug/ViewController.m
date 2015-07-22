//
//  ViewController.m
//  AppLovinBug
//
//  Created by Maximilian Tagher on 7/22/15.
//  Copyright (c) 2015 Heyzap. All rights reserved.
//

#import "ViewController.h"
#import "ALSdk.h"
#import "ALAdLoadDelegate.h"
#import "ALInterstitialAd.h"

@interface ViewController () <ALAdLoadDelegate>

@property (nonatomic, strong) ALSdk *sdk;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sdk = [ALSdk sharedWithKey:@"TvPRfJ0dxmTLiGoZQi9o3_5zG0d0FVQoOqD38Eh4-9QhQCFrvPdyOkwfkXfz24mRuzU1CB5BLVtmh7aaXDXwxS"];
    [self.sdk initializeSdk];
    
    [[self.sdk adService] loadNextAd:[ALAdSize sizeInterstitial] andNotify:self];
}

-(void) adService: (alnonnull ALAdService *) adService didLoadAd: (alnonnull ALAd *) ad {
    NSLog(@"Ad loaded; ad = %@",ad);
    NSLog(@"Has preloaded = %i",[adService hasPreloadedAdOfSize:[ALAdSize sizeInterstitial]]);
    
    ALInterstitialAd *interstitial = [[ALInterstitialAd alloc] initWithSdk:self.sdk];
    
    NSLog(@"isReadyForDisplay = %i",[interstitial isReadyForDisplay]);
}

- (void)adService:(nonnull ALAdService *)adService didFailToLoadAdWithError:(int)code {
    NSLog(@"Did fail to load ad; code = %i",code);
}

@end
