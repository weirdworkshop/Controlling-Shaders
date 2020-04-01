Shader "Unlit/Circle_2"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Colour("Colour", Color) = (0.0, 0.0, 0.0, 1.0)
		
		
		
	    
	}

	SubShader
	{
		Tags { "RenderType" = "Opaque"}
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag 
			// make fog work
			#pragma multi_compile_fog

			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float4 uv :		TEXCOORD0;

			};

			struct v2f {

				float2 uv :TEXCOORD0;
				UNITY_FOG_COORDS(1)
					float4 vertex :SV_POSITION;

			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			float4 _Colour;
			
			

			
			

			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o, o.vertex);
				return o;
			}



			fixed4 frag(v2f i) : SV_TARGET 
			{
				// Normalized pixel coordinates (from 0 to 1)
				float2 uv = i.uv;


				float4 col = _Colour;

				
				

				float2 centre = (0.5); 

				float dist = distance(i.uv, centre);

				if (dist > 0.25) {

					
					col = float4(0.0, 0.0, 0.2, 0.1);
				}


				// Output to screen
				return float4(col);
			}


		ENDCG
		}


	
	}
}