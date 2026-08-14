// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord.xy / iResolution.xy);
    vec3 gammaColor = texture(iChannel0, uv).xyz;
    // ungamma (should be 2.2 but...)
    vec3 color = pow(gammaColor, vec3(2.0));
    // grayscale conversion
    float gray = dot(color, vec3(0.2126, 0.7152, 0.0722));
    // regamma
    float gammaGray = sqrt(gray);
    fragColor = vec4(gammaGray,  gammaGray,  gammaGray, texture(iChannel0, fragCoord / iResolution.xy).a);
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}