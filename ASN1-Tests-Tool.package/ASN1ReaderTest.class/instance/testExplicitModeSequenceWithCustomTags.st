as yet unclassified
testExplicitModeSequenceWithCustomTags
	| result |
	result := self 
		readStream:  { 48. 10. 160. 3 . 2. 1. 24. 161. 3. 2. 1. 34 } readStream
		withBinding:  'ImplicitTaggedSequence'.
	self assert: result number = 24.
	self assert: result othernumber = 34