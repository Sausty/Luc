//
//  RendererCore.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

@import MetalKit;

@interface RendererCore : NSObject

- (nonnull instancetype)InitWithDevice:(id<MTLDevice>_Nonnull)device;
+ (nonnull id<MTLDevice>)device;
+ (nonnull id<MTLCommandQueue>)commandQueue;

@end
