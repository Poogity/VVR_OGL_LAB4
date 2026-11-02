#version 330 core

// input vertex and UV coordinates, different for all executions of this shader
layout(location = 0) in vec3 vertexPosition_modelspace;

// model view projection matrix 
uniform mat4 VP;
uniform mat4 M;

// Task 3.2a VS: propagate vertex coordinates (world space) to fragment shader
out vec4 vertexPosition_worldspace;

// Task 4.1b VS: 
uniform vec3 detachmentDisplacement;
uniform vec4 planeCoeffs;

void main()
{
    // assign vertex position
    vec4 coordinates_modelspace = vec4(vertexPosition_modelspace, 1.0);

    // Task 3.2b VS: calculate vertex position in world space
    vertexPosition_worldspace = M * coordinates_modelspace; 

    // Task 4.1c: displace the coordinates above by the detachmentDisplacement 
    // and the coordinates below by -detachmentDisplacement
    /*/
    float d = ...;
    if (d > 0.001f)
    {
        //vertexPosition_worldspace = ...;
    }
    else if (d < -0.001f)
    {
        //vertexPosition_worldspace = ...;
    }
    //*/
    
    gl_Position = VP * vertexPosition_worldspace;

    
}
