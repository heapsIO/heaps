package hxd.fs;

using haxe.io.Path;

/**
	A Bytes-based file entry.

	Not intended to be used directly, see notes on `hxd.fs.BytesFileSystem`.

	Can be used to create resources from outside of the Resource system via `hxd.res.Any.fromBytes`.
	For example, assets downloaded over the network or generated at runtime.
**/
class BytesFileEntry extends FileEntry {

	var fullPath : String;
	var bytes : haxe.io.Bytes;
	var pos : Int;

	/**
		Create a new BytesFileEntry instance.

		@param path The path of the file.
		@param bytes The contents of the file.
	**/
	public function new(path, bytes) {
		this.fullPath = path;
		this.name = path.split("/").pop();
		this.bytes = bytes;
	}

	override function get_path() {
		return fullPath;
	}

	override function getSign() : Int {
		return bytes.get(0) | (bytes.get(1) << 8) | (bytes.get(2) << 16) | (bytes.get(3) << 24);
	}

	override function getBytes() : haxe.io.Bytes {
		return bytes;
	}

	override function open() {
		pos = 0;
	}

	override function skip( nbytes : Int ) {
		pos += nbytes;
	}
	override function readByte() : Int {
		return bytes.get(pos++);
	}

	override function read( out : haxe.io.Bytes, pos : Int, size : Int ) {
		out.blit(pos, bytes, this.pos, size);
		this.pos += size;
	}

	override function close() {
	}

	override function load( ?onReady : Void -> Void ) : Void {
		haxe.Timer.delay(onReady, 1);
	}

	@:dox(show)
	override function loadBitmap( onLoaded : LoadedBitmap -> Void ) : Void {
		#if flash
		var loader = new flash.display.Loader();
		loader.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, function(e:flash.events.IOErrorEvent) {
			throw Std.string(e) + " while loading " + fullPath;
		});
		loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, function(_) {
			var content : flash.display.Bitmap = cast loader.content;
			onLoaded(new hxd.fs.LoadedBitmap(content.bitmapData));
			loader.unload();
		});
		loader.loadBytes(bytes.getData());
		#elseif js
		var mime = switch fullPath.extension().toLowerCase() {
			case 'jpg' | 'jpeg': 'image/jpeg';
			case 'png': 'image/png';
			case 'gif': 'image/gif';
			case _: throw 'Cannot determine image encoding, try adding an extension to the resource path';
		}
		var img = new js.html.Image();
		img.onload = function() onLoaded(new hxd.fs.LoadedBitmap(img));
		img.src = 'data:$mime;base64,' + haxe.crypto.Base64.encode(bytes);
		#else
		throw "Not implemented";
		#end
	}

	override function exists( name : String ) : Bool return false;
	override function get( name : String ) : FileEntry return null;

	override function iterator() : hxd.impl.ArrayIterator<FileEntry> return new hxd.impl.ArrayIterator(new Array<FileEntry>());

	override function get_size() return bytes.length;

}

/**
	A dummy FileSystem for `hxd.res.Any.fromBytes`.

	While not being designed to be used directly, it is suitable as a base class for simplified `FileSystem` implementation.
	However it is still recommended to implement FileSystem directly.

	As bare minimum, inheriting classes should override the `getBytes`, and ideally `getRoot` and `dir` methods.
**/
class BytesFileSystem implements FileSystem {

	function new() {
	}

	/**
		Should be overridden by inheriting class, otherwise throws an exception.
	**/
	public function getRoot() {
		throw "Not implemented";
		return null;
	}

	/**
		Returns the Bytes instance of the file under given `path`.
		Should be overridden by inheriting class, otherwise throws an exception.
	**/
	@:dox(show)
	function getBytes( path : String ) : haxe.io.Bytes {
		throw "Not implemented";
		return null;
	}

	/**
		Returns whether file under given `path` exists.

		Initially calls `getBytes()` and ideally should be overridden for optimization purposes.
	**/
	public function exists( path : String ) {
		return getBytes(path) != null;
	}

	/**
		Returns the BytesFileEntry instance for the file under given `path`.

		Does not cache the file entries (causing a new entry instance returned on same path every time)
		and ideally should be overridden for optimization purposes.

		@throws `NotFound` if the file under given path does not exist.
	**/
	public function get( path : String ) {
		var bytes = getBytes(path);
		if( bytes == null ) throw "Resource not found '" + path + "'";
		return new BytesFileEntry(path,bytes);
	}

	/**
		Disposes of the BytesFileSystem.

		Does nothing initially.
	**/
	public function dispose() {
	}

	/**
		Should be overridden by inheriting class, otherwise throws an exception.
	**/
	public function dir( path : String ) : Array<FileEntry> {
		throw "Not implemented";
		return null;
	}

}