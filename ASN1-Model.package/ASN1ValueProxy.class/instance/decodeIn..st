accessing
decodeIn: aModel
	^ decoded ifNil: [
		decoded := (aModel moduleDefiningOid: oid)
			read: encoded.
		decoded ]