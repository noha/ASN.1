as yet unclassified
testConstructedComplexChoice
	| data array |
	data := (self bindingAt: 'SequenceWithConstruction') newValue.
	data beSelfExpanding basicService
		at: 'ext-Teleservice' put: '11' asByteArray.

	array := self 
		encodeToByteArray: data
		withBinding:  'SequenceWithConstruction'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[164 6 165 4 131 2 49 49]).