as yet unclassified
testConstructedComplexChoice
	| data array |
	data := ASN1Dictionary new
		at: 'basicService' put: (ASN1Dictionary new
			at: 'ext-Teleservice' put: '11';
			yourself);
		yourself.
	array := self 
		encodeToByteArray: data
		withBinding:  'SequenceWithConstruction'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[164 5 165 3 131 1 17]).