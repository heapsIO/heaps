package hxd.snd.efx;

class ReverbPreset {
	public var density             (default, null) : Float;
    public var diffusion           (default, null) : Float;
    public var gain                (default, null) : Float;
    public var gainHF              (default, null) : Float;
    public var gainLF              (default, null) : Float;
    public var decayTime           (default, null) : Float;
    public var decayHFRatio        (default, null) : Float;
    public var decayLFRatio        (default, null) : Float;
    public var reflectionsGain     (default, null) : Float;
    public var reflectionsDelay    (default, null) : Float;
    public var reflectionsPan      (default, null) : h3d.Vector;
    public var lateReverbGain      (default, null) : Float;
    public var lateReverbDelay     (default, null) : Float;
    public var lateReverbPan       (default, null) : h3d.Vector;
    public var echoTime            (default, null) : Float;
    public var echoDepth           (default, null) : Float;
    public var modulationTime      (default, null) : Float;
    public var modulationDepth     (default, null) : Float;
    public var airAbsorptionGainHF (default, null) : Float;
    public var hfReference         (default, null) : Float;
    public var lfReference         (default, null) : Float;
    public var roomRolloffFactor   (default, null) : Float;
    public var decayHFLimit        (default, null) : Int;

	public function new( 
		density:             Float,
		diffusion:           Float,
		gain:                Float,
		gainHF:              Float,
		gainLF:              Float,
		decayTime:           Float,
		decayHFRatio:        Float,
		decayLFRatio:        Float,
		reflectionsGain:     Float,
		reflectionsDelay:    Float,
		reflectionsPan:      h3d.Vector,
		lateReverbGain:      Float,
		lateReverbDelay:     Float,
		lateReverbPan:       h3d.Vector,
		echoTime:            Float,
		echoDepth:           Float,
		modulationTime:      Float,
		modulationDepth:     Float,
		airAbsorptionGainHF: Float,
		hfReference:         Float,
		lfReference:         Float,
		roomRolloffFactor:   Float,
		decayHFLimit:        Int
	) {
		this.density             = density;
		this.diffusion           = diffusion;
		this.gain                = gain;
		this.gainHF              = gainHF;
		this.gainLF              = gainLF;
		this.decayTime           = decayTime;
		this.decayHFRatio        = decayHFRatio;
		this.decayLFRatio        = decayLFRatio;
		this.reflectionsGain     = reflectionsGain;
		this.reflectionsDelay    = reflectionsDelay;
		this.reflectionsPan      = reflectionsPan;
		this.lateReverbGain      = lateReverbGain;
		this.lateReverbDelay     = lateReverbDelay;
		this.lateReverbPan       = lateReverbPan;
		this.echoTime            = echoTime;
		this.echoDepth           = echoDepth;
		this.modulationTime      = modulationTime;
		this.modulationDepth     = modulationDepth;
		this.airAbsorptionGainHF = airAbsorptionGainHF;
		this.hfReference         = hfReference;
		this.lfReference         = lfReference;
		this.roomRolloffFactor   = roomRolloffFactor;
		this.decayHFLimit        = decayHFLimit;
	}

