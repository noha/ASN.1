resolving
pduForModule: aModule
	| visitor  pdu |
	visitor := ASN1PDUFindingVisitor new.
	visitor visit: aModule.
	(visitor candidates size = 1)
		ifTrue: [ pdu := visitor candidates associations first ].
	(visitor candidates size > 1)
		ifTrue: [ 
			(visitor candidates associations select: [:each| (each value label indexOfSubCollection: 'PDU') > 0])
				ifNotEmpty: [:pdus|
					(pdus size = 1) 
						ifTrue: [ pdu := pdus first ]
						ifFalse: [ Error signal: 'could not determine pdu spec, ',pdus size asString, ' alternatives left']]].
	pdu isNil ifTrue: [ ^ nil ].
	(aModule assignments detect: [:each| each left = pdu value ])
		propertyAt: #PDU put: true
	