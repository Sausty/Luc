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

vertex FragmentData DefaultVertexMain(const VertexIn vIn [[ stage_in ]]) {
    FragmentData fd;
    
    fd.position = float4(vIn.position, 1);
    fd.color = vIn.color;
    
    return fd;
}

fragment half4 DefaultFragmentMain(FragmentData fd [[ stage_in ]]) {
    float4 color = fd.color;
    
    return half4(color.r, color.g, color.b, color.a);
}
