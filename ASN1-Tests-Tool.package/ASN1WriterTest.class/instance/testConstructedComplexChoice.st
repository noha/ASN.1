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
	self assert: (array = #[164 6 165 4 131 2 49 49]).