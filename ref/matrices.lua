---@meta

---@class Transform

---@class matrix
matrix = {}

---Multiply two transforms together.
---@param tf1 Transform
---@param tf2 Transform
---@return Transform tf
function matrix.multiply(tf1, tf2)
	return {}
end
---Invert a transform.
---@param tf Transform
---@return Transform tf
function matrix.invert(tf)
	return {}
end
---Transpose a matrix.
---@param tf Transform
---@return Transform tf
function matrix.transpose(tf)
	return {}
end
---Return an identity matrix.
---@return Transform tf
function matrix.identity()
	return {}
end
---Return a matrix rotated in the X axis.
---@param radians number
---@return Transform tf
function matrix.rotationX(radians)
	return {}
end
---Return a matrix rotated in the Y axis.
---@param radians number
---@return Transform tf
function matrix.rotationY(radians)
	return {}
end
---Return a matrix rotated in the Z axis.
---@param radians number
---@return Transform tf
function matrix.rotationZ(radians)
	return {}
end
---Return a translation matrix translated by x, y, z.
---@param x number
---@param y number
---@param z number
---@return Transform tf
function matrix.translation(x, y, z)
	return {}
end
---Get the x, y, z position from a matrix.
---@param tf Transform
---@return number x
---@return number y
---@return number z
function matrix.position(tf) end
---Find the distance between two matrices.
---@param tf1 Transform
---@param tf2 Transform
---@return number distance
function matrix.distance(tf1, tf2) end
---Multiplies a matrix by a vec4.
---@param tf Transform
---@param x number
---@param y number
---@param z number
---@param w number
---@return number x
---@return number y
---@return number z
---@return number w
function matrix.multiplyXYZW(tf, x, y, z, w) end
---Returns the rotation required to face an X Z vector.
---@param x number
---@param z number
---@return number outRotation
function matrix.rotationToFaceXZ(x, z) end
