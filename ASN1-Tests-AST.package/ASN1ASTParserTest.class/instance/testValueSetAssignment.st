tests
testValueSetAssignment
	| parsed |
	parsed := self parse: 'Supported-MAP-Operations OPERATION ::= {updateLocation | cancelLocation | purgeMS | 
sendIdentification | updateGprsLocation | prepareHandover | sendEndSignal | 
processAccessSignalling
}
' rule: #assignmentList.
	self assert: parsed first right class = ASN1ValueSetNode  