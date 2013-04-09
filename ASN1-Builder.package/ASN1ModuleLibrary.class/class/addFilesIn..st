as yet unclassified
addFilesIn: aPathString
	| directory |
	directory := FileDirectory default directoryNamed: aPathString.
	(self asnFilesIn: directory) do: [:filename| | grammar |
		grammar := (StandardFileStream readOnlyFileNamed: (directory fullPathFor: filename)) contentsOfEntireFile.
		self compile: (self escape: grammar) selector: (self selectorNameFromFilename: filename)  ]
