as yet unclassified
basicFind: aKey
	self 
		at: aKey 
		ifPresent: [:elem| ^ elem ].
	^ self find: aKey in: values  