as yet unclassified
basicTypeAt: aKey ifNone: aBlock
	^ (type 
		elementAt: aKey 
		ifNone: aBlock) value basicType