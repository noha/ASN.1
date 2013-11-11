as yet unclassified
testConstructedComplexChoice
	| result |
	result := self
		readStream:  #[164 5 165 3 131 1 17] readStream
		withBinding: 'SequenceWithConstruction'.
		
	self assert: result basicService ext_Teleservice = '11'.
