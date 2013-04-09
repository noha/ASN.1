as yet unclassified
visitChoice: aChoice
	| key type encoded |
	key := stack top keys first.
	type := (aChoice elements detect: [:each| each key = key asn1Denormalized ]) value.
	^ self
		push: (stack top at: key)
		during: [ self visitDecoded: type ].