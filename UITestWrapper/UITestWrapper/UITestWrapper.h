//
//  UITestWrapper.h
//  UITestWrapper
//
//  Created by Jaroslaw Gliwinski on 2020-03-24.
//  Copyright © 2020 Tooploox. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for UITestWrapper.
FOUNDATION_EXPORT double UITestWrapperVersionNumber;

//! Project version string for UITestWrapper.
FOUNDATION_EXPORT const unsigned char UITestWrapperVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <UITestWrapper/PublicHeader.h>

#import "AppFramework/Action/GREYAction.h"
#import "AppFramework/Action/GREYActionBlock.h"
#import "AppFramework/Action/GREYActions.h"
#import "CommonLib/DistantObject/GREYHostApplicationDistantObject.h"
#import "CommonLib/Matcher/GREYElementMatcherBlock.h"
#import "CommonLib/Matcher/GREYMatcher.h"
#import "TestLib/AlertHandling/XCTestCase+GREYSystemAlertHandler.h"
#import "TestLib/EarlGreyImpl/EarlGrey.h"
