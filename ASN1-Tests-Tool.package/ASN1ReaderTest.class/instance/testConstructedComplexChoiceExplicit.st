as yet unclassified
testConstructedComplexChoiceExplicit
	| result |
	result := self
		readStream:  #[164 10 48 8 165 6 163 4 4 2 49 49] readStream
		withBinding: 'SequenceWithConstruction'.
		
	self assert: result basicService ext_Teleservice = '11'.
