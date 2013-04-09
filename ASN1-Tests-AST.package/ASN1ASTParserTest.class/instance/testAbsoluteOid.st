tests
testAbsoluteOid
	| parsed |
	parsed := self parse: 'mobileDomainId OBJECT IDENTIFIER ::= 
        {itu-t (0) identified-organization (4) etsi (0) mobileDomain (0)}' rule: #assignmentList.
	self assert: (parsed first right oidString =  '0.4.0.0')