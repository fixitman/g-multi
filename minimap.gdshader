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
	if (abs(distance(center,UV)) < .01){
		COLOR = ship_color;
	}else{
		for(int i = 0;i<int(sizef);i++){
			vec4 point = texelFetch(target_data,ivec2(0,i+1),0);
			vec2 pt = vec2(point.r/(2.0*range),point.b/(2.0*range));
			vec2 scaled_point = center + pt ;
			if(distance(UV, scaled_point) < .01){
				COLOR = enemy_color;				
				break;	
			}
		}
	}
}
	
	
		