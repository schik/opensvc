/* main.m
 *  
 * Copyright (C) 2013 Andreas Schik
 *
 * Author: Andreas Schik <andreas@schik.de>
 * Date: March 2013
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

#include <AppKit/NSApplication.h>
#include <Foundation/NSArray.h>

#include "Controller.h"

int main(int argc, const char *argv[])
{
    NSProcessInfo *info = [NSProcessInfo processInfo];

    if ([[info arguments] count] < 2) {
	NSLog(@"Too few arguments. Path name is missing.");
	exit(-1);
    }

    CREATE_AUTORELEASE_POOL (pool);
    // We need the following to be able to access services.
    [NSApplication sharedApplication];
    [NSApp setDelegate: [[Controller alloc] init]];

    NSApplicationMain(argc, argv);
    RELEASE (pool);
    
    exit(EXIT_SUCCESS);
}