	public static var GENERIC                   = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.8913, 1.0000, 1.4900, 0.8300, 1.0000, 0.0500, 0.0070,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var PADDEDCELL                = new ReverbPreset( 0.1715, 1.0000, 0.3162, 0.0010, 1.0000, 0.1700, 0.1000, 1.0000, 0.2500, 0.0010,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2691, 0.0020, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var ROOM                      = new ReverbPreset( 0.4287, 1.0000, 0.3162, 0.5929, 1.0000, 0.4000, 0.8300, 1.0000, 0.1503, 0.0020,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.0629, 0.0030, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var BATHROOM                  = new ReverbPreset( 0.1715, 1.0000, 0.3162, 0.2512, 1.0000, 1.4900, 0.5400, 1.0000, 0.6531, 0.0070,  new h3d.Vector(0.0000, 0.0000, 0.0000), 3.2734, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var LIVINGROOM                = new ReverbPreset( 0.9766, 1.0000, 0.3162, 0.0010, 1.0000, 0.5000, 0.1000, 1.0000, 0.2051, 0.0030,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2805, 0.0040, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var STONEROOM                 = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.7079, 1.0000, 2.3100, 0.6400, 1.0000, 0.4411, 0.0120,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.1003, 0.0170, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var AUDITORIUM                = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.5781, 1.0000, 4.3200, 0.5900, 1.0000, 0.4032, 0.0200,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7170, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var CONCERTHALL               = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.5623, 1.0000, 3.9200, 0.7000, 1.0000, 0.2427, 0.0200,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.9977, 0.0290, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var CAVE                      = new ReverbPreset( 1.0000, 1.0000, 0.3162, 1.0000, 1.0000, 2.9100, 1.3000, 1.0000, 0.5000, 0.0150,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7063, 0.0220, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );
	public static var ARENA                     = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.4477, 1.0000, 7.2400, 0.3300, 1.0000, 0.2612, 0.0200,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.0186, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var HANGAR                    = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.3162, 1.0000, 10.0500, 0.2300, 1.0000, 0.5000, 0.0200, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2560, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var CARPETEDHALLWAY           = new ReverbPreset( 0.4287, 1.0000, 0.3162, 0.0100, 1.0000, 0.3000, 0.1000, 1.0000, 0.1215, 0.0020,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1531, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var HALLWAY                   = new ReverbPreset( 0.3645, 1.0000, 0.3162, 0.7079, 1.0000, 1.4900, 0.5900, 1.0000, 0.2458, 0.0070,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.6615, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var STONECORRIDOR             = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.7612, 1.0000, 2.7000, 0.7900, 1.0000, 0.2472, 0.0130,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.5758, 0.0200, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var ALLEY                     = new ReverbPreset( 1.0000, 0.3000, 0.3162, 0.7328, 1.0000, 1.4900, 0.8600, 1.0000, 0.2500, 0.0070,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.9954, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1250, 0.9500, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var FOREST                    = new ReverbPreset( 1.0000, 0.3000, 0.3162, 0.0224, 1.0000, 1.4900, 0.5400, 1.0000, 0.0525, 0.1620,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7682, 0.0880, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1250, 1.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var CITY                      = new ReverbPreset( 1.0000, 0.5000, 0.3162, 0.3981, 1.0000, 1.4900, 0.6700, 1.0000, 0.0730, 0.0070,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1427, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var MOUNTAINS                 = new ReverbPreset( 1.0000, 0.2700, 0.3162, 0.0562, 1.0000, 1.4900, 0.2100, 1.0000, 0.0407, 0.3000,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1919, 0.1000, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 1.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );
	public static var QUARRY                    = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.3162, 1.0000, 1.4900, 0.8300, 1.0000, 0.0000, 0.0610,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.7783, 0.0250, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1250, 0.7000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var PLAIN                     = new ReverbPreset( 1.0000, 0.2100, 0.3162, 0.1000, 1.0000, 1.4900, 0.5000, 1.0000, 0.0585, 0.1790,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1089, 0.1000, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 1.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var PARKINGLOT                = new ReverbPreset( 1.0000, 1.0000, 0.3162, 1.0000, 1.0000, 1.6500, 1.5000, 1.0000, 0.2082, 0.0080,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2652, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );
	public static var SEWERPIPE                 = new ReverbPreset( 0.3071, 0.8000, 0.3162, 0.3162, 1.0000, 2.8100, 0.1400, 1.0000, 1.6387, 0.0140,  new h3d.Vector(0.0000, 0.0000, 0.0000), 3.2471, 0.0210, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var UNDERWATER                = new ReverbPreset( 0.3645, 1.0000, 0.3162, 0.0100, 1.0000, 1.4900, 0.1000, 1.0000, 0.5963, 0.0070,  new h3d.Vector(0.0000, 0.0000, 0.0000), 7.0795, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 1.1800, 0.3480, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var DRUGGED                   = new ReverbPreset( 0.4287, 0.5000, 0.3162, 1.0000, 1.0000, 8.3900, 1.3900, 1.0000, 0.8760, 0.0020,  new h3d.Vector(0.0000, 0.0000, 0.0000), 3.1081, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 1.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );
	public static var DIZZY                     = new ReverbPreset( 0.3645, 0.6000, 0.3162, 0.6310, 1.0000, 17.2300, 0.5600, 1.0000, 0.1392, 0.0200, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.4937, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 1.0000, 0.8100, 0.3100, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );
	public static var PSYCHOTIC                 = new ReverbPreset( 0.0625, 0.5000, 0.3162, 0.8404, 1.0000, 7.5600, 0.9100, 1.0000, 0.4864, 0.0200,  new h3d.Vector(0.0000, 0.0000, 0.0000), 2.4378, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 4.0000, 1.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );

	// Castle Presets
	public static var CASTLE_SMALLROOM          = new ReverbPreset( 1.0000, 0.8900, 0.3162, 0.3981, 0.1000, 1.2200, 0.8300, 0.3100, 0.8913, 0.0220, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.9953, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1380, 0.0800, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 );
	public static var CASTLE_SHORTPASSAGE       = new ReverbPreset( 1.0000, 0.8900, 0.3162, 0.3162, 0.1000, 2.3200, 0.8300, 0.3100, 0.8913, 0.0070, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0230, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1380, 0.0800, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 );
	public static var CASTLE_MEDIUMROOM         = new ReverbPreset( 1.0000, 0.9300, 0.3162, 0.2818, 0.1000, 2.0400, 0.8300, 0.4600, 0.6310, 0.0220, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.5849, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1550, 0.0300, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 );
	public static var CASTLE_LARGEROOM          = new ReverbPreset( 1.0000, 0.8200, 0.3162, 0.2818, 0.1259, 2.5300, 0.8300, 0.5000, 0.4467, 0.0340, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0160, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1850, 0.0700, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 );
	public static var CASTLE_LONGPASSAGE        = new ReverbPreset( 1.0000, 0.8900, 0.3162, 0.3981, 0.1000, 3.4200, 0.8300, 0.3100, 0.8913, 0.0070, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.4125, 0.0230, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1380, 0.0800, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 );
	public static var CASTLE_HALL               = new ReverbPreset( 1.0000, 0.8100, 0.3162, 0.2818, 0.1778, 3.1400, 0.7900, 0.6200, 0.1778, 0.0560, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.1220, 0.0240, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 );
	public static var CASTLE_CUPBOARD           = new ReverbPreset( 1.0000, 0.8900, 0.3162, 0.2818, 0.1000, 0.6700, 0.8700, 0.3100, 1.4125, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 3.5481, 0.0070, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1380, 0.0800, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 );
	public static var CASTLE_COURTYARD          = new ReverbPreset( 1.0000, 0.4200, 0.3162, 0.4467, 0.1995, 2.1300, 0.6100, 0.2300, 0.2239, 0.1600, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7079, 0.0360, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.3700, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );
	public static var CASTLE_ALCOVE             = new ReverbPreset( 1.0000, 0.8900, 0.3162, 0.5012, 0.1000, 1.6400, 0.8700, 0.3100, 1.0000, 0.0070, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.4125, 0.0340, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1380, 0.0800, 0.2500, 0.0000, 0.9943, 5168.6001, 139.5000, 0.0000, 0x1 );

	// Factory Presets
	public static var FACTORY_SMALLROOM         = new ReverbPreset( 0.3645, 0.8200, 0.3162, 0.7943, 0.5012, 1.7200, 0.6500, 1.3100, 0.7079, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.7783, 0.0240, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1190, 0.0700, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 );
	public static var FACTORY_SHORTPASSAGE      = new ReverbPreset( 0.3645, 0.6400, 0.2512, 0.7943, 0.5012, 2.5300, 0.6500, 1.3100, 1.0000, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0380, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1350, 0.2300, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 );
	public static var FACTORY_MEDIUMROOM        = new ReverbPreset( 0.4287, 0.8200, 0.2512, 0.7943, 0.5012, 2.7600, 0.6500, 1.3100, 0.2818, 0.0220, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.4125, 0.0230, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1740, 0.0700, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 );
	public static var FACTORY_LARGEROOM         = new ReverbPreset( 0.4287, 0.7500, 0.2512, 0.7079, 0.6310, 4.2400, 0.5100, 1.3100, 0.1778, 0.0390, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.1220, 0.0230, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2310, 0.0700, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 );
	public static var FACTORY_LONGPASSAGE       = new ReverbPreset( 0.3645, 0.6400, 0.2512, 0.7943, 0.5012, 4.0600, 0.6500, 1.3100, 1.0000, 0.0200, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0370, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1350, 0.2300, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 );
	public static var FACTORY_HALL              = new ReverbPreset( 0.4287, 0.7500, 0.3162, 0.7079, 0.6310, 7.4300, 0.5100, 1.3100, 0.0631, 0.0730, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.8913, 0.0270, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0700, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 );
	public static var FACTORY_CUPBOARD          = new ReverbPreset( 0.3071, 0.6300, 0.2512, 0.7943, 0.5012, 0.4900, 0.6500, 1.3100, 1.2589, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.9953, 0.0320, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1070, 0.0700, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 );
	public static var FACTORY_COURTYARD         = new ReverbPreset( 0.3071, 0.5700, 0.3162, 0.3162, 0.6310, 2.3200, 0.2900, 0.5600, 0.2239, 0.1400, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.3981, 0.0390, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.2900, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 );
	public static var FACTORY_ALCOVE            = new ReverbPreset( 0.3645, 0.5900, 0.2512, 0.7943, 0.5012, 3.1400, 0.6500, 1.3100, 1.4125, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.0000, 0.0380, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1140, 0.1000, 0.2500, 0.0000, 0.9943, 3762.6001, 362.5000, 0.0000, 0x1 );
	
	// Ice Palace Presets
	public static var ICEPALACE_SMALLROOM       = new ReverbPreset( 1.0000, 0.8400, 0.3162, 0.5623, 0.2818, 1.5100, 1.5300, 0.2700, 0.8913, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.4125, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1640, 0.1400, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 );
	public static var ICEPALACE_SHORTPASSAGE    = new ReverbPreset( 1.0000, 0.7500, 0.3162, 0.5623, 0.2818, 1.7900, 1.4600, 0.2800, 0.5012, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.1220, 0.0190, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1770, 0.0900, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 );
	public static var ICEPALACE_MEDIUMROOM      = new ReverbPreset( 1.0000, 0.8700, 0.3162, 0.5623, 0.4467, 2.2200, 1.5300, 0.3200, 0.3981, 0.0390, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.1220, 0.0270, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1860, 0.1200, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 );
	public static var ICEPALACE_LARGEROOM       = new ReverbPreset( 1.0000, 0.8100, 0.3162, 0.5623, 0.4467, 3.1400, 1.5300, 0.3200, 0.2512, 0.0390, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.0000, 0.0270, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2140, 0.1100, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 );
	public static var ICEPALACE_LONGPASSAGE     = new ReverbPreset( 1.0000, 0.7700, 0.3162, 0.5623, 0.3981, 3.0100, 1.4600, 0.2800, 0.7943, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0250, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1860, 0.0400, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 );
	public static var ICEPALACE_HALL            = new ReverbPreset( 1.0000, 0.7600, 0.3162, 0.4467, 0.5623, 5.4900, 1.5300, 0.3800, 0.1122, 0.0540, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.6310, 0.0520, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2260, 0.1100, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 );
	public static var ICEPALACE_CUPBOARD        = new ReverbPreset( 1.0000, 0.8300, 0.3162, 0.5012, 0.2239, 0.7600, 1.5300, 0.2600, 1.1220, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.9953, 0.0160, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1430, 0.0800, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 );
	public static var ICEPALACE_COURTYARD       = new ReverbPreset( 1.0000, 0.5900, 0.3162, 0.2818, 0.3162, 2.0400, 1.2000, 0.3800, 0.3162, 0.1730, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.3162, 0.0430, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2350, 0.4800, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 );
	public static var ICEPALACE_ALCOVE          = new ReverbPreset( 1.0000, 0.8400, 0.3162, 0.5623, 0.2818, 2.7600, 1.4600, 0.2800, 1.1220, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.8913, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1610, 0.0900, 0.2500, 0.0000, 0.9943, 12428.5000, 99.6000, 0.0000, 0x1 );

	// Space Station Presets
	public static var SPACESTATION_SMALLROOM    = new ReverbPreset( 0.2109, 0.7000, 0.3162, 0.7079, 0.8913, 1.7200, 0.8200, 0.5500, 0.7943, 0.0070, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.4125, 0.0130, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1880, 0.2600, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 );
	public static var SPACESTATION_SHORTPASSAGE = new ReverbPreset( 0.2109, 0.8700, 0.3162, 0.6310, 0.8913, 3.5700, 0.5000, 0.5500, 1.0000, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.1220, 0.0160, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1720, 0.2000, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 );
	public static var SPACESTATION_MEDIUMROOM   = new ReverbPreset( 0.2109, 0.7500, 0.3162, 0.6310, 0.8913, 3.0100, 0.5000, 0.5500, 0.3981, 0.0340, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.1220, 0.0350, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2090, 0.3100, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 );
	public static var SPACESTATION_LARGEROOM    = new ReverbPreset( 0.3645, 0.8100, 0.3162, 0.6310, 0.8913, 3.8900, 0.3800, 0.6100, 0.3162, 0.0560, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.8913, 0.0350, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2330, 0.2800, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 );
	public static var SPACESTATION_LONGPASSAGE  = new ReverbPreset( 0.4287, 0.8200, 0.3162, 0.6310, 0.8913, 4.6200, 0.6200, 0.5500, 1.0000, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0310, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.2300, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 );
	public static var SPACESTATION_HALL         = new ReverbPreset( 0.4287, 0.8700, 0.3162, 0.6310, 0.8913, 7.1100, 0.3800, 0.6100, 0.1778, 0.1000, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.6310, 0.0470, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.2500, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 );
	public static var SPACESTATION_CUPBOARD     = new ReverbPreset( 0.1715, 0.5600, 0.3162, 0.7079, 0.8913, 0.7900, 0.8100, 0.5500, 1.4125, 0.0070, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.7783, 0.0180, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1810, 0.3100, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 );
	public static var SPACESTATION_ALCOVE       = new ReverbPreset( 0.2109, 0.7800, 0.3162, 0.7079, 0.8913, 1.1600, 0.8100, 0.5500, 1.4125, 0.0070, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.0000, 0.0180, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1920, 0.2100, 0.2500, 0.0000, 0.9943, 3316.1001, 458.2000, 0.0000, 0x1 );

	// Wooden Galleon Presets
	public static var WOODEN_SMALLROOM          = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.1122, 0.3162, 0.7900, 0.3200, 0.8700, 1.0000, 0.0320, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.8913, 0.0290, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 );
	public static var WOODEN_SHORTPASSAGE       = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.1259, 0.3162, 1.7500, 0.5000, 0.8700, 0.8913, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.6310, 0.0240, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 );
	public static var WOODEN_MEDIUMROOM         = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.1000, 0.2818, 1.4700, 0.4200, 0.8200, 0.8913, 0.0490, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.8913, 0.0290, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 );
	public static var WOODEN_LARGEROOM          = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.0891, 0.2818, 2.6500, 0.3300, 0.8200, 0.8913, 0.0660, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7943, 0.0490, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 );
	public static var WOODEN_LONGPASSAGE        = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.1000, 0.3162, 1.9900, 0.4000, 0.7900, 1.0000, 0.0200, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.4467, 0.0360, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 );
	public static var WOODEN_HALL               = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.0794, 0.2818, 3.4500, 0.3000, 0.8200, 0.8913, 0.0880, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7943, 0.0630, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 );
	public static var WOODEN_CUPBOARD           = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.1413, 0.3162, 0.5600, 0.4600, 0.9100, 1.1220, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.1220, 0.0280, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 );
	public static var WOODEN_COURTYARD          = new ReverbPreset( 1.0000, 0.6500, 0.3162, 0.0794, 0.3162, 1.7900, 0.3500, 0.7900, 0.5623, 0.1230, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1000, 0.0320, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 );
	public static var WOODEN_ALCOVE             = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.1259, 0.3162, 1.2200, 0.6200, 0.9100, 1.1220, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7079, 0.0240, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 4705.0000, 99.6000, 0.0000, 0x1 );
	
	// Sports Presets
	public static var SPORT_EMPTYSTADIUM        = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.4467, 0.7943, 6.2600, 0.5100, 1.1000, 0.0631, 0.1830, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.3981, 0.0380, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var SPORT_SQUASHCOURT         = new ReverbPreset( 1.0000, 0.7500, 0.3162, 0.3162, 0.7943, 2.2200, 0.9100, 1.1600, 0.4467, 0.0070, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7943, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1260, 0.1900, 0.2500, 0.0000, 0.9943, 7176.8999, 211.2000, 0.0000, 0x1 );
	public static var SPORT_SMALLSWIMMINGPOOL   = new ReverbPreset( 1.0000, 0.7000, 0.3162, 0.7943, 0.8913, 2.7600, 1.2500, 1.1400, 0.6310, 0.0200, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7943, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1790, 0.1500, 0.8950, 0.1900, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );
	public static var SPORT_LARGESWIMMINGPOOL   = new ReverbPreset( 1.0000, 0.8200, 0.3162, 0.7943, 1.0000, 5.4900, 1.3100, 1.1400, 0.4467, 0.0390, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.5012, 0.0490, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2220, 0.5500, 1.1590, 0.2100, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );
	public static var SPORT_GYMNASIUM           = new ReverbPreset( 1.0000, 0.8100, 0.3162, 0.4467, 0.8913, 3.1400, 1.0600, 1.3500, 0.3981, 0.0290, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.5623, 0.0450, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1460, 0.1400, 0.2500, 0.0000, 0.9943, 7176.8999, 211.2000, 0.0000, 0x1 );
	public static var SPORT_FULLSTADIUM         = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.0708, 0.7943, 5.2500, 0.1700, 0.8000, 0.1000, 0.1880, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2818, 0.0380, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var SPORT_STADIUMTANNOY       = new ReverbPreset( 1.0000, 0.7800, 0.3162, 0.5623, 0.5012, 2.5300, 0.8800, 0.6800, 0.2818, 0.2300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.5012, 0.0630, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.2000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );

	// Prefab Presets
	public static var PREFAB_WORKSHOP           = new ReverbPreset( 0.4287, 1.0000, 0.3162, 0.1413, 0.3981, 0.7600, 1.0000, 1.0000, 1.0000, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000 ), 1.1220, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );
	public static var PREFAB_SCHOOLROOM         = new ReverbPreset( 0.4022, 0.6900, 0.3162, 0.6310, 0.5012, 0.9800, 0.4500, 0.1800, 1.4125, 0.0170, new h3d.Vector(0.0000, 0.0000, 0.0000 ), 1.4125, 0.0150, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.0950, 0.1400, 0.2500, 0.0000, 0.9943, 7176.8999, 211.2000, 0.0000, 0x1 );
	public static var PREFAB_PRACTISEROOM       = new ReverbPreset( 0.4022, 0.8700, 0.3162, 0.3981, 0.5012, 1.1200, 0.5600, 0.1800, 1.2589, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000 ), 1.4125, 0.0110, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.0950, 0.1400, 0.2500, 0.0000, 0.9943, 7176.8999, 211.2000, 0.0000, 0x1 );
	public static var PREFAB_OUTHOUSE           = new ReverbPreset( 1.0000, 0.8200, 0.3162, 0.1122, 0.1585, 1.3800, 0.3800, 0.3500, 0.8913, 0.0240, new h3d.Vector(0.0000, 0.0000, -0.0000), 0.6310, 0.0440, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1210, 0.1700, 0.2500, 0.0000, 0.9943, 2854.3999, 107.5000, 0.0000, 0x0 );
	public static var PREFAB_CARAVAN            = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.0891, 0.1259, 0.4300, 1.5000, 1.0000, 1.0000, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000 ), 1.9953, 0.0120, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0 );

