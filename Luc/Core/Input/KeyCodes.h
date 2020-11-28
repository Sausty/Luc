//
//  KeyCodes.h
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum KeyCodes : int {
    
    // Special Keys
    Space             = 0x31,
    ReturnKey         = 0x24,
    EnterKey          = 0x4C,
    Escape            = 0x35,
    Shift             = 0x38,
    Command           = 0x37,
    
    // DPad Keys
    LeftArrow         = 0x7B,
    RightArrow        = 0x7C,
    DownArrow         = 0x7D,
    UpArrow           = 0x7E,
    
    // Alphabet
    KeyA                 = 0x00,
    KeyB                 = 0x0B,
    KeyC                 = 0x08,
    KeyD                 = 0x02,
    KeyE                 = 0x0E,
    KeyF                 = 0x03,
    KeyG                 = 0x05,
    KeyH                 = 0x04,
    KeyI                 = 0x22,
    KeyJ                 = 0x26,
    KeyK                 = 0x28,
    KeyL                 = 0x25,
    KeyM                 = 0x2E,
    KeyN                 = 0x2D,
    KeyO                 = 0x1F,
    KeyP                 = 0x23,
    KeyQ                 = 0x0C,
    KeyR                 = 0x0F,
    KeyS                 = 0x01,
    KeyT                 = 0x11,
    KeyU                 = 0x20,
    KeyV                 = 0x09,
    KeyW                 = 0x0D,
    KeyX                 = 0x07,
    KeyY                 = 0x10,
    KeyZ                 = 0x06,
    
    // Top Numbers
    Key0              = 0x1D,
    Key1              = 0x12,
    Key2              = 0x13,
    Key3              = 0x14,
    Key4              = 0x15,
    Key5              = 0x17,
    Key6              = 0x16,
    Key7              = 0x1A,
    Key8              = 0x1C,
    Key9              = 0x19,
    
    // Keypad Numbers
    Keypad0           = 0x52,
    Keypad1           = 0x53,
    Keypad2           = 0x54,
    Keypad3           = 0x55,
    Keypad4           = 0x56,
    Keypad5           = 0x57,
    Keypad6           = 0x58,
    Keypad7           = 0x59,
    Keypad8           = 0x5B,
    Keypad9           = 0x5C
} KeyCodes;
