package hxd;

typedef BitmapInnerData =
#if (flash || openfl || nme)
	flash.display.BitmapData;
#elseif js
	js.html.CanvasRenderingContext2D;
#elseif lime
	lime.graphics.Image;
#else
	BitmapInnerDataImpl;

class BitmapInnerDataImpl {
	#if hl
	public var pixels : hl.BytesAccess<Int>;
	#else
	public var pixels : haxe.ds.Vector<Int>;
	#end
	public var width : Int;
	public var height : Int;
	public function new() {
	}
}
#end

class BitmapData {

	#if (flash || nme || openfl)
	static var tmpRect = new flash.geom.Rectangle();
	static var tmpPoint = new flash.geom.Point();
	static var tmpMatrix = new flash.geom.Matrix();
	#end

#if (flash||openfl||nme)
	var bmp : flash.display.BitmapData;
#elseif js
	var ctx : js.html.CanvasRenderingContext2D;
	var lockImage : js.html.ImageData;
	var pixel : js.html.ImageData;
#else
	var data : BitmapInnerData;
#end

	public var width(get, never) : Int;
	public var height(get, never) : Int;

	public function new(width:Int, height:Int) {
		if( width == -101 && height == -102 ) {
			// no alloc
		} else {
			#if (flash||openfl||nme)
			bmp = new flash.display.BitmapData(width, height, true, 0);
			#elseif js
			var canvas = js.Browser.document.createCanvasElement();
			canvas.width = width;
			canvas.height = height;
			ctx = canvas.getContext2d();
			#elseif lime
			data = new lime.graphics.Image( null, 0, 0, width, height );
			#else
			data = new BitmapInnerData();
			#if hl
			data.pixels = new hl.Bytes(width * height * 4);
			(data.pixels:hl.Bytes).fill(0, width * height * 4, 0);
			#else
			data.pixels = new haxe.ds.Vector(width * height);
			#end
			data.width = width;
			data.height = height;
			#end
		}
	}

	public function clear( color : Int ) {
		#if (flash||openfl||nme)
		bmp.fillRect(bmp.rect, color);
		#else
		fill(0, 0, width, height, color);
		#end
	}

	static inline function notImplemented() {
		throw "Not implemented";
	}

	public function fill( x : Int, y : Int, width : Int, height : Int, color : Int ) {
		#if (flash || openfl || nme)
		var r = tmpRect;
		r.x = x;
		r.y = y;
		r.width = width;
		r.height = height;
		bmp.fillRect(r, color);
		#elseif js
		ctx.fillStyle = 'rgba(${(color>>16)&0xFF}, ${(color>>8)&0xFF}, ${color&0xFF}, ${(color>>>24)/255})';
		ctx.fillRect(x, y, width, height);
		#else
		if( x < 0 ) {
			width += x;
			x = 0;
		}
		if( y < 0 ) {
			height += y;
			y = 0;
		}
		if( x + width > data.width )
			width = data.width - x;
		if( y + height > data.height )
			height = data.height - y;
		for( dy in 0...height ) {
			var p = x + (y + dy) * data.width;
			for( dx in 0...width )
				#if lime
				data.buffer.data[p++] = color;
				#else
				data.pixels[p++] = color;
				#end
		}
		#end
	}

