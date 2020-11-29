//
//  Scene2D.m
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Scene2D.h"
#import "Keyboard.h"
#import "KeyCodes.h"
#import "Scene2DCamera.h"
#import <stdio.h>

@implementation Scene2D
{
    float _x;
    float _y;
    Scene2DCamera* scene2DCamera;
}

- (nonnull instancetype)init:(CGSize)size
{
    self = [super init:size];
    
    // Create whatever game objects you want to create... and add them using :
    // [self addGameObject:(nonnull Mesh*)mesh:(NSString*)name]
    
    scene2DCamera = [[Scene2DCamera alloc] init:size.width :size.height];
    
    return self;
}

- (void)SceneResize:(CGSize)size
{
    [scene2DCamera OnResize:size];
}

- (void)update
{
    [self beginScene:[scene2DCamera GetViewProjection]];
    [scene2DCamera Update];
    
    Mesh* quadGameObject = self.sceneGameObjects[@"Quad"];
    if ([Keyboard IsKeyPressed:UpArrow])
        _y += 0.05;
    else if ([Keyboard IsKeyPressed:DownArrow])
        _y -= 0.05;
    if ([Keyboard IsKeyPressed:LeftArrow])
        _x -= 0.05;
    if ([Keyboard IsKeyPressed:RightArrow])
        _x += 0.05;
    
    [quadGameObject.transform setPosition:simd_make_float3(_x, _y, 0.0f)];
}

@end
