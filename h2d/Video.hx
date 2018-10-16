package h2d;

#if hl
private abstract VideoImpl(hl.Abstract<"hl_video">) {

	@:hlNative("video","video_close") public function close() : Void {
	}

	@:hlNative("video","video_decode_frame") public function decodeFrame( out : hl.Bytes, time : hl.Ref<Float> ) : Bool {
		return false;
	}

	@:hlNative("video","video_get_size") public function getSize( width : hl.Ref<Int>, height : hl.Ref<Int> ) : Void {
	}

	@:hlNative("video","video_open") public static function open( file : hl.Bytes ) : VideoImpl {
		return null;
	}

	@:hlNative("video","video_init") public static function init() {
	}

}
#end

class Video extends Drawable {

	#if hl
	static var INIT_DONE = false;
	var v : VideoImpl;
	var pixels : hxd.Pixels;
	#elseif js
	var v : js.html.VideoElement;
	var videoPlaying : Bool;
	var videoTimeupdate : Bool;
	var onReady : Void->Void;
	#end
	var texture : h3d.mat.Texture;
	var tile : h2d.Tile;
	var playTime : Float;
	var videoTime : Float;
	var frameReady : Bool;

	public var videoWidth(default, null) : Int;
	public var videoHeight(default, null) : Int;
	public var playing(default, null) : Bool;
	public var time(get, null) : Float;

	public function new(?parent) {
		super(parent);
		blendMode = None;
		smooth = true;
	}

	public dynamic function onError( msg : String ) {
	}

	public dynamic function onEnd() {
	}

	public function get_time() {
		return playing ? haxe.Timer.stamp() - playTime : 0;
	}

	public function dispose() {
		#if hl
		if( v != null ) {
			v.close();
			v = null;
		};
		pixels = null;
		#elseif js
		if ( v != null ) {
			if (!v.paused) v.pause();
			v = null;
		}
		#end
		if( texture != null ) {
			texture.dispose();
			texture = null;
		}
		tile = null;
		videoWidth = 0;
		videoHeight = 0;
		time = 0;
		playing = false;
		frameReady = false;
	}

	public function load( path : String, ?onReady : Void -> Void ) {
		dispose();

		#if hl
		if( !INIT_DONE ) { INIT_DONE = true; VideoImpl.init(); }
		v = VideoImpl.open(@:privateAccess path.toUtf8());
		if( v == null ) {
			onError("Failed to init video " + path);
			return;
		}
		var w = 0, h = 0;
		v.getSize(w, h);
		videoWidth = w;
		videoHeight = h;
		playing = true;
		playTime = haxe.Timer.stamp();
		videoTime = 0.;
		if( onReady != null ) onReady();
		#elseif js
		v = js.Browser.document.createVideoElement();
		v.autoplay = true;
		v.muted = true;
		v.loop = true;
		
		videoPlaying = false;
		videoTimeupdate = false;
		this.onReady = onReady;
		
		v.addEventListener("playing", checkReady, true);
		v.addEventListener("timeupdate", checkReady, true);
		v.src = path;
		v.play();
		#else
		onError("Video not supported on this platform");
		#end
	}
	
	#if js
	function checkReady(e : js.html.Event) {
		if (e.type == "playing") {
			videoPlaying = true;
			v.removeEventListener("playing", checkReady, true);
		} else {
			videoTimeupdate = true;
			v.removeEventListener("timeupdate", checkReady, true);
		}
		
		if (videoPlaying && videoTimeupdate) {
			frameReady = true;
			videoWidth = v.videoWidth;
			videoHeight = v.videoHeight;
			playing = true;
			playTime = haxe.Timer.stamp();
			videoTime = 0.0;
			if ( onReady != null )
			{
				onReady();
				onReady = null;
			}
		}
	}
	#end

	override function draw(ctx:RenderContext) {
		if( tile != null )
			ctx.drawTile(this, tile);
	}

	#if js
	@:access(h3d.mat.Texture)
	#end
	override function sync(ctx:RenderContext) {
		if( !playing )
			return;
		if( texture == null ) {
			var w = videoWidth, h = videoHeight;
			texture = new h3d.mat.Texture(w, h);
			tile = h2d.Tile.fromTexture(texture);
			#if hl
			pixels = new hxd.Pixels(w, h, haxe.io.Bytes.alloc(w * h * 4), h3d.mat.Texture.nativeFormat);
			#end
		}
		if( frameReady ) {
			#if hl
			texture.uploadPixels(pixels);
			frameReady = false;
			#elseif js
			texture.alloc();
			texture.checkSize(videoWidth, videoHeight, 0);
			cast (@:privateAccess texture.mem.driver, h3d.impl.GlDriver).uploadTextureVideoElement(texture, v, 0, 0);
			texture.flags.set(WasCleared);
			texture.checkMipMapGen(0, 0);
			#end
		}
		#if hl
		if( time >= videoTime ) {
			var t = 0.;
			v.decodeFrame(pixels.bytes, t);
			videoTime = t;
			frameReady = true; // delay decode/upload for more reliable FPS
		}
		#end
	}

}