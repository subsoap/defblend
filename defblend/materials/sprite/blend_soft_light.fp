varying mediump vec2 var_texcoord0;

uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp vec4 blend;

void main()
{
	vec4 base = texture2D(DIFFUSE_TEXTURE, var_texcoord0.xy);
	vec4 blended = vec4(((blend.r<0.5)?(2.0*base.r*blend.r+base.r*base.r*(1.0-2.0*blend.r)):(sqrt(base.r)*(2.0*blend.r-1.0)+2.0*base.r*(1.0-blend.r))), ((blend.g<0.5)?(2.0*base.g*blend.g+base.g*base.g*(1.0-2.0*blend.g)):(sqrt(base.g)*(2.0*blend.g-1.0)+2.0*base.g*(1.0-blend.g))), ((blend.b<0.5)?(2.0*base.b*blend.b+base.b*base.b*(1.0-2.0*blend.b)):(sqrt(base.b)*(2.0*blend.b-1.0)+2.0*base.b*(1.0-blend.b))), blend.w);
	vec4 color = vec4(blended.rgb * blended.a +  base.rgb * (1.0 - blended.a), base.w);
	base.rgba = color * base.w;
	gl_FragColor = base;
}


