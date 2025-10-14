shader_type canvas_item;

// --- Uniforms --- //
uniform vec2 speed = vec2(5.0, 0.0);
uniform vec4 color = vec4(1.,1.,1.,1.);

// --- Functions --- //
void fragment() {
	COLOR = texture(TEXTURE, mod(UV + TIME * speed, 1.0))*color;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