	// Dome and Pipe Presets
	public static var DOME_TOMB                 = new ReverbPreset( 1.0000, 0.7900, 0.3162, 0.3548, 0.2239, 4.1800, 0.2100, 0.1000, 0.3868, 0.0300,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.6788, 0.0220, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1770, 0.1900, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x0 );
	public static var PIPE_SMALL                = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.3548, 0.2239, 5.0400, 0.1000, 0.1000, 0.5012, 0.0320,  new h3d.Vector(0.0000, 0.0000, 0.0000), 2.5119, 0.0150, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x1 );
	public static var DOME_SAINTPAULS           = new ReverbPreset( 1.0000, 0.8700, 0.3162, 0.3548, 0.2239, 10.4800, 0.1900, 0.1000, 0.1778, 0.0900, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0420, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.1200, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x1 );
	public static var PIPE_LONGTHIN             = new ReverbPreset( 0.2560, 0.9100, 0.3162, 0.4467, 0.2818, 9.2100, 0.1800, 0.1000, 0.7079, 0.0100,  new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7079, 0.0220, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x0 );
	public static var PIPE_LARGE                = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.3548, 0.2239, 8.4500, 0.1000, 0.1000, 0.3981, 0.0460,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.5849, 0.0320, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x1 );
	public static var PIPE_RESONANT             = new ReverbPreset( 0.1373, 0.9100, 0.3162, 0.4467, 0.2818, 6.8100, 0.1800, 0.1000, 0.7079, 0.0100,  new h3d.Vector(0.0000, 0.0000, 0.0000), 1.0000, 0.0220, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 2854.3999, 20.0000, 0.0000, 0x0 );

	// Outdoors Presets
	public static var OUTDOORS_BACKYARD         = new ReverbPreset( 1.0000, 0.4500, 0.3162, 0.2512, 0.5012, 1.1200, 0.3400, 0.4600, 0.4467, 0.0690, new h3d.Vector(0.0000, 0.0000, -0.0000), 0.7079, 0.0230, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2180, 0.3400, 0.2500, 0.0000, 0.9943, 4399.1001, 242.9000, 0.0000, 0x0 );
	public static var OUTDOORS_ROLLINGPLAINS    = new ReverbPreset( 1.0000, 0.0000, 0.3162, 0.0112, 0.6310, 2.1300, 0.2100, 0.4600, 0.1778, 0.3000, new h3d.Vector(0.0000, 0.0000, -0.0000), 0.4467, 0.0190, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 1.0000, 0.2500, 0.0000, 0.9943, 4399.1001, 242.9000, 0.0000, 0x0 );
	public static var OUTDOORS_DEEPCANYON       = new ReverbPreset( 1.0000, 0.7400, 0.3162, 0.1778, 0.6310, 3.8900, 0.2100, 0.4600, 0.3162, 0.2230, new h3d.Vector(0.0000, 0.0000, -0.0000), 0.3548, 0.0190, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 1.0000, 0.2500, 0.0000, 0.9943, 4399.1001, 242.9000, 0.0000, 0x0 );
	public static var OUTDOORS_CREEK            = new ReverbPreset( 1.0000, 0.3500, 0.3162, 0.1778, 0.5012, 2.1300, 0.2100, 0.4600, 0.3981, 0.1150, new h3d.Vector(0.0000, 0.0000, -0.0000), 0.1995, 0.0310, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2180, 0.3400, 0.2500, 0.0000, 0.9943, 4399.1001, 242.9000, 0.0000, 0x0 );
	public static var OUTDOORS_VALLEY           = new ReverbPreset( 1.0000, 0.2800, 0.3162, 0.0282, 0.1585, 2.8800, 0.2600, 0.3500, 0.1413, 0.2630, new h3d.Vector(0.0000, 0.0000, -0.0000), 0.3981, 0.1000, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.3400, 0.2500, 0.0000, 0.9943, 2854.3999, 107.5000, 0.0000, 0x0 );

	// Mood Presets
	public static var MOOD_HEAVEN               = new ReverbPreset( 1.0000, 0.9400, 0.3162, 0.7943, 0.4467, 5.0400, 1.1200, 0.5600, 0.2427, 0.0200, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0290, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0800, 2.7420, 0.0500, 0.9977, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var MOOD_HELL                 = new ReverbPreset( 1.0000, 0.5700, 0.3162, 0.3548, 0.4467, 3.5700, 0.4900, 2.0000, 0.0000, 0.0200, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.4125, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1100, 0.0400, 2.1090, 0.5200, 0.9943, 5000.0000, 139.5000, 0.0000, 0x0 );
	public static var MOOD_MEMORY               = new ReverbPreset( 1.0000, 0.8500, 0.3162, 0.6310, 0.3548, 4.0600, 0.8200, 0.5600, 0.0398, 0.0000, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.1220, 0.0000, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.4740, 0.4500, 0.9886, 5000.0000, 250.0000, 0.0000, 0x0 );

	// Driving Presets
	public static var DRIVING_COMMENTATOR       = new ReverbPreset( 1.0000, 0.0000, 0.3162, 0.5623, 0.5012, 2.4200, 0.8800, 0.6800, 0.1995, 0.0930, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2512, 0.0170, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 1.0000, 0.2500, 0.0000, 0.9886, 5000.0000, 250.0000, 0.0000, 0x1  );
	public static var DRIVING_PITGARAGE         = new ReverbPreset( 0.4287, 0.5900, 0.3162, 0.7079, 0.5623, 1.7200, 0.9300, 0.8700, 0.5623, 0.0000, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0160, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.1100, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x0  );
	public static var DRIVING_INCAR_RACER       = new ReverbPreset( 0.0832, 0.8000, 0.3162, 1.0000, 0.7943, 0.1700, 2.0000, 0.4100, 1.7783, 0.0070, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7079, 0.0150, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 10268.2002, 251.0000, 0.0000, 0x1 );
	public static var DRIVING_INCAR_SPORTS      = new ReverbPreset( 0.0832, 0.8000, 0.3162, 0.6310, 1.0000, 0.1700, 0.7500, 0.4100, 1.0000, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.5623, 0.0000, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 10268.2002, 251.0000, 0.0000, 0x1 );
	public static var DRIVING_INCAR_LUXURY      = new ReverbPreset( 0.2560, 1.0000, 0.3162, 0.1000, 0.5012, 0.1300, 0.4100, 0.4600, 0.7943, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.5849, 0.0100, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 10268.2002, 251.0000, 0.0000, 0x1 );
	public static var DRIVING_FULLGRANDSTAND    = new ReverbPreset( 1.0000, 1.0000, 0.3162, 0.2818, 0.6310, 3.0100, 1.3700, 1.2800, 0.3548, 0.0900, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1778, 0.0490, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 10420.2002, 250.0000, 0.0000, 0x0 );
	public static var DRIVING_EMPTYGRANDSTAND   = new ReverbPreset( 1.0000, 1.0000, 0.3162, 1.0000, 0.7943, 4.6200, 1.7500, 1.4000, 0.2082, 0.0900, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2512, 0.0490, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.0000, 0.9943, 10420.2002, 250.0000, 0.0000, 0x0 );
	public static var DRIVING_TUNNEL            = new ReverbPreset( 1.0000, 0.8100, 0.3162, 0.3981, 0.8913, 3.4200, 0.9400, 1.3100, 0.7079, 0.0510, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7079, 0.0470, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2140, 0.0500, 0.2500, 0.0000, 0.9943, 5000.0000, 155.3000, 0.0000, 0x1  );

	// City Presets
	public static var CITY_STREETS              = new ReverbPreset( 1.0000, 0.7800, 0.3162, 0.7079, 0.8913, 1.7900, 1.1200, 0.9100, 0.2818, 0.0460, new h3d.Vector(0.0000, 0.0000, 0.0000 ), 0.1995, 0.0280, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.2000, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var CITY_SUBWAY               = new ReverbPreset( 1.0000, 0.7400, 0.3162, 0.7079, 0.8913, 3.0100, 1.2300, 0.9100, 0.7079, 0.0460, new h3d.Vector(0.0000, 0.0000, 0.0000 ), 1.2589, 0.0280, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1250, 0.2100, 0.2500, 0.0000, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var CITY_MUSEUM               = new ReverbPreset( 1.0000, 0.8200, 0.3162, 0.1778, 0.1778, 3.2800, 1.4000, 0.5700, 0.2512, 0.0390, new h3d.Vector(0.0000, 0.0000, -0.0000), 0.8913, 0.0340, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1300, 0.1700, 0.2500, 0.0000, 0.9943, 2854.3999, 107.5000, 0.0000, 0x0 );
	public static var CITY_LIBRARY              = new ReverbPreset( 1.0000, 0.8200, 0.3162, 0.2818, 0.0891, 2.7600, 0.8900, 0.4100, 0.3548, 0.0290, new h3d.Vector(0.0000, 0.0000, -0.0000), 0.8913, 0.0200, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1300, 0.1700, 0.2500, 0.0000, 0.9943, 2854.3999, 107.5000, 0.0000, 0x0 );
	public static var CITY_UNDERPASS            = new ReverbPreset( 1.0000, 0.8200, 0.3162, 0.4467, 0.8913, 3.5700, 1.1200, 0.9100, 0.3981, 0.0590, new h3d.Vector(0.0000, 0.0000, 0.0000 ), 0.8913, 0.0370, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.1400, 0.2500, 0.0000, 0.9920, 5000.0000, 250.0000, 0.0000, 0x1 );
	public static var CITY_ABANDONED            = new ReverbPreset( 1.0000, 0.6900, 0.3162, 0.7943, 0.8913, 3.2800, 1.1700, 0.9100, 0.4467, 0.0440, new h3d.Vector(0.0000, 0.0000, 0.0000 ), 0.2818, 0.0240, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.2000, 0.2500, 0.0000, 0.9966, 5000.0000, 250.0000, 0.0000, 0x1 );

	// Misc. Presets
	public static var DUSTYROOM                 = new ReverbPreset( 0.3645, 0.5600, 0.3162, 0.7943, 0.7079, 1.7900, 0.3800, 0.2100, 0.5012, 0.0020, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.2589, 0.0060, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2020, 0.0500, 0.2500, 0.0000, 0.9886, 13046.0000, 163.3000, 0.0000, 0x1 );
	public static var CHAPEL                    = new ReverbPreset( 1.0000, 0.8400, 0.3162, 0.5623, 1.0000, 4.6200, 0.6400, 1.2300, 0.4467, 0.0320, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.7943, 0.0490, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.2500, 0.0000, 0.2500, 0.1100, 0.9943, 5000.0000, 250.0000, 0.0000, 0x1  );
	public static var SMALLWATERROOM            = new ReverbPreset( 1.0000, 0.7000, 0.3162, 0.4477, 1.0000, 1.5100, 1.2500, 1.1400, 0.8913, 0.0200, new h3d.Vector(0.0000, 0.0000, 0.0000), 1.4125, 0.0300, new h3d.Vector(0.0000, 0.0000, 0.0000), 0.1790, 0.1500, 0.8950, 0.1900, 0.9920, 5000.0000, 250.0000, 0.0000, 0x0  );
}