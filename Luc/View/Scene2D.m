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
#import <stdio.h>

@implementation Scene2D
{
    float _x;
    float _y;
}

- (nonnull instancetype)init
{
    self = [super init];
    
    // Create whatever game objects you want to create... and add them using :
    // [self addGameObject:(nonnull Mesh*)mesh:(NSString*)name]
    
    return self;
}

- (void)update
{
    Mesh* quadGameObject = self.sceneGameObjects[@"Quad"];
    if ([Keyboard IsKeyPressed:KeyW])
        _y += 0.05;
    else if ([Keyboard IsKeyPressed:KeyS])
        _y -= 0.05;
    if ([Keyboard IsKeyPressed:KeyA])
        _x -= 0.05;
    if ([Keyboard IsKeyPressed:KeyD])
        _x += 0.05;
    
    [quadGameObject.transform setPosition:simd_make_float3(_x, _y, 0.0f)];
}

@end
