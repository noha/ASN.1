as yet unclassified
resolveReferencesOf: aCollection
	"dereferencing values needs improvement"
	self flag: #hack.
	^ aCollection collect: [:each|
		(each isAsn1ReferenceNode )  
			ifTrue: [ 
				ASN1ObjectIdComponentNode new
					number: each definition value value asInteger;
					name: each label]
			ifFalse: [ each ]]