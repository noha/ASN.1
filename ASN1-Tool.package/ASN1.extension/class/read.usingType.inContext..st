*asn1-tool
read: aTaggedValue usingType: aType inContext: aContext
	^ [ ASN1ReadVisitor new
		read: aTaggedValue using: aType ]
			on: ASN1UnresolvedOid 
			do: [ :err | 
				err resume: (aContext 
					ifNotNil: [ aContext moduleDefiningOid: err oid ] ) ]