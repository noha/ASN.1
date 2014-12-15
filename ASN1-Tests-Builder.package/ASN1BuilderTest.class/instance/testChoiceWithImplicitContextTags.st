as yet unclassified
testChoiceWithImplicitContextTags 
	| model |
	model := self modelBindingValue:  'ChoiceWithImplicitTaggedTypes'.
	self assert: model elements first value tag = (ASN1Tag new clazz: nil; number: 0).
	self assert: model elements second value tag = (ASN1Tag new clazz: nil; number: 1).