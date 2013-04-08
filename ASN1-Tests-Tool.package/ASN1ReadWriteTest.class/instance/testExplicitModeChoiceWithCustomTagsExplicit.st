as yet unclassified
testExplicitModeChoiceWithCustomTagsExplicit
	|  result  array |
	result := self 
		readStream:  { 160. 3. 2. 1. 24 } readStream
		withBinding:  'SimpleChoice'.
	self assert: result number  = 24.
	array := self 
		encodeToByteArray: result
		withBinding:  'SimpleChoice'
		tagEnvironment: ASN1ExplicitTags. 
	self assert: (array = #[ 160 3 2 1 24 ] ).