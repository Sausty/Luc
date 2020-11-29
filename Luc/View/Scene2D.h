//
//  Scene2D.h
//  Luc
//
//  Created by Milo Heinrich on 28/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#import "Scene.h"

@interface Scene2D : Scene

- (nonnull instancetype)init:(CGSize)size;
- (void)SceneResize:(CGSize)size;
- (void)update;

@end
