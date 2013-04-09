visiting
visitModuleDefinitionNode: aModuleDefinition 
	module := ASN1Module new
		name: aModuleDefinition identifier name.
	objects at: aModuleDefinition put: module.
	self
		useModule: module
		during:[	
			module addFields: (self visitAll: aModuleDefinition assignments) asDictionary.
			aModuleDefinition identifier ifNotNil: [
				module oid: aModuleDefinition identifier oid oidString].
			(aModuleDefinition assignments 
				detect: [:each| each hasProperty: #PDU ]
				ifNone: [nil])
					ifNotNil: [:assignment| module propertyAt: #PDU put: assignment left label ].
			module tagEnvironment: aModuleDefinition tagDefault.
			^ module ]	