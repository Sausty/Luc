//
//  RendererCore.m
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "RendererCore.h"

@implementation RendererCore
{
    
}

- (nonnull instancetype)InitWithDevice:(id<MTLDevice>)device
{
    _device = device;
    _commandQueue = [_device newCommandQueue];
    
    return self;
}

@end
