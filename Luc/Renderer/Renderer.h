//
//  Renderer.h
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

@import MetalKit;

@interface Renderer : NSObject <MTKViewDelegate>

- (void)mtkView:(MTKView *)view drawableSizeWillChange:(CGSize)size;
- (void)drawInMTKView:(MTKView *)view;

@end
