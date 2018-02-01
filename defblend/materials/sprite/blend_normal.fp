varying mediump vec2 var_texcoord0;

uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp vec4 blend;

void main()
{
	vec4 texColor = texture2D(DIFFUSE_TEXTURE, var_texcoord0.xy);
	vec4 color = vec4(blend.rgb * blend.a +  texColor.rgb * (1.0 - blend.a), texColor.w);
	texColor.rgba = color * texColor.w;
	gl_FragColor = texColor;
}