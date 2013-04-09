visiting
visitModuleIdentifierNode: aModuleIdentifierNode 
	^ aModuleIdentifierNode oid: (self visit: aModuleIdentifierNode oid)