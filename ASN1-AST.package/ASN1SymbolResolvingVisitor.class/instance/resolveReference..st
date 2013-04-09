resolving
resolveReference: aReference
	(aReference isUnresolved) ifTrue: [ | def |
		def := self resolveLabel: aReference label.
		def propertyAt: #referenced put: true.
		aReference module: scope moduleDefinition.
		aReference definition: (def ifNil: [ self halt ]) ]