tests
testObjectAssignment
	self parse: 'mapSpecificAS ABSTRACT-SYNTAX ::= {
  MapSpecificPDUs
  IDENTIFIED BY  gsm-MessagingId
}' rule: #objectAssignment.
