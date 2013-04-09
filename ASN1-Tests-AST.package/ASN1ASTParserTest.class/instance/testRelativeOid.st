tests
testRelativeOid
	| parsed components |
	parsed := self parse: 'gsm-MessagingId OBJECT IDENTIFIER ::= 
        {mobileDomainId gsm-Messaging (4)}' rule: #assignmentList.
	components := parsed first right components.
	self assert: (components first isAsn1ReferenceNode).
	self assert: (components second number = 4)