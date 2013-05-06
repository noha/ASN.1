as yet unclassified
addFilesIn: aPathString withEncoding: anEncodingString
	| directory |
	directory := aPathString asFileReference.
	(directory filesMatching: '*.asn') do: [:fileReference| | grammar |
		grammar := (fileReference  readStream converter: (TextConverter newForEncoding: anEncodingString))  ascii contentsOfEntireFile.
		self compile: (self escape: grammar) selector: (self selectorNameFromFilename: fileReference basename)  ]
