accessing
mapKeyForMessage: aSelector
	"^ aMessage selector asString asn1Denormalized"
	| result |
	result := aSelector copy.
	1 to: aSelector size do: [ :n |
		 ((aSelector at: n) = $-)
			ifTrue: [ result at: n put: $_ ] ].
	^ result