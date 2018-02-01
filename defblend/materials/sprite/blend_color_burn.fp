varying mediump vec2 var_texcoord0;

uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp vec4 blend;

void main()
{
	vec4 base = texture2D(DIFFUSE_TEXTURE, var_texcoord0.xy);
	vec4 blended = vec4((blend.r==0.0)?blend.r:max((1.0-((1.0-base.r)/blend.r)),0.0), (blend.g==0.0)?blend.g:max((1.0-((1.0-base.g)/blend.g)),0.0), (blend.b==0.0)?blend.b:max((1.0-((1.0-base.b)/blend.b)),0.0), blend.w);
	vec4 color = vec4(blended.rgb * blended.a +  base.rgb * (1.0 - blended.a), base.w);
	base.rgba = color * base.w;
	gl_FragColor = base;
}
