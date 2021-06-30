shader_type canvas_item;

uniform vec2 direction = vec2(0.0, 0.0);
uniform float speed = 0.8;

vec2 toIsoUV(vec2 uv)
{
    return vec2(uv.x + uv.y - 0.5, -uv.x + uv.y + 0.5);
}

vec2 fromIsoUV(vec2 uv)
{
    return vec2(0.5 * (uv.x - uv.y + 1.0), 0.5 * (uv.x + uv.y));
}

void fragment()
{
    vec2 uv = UV;
    uv -= direction * speed * TIME;
    uv = toIsoUV(uv);
    uv -= floor(uv); // make it into [0, 1) x [0, 1)
    uv = fromIsoUV(uv);
    COLOR = vec4(texture(TEXTURE, uv).rgb, texture(TEXTURE, UV).a);
}