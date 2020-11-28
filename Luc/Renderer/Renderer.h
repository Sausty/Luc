//
//  Renderer.h
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Scene.h"

@import MetalKit;

@interface Renderer : NSObject <MTKViewDelegate>

@property Scene* _Nonnull activeRendererScene;

- (void)setActiveScene:(nonnull Scene*)scene;
- (void)mtkView:(MTKView *)view drawableSizeWillChange:(CGSize)size;
- (void)drawInMTKView:(MTKView *)view;

@end
