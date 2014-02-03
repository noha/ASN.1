visiting
visitBitStringValueNode: aNode
	super visitBitStringValueNode: aNode.
	"resolve the values for the named bits"
	aNode setBitValues: (aNode value collect: [:each| self resolveLabel: each])