	public function draw( x : Int, y : Int, src : BitmapData, srcX : Int, srcY : Int, width : Int, height : Int, ?blendMode : h2d.BlendMode ) {
		#if (flash || openfl || nme)
		if( blendMode == null ) blendMode = Alpha;
		var r = tmpRect;
		r.x = srcX;
		r.y = srcY;
		r.width = width;
		r.height = height;
		switch( blendMode ) {
		case None:
			var p = tmpPoint;
			p.x = x;
			p.y = y;
			bmp.copyPixels(src.bmp, r, p);
		case Alpha:
			var p = tmpPoint;
			p.x = x;
			p.y = y;
			bmp.copyPixels(src.bmp, r, p, src.bmp, null, true);
		case Add:
			var m = tmpMatrix;
			m.tx = x - srcX;
			m.ty = y - srcY;
			r.x = x;
			r.y = y;
			bmp.draw(src.bmp, m, null, flash.display.BlendMode.ADD, r, false);
		case Erase:
			var m = tmpMatrix;
			m.tx = x - srcX;
			m.ty = y - srcY;
			r.x = x;
			r.y = y;
			bmp.draw(src.bmp, m, null, flash.display.BlendMode.ERASE, r, false);
		case Multiply:
			var m = tmpMatrix;
			m.tx = x - srcX;
			m.ty = y - srcY;
			r.x = x;
			r.y = y;
			bmp.draw(src.bmp, m, null, flash.display.BlendMode.MULTIPLY, r, false);
		case Screen:
			var m = tmpMatrix;
			m.tx = x - srcX;
			m.ty = y - srcY;
			r.x = x;
			r.y = y;
			bmp.draw(src.bmp, m, null, flash.display.BlendMode.SCREEN, r, false);
		case SoftAdd:
			throw "BlendMode not supported";
		}
		#else
		notImplemented();
		#end
	}

	public function drawScaled( x : Int, y : Int, width : Int, height : Int, src : BitmapData, srcX : Int, srcY : Int, srcWidth : Int, srcHeight : Int, ?blendMode : h2d.BlendMode, smooth = true ) {
		if( blendMode == null ) blendMode = Alpha;
		#if (flash || openfl || nme)

		var b = switch( blendMode ) {
		case None:
			// todo : clear before ?
			flash.display.BlendMode.NORMAL;
		case Alpha:
			flash.display.BlendMode.NORMAL;
		case Add:
			flash.display.BlendMode.ADD;
		case Erase:
			flash.display.BlendMode.ERASE;
		case Multiply:
			flash.display.BlendMode.MULTIPLY;
		case Screen:
			flash.display.BlendMode.SCREEN;
		case SoftAdd:
			throw "BlendMode not supported";
		}

		var m = tmpMatrix;
		m.a = width / srcWidth;
		m.d = height / srcHeight;
		m.tx = x - srcX * m.a;
		m.ty = y - srcY * m.d;

		var r = tmpRect;
		r.x = x;
		r.y = y;
		r.width = width;
		r.height = height;

		bmp.draw(src.bmp, m, null, b, r, smooth);
		m.a = 1;
		m.d = 1;

		#elseif hl

		if( blendMode != None ) throw "BitmapData.drawScaled blendMode no supported : " + blendMode;
		if( x < 0 || y < 0 || width < 0 || height < 0 || srcX < 0 || srcY < 0 || srcWidth < 0 || srcHeight < 0 ||
			x + width > this.width || y + height > this.height || srcX + srcWidth > src.width || srcY + srcHeight > src.height )
			throw "Outside bounds";
		hl.Format.scaleImage(
			data.pixels, (x + y * this.width) << 2, this.width<<2, width, height,
			src.data.pixels, (srcX + srcY * src.width)<<2, src.width<<2, srcWidth, srcHeight,
			smooth?1:0
		);

		#else
		notImplemented();
		#end
	}

