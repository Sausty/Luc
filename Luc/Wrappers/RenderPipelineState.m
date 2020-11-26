//
//  RenderPipelineState.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "RenderPipelineState.h"

@implementation RenderPipelineState

- (nonnull instancetype)initWithDeviceAndDescriptor:(nonnull id<MTLDevice>)device:(nonnull RenderPipelineDescriptor*)descriptor
{
    self = [super init];
    
    NSError* error;
    self.renderPipelineState = [device newRenderPipelineStateWithDescriptor:[descriptor renderPipelineDescriptor] error:&error];
    NSAssert(self.renderPipelineState, @"Failed to create render pipeline state!");
    
    return self;
}

@end
