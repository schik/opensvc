/* Controller.m
 *  
 * Copyright (C) 2013 Andreas Schik
 *
 * Author: Andreas Schik <andreas@schik.de>
 * Date: December 2013
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 USA.
 */

#include <AppKit/AppKit.h>
#include "Controller.h"



@implementation Controller

- (id) init
{
    self = [super init];
  
    if (self) {
    }
  
    return self;
}

- (BOOL) application: app openFile: file
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *service = nil;
    NSString *key = nil;

    [NSApp registerServicesMenuSendTypes:
        [NSArray arrayWithObjects: @"NSStringPboardType", nil]
                             returnTypes: nil];

    key = [defaults stringForKey: @"service"];
    if (key == nil) {
        key = @"open_fs_service";
    }
    service = [defaults objectForKey: key];

    NSLog(@"Opening file %@ with service %@", file, service);
    [self openFile: file withService: service];
    return YES;
}

- (void) applicationDidFinishLaunching: (NSNotification *)notif
{
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}

- (void) openFile: (NSString *)file withService: (NSString *)service
{
    NSPasteboard *pboard;
    NSArray *urlPboardTypes;

    if (service && [service length]) {
        pboard = [NSPasteboard pasteboardWithUniqueName];
        urlPboardTypes = [NSArray arrayWithObjects: NSStringPboardType, nil];
        [pboard declareTypes: urlPboardTypes owner: nil];
        [pboard setString: file forType: NSStringPboardType];
        NSPerformService(service, pboard);
    } else {
        NSLog(@"No service known for opening the file %@.", file);
    }
}


@end

