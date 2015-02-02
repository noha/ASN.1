codec
decode: aByteArray
	| byteStream |
	byteStream := aByteArray readStream.
	^ String streamContents: [ :stream | 
		[ byteStream atEnd ] whileFalse: [  
			stream nextPut: (Character value: (byteStream next: 4) asInteger) ] ]