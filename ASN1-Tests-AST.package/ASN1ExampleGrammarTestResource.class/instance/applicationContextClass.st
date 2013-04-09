as yet unclassified
applicationContextClass
	<definition: #example>
	^ 'APPLICATION-CONTEXT ::= CLASS {
   &Symmetric OPERATION-PACKAGE OPTIONAL,
   &InitiatorConsumerOf OPERATION-PACKAGE OPTIONAL,
   &ResponderConsumerOf OPERATION-PACKAGE OPTIONAL,
   &code OBJECT IDENTIFIER }
WITH SYNTAX {
   [ OPERATIONS OF &Symmetric ]
   [ INITIATOR CONSUMER OF &InitiatorConsumerOf ]
   [ RESPONDER CONSUMER OF &ResponderConsumerOf ]
     ID &code }
'
