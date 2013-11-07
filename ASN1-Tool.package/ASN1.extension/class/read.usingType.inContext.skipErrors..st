*asn1-tool
read: aTaggedValue usingType: aType inContext: aContext skipErrors: aBoolean
	^ [ ASN1ReadVisitor new
			skipErrors: (aBoolean ifNil: [ false ]);
			read: aTaggedValue using: aType ]
				on: ASN1UnresolvedOid 
				do: [ :err | 
					err resume: (aContext 
						ifNotNil: [ aContext moduleDefiningOid: err oid ] ) ]