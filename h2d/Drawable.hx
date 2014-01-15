package h2d;

class Drawable extends Sprite {
	
	public var color : h3d.Vector;
	public var alpha(get, set) : Float;
	public var blendMode : BlendMode;
	var shaders : Array<hxsl.Shader>;
	
	function new(parent) {
		super(parent);
		blendMode = Normal;
		color = new h3d.Vector(1, 1, 1, 1);
		shaders = [];
	}
	
	inline function get_alpha() {
		return color.a;
	}

	inline function set_alpha(v) {
		return color.a = v;
	}
	
	public function getDebugShaderCode( toHxsl = true ) {
		var shader = @:privateAccess {
			var ctx = getScene().ctx;
			var shaders : Array<hxsl.Shader> = [ctx.baseShader];
			shaders = shaders.concat(this.shaders);
			ctx.manager.compileShaders(shaders);
		}
		var toString = toHxsl ? function(d) return hxsl.Printer.shaderToString(d,true) : hxsl.GlslOut.toGlsl;
		return "VERTEX=\n" + toString(shader.vertex.data) + "\n\nFRAGMENT=\n" + toString(shader.fragment.data);
	}
	
	public inline function getShaders() {
		return new hxd.impl.ArrayIterator<hxsl.Shader>(shaders);
	}
	
	public function addShader<T:hxsl.Shader>( s : T ) : T {
		this.shaders.push(s);
		return s;
	}
	
	public function removeShader( s : hxsl.Shader ) {
		return this.shaders.remove(s);
	}
	
	function emitTile( ctx : RenderContext, tile : Tile ) {
		if( tile == null )
			tile = new Tile(null, 0, 0, 5, 5);
		ctx.beginDrawBatch(tile.getTexture(), 8, blendMode, shaders);

		var ax = absX + tile.dx * matA + tile.dy * matC;
		var ay = absY + tile.dx * matB + tile.dy * matD;
		var buf = ctx.buffer;
		var pos = ctx.bufPos;
		buf.grow(pos + 4 * 8);
		
		inline function emit(v:Float) buf[pos++] = v;
		
		emit(ax);
		emit(ay);
		emit(tile.u);
		emit(tile.v);
		emit(color.r);
		emit(color.g);
		emit(color.b);
		emit(color.a);
		
		
		var tw = tile.width;
		var th = tile.height;
		var dx1 = tw * matA;
		var dy1 = tw * matB;
		var dx2 = th * matC;
		var dy2 = th * matD;
		
		emit(ax + dx1);
		emit(ay + dy1);
		emit(tile.u2);
		emit(tile.v);
		emit(color.r);
		emit(color.g);
		emit(color.b);
		emit(color.a);
		
		emit(ax + dx2);
		emit(ay + dy2);
		emit(tile.u);
		emit(tile.v2);
		emit(color.r);
		emit(color.g);
		emit(color.b);
		emit(color.a);

		emit(ax + dx1 + dx2);
		emit(ay + dy1 + dy2);
		emit(tile.u2);
		emit(tile.v2);
		emit(color.r);
		emit(color.g);
		emit(color.b);
		emit(color.a);

		ctx.bufPos = pos;
	}
	
}
