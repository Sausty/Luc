//
//  Scene.h
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Mesh.h"
#import "RenderPipelineState.h"

@import MetalKit;

@interface Scene : NSObject

@property NSMutableDictionary<NSString*, Mesh*>* _Nonnull sceneGameObjects;
@property RenderPipelineState* _Nonnull sceneRenderPipelineState;

- (nonnull instancetype)init;

- (void)setRenderPipelineState:(RenderPipelineState * _Nonnull)sceneRenderPipelineState;
- (void)addGameObject:(nonnull Mesh*)mesh:(NSString*)tag;
- (void)render;
- (void)update;

@end
