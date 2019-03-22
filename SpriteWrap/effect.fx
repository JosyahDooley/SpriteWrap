/////////////////////////////////////////////////////////
// SpriteWrap effect
varying mediump vec2 vTex;
uniform lowp sampler2D samplerFront;
uniform mediump vec2 srcOriginStart;
uniform mediump vec2 srcOriginEnd;

uniform lowp float offsetX;
uniform lowp float offsetY;

void main(void)
{
	lowp vec2 offset = vec2(vTex.x + offsetX, vTex.y + offsetY);
	
	//if(offset.x > 1.0) offset.x = offset.x - floor(vTex.x + offsetX);
	//if(offset.y > 1.0) offset.y = offset.y - floor(vTex.y + offsetY);
	

	if(offset.x > srcOriginEnd.x) offset.x = offset.x - floor(vTex.x + offsetX);
	if(offset.y > srcOriginEnd.y) offset.y = offset.y - floor(vTex.y + offsetY);

	lowp vec4 outColor = texture2D(samplerFront, offset);
	gl_FragColor = outColor;
}
