visiting
visitModuleDefinitionNode: aModuleDefinition 
	| m |
	m := ASN1Module new
		name: aModuleDefinition identifier name.
	objects at: aModuleDefinition put: m.
	self
		useModule: m
		during:[	
			module addFields: (self visitAll: aModuleDefinition assignments) asDictionary.
			aModuleDefinition identifier ifNotNil: [
				module oid: aModuleDefinition identifier oid oidString asAsn1Oid ].
			(aModuleDefinition assignments 
				detect: [:each| each hasProperty: #PDU ]
				ifNone: [nil])
					ifNotNil: [:assignment| module propertyAt: #PDU put: assignment left label ].
			module tagEnvironment: aModuleDefinition tagDefault.
			^ module ]	