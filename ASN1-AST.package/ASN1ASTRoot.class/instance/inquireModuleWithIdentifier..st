resolving
inquireModuleWithIdentifier: aModuleIdentifier
	"raise resumable exception to inquire a module or module source string"
	^ (ASN1MissingModule new identifier: aModuleIdentifier; signal)
		ifNotNil: [ :moduleOrSource |
			 moduleOrSource isAsn1ModuleDefinitionNode 
				ifTrue: [ self addModule: moduleOrSource ]
				ifFalse: [ self addModuleFrom: moduleOrSource  ]]
		ifNil: [ Error signal: 'cannot resolve module with identifier ', aModuleIdentifier asString ]