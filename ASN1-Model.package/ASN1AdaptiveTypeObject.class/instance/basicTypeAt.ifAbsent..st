accessing
basicTypeAt: aKey ifAbsent: aBlock
	^ type 
		elementAt: aKey 
		ifNone: aBlock