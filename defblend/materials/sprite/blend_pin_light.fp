varying mediump vec2 var_texcoord0;

uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp vec4 blend;

float darken(float base, float blend) {
	return min(blend,base);
}

float lighten(float base, float blend) {
	return max(blend,base);
}

float pin_light(float base, float blend) {
	return (blend<0.5)?darken(base,(2.0*blend)):lighten(base,(2.0*(blend-0.5)));
}

void main()
{
	vec4 base = texture2D(DIFFUSE_TEXTURE, var_texcoord0.xy);
	vec4 blended = vec4(pin_light(base.r,blend.r), pin_light(base.g,blend.g), pin_light(base.b,blend.b), blend.w);
	vec4 color = vec4(blended.rgb * blended.a +  base.rgb * (1.0 - blended.a), base.w);
	base.rgba = color * base.w;
	gl_FragColor = base;
}
