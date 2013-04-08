as yet unclassified
testExplicitModeChoiceWithCustomTags
	| choice reader decoder grammar ast model result |
	result := self
		readStream:  { 160. 3. 2. 1. 24 } readStream
		withBinding: 'SimpleChoice'.
	self assert: result number  = 24.
