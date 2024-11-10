#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
#define texture flixel_texture2D

// third argument fix
vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}

// variables which is empty, they need just to avoid crashing shader
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

    float onOff(float a, float b, float c)
    {
        return step(c, sin(iTime + a*cos(iTime*b)));
    }

    float ramp(float y, float start, float end)
    {
        float inside = step(start,y) - step(end,y);
        float fact = (y-start)/(end-start)*inside;
        return (1.-fact) * inside;

    }

    vec4 getVideo(vec2 uv)
      {
        vec2 look = uv;
            float window = 1./(1.+20.*(look.y-mod(iTime/4.,1.))*(look.y-mod(iTime/4.,1.)));
            look.x = look.x + (sin(look.y*10. + iTime)/50.*onOff(4.,4.,.3)*(1.+cos(iTime*80.))*window)*(0.1*2.);
            float vShift = 0.4*onOff(2.,3.,.9)*(sin(iTime)*sin(iTime*20.) +
                                                 (0.5 + 0.1*sin(iTime*200.)*cos(iTime)));
            look.y = mod(look.y + vShift*0.1, 1.);
        
        vec4 video = texture(iChannel0,look);

        return video;
      }

    vec2 screenDistort(vec2 uv)
    {
        uv = (uv - 0.5) * 2.0;
        uv *= 1.1;
        uv.x *= 1.0 + pow((abs(uv.y) / 5.0), 2.0);
        uv.y *= 1.0 + pow((abs(uv.x) / 4.0), 2.0);
        uv  = (uv / 2.0) + 0.5;
        uv =  uv *0.92 + 0.04;
        return uv;
      
        return uv;
    }
    float random(vec2 uv)
    {
        return fract(sin(dot(uv, vec2(15.5151, 42.2561))) * 12341.14122 * sin(iTime * 0.03));
    }
    float noise(vec2 uv)
    {
        vec2 i = floor(uv);
        vec2 f = fract(uv);

        float a = random(i);
        float b = random(i + vec2(1.,0.));
        float c = random(i + vec2(0., 1.));
        float d = random(i + vec2(1.));

        vec2 u = smoothstep(0., 1., f);

        return mix(a,b, u.x) + (c - a) * u.y * (1. - u.x) + (d - b) * u.x * u.y;

    }


    vec2 scandistort(vec2 uv) {
        float scan1 = clamp(cos(uv.y * 2.0 + iTime), 0.0, 1.0);
        float scan2 = clamp(cos(uv.y * 2.0 + iTime + 4.0) * 10.0, 0.0, 1.0) ;
        float amount = scan1 * scan2 * uv.x;

        //uv.x -= 0.05 * mix(texture2D(noiseTex, vec2(uv.x, amount)).r * amount, amount, 0.9);

        return uv;

    }
    void mainImage( out vec4 fragColor, in vec2 fragCoord )
    {
        vec2 uv = fragCoord/iResolution.xy;
      vec2 curUV = screenDistort(uv);
        uv = scandistort(curUV);
        vec4 video = getVideo(uv);
      float vigAmt = 1.0;
      float x =  0.;


      video.r = getVideo(vec2(x+uv.x+0.001,uv.y+0.001)).x+0.05;
      video.g = getVideo(vec2(x+uv.x+0.000,uv.y-0.002)).y+0.05;
      video.b = getVideo(vec2(x+uv.x-0.002,uv.y+0.000)).z+0.05;
      video.r += 0.08*getVideo(0.75*vec2(x+0.025, -0.027)+vec2(uv.x+0.001,uv.y+0.001)).x;
      video.g += 0.05*getVideo(0.75*vec2(x+-0.022, -0.02)+vec2(uv.x+0.000,uv.y-0.002)).y;
      video.b += 0.08*getVideo(0.75*vec2(x+-0.02, -0.018)+vec2(uv.x-0.002,uv.y+0.000)).z;

      video = clamp(video*0.6+0.4*video*video*1.0,0.0,1.0);
          vigAmt = 3.+.3*sin(iTime + 5.*cos(iTime*5.));

        float vignette = (1.-vigAmt*(uv.y-.5)*(uv.y-.5))*(1.-vigAmt*(uv.x-.5)*(uv.x-.5));

         video *= vignette;


      fragColor = mix(video,vec4(noise(uv * 75.)),.05);

      if(curUV.x<0. || curUV.x>1. || curUV.y<0. || curUV.y>1.){
        fragColor = vec4(0.,0.,0.,texture(iChannel0, uv).a);
      }

    }

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}