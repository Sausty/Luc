# Luc : Metal renderer built in Objective C

Luc is a metal renderer built using Objective-C. It's main goal is to make a simple yet powerful API that allows anyone to create graphical applications without all the hard low level code. 

## Engine Features :
- Wrappers for most of the Metal objects
- A scene system
- Custom shading

## Things I would like to implement :

### Engine Core:
- Cross Platform (macOS, iOS, tvOS)
- A more complete maths library
- An input system

### Engine Rendering:
- Cameras
- 3D meshes
- Model loading (.obj, .mtl)
- Skyboxes
- Textures
- Normal mapping
- Lighting
- Multiple shading pipelines (Phong, toon...)

## Fun facts :
I built Luc in Objective-C because I wanted to try a new language. Since I already tried swift and I didn't like it at all, so I guess and old dying language can help me build this engine.
Note that this engine will only support rendering, input and mathematics! It does not have the functionnalities of a complete game engine such as Physics, Multithreading, Networking, etc.