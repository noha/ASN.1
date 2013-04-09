*asn1-builder
modelFromAllFilesIn: aDirectoryPath
	^ (self astRootFromAllFilesIn: aDirectoryPath)
		buildModel