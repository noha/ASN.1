accessing
bitIndexOf: aString 
	^ (self bits detect: [ :each | each name = aString ]) value