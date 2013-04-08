as yet unclassified
testImplicitModeSequenceWithCustomTags
	| result |
	result := self
		readStream:  { 160. 6. 128. 1. 24. 129. 1. 34 } readStream
		withBinding: 'ImplicitTaggedSequence'
		tagEnvironment: ASN1ImplicitTags.
	self assert: result values first value = 24.
	self assert: result values second value = 34