resolving
resolveReference: aReference
	(aReference isUnresolved) ifTrue: [ | def |
 		def := self resolveLabel: aReference label.
		def propertyAt: #referenced put: true.
		aReference definition: def ]