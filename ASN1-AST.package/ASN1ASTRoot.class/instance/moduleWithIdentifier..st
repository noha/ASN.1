resolving
moduleWithIdentifier: aModuleIdentifier
	^ self modules 
		detect: [:each| each identifier = aModuleIdentifier ]
		ifNone: [ 
			(self moduleWithName: aModuleIdentifier name label) 
				ifNotNil: [:module|
					Transcript show: 'WARNING: did not find module by OID ',aModuleIdentifier oid oidString, ' only by name ', aModuleIdentifier name printString; cr.
				module]
				ifNil: [ nil ] ]