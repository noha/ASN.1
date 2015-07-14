as yet unclassified
testEnumeratedWithExtension
	"constrcut a enumerated type containing an extension and try to read it. The enumerated type should
	skip the extension "
	| result |
	result := ASN1 
		read: (ASN1PrimitiveTaggedValue new
			contents: #[ 3 ];
			tag: (ASN1Tag clazz: 'CONTEXT' number: 3 ))
		usingType: (ASN1EnumeratedType new 
			elements: {
				ASN1NamedNumber new name: 'foo';  number: 1.
				ASN1Extension new.
				ASN1NamedNumber new name: 'bar'; number: 3 }).
	self assert: result equals: 'bar'