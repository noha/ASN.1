*asn1-builder
libraries
	^ self properties
		at: #libraryCollection
		ifAbsentPut: [ ASN1LibraryCollection new ]