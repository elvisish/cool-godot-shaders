shader_type canvas_item;

uniform sampler2D gradient;
uniform float speed_scale = 0.1;
uniform float exposure = 1.2;

void fragment() {
    vec4 color = texture(TEXTURE, UV);
    float x = abs(mod(color.r - TIME * speed_scale, 1.0) - 0.5) * 2.0;
    COLOR = color;
    COLOR.rgb += textureLod(gradient, vec2(x, 0), 0.0).rgb * exposure * COLOR.r;
}