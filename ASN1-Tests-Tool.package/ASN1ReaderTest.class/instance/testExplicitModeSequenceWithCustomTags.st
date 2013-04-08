as yet unclassified
testExplicitModeSequenceWithCustomTags
	| choice reader decoder grammar ast model result |
	result := self 
		readStream:  { 48. 10. 160. 3 . 2. 1. 24. 161. 3. 2. 1. 34 } readStream
		withBinding:  'ImplicitTaggedSequence'.
	self assert: result values first value = 24.
	self assert: result values second value = 34