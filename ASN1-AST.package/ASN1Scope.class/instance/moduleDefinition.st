resolving
moduleDefinition
	^ (scopeObject class = ASN1ModuleDefinitionNode ) 
		ifTrue: [ scopeObject ]
		ifFalse: [ parent moduleDefinition ]