	public function line( x0 : Int, y0 : Int, x1 : Int, y1 : Int, color : Int ) {
		var dx = x1 - x0;
		var dy = y1 - y0;
		if( dx == 0 ) {
			if( y1 < y0 ) {
				var tmp = y0;
				y0 = y1;
				y1 = tmp;
			}
			for( y in y0...y1 + 1 )
				setPixel(x0, y, color);
		} else if( dy == 0 ) {
			if( x1 < x0 ) {
				var tmp = x0;
				x0 = x1;
				x1 = tmp;
			}
			for( x in x0...x1 + 1 )
				setPixel(x, y0, color);
		} else {
			/************************************************************************************************
			if ( (x0<0 && x1<0) || (y0<0 && y1<0) || (x0>=width && x1>=width) || (y0>=height && y1>=width) )
				return;

			var yc = 1;
			var xc = 1;

			var start_out = (x0<0 || x0>=width || y0<0 || y0>=height);
			var end_out   = (x1<0 || x1>=width || y1<0 || y1>=height);
			// var in_view = !start_out;

			if ( dx<0 ) {
				xc = -1;
				dx = -dx;
			}

			if ( dy<0) {
				yc = -1;
				dy = -dy;
			}

			var d2x = 2*dx;
			var d2y = 2*dy;

			var x = x0;
			var y = y0;

			if ( dx < dy ) {
				var delta = d2x - dy;
				var i = 0;

				while( i <= dy ) {
					setPixel(x, y, color);

					if ( delta > 0) {
						x += xc;
						delta -= d2y;
					}
					y += yc;	
					delta += d2x;
					++i;
				}
			} else {
				var delta = d2y - dx;

				var i = 0;

				if (start_out) {
					if (x<0) { 	// try to go to (0;???)
						var nx = 0;
						var ni = nx-x0;

						// @to fix : if i and d2y are too big this may overflow
						var j = Math.floor( (delta + i * d2y + d2x)/d2x );
						var ny = y0 + j*yc;

						if (ny>=0 && ny<height) {
							x=nx;
							y=ny;
							i=ni;
							delta += i*d2y - j*d2x;
							trace(x,y);
						} else {
							trace("Rejecting", nx,ny);
						}
					}
					if(y<0) {	// try to go to (???;0)
						if (yc<0) return; 		// This is impossible to draw
						var ny = 0;
						var j = (ny-y0);

						// @to fix : if j and d2x are too big this may overflow
						var ni = Math.floor( (j*d2x - delta + d2y) / d2y );
						var nx = x0 + ni*xc;

						if (nx>=0 && nx<height) {
							x=nx;
							y=ny;
							i=ni;
							delta += i*d2y - j*d2x;
							trace(x,y);
						} else {
							trace("Rejecting", nx,ny);
						}
					}
					if (x>=width) {   // try to go to (width-1;???)
						if (xc>0) return; 		// This is impossible to draw
						var nx = width-1;
						var ni = x0-nx;

						// @to fix : if i and d2y are too big this may overflow
						var j = Math.floor( (delta + i * d2y + d2x)/d2x );
						var ny = y0 + j*yc;
						if (ny>=0 && ny<height) {
							x=nx;
							y=ny;
							i=ni;
							delta += i*d2y - j*d2x;
							trace(x,y);
						} else {
							trace("Rejecting", nx,ny);
						}
					}
					if(y>=height) {	// try to go to (???;height-1)
						if (yc>0) return; 		// This is impossible to draw
						var ny = height-1;
						var j = (y0-ny);

						// @to fix : if j and d2x are too big this may overflow
						var ni = Math.floor( (j*d2x - delta + d2y) / d2y );
						var nx = x0 + ni*xc;
						if (nx>=0 && nx<height) {
							x=nx;
							y=ny;
							i=ni;
							delta += i*d2y - j*d2x;
							trace(x,y);
						} else {
							trace("Rejecting", nx,ny);
							return; 			// We should'n reject at this point!
						}
					}
				}
				
				while( i <= dx ) {
					//if (in_view)
					setPixel(x, y, color);
					if ( delta > 0) {
						y += yc;
						delta -= d2x;
					}
					x += xc;	
					delta += d2y;

					if(end_out) {
						if (x<0 || x>=width || y<0 || y>=height)
							return;
						// if (in_view)
						// 	start_out = false;
						// if (!in_view && !start_out && end_out)
						// 	return;
					}

					++i;
				}
			}
			***********************************************************/
		
			// Step 1... = checks for clipping
			var sx : Int;
			var sy : Int;
			var clip_x0 : Int;
			var clip_y0 : Int;
			var clip_x1 : Int;
			var clip_y1 : Int;

			if ( x0<x1 ) {
				if ( x0>=width || x1 <0 )	return;
				sx = 1;				
				clip_x0 = 0;
				clip_x1 = width-1;
			} else {
				if ( x1>=width || x0<0 )	return;
				sx = -1;
				x1 = -x1;
				x0 = -x0;
				clip_x0 = 1-width;
				clip_x1 = 0;
			}

			if ( y0<y1 ) {
				if ( y0>=height || y1 <0 )	return;
				sy = 1;
				clip_y0 = 0;
				clip_y1 = height-1;
			} else {
				if ( y1>=width || y0<0 )	return;
				sy = -1;
				y1 = -y1;
				y0 = -y0;
				clip_y0 = 1-height;
				clip_y1 = 0;
			}

			dx = x1-x0;				// Those are always > 0 because of swappings
			dy = y1-y0;

			var d2x = dx << 1;		// double steps for bresenham
			var d2y = dy << 1;

			var x = x0;
			var y = y0;

			if ( dx >= dy ) { 		// slope in ]0;1]
				var delta = d2y - dx;
				var tracing_can_start = false;

				// Clipping on (x0;y0) side
				if ( y0 < clip_y0 ) {
					var temp : haxe.Int64 = d2x*(clip_y0-y0) - dx;			// Compute intersection (???;clip_y0)
					var xinc : haxe.Int64 = (temp / d2y);
					
					if( xinc.high != 0 )
						throw "This should not happen...";
					trace("Case 1", x,y,xinc.low, x+xinc.low);
					x += xinc.low;

					if ( x > clip_x1 )	return;

					if ( x >= clip_x0 ) {
						temp -= xinc * d2y;
						if( temp.high != 0 )
							throw "This should not happen...";
						delta -= temp.low + dx;
						y = clip_y0;

						if (temp>0) {
							x += 1;
							delta += d2y;
						}
						tracing_can_start = true;
					}
				}

				if( !tracing_can_start && x0 < clip_x0 ) {
					var temp : haxe.Int64 = d2y*(clip_x0 - x0);				// Compute intersection (clip_x0;???)
					var yinc : haxe.Int64 = (temp / d2x);

					if( yinc.high != 0 )
						throw "This should not happen...";

					trace("Case 2", x,y,yinc.low, y+yinc.low);
					y += yinc.low;
					temp %= d2x;

					if( temp.high != 0 )
						throw "This should not happen...";

					if ( y > clip_y1 || ( y == clip_y1 && temp > dx ) )	return;

					x = clip_x0;
					delta += temp.low;

					if ( temp >= dx ) {
						++y;
						delta -= d2x;
					}
					//trace("Found", x, y);
				}

				// If we arrive here, (x;y) is the first point in view and delta was adjusted

				// clipping on (x1;y1) side
				var xend = x1;
				if ( y1 > clip_y1 ) {
					var temp = d2x*(clip_y1-y1) + dx;			// Compute intersection (???;clip_y1)
					var xinc = Math.floor(temp / d2y);
					xend += xinc;

					if ( temp - xinc*d2y == 0 )
                		--xend;
				}
				xend = ( xend > clip_x1 ) ? clip_x1 + 1 : xend + 1;

				// Clipping is done
				if ( sx == -1 ) {
					x = -x;
					xend = -xend;
				}
				if ( sy == -1 ) {
					y = -y;
				}

				//trace("Drawing : ", x,y, xend);

				d2x -= d2y;	// Changing d2x : delta is adjusted only once every loop 

				// Drawing
				while ( x != xend ) {
					setPixel(x, y, color);

					if ( delta >= 0 ) {
                		y += sy;
                		delta -= d2x;
           			} else {
                		delta += d2y;
            		}
					x += sx;
				}
			} else {				// slope in ]1;+oo[
				trace("Not implemented");
			}
		}
	}

