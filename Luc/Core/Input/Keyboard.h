//
//  Keyboard.h
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "KeyCodes.h"

static int KeyCount = 256;

@interface Keyboard : NSObject

+ (void)InitKeyboard;
+ (void)SetKeyPressed:(int)keycode:(BOOL)isOn;
+ (BOOL)IsKeyPressed:(int)keycode;

@end
