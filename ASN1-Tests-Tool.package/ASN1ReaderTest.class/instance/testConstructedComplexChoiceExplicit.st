as yet unclassified
testConstructedComplexChoiceExplicit
	| result |
	result := self
		readStream:  #[164 9 48 7 165 5 163 3 131 1 17] readStream
		withBinding: 'SequenceWithConstruction'.
		
	self assert: result basicService ext_Teleservice = '11'.
