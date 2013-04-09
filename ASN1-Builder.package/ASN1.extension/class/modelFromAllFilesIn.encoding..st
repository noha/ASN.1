*asn1-builder
modelFromAllFilesIn: aDirectoryPath encoding: anEncoding
	^ (self astRootFromAllFilesIn: aDirectoryPath encoding: anEncoding)
		buildModel