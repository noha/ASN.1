as yet unclassified
matchesSyntax: aCollection
	[ self parseSyntax: aCollection ]
		on: Error
		do: [:err|  ^ false].
	^ true