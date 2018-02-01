varying mediump vec2 var_texcoord0;

uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp vec4 blend;

void main()
{
	vec4 base = texture2D(DIFFUSE_TEXTURE, var_texcoord0.xy);
	vec4 blended = vec4((blend.r==1.0)?blend.r:min(base.r/(1.0-blend.r),1.0), (blend.g==1.0)?blend.g:min(base.g/(1.0-blend.g),1.0), (blend.b==1.0)?blend.b:min(base.b/(1.0-blend.b),1.0), blend.w);
	vec4 color = vec4(blended.rgb * blended.a +  base.rgb * (1.0 - blended.a), base.w);
	base.rgba = color * base.w;
	gl_FragColor = base;
}

