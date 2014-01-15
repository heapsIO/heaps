package h3d.shader;

class Base2d extends hxsl.Shader {

	static var SRC = {
		
		@input var input : {
			var position : Vec2;
			var uv : Vec2;
			var color : Vec4;
		};
		
		var output : {
			var position : Vec4;
			var color : Vec4;
		};

		@param var zValue : Float;
		@param var texture : Sampler2D;
		
		var spritePosition : Vec4;
		var absolutePosition : Vec4;
		var pixelColor : Vec4;
		@var var calculateUV : Vec2;
		
		@const var isRelative : Bool;
		@param var color : Vec4;
		@param var absoluteMatrixA : Vec3;
		@param var absoluteMatrixB : Vec3;

		function __init__() {
			spritePosition = vec4(input.position, zValue, 1);
			if( isRelative ) {
				absolutePosition.x = vec3(spritePosition.xy,1).dot(absoluteMatrixA);
				absolutePosition.y = vec3(spritePosition.xy,1).dot(absoluteMatrixB);
				absolutePosition.zw = spritePosition.zw;
			} else
				absolutePosition = spritePosition;
			calculateUV = input.uv;
			pixelColor = isRelative ? color : input.color;
			pixelColor *= texture.get(calculateUV);
		}
		
		function vertex() {
			output.position = absolutePosition;
		}
		
		function fragment() {
			output.color = pixelColor;
		}
		
	};

	
}