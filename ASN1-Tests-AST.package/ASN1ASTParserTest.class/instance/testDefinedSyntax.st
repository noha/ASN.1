tests
testDefinedSyntax
	| parsed | 
	parsed := self parse: 'CLASS {
   &Symmetric OPERATION-PACKAGE OPTIONAL,
   &InitiatorConsumerOf OPERATION-PACKAGE OPTIONAL,
   &ResponderConsumerOf OPERATION-PACKAGE OPTIONAL,
   &code OBJECT IDENTIFIER }
WITH SYNTAX {
   [ OPERATIONS OF &Symmetric ]
   [ INITIATOR CONSUMER OF &InitiatorConsumerOf
     RESPONDER CONSUMER OF &ResponderConsumerOf ]
     ID &code }' ruleSelector: #objectClassDefn.
	self assert: parsed fields size = 4         