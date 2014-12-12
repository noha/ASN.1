as yet unclassified
expandKey: aKey
	| fieldType |
	map at: aKey ifPresent: [ :v | ^ v ].
	fieldType := self basicTypeAt: aKey.
	^ (self 
		valueMapAt: fieldType 
		ifAbsent: [ 
			map
				at: aKey
				put: (fieldType asAsn1Value parent: self) ])
		selfExpanding: selfExpanding 