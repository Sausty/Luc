//
//  DefaultShader.metal
//  Luc
//
//  Created by Milo Heinrich on 25/11/2020.
//  Copyright © 2020 Sausty. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct FragmentData {
    float4 position [[ position ]];
    float4 color;
};

struct ModelConstants {
    float4x4 modelTransform;
};

struct SceneConstants {
    float4x4 sceneCamera;
};

vertex FragmentData DefaultVertexMain(const VertexIn vIn [[ stage_in ]],
                                      constant ModelConstants &modelConstants [[ buffer(1) ]],
                                      constant SceneConstants &sceneConstants [[ buffer(2) ]]) {
    FragmentData fd;
    
    fd.position = sceneConstants.sceneCamera * modelConstants.modelTransform * float4(vIn.position, 1);
    fd.color = vIn.color;
    
    return fd;
}

fragment half4 DefaultFragmentMain(FragmentData fd [[ stage_in ]]) {
    float4 color = fd.color;
    
    return half4(color.r, color.g, color.b, color.a);
}
