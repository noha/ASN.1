as yet unclassified
testExplicitModeChoiceWithCustomTags
	| array data |
	data := (self bindingAt: 'SimpleChoice') newValue.
	array := self 
		encodeToByteArray: (data
				at: 'number' put: 24;
				yourself)
		withBinding:  'SimpleChoice'
		tagEnvironment: ASN1ExplicitTags.
	self assert: (array = #[ 160 3 2 1 24 ]).