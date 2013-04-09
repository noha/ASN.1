X.681 grammar
objectClassDefn
	^ super objectClassDefn ==> [:nodes| 
		(nodes second isNil 
			ifTrue: [ ASN1DefaultSyntaxClassNode new ]
			ifFalse: [ ASN1DefinedSyntaxClassNode new syntax: nodes second ])
				fields: nodes first ]