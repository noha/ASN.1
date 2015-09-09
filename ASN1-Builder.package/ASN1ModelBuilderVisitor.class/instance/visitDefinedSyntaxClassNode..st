visiting
visitDefinedSyntaxClassNode: aNode
	"classes should not be needed beyond this point. Classes just help
	instantiating objects"
	"returning dummy class for debugging purpose"
	^ ASN1ClassType new
		module: module