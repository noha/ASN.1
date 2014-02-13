adding
addBit: aString
	(self type hasBitNamed: aString) ifFalse: [ Error signal: 'not a valid bit name for this type' ].
	self bits add: aString