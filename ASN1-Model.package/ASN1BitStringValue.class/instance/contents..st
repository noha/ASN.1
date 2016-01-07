accessing
contents: aCollectionOrString
	"enable the setting for the bit string either as binary string or as collection of
	bit names."
	aCollectionOrString isString 
		ifTrue: [ 
			contents := aCollectionOrString.
			self adjustContentsSize ]
		ifFalse: [ self namedBits: aCollectionOrString ]
	