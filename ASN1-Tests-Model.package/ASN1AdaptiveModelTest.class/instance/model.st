as yet unclassified
model
	^ ASN1SequenceType new
		elements: { 
			'firstElement' -> (
				ASN1SequenceType new
					elements: { 
						'firstElement' -> ASN1OctetStringType new.
						'secondElement' -> ASN1IntegerType new } asDictionary).
			'secondElement' -> ASN1OctetStringType new } asDictionary 