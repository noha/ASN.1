*asn1-tool
read: aTaggedValue usingType: aType inContext: aContext
	^ [ self readVisitorClass new
		read: aTaggedValue using: aType ]
			on: ASN1UnresolvedOid 
			do: [ :err | 
				err resume: (aContext 
					ifNotNil: [ aContext moduleDefiningOid: err oid ] ) ]