//
//  RendererPreferences.m
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "RendererPreferences.h"
#import "RendererCore.h"

static DrawMode currentDrawMode;

@implementation RendererPreferences

+ (void)SetDrawMode:(DrawMode)mode
{
    currentDrawMode = mode;
}

+ (DrawMode)GetCurrentDrawMode
{
    return currentDrawMode;
}

+ (void)BindDrawMode
{
    if (currentDrawMode == DrawModeLines)
        [RendererCore.currentRenderCommandEncoder setTriangleFillMode:MTLTriangleFillModeLines];
    if (currentDrawMode == DrawModeFill)
        [RendererCore.currentRenderCommandEncoder setTriangleFillMode:MTLTriangleFillModeFill];
}

@end
