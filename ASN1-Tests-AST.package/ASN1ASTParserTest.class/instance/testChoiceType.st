tests
testChoiceType
	| parsed |
	parsed := self parse: 'CHOICE {
  reroutingNumber    [0] IMPLICIT IsdnNumber,
  forwardedToNumber  [1] IMPLICIT IsdnNumber
}' rule: #choiceType.
	self assert: (parsed elements size = 2).
	self assert: (parsed elements first name = 'reroutingNumber').
