tests
testGlobalDeclarations
	| parsed |
	parsed := self parse: ASN1DefaultModuleLibrary globalDeclarations rule: #assignmentList.
	self assert: parsed first left label = 'itu-t'.
	self assert: parsed first right components first name = 'itu-t'.
	self assert: parsed first right components first number = 0.
	self assert: parsed second left label = 'iso'.
	self assert: parsed second right components first name = 'iso'.
	self assert: parsed second right components first number = 1.
	self assert: parsed third left label = 'joint-iso-itu-t'.
	self assert: parsed third right components first name = 'joint-iso-itu-t'.
	self assert: parsed third right components first number = 2