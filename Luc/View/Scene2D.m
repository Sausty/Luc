//
//  Scene2D.m
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Scene2D.h"
#import <stdio.h>

@implementation Scene2D
{
    float quadPosX;
}

- (nonnull instancetype)init
{
    self = [super init];
    
    // Create whatever game objects you want to create... and add them using :
    // [self addGameObject:(nonnull Mesh*)mesh:(NSString*)name]
    
    self->quadPosX = 0;
    
    return self;
}

- (void)update
{
    Mesh* quadGameObject = self.sceneGameObjects[@"Quad"];
    quadPosX += 0.02f;
    [[quadGameObject getTransform] setRotation:simd_make_float3(0.0f, 0.0f, 1.0f) :quadPosX];
}

@end
