as yet unclassified
contentsOfModuleNamed: aModuleName
	^ ASN1MissingModule signal: 'cannot find module ', aModuleName printString 