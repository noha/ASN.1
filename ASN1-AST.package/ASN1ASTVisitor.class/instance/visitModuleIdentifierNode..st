visiting
visitModuleIdentifierNode: aModuleIdentifierNode 
	"self visit: aModuleIdentifierNode name."
	self visit: aModuleIdentifierNode oid.
	^ aModuleIdentifierNode 