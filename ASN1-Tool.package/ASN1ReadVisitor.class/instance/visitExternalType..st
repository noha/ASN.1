visiting
visitExternalType: anExternalType
	| oid  value |
	value := ASN1ValueProxy new.
	oid := self 
		push: stack top elements first
		during: [
			((stack top tag clazz = 'UNIVERSAL') & (stack top tag number = 6)) ifFalse: [ 
				ASN1UnexpectedType signal: 'expected external value' ]. 
			ASN1ObjectIdentifierType decode: stack top contents ].
	value oid: oid.
	
	self 
		push: stack top elements second
		during: [
			(ASN1UnresolvedOid oid: oid) signal
				ifNotNil: [:module|
					(stack top tag number = 0) ifFalse: [ Error signal: 'unexpected tag number' ].
					value decoded: (self class new 
						model: model;
						read: stack top elements first 
						usingModule: module) ]
				ifNil:  [  value encoded: stack top elements first ]].
	^ value