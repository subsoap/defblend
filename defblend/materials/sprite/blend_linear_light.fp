varying mediump vec2 var_texcoord0;

uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp vec4 blend;

float linear_burn(float base, float blend) {
	return max(base+blend-1.0,0.0);
}

float linear_dodge(float base, float blend) {
	return min(base+blend,1.0);
}

float linear_light(float base, float blend) {
	return blend<0.5?linear_burn(base,(2.0*blend)):linear_dodge(base,(2.0*(blend-0.5)));
}

void main()
{
	vec4 base = texture2D(DIFFUSE_TEXTURE, var_texcoord0.xy);
	vec4 blended = vec4(linear_light(base.r,blend.r), linear_light(base.g,blend.g), linear_light(base.b,blend.b), blend.w);
	vec4 color = vec4(blended.rgb * blended.a +  base.rgb * (1.0 - blended.a), base.w);
	base.rgba = color * base.w;
	gl_FragColor = base;
}
