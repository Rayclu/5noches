shader_type canvas_item;

uniform float blur_strength : hint_range(0.0, 10.0) = 2.0;
uniform int samples : hint_range(1, 15) = 6;

void fragment() {
    vec2 pixel = SCREEN_PIXEL_SIZE * blur_strength;
    vec4 col = vec4(0.0);
    float count = 0.0;

    for (int x = -samples; x <= samples; x++) {
        for (int y = -samples; y <= samples; y++) {
            vec2 offset = vec2(float(x), float(y)) * pixel;
            col += texture(TEXTURE, UV + offset);
            count += 1.0;
        }
    }
    COLOR = col / count;
}
