import h3d.pass.ScalableAO;

import hxd.Math;
import hxd.Window;
import hxd.Key in K;

class CustomRenderer extends h3d.scene.fwd.Renderer {

	public var sao : h3d.pass.ScalableAO;
	public var saoBlur : h3d.pass.Blur;
	var fxaa : h3d.pass.FXAA;

	public var mode = 0;
	public var hasMRT : Bool;
	public var enableFXAA : Bool;
	var out : h3d.mat.Texture;
	var mrt : h3d.pass.Output;

	public var bench = new h3d.impl.Benchmark();

	public function new() {
		super();
		sao = new h3d.pass.ScalableAO();
		saoBlur = new h3d.pass.Blur();
		fxaa = new h3d.pass.FXAA();
		sao.shader.sampleRadius	= 0.2;
		sao.shader.numSamples = 30;
		shadow.power = 8;
		shadow.blur.quality = 1.0;
		enableFXAA = true;
		hasMRT = h3d.Engine.getCurrent().driver.hasFeature(MultipleRenderTargets);
		if( !hasMRT ) throw "This sample requires MRT";
		mrt = new h3d.pass.Output("mrt",[Value("output.color"), PackFloat(Value("output.depth")), PackNormal(Value("output.normal"))]);
		allPasses.push(mrt);
	}

	override function renderPass(p:h3d.pass.Base, passes, ?sort) {
		bench.measure(p.name);
		return super.renderPass(p, passes, sort);
	}

	override function render() {
		renderPass(shadow,get("shadow"));
		var color = allocTarget("color");
		var depth = allocTarget("depth");
		var normal = allocTarget("normal");
		setTargets([color,depth,normal]);
		clear(0,1);
		mrt.draw(get("default"));
		resetTarget();
		if(mode != 1) {
			bench.measure("sao");
			var saoTarget = allocTarget("sao");
			setTarget(saoTarget);
			sao.apply(depth, normal, ctx.camera);
			resetTarget();
			bench.measure("saoBlur");
			saoBlur.apply(ctx, saoTarget);
			bench.measure("saoBlend");
			if (enableFXAA) fxaa.apply(color) else copy(color, null);
			copy(saoTarget, null, mode == 0 ? Multiply : null);
		} else {
			if (enableFXAA) fxaa.apply(color) else copy(color, null);
		}
	}

}

class Sao extends SampleApp {

	var wscale = 1.;
	var renderer : CustomRenderer;

	override function render(e:h3d.Engine) {
		renderer.bench.begin();
		s3d.render(e);
		renderer.bench.measure("ui");
		s2d.render(e);
		renderer.bench.end();
	}

	override function init() {
		super.init();

		var r = new hxd.Rand(Std.random(0xFFFFFF));

		renderer = new CustomRenderer();
		s2d.add(renderer.bench, 10);
		s3d.renderer = renderer;

		var floor = new h3d.prim.Grid(40,40,0.25,0.25);
		floor.addNormals();
		floor.translate( -5, -5, 0);
		var m = new h3d.scene.Mesh(floor, s3d);
		m.material.color.makeColor(0.35, 0.5, 0.5);
		m.setScale(wscale);

		for( i in 0...100 ) {
			var box : h3d.prim.Polygon = new h3d.prim.Cube(0.3 + r.rand() * 0.5, 0.3 + r.rand() * 0.5, 0.2 + r.rand());
			box.unindex();
			box.addNormals();
			var p = new h3d.scene.Mesh(box, s3d);
			p.setScale(wscale);
			p.x = r.srand(3) * wscale;
			p.y = r.srand(3) * wscale;
			p.material.color.makeColor(r.rand() * 0.3, 0.5, 0.5);
		}
		s3d.camera.zNear = 0.1 * wscale;
		s3d.camera.zFar = 150 * wscale;

		cast(s3d.lightSystem,h3d.scene.fwd.LightSystem).ambientLight.set(0.5, 0.5, 0.5);
		var dir = new h3d.scene.fwd.DirLight(new h3d.Vector( -0.3, -0.2, -1), s3d);
		dir.color.set(0.5, 0.5, 0.5);

		var time = Math.PI * 0.25;
		var camdist = 6 * wscale;
		s3d.camera.pos.set(camdist * Math.cos(time), camdist * Math.sin(time), camdist * 0.5);
		new h3d.scene.CameraController(s3d).loadFromCamera();

		var c = renderer;
		addText("SAO:");
		addSlider("Samples", function() return c.sao.shader.numSamples, function(v) c.sao.shader.numSamples = Std.int(v), 1, 101, true);
		addSlider("Bias", function() return c.sao.shader.bias, function(v) c.sao.shader.bias = v, 0, 0.3);
		addSlider("Intensity", function() return c.sao.shader.intensity, function(v) c.sao.shader.intensity = v, 0, 10);
		addSlider("Radius", function() return c.sao.shader.sampleRadius, function(v) c.sao.shader.sampleRadius = v);
		addSlider("Blur", function() return c.saoBlur.radius, function(v) c.saoBlur.radius = v, 0, 10);
		addSlider("BlurQuality", function() return c.saoBlur.quality, function(v) c.saoBlur.quality = v);
		addSlider("BlurLineary", function() return c.saoBlur.linear, function(v) c.saoBlur.linear = v);
		addText("Shadow:");
		// addSlider("ShadowQuality", function() return c.shadow.pcfQuality, function(v) c.shadow.pcfQuality = Std.int(v), 0, 2); // No noticeable effect?
		addSlider("Power", function() return c.shadow.power, function(v) c.shadow.power = v, 0, 50);
		addSlider("Size", function() return Math.log(c.shadow.size)/Math.log(2), function(v) c.shadow.size = Std.int(Math.pow(2, Std.int(v))), 6, 12, true);
		addSlider("BlurQuality", function() return c.shadow.blur.quality, function(v) c.shadow.blur.quality = v, 0, 2);
		addSlider("BlurRadius", function() return c.shadow.blur.radius, function(v) c.shadow.blur.radius = v, 0, 10);
		addText("Scene:");
		addCheck("FXAA", function() return c.enableFXAA, function(v) c.enableFXAA = v);
		// addCheck("Fullscreen", function() return Window.getInstance().displayMode == DisplayMode.Fullscreen, function(v) Window.getInstance().displayMode = v ? DisplayMode.Fullscreen : DisplayMode.Windowed);
		addCheck("VSync", function() return Window.getInstance().vsync, function(v) Window.getInstance().vsync = v);
		addText("Modes: (1) All, (2) Disable SAO, (3) Isolate SAO");

		onResize();
	}

	function reset() {
		while( s3d.numChildren > 0 )
			s3d.getChildAt(0).remove();
		s3d.dispose();
		init();
	}

	override function onResize() {
		renderer.bench.y = s2d.height - renderer.bench.height;
	}

	override function update( dt : Float ) {

		if(K.isPressed(K.BACKSPACE))
			reset();

		var r = hxd.impl.Api.downcast(s3d.renderer, CustomRenderer);
		if(K.isPressed(K.NUMBER_1))
			r.mode = 0;
		if(K.isPressed(K.NUMBER_2))
			r.mode = 1;
		if(K.isPressed(K.NUMBER_3))
			r.mode = 2;
	}

	static function main() {
		new Sao();
	}

}
