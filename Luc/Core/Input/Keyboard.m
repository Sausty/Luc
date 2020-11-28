//
//  Keyboard.m
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Keyboard.h"

static NSMutableDictionary<NSNumber*, NSNumber*>* keys;

@implementation Keyboard

+ (void)InitKeyboard
{
    keys = [[NSMutableDictionary alloc] initWithCapacity:KeyCount];
}

+ (void)SetKeyPressed:(int)keycode :(BOOL)isOn
{
    NSNumber* key = [[NSNumber alloc] initWithInt:keycode];
    NSNumber* pressed = [[NSNumber alloc] initWithBool:isOn];
    
    keys[key] = pressed;
}

+ (BOOL)IsKeyPressed:(int)keycode
{
    NSNumber* key = [[NSNumber alloc] initWithInt:keycode];
    return [keys[key] boolValue];
}

@end
