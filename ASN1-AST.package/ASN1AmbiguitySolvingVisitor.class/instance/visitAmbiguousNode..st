visiting
visitAmbiguousNode: anAmbiguousType
	"^ (anAmbiguousType alternatives detect: [:each| | type |
		type := each properties at: #definition ifAbsent: [ nil ].
		each matchesType: type ])"
	^ anAmbiguousType alternatives 
		detect: [:each| each resolvesIn: self module ]
	