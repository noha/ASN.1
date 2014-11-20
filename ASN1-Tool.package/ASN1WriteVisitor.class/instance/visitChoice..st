visiting
visitChoice: aChoice
	| key type  |
	key := currentValue keys first.
	type := (aChoice elements detect: [:each| each key = key asn1Denormalized ]) value.
	^ self
		push: (currentValue at: key)
		during: [ self visit: type ].