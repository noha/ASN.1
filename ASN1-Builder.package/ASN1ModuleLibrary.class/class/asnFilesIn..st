as yet unclassified
asnFilesIn: aDirectory
	^ aDirectory fileNames select: [:each| each endsWith: '.asn' ]