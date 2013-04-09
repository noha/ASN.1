tests
testChoiceWithImplicitContextTags
	| nodes |
	nodes := self parse: ' CHOICE {present  [0] IMPLICIT present < InvokeId,
            absent   [1] IMPLICIT NULL
  }' rule: #choiceType.
	self assert: nodes elements second type tag tagNumber = '1'
