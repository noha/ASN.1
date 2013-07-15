resolving
moduleWithIdentifier: aModuleIdentifier
	"resolve a module by its identifier. If the identifier cannot be found resolve the module
	with its name. If no module is found throw a resumable exception so someelse can provide
	a module"
	^ self modules 
		detect: [:each| each identifier = aModuleIdentifier ]
		ifNone: [ 
			(self moduleWithName: aModuleIdentifier name label) 
				ifNotNil: [:module|
					Transcript 
						show: 'WARNING: did not find module by OID ', aModuleIdentifier oid oidString, 
								' only by name ', aModuleIdentifier name printString; 
						cr.
					module]
				ifNil: [ self inquireModuleWithIdentifier: aModuleIdentifier  ]]