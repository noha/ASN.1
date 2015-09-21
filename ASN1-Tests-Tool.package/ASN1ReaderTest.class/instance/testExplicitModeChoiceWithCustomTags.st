as yet unclassified
testExplicitModeChoiceWithCustomTags
	| result |
	result := self
		readStream:  { 160. 3. 2. 1. 24 } readStream
		withBinding: 'SimpleChoice'.
	self assert: result number = 24.
