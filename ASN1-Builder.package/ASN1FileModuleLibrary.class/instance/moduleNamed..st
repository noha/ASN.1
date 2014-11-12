loading
moduleNamed: aString 
	Transcript show: self name asString, ': loading module ', aString asString; cr.
	^ self readFile: (self filename: aString)