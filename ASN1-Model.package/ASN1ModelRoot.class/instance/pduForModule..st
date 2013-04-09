as yet unclassified
pduForModule: aModule
	| visitor  pdu |
	visitor := ASN1PDUFindingVisitor new.
	visitor visit: aModule.
	(visitor candidates size = 1)
		ifTrue: [ pdu := visitor candidates associations first ].
	(visitor candidates size > 1)
		ifTrue: [ 
			(visitor candidates associations select: [:each| each value label includesSubString: 'PDU'])
				ifNotEmpty: [:pdus|
					(pdus size = 1) 
						ifTrue: [ pdu := pdus first ]
						ifFalse: [ Error signal: 'could not determine pdu spec, ',pdus size asString, ' alternatives left']]
				ifEmpty: [ Error signal: 'could not determine pdu. None found']].
	^ aModule fields associations detect: [:each| each left = pdu value ]
	