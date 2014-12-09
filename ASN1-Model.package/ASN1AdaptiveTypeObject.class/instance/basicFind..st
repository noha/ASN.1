finding
basicFind: aKey
	map 
		at: aKey 
		ifPresent: [:elem| ^ elem ].
	^ self find: aKey in: map values  