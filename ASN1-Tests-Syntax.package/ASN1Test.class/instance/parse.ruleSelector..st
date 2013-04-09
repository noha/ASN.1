accessing
parse: aString ruleSelector: aSymbol
	| production |
	production := self parserInstance.
	aSymbol = #start
		ifFalse: [ production := production perform: aSymbol ].
	result := production end parse: aString.
	self
		deny: result isPetitFailure
		description: 'Unable to parse ' , aString printString
		resumable: true.
	^ result