as yet unclassified
loadModuleWithFilename: aFilename
	| filename |
	filename := String streamContents: [:stream|
		stream
			nextPutAll: self path;
			nextPutAll: aFilename ].
	Transcript show: 'loading module ', filename; cr.
	 ^ (StandardFileStream readOnlyFileNamed: filename) contents