#ifndef INCLUDED_h3d_scene_Skin
#define INCLUDED_h3d_scene_Skin

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <h3d/scene/Mesh.h>
HX_DECLARE_CLASS1(h3d,Matrix)
HX_DECLARE_CLASS2(h3d,anim,Skin)
HX_DECLARE_CLASS2(h3d,col,Bounds)
HX_DECLARE_CLASS2(h3d,mat,Material)
HX_DECLARE_CLASS2(h3d,mat,MeshMaterial)
HX_DECLARE_CLASS2(h3d,scene,Mesh)
HX_DECLARE_CLASS2(h3d,scene,Object)
HX_DECLARE_CLASS2(h3d,scene,RenderContext)
HX_DECLARE_CLASS2(h3d,scene,Skin)
namespace h3d{
namespace scene{


class HXCPP_CLASS_ATTRIBUTES  Skin_obj : public ::h3d::scene::Mesh_obj{
	public:
		typedef ::h3d::scene::Mesh_obj super;
		typedef Skin_obj OBJ_;
		Skin_obj();
		Void __construct(::h3d::anim::Skin s,::h3d::mat::MeshMaterial mat,::h3d::scene::Object parent);

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< Skin_obj > __new(::h3d::anim::Skin s,::h3d::mat::MeshMaterial mat,::h3d::scene::Object parent);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Skin_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("Skin"); }

		::h3d::anim::Skin skinData;
		Array< ::Dynamic > currentRelPose;
		Array< ::Dynamic > currentAbsPose;
		Array< ::Dynamic > currentPalette;
		Array< ::Dynamic > splitPalette;
		bool jointsUpdated;
		::h3d::Matrix jointsAbsPosInv;
		bool paletteChanged;
		bool showJoints;
		bool syncIfHidden;
		virtual ::h3d::scene::Object clone( ::h3d::scene::Object o);

		virtual ::h3d::col::Bounds getBounds( ::h3d::col::Bounds b);

		virtual ::h3d::scene::Object getObjectByName( ::String name);

		virtual Void calcAbsPos( );

		virtual Void setSkinData( ::h3d::anim::Skin s);
		Dynamic setSkinData_dyn();

		virtual Void sync( ::h3d::scene::RenderContext ctx);

		virtual Void draw( ::h3d::scene::RenderContext ctx);

		virtual Void drawJoints( ::h3d::scene::RenderContext ctx);
		Dynamic drawJoints_dyn();

};

} // end namespace h3d
} // end namespace scene

#endif /* INCLUDED_h3d_scene_Skin */ 