	public inline function dispose() {
		#if (flash||openfl||nme)
		bmp.dispose();
		#elseif js
		ctx = null;
		pixel = null;
		#else
		data = null;
		#end
	}

	public function clone() {
		return sub(0,0,width,height);
	}

	public function sub( x, y, w, h ) : BitmapData {
		#if (flash || openfl || nme)
		var b = new flash.display.BitmapData(w, h);
		b.copyPixels(bmp, new flash.geom.Rectangle(x, y, w, h), new flash.geom.Point(0, 0));
		return fromNative(b);
		#elseif js
		var canvas = js.Browser.document.createCanvasElement();
		canvas.width = w;
		canvas.height = h;
		var ctx = canvas.getContext2d();
		ctx.drawImage(this.ctx.canvas, x, y);
		return fromNative(ctx);
		#elseif lime
		notImplemented();
		return null;
		#else
		if( x < 0 || y < 0 || w < 0 || h < 0 || x + w > width || y + h > height ) throw "Outside bounds";
		var b = new BitmapInnerData();
		b.width = w;
		b.height = h;
		#if hl
		b.pixels = new hl.Bytes(w * h * 4);
		for( dy in 0...h )
			b.pixels.blit(dy * w, data.pixels, x + (y + dy) * width, w);
		#else
		b.pixels = new haxe.ds.Vector(w * h);
		for( dy in 0...h )
			haxe.ds.Vector.blit(data.pixels, x + (y + dy) * width, b.pixels, dy * w, w);
		#end
		return fromNative(b);
		#end
	}

