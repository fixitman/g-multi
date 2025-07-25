shader_type canvas_item;
const int MAX_TARGETS = 20;
uniform vec4 bg_color: source_color = vec4(.5,.5,.5,1);
uniform vec4 enemy_color: source_color = vec4(1,0,0,1);
uniform vec3 point = vec3(-200,50,-20);
uniform vec4 ship_color: source_color = vec4(0,0,1,1);
uniform vec3[MAX_TARGETS] target_data;

uniform float range = 500; 

vec2 convert_point(vec3 p){
	vec2 p2 = vec2(p.x/(2.0*range)+.5,p.z/(2.0*range)+.5);
	return p2;
}

void fragment() {
	vec2[MAX_TARGETS] targets;
	vec2 center = vec2(.5,.5);
	vec2 pt = vec2(point.r/(2.0*range),point.b/(2.0*range));
	vec2 scaled_point = center + pt ;
	
	COLOR = bg_color;
	if (abs(distance(center,UV)) < .01){
		COLOR = ship_color;
	}else{
		for(int i=0;i<target_data.length() ;i++){
			if(distance(UV, convert_point(target_data[i])) < .01){
				COLOR = enemy_color;				
				break;				
			}
			
		}
			
	}	
}


