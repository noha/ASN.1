*asn1-tool
read: aTaggedValue usingType: aType inContext: aContext skipErrors: aBoolean as: aClass reader: aVisitor
	^ [ aVisitor
			skipErrors: (aBoolean ifNil: [ false ]);
			read: aTaggedValue using: aType as: aClass]
				on: ASN1UnresolvedOid 
				do: [ :err | 
					err resume: (aContext 
						ifNotNil: [ aContext moduleDefiningOid: err oid ] ) ] 