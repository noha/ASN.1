as yet unclassified
readFile: aString 
	^ (path / aString) readStream
		converter: self defaultConverter;
		contents