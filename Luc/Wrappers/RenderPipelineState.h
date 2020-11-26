//
//  RenderPipelineState.h
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "RenderPipelineDescriptor.h"

@import MetalKit;

@interface RenderPipelineState : NSObject

@property id<MTLRenderPipelineState> _Nonnull renderPipelineState;

- (nonnull instancetype)initWithDeviceAndDescriptor:(nonnull id<MTLDevice>)device:(nonnull RenderPipelineDescriptor*)descriptor;

@end
