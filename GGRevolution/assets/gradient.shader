shader_type canvas_item;

void fragment () {
        vec2 resolution = vec2(1024, 600);
        vec2 texcoord = FRAGCOORD.xy / resolution;

        vec3 colours = vec3(0.2,0.9,0.1);
        float backgroundlight = 0.22;
        vec3 lightcolor = vec3(0.2,0.8,0);

        float brightness;
        float intensity = abs(cos(TIME*0.6));
        float size = 300.0;
        vec2 ligthpos = resolution / 2.0 + cos(TIME)/TIME ;
        float dist = distance(FRAGCOORD.xy, ligthpos);
        float distFromEdge = size - dist;

        brightness = 1.0 / (dist * ((.74 / intensity) / size));
        brightness -= brightness * (size / dist);

        if (distFromEdge <= 0.0) {
                brightness = 0.0;
        }

        lightcolor.xyz *= abs(brightness);
        colours.xyz *= abs(brightness) + backgroundlight;
        colours.xyz += lightcolor.xyz;

        COLOR = vec4(colours.xyz, 0.50);
}