//
//  RendererPreferences.h
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum DrawMode : int {
    DrawModeLines,
    DrawModeFill
} DrawMode;

@import MetalKit;

@interface RendererPreferences : NSObject

// Draw Mode Preferences
+ (void)SetDrawMode:(DrawMode)mode;
+ (DrawMode)GetCurrentDrawMode;
+ (void)BindDrawMode;

@end
