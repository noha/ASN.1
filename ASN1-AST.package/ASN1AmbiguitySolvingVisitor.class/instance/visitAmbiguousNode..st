visiting
visitAmbiguousNode: anAmbiguousType
	"^ (anAmbiguousType alternatives detect: [:each| | type |
		type := each properties at: #definition ifAbsent: [ nil ].
		each matchesType: type ])"
	| type |
	type := ASN1ClosestTypeDefinition value.
	^ anAmbiguousType alternatives 
		detect: [:each| each canBeAssignedTo: type ]