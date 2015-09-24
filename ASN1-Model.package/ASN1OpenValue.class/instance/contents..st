as yet unclassified
contents: anObject
	"we support setting encoded values as open types. This way both modi should be possible
	either it structured data that needs to be encoded or it is already encoded data"
	anObject isAsn1EncodedValue ifTrue: [ 
		contents := anObject.
		^ self ].
	"make sure that the open type has an ASN.1 value embedded. This is different to other 
	primitive values"
	contents := anObject isAsn1 
		ifTrue: [ anObject ]
		ifFalse: [ anObject asAsn1Value ]