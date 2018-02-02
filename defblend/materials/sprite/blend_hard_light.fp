varying mediump vec2 var_texcoord0;

uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp vec4 blend;

void main()
{
	vec4 base = texture2D(DIFFUSE_TEXTURE, var_texcoord0.xy);
	vec4 blended = vec4((base.r<0.5?(2.0*base.r*blend.r):(1.0-2.0*(1.0-base.r)*(1.0-blend.r))), (base.g<0.5?(2.0*base.g*blend.g):(1.0-2.0*(1.0-base.g)*(1.0-blend.g))), (base.b<0.5?(2.0*base.b*blend.b):(1.0-2.0*(1.0-base.b)*(1.0-blend.b))), blend.w);
	vec4 color = vec4(blended.rgb * blended.a +  base.rgb * (1.0 - blended.a), base.w);
	base.rgba = color * base.w;
	gl_FragColor = base;
}

