//
//  Scene.m
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Scene.h"
#import "RendererCore.h"

@implementation Scene

- (nonnull instancetype)init:(CGSize)size
{
    self = [super init];
    
    self.sceneGameObjects = [[NSMutableDictionary alloc] init];
    
    return self;
}

- (void)SceneResize:(CGSize)size
{
    
}

- (void)setRenderPipelineState:(RenderPipelineState * _Nonnull)sceneRenderPipelineState
{
    self.sceneRenderPipelineState = sceneRenderPipelineState;
}

- (void)addGameObject:(nonnull Mesh*)mesh:(NSString*)tag
{
    _sceneGameObjects[tag] = mesh;
}

- (void)beginScene:(matrix_float4x4)viewProjectionCamera
{
    [RendererCore.currentRenderCommandEncoder setVertexBytes:&viewProjectionCamera length:sizeof(matrix_float4x4) atIndex:2];
}

- (void)render;
{
    [RendererCore.currentRenderCommandEncoder setRenderPipelineState:self.sceneRenderPipelineState.renderPipelineState];
    
    [self update];
    
    for (NSString* key in _sceneGameObjects)
    {
        Mesh* value = _sceneGameObjects[key];
        [value render];
    }
}

- (void)update
{
    
}

@end
