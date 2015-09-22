as yet unclassified
testEnumeratedValue
	| type value encoded |

	type := ASN1EnumeratedType new 
		elements: { 
			ASN1NamedNumber  name: 'one' number: 1 .
			ASN1NamedNumber  name: 'two' number: 2 .
			ASN1NamedNumber  name: 'three' number: 3
			}.
	
	value := type newValue.
	value basicValue: 'two'.
	encoded := ASN1 write: value usingType: type.
	self assert: encoded contents = #[2].
	self assert: encoded tag number = 10
	
	
	