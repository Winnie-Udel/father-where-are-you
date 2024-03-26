shader_type canvas_item;

uniform float amplitude = 0.02; // Amplitude of the wave
uniform float frequency = 1.0; // Frequency of the wave
uniform float speed = 1.0; // Speed of the wave
uniform float time_scale = 1.0; // Scale the time
uniform vec2 offset = vec2(0.0, 0.0); // Offset for scrolling effect

float random(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898,78.233))) * 43758.5453);
}

float smoothNoise(vec2 co) {
    vec2 integral = floor(co);
    vec2 fractional = fract(co);

    // Smooth interpolation
    fractional = fractional * fractional * (3.0 - 2.0 * fractional);

    // Neighboring integer coordinates
    vec2 v1 = fract(vec2(integral.x, integral.y) * 0.001);
    vec2 v2 = fract(vec2(integral.x + 1.0, integral.y) * 0.001);
    vec2 v3 = fract(vec2(integral.x, integral.y + 1.0) * 0.001);
    vec2 v4 = fract(vec2(integral.x + 1.0, integral.y + 1.0) * 0.001);

    // Smoothed noise values
    float i1 = mix(random(v1), random(v2), fractional.x);
    float i2 = mix(random(v3), random(v4), fractional.x);

    return mix(i1, i2, fractional.y);
}

void fragment() {
    // Calculate the displacement
    float noise = smoothNoise(FRAGCOORD.xy) * 2.0 - 1.0; // Random noise between -1 and 1
    float displacement = sin(TIME * speed * time_scale + (FRAGCOORD.x + FRAGCOORD.y) * frequency + noise) * amplitude;
    
    // Apply scrolling offset
    vec2 uv = UV + offset;
    
    // Apply displacement to the y-coordinate of the UV
    uv.y += displacement*random(vec2(0,10));
	uv.x *= displacement*random(vec2(0,10));
    
    // Sample the texture using the displaced UV
    vec4 finalColor = texture(TEXTURE, uv);
    
    // Output the final color
    COLOR = finalColor;
}