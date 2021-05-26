// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "ConnectivitySpeedPlugin.h"

#import "Reachability/Reachability.h"

#import <CoreLocation/CoreLocation.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "SystemConfiguration/CaptiveNetwork.h"

#include <ifaddrs.h>

#include <arpa/inet.h>

@implementation ConnectivitySpeedPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"connectivity_speed"
            binaryMessenger:[registrar messenger]];
  ConnectivitySpeedPlugin* instance = [[ConnectivitySpeedPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (NSString*)getConnectionSubtype:(Reachability*)reachability {
  if ([reachability currentReachabilityStatus] == NotReachable) {
    return @"none";
  }

  CTTelephonyNetworkInfo* netinfo = [[CTTelephonyNetworkInfo alloc] init];
  NSDictionary<NSString*, NSString*>* carrierByType = netinfo.serviceCurrentRadioAccessTechnology;
  NSArray *carriers = [carrierByType allValues];
  NSString *carrierType = carriers.firstObject;
  BOOL eq = [carrierType isEqualToString:CTRadioAccessTechnologyLTE];
  NSLog(@"CarrierType is %@", carrierType);

  if ([carrierType isEqualToString:CTRadioAccessTechnologyGPRS]) {
    return @"gprs";
  } else if ([carrierType isEqualToString:CTRadioAccessTechnologyEdge]) {
    return @"edge";
  } else if ([carrierType isEqualToString:CTRadioAccessTechnologyWCDMA]) {
    return @"cdma";
  } else if ([carrierType isEqualToString:CTRadioAccessTechnologyHSDPA]) {
    return @"hsdpa";
  } else if ([carrierType isEqualToString:CTRadioAccessTechnologyHSUPA]) {
    return @"hsupa";
  } else if ([carrierType isEqualToString:CTRadioAccessTechnologyCDMA1x]) {
    return @"cdma";
  } else if ([carrierType isEqualToString:CTRadioAccessTechnologyCDMAEVDORev0]) {
    return @"evdo_0";
  } else if ([carrierType isEqualToString:CTRadioAccessTechnologyCDMAEVDORevA]) {
    return @"evdo_a";
  } else if ([carrierType isEqualToString:CTRadioAccessTechnologyCDMAEVDORevB]) {
    return @"evdo_b";
  } else if ([carrierType isEqualToString:CTRadioAccessTechnologyeHRPD]) {
    return @"ehrpd";
  } else if ([carrierType isEqualToString:CTRadioAccessTechnologyLTE]) {
    return @"lte";
  }
  return @"unknown";
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getNetworkSubType" isEqualToString:call.method]) {
    result([self getConnectionSubtype:[Reachability reachabilityForInternetConnection]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
