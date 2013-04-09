tests
testChoiceType
	| alternativeTypeList |
	self parse: 'CHOICE {
  reroutingNumber    [0] IMPLICIT IsdnNumber,
  forwardedToNumber  [1] IMPLICIT IsdnNumber
}' rule: #choiceType.
	alternativeTypeList := 'foo Bar, name Type'.

	self parse: 'CHOICE {',alternativeTypeList,'}' rule: #choiceType.
	self parse: 'CHOICE {',alternativeTypeList,',... }' rule: #choiceType.
	self parse: 'CHOICE {',alternativeTypeList,' ... ,',alternativeTypeList,'}' rule: #choiceType.
	self parse: 'CHOICE {', alternativeTypeList,' ... ! Foo:bar','}' rule: #choiceType.
