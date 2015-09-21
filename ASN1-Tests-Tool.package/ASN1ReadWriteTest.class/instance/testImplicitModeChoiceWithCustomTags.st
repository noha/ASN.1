as yet unclassified
testImplicitModeChoiceWithCustomTags
	| result array |
	result := self 
		readStream:  { 128 . 1. 24 } readStream
		withBinding:  'SimpleChoice'
		tagEnvironment: ASN1ImplicitTags.
	self assert: result number = 24.
	array := self 
		encodeToByteArray: result
		withBinding:  'SimpleChoice'
		tagEnvironment: ASN1ImplicitTags. 
	self assert: (array = #[ 128  1 24 ] ).