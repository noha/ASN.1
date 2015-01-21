visiting
visitExternalType: anExternalType
	| oid  value |
	value := self valueForType: anExternalType.
	oid := self 
		push: currentTaggedValue elements first
		during: [
			((currentTaggedValue tag clazz = 'UNIVERSAL') & (currentTaggedValue tag number = 6)) ifFalse: [ 
				ASN1UnexpectedType signal: 'expected external value' ]. 
			ASN1ObjectIdentifierType decode: currentTaggedValue contents ].
	value oid: oid.

	self 
		push: currentTaggedValue elements second
		during: [
			(ASN1UnresolvedOid oid: oid) signal
				ifNotNil: [:module|
					(currentTaggedValue tag number = 0) ifFalse: [ Error signal: 'unexpected tag number' ].
					value decoded: (self class new 
						objectFactory: objectFactory;
						factories: fieldFactories;
						read: currentTaggedValue elements first 
						usingModule: module
						as: value valueClass) ]
				ifNil:  [ value encoded: currentTaggedValue elements first ]].
	^ value