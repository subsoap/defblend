varying mediump vec2 var_texcoord0;

uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp vec4 blend;

void main()
{
	vec4 base = texture2D(DIFFUSE_TEXTURE, var_texcoord0.xy);
	vec4 blended = vec4(min(base.r, blend.r), min(base.g, blend.g), min(base.b, blend.b), blend.w);
	vec4 color = vec4(blended.rgb * blended.a +  base.rgb * (1.0 - blended.a), base.w);
	base.rgba = color * base.w;
	gl_FragColor = base;
}