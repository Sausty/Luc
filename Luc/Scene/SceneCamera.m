//
//  SceneCamera.m
//  Luc
//
//  Created by Milo Heinrich on 29/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "SceneCamera.h"

@implementation SceneCamera

- (nonnull instancetype)init
{
    self = [super init];
    
    self.projectionMatrix = matrix_identity_float4x4;
    self.viewMatrix = [[Transform alloc] init];
    
    return self;
}

@end
