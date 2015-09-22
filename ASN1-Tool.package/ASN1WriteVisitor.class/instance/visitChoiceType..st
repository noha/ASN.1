visiting
visitChoiceType: aChoice
	| key type  |
	key := currentValue keys first.
	type := (aChoice elements associations detect: [:each| each key = key asn1Denormalized ]) value.
	^ self
		push: (currentValue basicAt: key)
		during: [ self visit: type ].