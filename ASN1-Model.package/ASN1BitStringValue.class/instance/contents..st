accessing
contents: aCollectionOrString
	"we accept two forms of bits: either it is a collection with names of the bits
	or it is a binary string like '1011' where the position in the string denotes
	the postion of the bit"
	aCollectionOrString isString 
		ifTrue: [ self binaryStringValue: aCollectionOrString ]
		ifFalse: [ 
			(type bitNames includesAll: aCollectionOrString) ifFalse: [ 
				Error signal: 'bit string does not understand bit names: ', (aCollectionOrString difference: type bitNames) asString  ].
			self bits: aCollectionOrString ]