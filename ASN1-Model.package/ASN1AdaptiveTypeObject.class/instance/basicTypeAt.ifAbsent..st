as yet unclassified
basicTypeAt: aKey ifAbsent: aBlock
	^ (type 
		elementAt: aKey 
		ifNone: aBlock) value basicType