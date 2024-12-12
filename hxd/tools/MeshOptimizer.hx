package hxd.tools;

#if (hl && hl_ver >= version("1.15.0"))
class MeshOptimizer {
	/**
	Generates a vertex remap table from the vertex buffer and an optional index buffer and returns number of unique vertices
	As a result, all vertices that are binary equivalent map to the same (new) location, with no gaps in the resulting sequence.
	Resulting remap table maps old vertices to new vertices and can be used in remapVertexBuffer/remapIndexBuffer.
	Note that binary equivalence considers all vertexSize bytes, including padding which should be zero-initialized.

	remapOut must contain enough space for the resulting remap table (vertexCount elements)
	indices can be null if the input is unindexed
	**/
	@:hlNative("heaps", "generate_vertex_remap")
	public static function generateVertexRemap(remapOut:hl.Bytes, indices:hl.Bytes, indexCount:Int, vertices:hl.Bytes, vertexCount:Int, vertexSize:Int) : Int {
		return 0;
	}

	/**
	Generate index buffer from the source index buffer and remap table generated by generateVertexRemap

	indicesOut must contain enough space for the resulting index buffer (indexCount elements)
	indicesIn can be null if the input is unindexed
	**/
	@:hlNative("heaps", "remap_index_buffer")
	public static function remapIndexBuffer(indicesOut:hl.Bytes, indicesIn:hl.Bytes, indexCount:Int, remap:hl.Bytes) {}

	/**
	Generates vertex buffer from the source vertex buffer and remap table generated by generateVertexRemap

	vertexOut must contain enough space for the resulting vertex buffer (vertexCount elements, returned by generateVertexRemap)
	vertexCount should be the initial vertex count and not the value returned by generateVertexRemap
	**/
	@:hlNative("heaps", "remap_vertex_buffer")
	public static function remapVertexBuffer(verticesOut:hl.Bytes, verticesIn:hl.Bytes, vertexCount:Int, vertexSize:Int, remap:hl.Bytes) {}

	/**
	Mesh simplifier
	Reduces the number of triangles in the mesh, attempting to preserve mesh appearance as much as possible
	The algorithm tries to preserve mesh topology and can stop short of the target goal based on topology constraints or target error.
	If not all attributes from the input mesh are required, it's recommended to reindex the mesh without them prior to simplification.
	Returns the number of indices after simplification, with destination containing new index data
	The resulting index buffer references vertices from the original vertex buffer.
	If the original vertex data isn't required, creating a compact vertex buffer using optimizeVertexFetch is recommended.

	indicesOut must contain enough space for the target index buffer, worst case is indexCount elements (*not* targetIndexCount)!
	vertices should have float3 position in the first 12 bytes of each vertex
	targetError represents the error relative to mesh extents that can be tolerated, e.g. 0.01 = 1% deformation; value range [0..1]
	options must be a bitmask composed of meshopt_SimplifyX options; 0 is a safe default
	resultErrorOut can be null; when it's not null, it will contain the resulting (relative) error after simplification
	**/
	@:hlNative("heaps", "simplify")
	public static function simplify(indicesOut:hl.Bytes, indicesIn:hl.Bytes, indexCount:Int, vertices:hl.Bytes, vertexCount:Int, vertexSize:Int, targetIndexCount:Int, targetError:Single, options:Int, resultErrorOut:hl.Bytes) : Int {
		return 0;
	}

	/**
	Vertex transform cache optimizer
	Reorders indices to reduce the number of GPU vertex shader invocations
	If index buffer contains multiple ranges for multiple draw calls, this functions needs to be called on each range individually.

	indicesOut must contain enough space for the resulting index buffer (indexCount elements)
	**/
	@:hlNative("heaps", "optimize_vertex_cache")
	public static function optimizeVertexCache(indicesOut:hl.Bytes, indicesIn:hl.Bytes, indexCount:Int, vertexCount:Int) {}

	/**
	Overdraw optimizer
	Reorders indices to reduce the number of GPU vertex shader invocations and the pixel overdraw
	If index buffer contains multiple ranges for multiple draw calls, this functions needs to be called on each range individually.

	indicesOut must contain enough space for the resulting index buffer (indexCount elements)
	indicesIn must contain index data that is the result of optimizeVertexCache (*not* the original mesh indices!)
	vertices should have float3 position in the first 12 bytes of each vertex
	threshold indicates how much the overdraw optimizer can degrade vertex cache efficiency (1.05 = up to 5%) to reduce overdraw more efficiently
	**/
	@:hlNative("heaps", "optimize_overdraw")
	public static function optimizeOverdraw(indicesOut:hl.Bytes, indicesIn:hl.Bytes, indexCount:Int, vertices:hl.Bytes, vertexCount:Int, vertexSize:Int, threshold:Single) {}

	/**
	Vertex fetch cache optimizer
	Reorders vertices and changes indices to reduce the amount of GPU memory fetches during vertex processing
	Returns the number of unique vertices, which is the same as input vertex count unless some vertices are unused

	verticesOut must contain enough space for the resulting vertex buffer (vertexCount elements)
	indices is used both as an input and as an output index buffer
	**/
	@:hlNative("heaps", "optimize_vertex_fetch")
	public static function optimizeVertexFetch(verticesOut:hl.Bytes, indices:hl.Bytes, indexCount:Int, verticesIn:hl.Bytes, vertexCount:Int, vertexSize:Int) : Int {
		return 0;
	}
}
#end