	/**
		Inform that we will perform several pixel operations on the BitmapData.
	**/
	public function lock() {
		#if flash
		bmp.lock();
		#elseif js
		if( lockImage == null )
			lockImage = ctx.getImageData(0, 0, width, height);
		#end
	}

	/**
		Inform that we have finished performing pixel operations on the BitmapData.
	**/
	public function unlock() {
		#if flash
		bmp.unlock();
		#elseif js
		if( lockImage != null ) {
			ctx.putImageData(lockImage, 0, 0);
			lockImage = null;
		}
		#end
	}

	/**
		Access the pixel color value at the given position. Note : this function can be very slow if done many times and the BitmapData has not been locked.
	**/
	public #if (flash || openfl || nme) inline #end function getPixel( x : Int, y : Int ) : Int {
		#if ( flash || openfl || nme )
		return bmp.getPixel32(x, y);
		#elseif js
		var i = lockImage;
		var a;
		if( i != null )
			a = (x + y * i.width) << 2;
		else {
			a = 0;
			i = ctx.getImageData(x, y, 1, 1);
		}
		return (i.data[a] << 16) | (i.data[a|1] << 8) | i.data[a|2] | (i.data[a|3] << 24);
		#elseif lime
		return if( x >= 0 && y >= 0 && x < data.width && y < data.height ) data.buffer.data[x + y * data.width] else 0;
		#else
		return if( x >= 0 && y >= 0 && x < data.width && y < data.height ) data.pixels[x + y * data.width] else 0;
		#end
	}

	/**
		Modify the pixel color value at the given position. Note : this function can be very slow if done many times and the BitmapData has not been locked.
	**/
	public #if (flash || openfl || nme) inline #end function setPixel( x : Int, y : Int, c : Int ) {
		#if ( flash || openfl || nme)
		bmp.setPixel32(x, y, c);
		#elseif js
		var i : js.html.ImageData = lockImage;
		if( i != null ) {
			var a = (x + y * i.width) << 2;
			i.data[a] = (c >> 16) & 0xFF;
			i.data[a|1] = (c >> 8) & 0xFF;
			i.data[a|2] = c & 0xFF;
			i.data[a|3] = (c >>> 24) & 0xFF;
			return;
		}
		var i = pixel;
		if( i == null ) {
			i = ctx.createImageData(1, 1);
			pixel = i;
		}
		i.data[0] = (c >> 16) & 0xFF;
		i.data[1] = (c >> 8) & 0xFF;
		i.data[2] = c & 0xFF;
		i.data[3] = (c >>> 24) & 0xFF;
		ctx.putImageData(i, x, y);
		#elseif lime
		if( x >= 0 && y >= 0 && x < data.width && y < data.height ) data.buffer.data[x + y * data.width] = c;
		#else
		if( x >= 0 && y >= 0 && x < data.width && y < data.height ) data.pixels[x + y * data.width] = c;
		#end
	}

	inline function get_width() : Int {
		#if (flash || nme || openfl)
		return bmp.width;
		#elseif js
		return ctx.canvas.width;
		#else
		return data.width;
		#end
	}

	inline function get_height() {
		#if (flash || nme || openfl)
		return bmp.height;
		#elseif js
		return ctx.canvas.height;
		#else
		return data.height;
		#end
	}

	public function getPixels() : Pixels {
		#if (flash || nme || openfl)
		var p = new Pixels(width, height, haxe.io.Bytes.ofData(bmp.getPixels(bmp.rect)), ARGB);
		p.flags.set(AlphaPremultiplied);
		return p;
		#elseif js
		var w = width;
		var h = height;
		var data = ctx.getImageData(0, 0, w, h).data;
		var pixels = data.buffer;
		return new Pixels(w, h, haxe.io.Bytes.ofData(pixels), RGBA);
		#elseif lime
		var p = new Pixels(width, height, this.data.data.buffer, RGBA);
		return p;
		#else
		var out = hxd.impl.Tmp.getBytes(data.width * data.height * 4);
		for( i in 0...data.width*data.height )
			out.setInt32(i << 2, data.pixels[i]);
		return new Pixels(data.width, data.height, out, BGRA);
		#end
	}

	public function setPixels( pixels : Pixels ) {
		if( pixels.width != width || pixels.height != height )
			throw "Invalid pixels size";
		pixels.setFlip(false);
		#if flash
		var bytes = pixels.bytes.getData();
		bytes.position = 0;
		switch( pixels.format ) {
		case BGRA:
			bytes.endian = flash.utils.Endian.LITTLE_ENDIAN;
		case ARGB:
			bytes.endian = flash.utils.Endian.BIG_ENDIAN;
		default:
			pixels.convert(BGRA);
			bytes.endian = flash.utils.Endian.LITTLE_ENDIAN;
		}
		bmp.setPixels(bmp.rect, bytes);
		#elseif js
		var img = ctx.createImageData(pixels.width, pixels.height);
		pixels.convert(RGBA);
		for( i in 0...pixels.width*pixels.height*4 ) img.data[i] = pixels.bytes.get(i);
		ctx.putImageData(img, 0, 0);
		#elseif (nme || openfl)
		pixels.convert(BGRA);
		bmp.setPixels(bmp.rect, flash.utils.ByteArray.fromBytes(pixels.bytes));
		#elseif lime
		// TODO format
		pixels.convert(BGRA);
		var src = pixels.bytes;
		var i = 0;
		for( y in 0...height ){
			for( x in 0...width  ){
				data.setPixel32( x, y, src.getInt32(i<<2) );
				i++;
			}
		}
		#else
		pixels.convert(BGRA);
		var src = pixels.bytes;
		for( i in 0...width * height )
			data.pixels[i] = src.getInt32(i<<2);
		#end
	}

	public inline function toNative() : BitmapInnerData {
		#if (flash || nme || openfl)
		return bmp;
		#elseif js
		return ctx;
		#else
		return data;
		#end
	}

	public static function fromNative( data : BitmapInnerData ) : BitmapData {
		var b = new BitmapData( -101, -102 );
		#if (flash || nme || openfl)
		b.bmp = data;
		#elseif js
		b.ctx = data;
		#else
		b.data = data;
		#end
		return b;
	}

	public function toPNG() {
		var pixels = getPixels();
		var png = pixels.toPNG();
		pixels.dispose();
		return png;
	}

}