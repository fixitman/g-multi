shader_type canvas_item;
uniform vec4 bg_color: source_color = vec4(.5,.5,.5,1);
uniform vec4 enemy_color: source_color = vec4(1,0,0,1);
uniform vec4 ship_color: source_color = vec4(0,0,1,1);
uniform sampler2D target_data;
uniform float range = 500;

void fragment() {
	vec2 center = vec2(.5,.5);
	float sizef = texelFetch(target_data,ivec2(0,0),0).r;

	COLOR = bg_color;
	if (distance(center,UV) < .015){
		COLOR = ship_color;
	}else{
		for(int i = 0;i<int(sizef);i++){
			vec4 point = texelFetch(target_data,ivec2(0,i+1),0);
			vec2 pt = vec2(point.r/(2.0*range),point.b/(2.0*range)); //scale it down
			pt += center ;  // move origin to center of screen
			pt = clamp(pt,vec2(0,0),vec2(1,1));
			if(distance(UV, pt) < .01){
				COLOR = enemy_color;
				float elevation_degrees = degrees(asin(normalize(point).g));
				elevation_degrees += 13.0; //compensate for camera rotation
				if(elevation_degrees > 35.0){
					COLOR = vec4(1,1,1,1);
				}
				if(elevation_degrees < -35.0){
					COLOR = vec4(0,0,0,1);
				}
				break;
			}
		}
	}
}
