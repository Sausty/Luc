//
//  RendererCore.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

@import MetalKit;

@interface RendererCore : NSObject

@property id<MTLDevice> _Nonnull device;
@property id<MTLCommandQueue> _Nonnull commandQueue;

- (nonnull instancetype)InitWithDevice:(id<MTLDevice>_Nonnull)device;

@end
