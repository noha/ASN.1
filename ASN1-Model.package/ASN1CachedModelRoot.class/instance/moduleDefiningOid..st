accessing
moduleDefiningOid: anOid 
	^ modulesByOid 
		at: anOid
		ifAbsentPut: [ super moduleDefiningOid: anOid ]