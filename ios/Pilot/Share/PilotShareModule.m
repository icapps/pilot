//
//  PilotShareModule.m
//  Pilot
//
//  Created by Dylan Gyesbreghs on 23/05/2018.
//  Copyright © 2018 icapps. All rights reserved.
//

#import "PilotShareModule.h"

@implementation PilotShareModule

RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(shareUrl:(NSString *)url title:(NSString *)title subject:(NSString *)subject) {
    NSURL *object = [[NSURL alloc] initWithString:url];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[object]
                                      applicationActivities:nil];
    [self.rootViewController presentViewController:activityViewController animated:YES completion:nil];
}

#pragma mark - Private Methods

- (UIViewController *)rootViewController {
    return UIApplication.sharedApplication.keyWindow.rootViewController;
}

@end
