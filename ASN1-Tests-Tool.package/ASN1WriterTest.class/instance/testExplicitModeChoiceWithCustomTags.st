as yet unclassified
testExplicitModeChoiceWithCustomTags
	| array |
	array := self 
		encodeToByteArray: (ASN1Dictionary new
				at: 'number' put: 24;
				yourself)
		withBinding:  'SimpleChoice'
		tagEnvironment: ASN1ExplicitTags.
	self assert: (array = #[ 160 3 2 1 24 ]).