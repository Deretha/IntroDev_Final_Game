//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.rgb = v_vColour.rgb; //through rgb gets the color, and then sets the final color of spr to it
	//therefore doesn't use the color(s) of the spr itself but instead blends to get it to be red
}
