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

- (nonnull instancetype)init
{
    self = [super init];
    
    self.sceneGameObjects = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)setRenderPipelineState:(RenderPipelineState * _Nonnull)sceneRenderPipelineState
{
    self.sceneRenderPipelineState = sceneRenderPipelineState;
}

- (void)addGameObject:(nonnull Mesh*)mesh
{
    [_sceneGameObjects addObject:mesh];
}

- (void)render;
{
    [RendererCore.currentRenderCommandEncoder setRenderPipelineState:self.sceneRenderPipelineState.renderPipelineState];
    NSUInteger size = [_sceneGameObjects count];
    for (NSUInteger i = 0; i < size; i++)
    {
        [_sceneGameObjects[i] render];
    }
}

@end
