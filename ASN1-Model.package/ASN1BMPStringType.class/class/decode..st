codec
decode: aByteArray
	| byteStream |
	((aByteArray size \\ 2) = 0) ifFalse: [ Error signal: 'encoded BMPString needs to have an odd number of octets' ].
	byteStream := aByteArray readStream.
	^ String streamContents: [ :stream |
		[ byteStream atEnd ] whileFalse: [  
			stream nextPut: (Character value: (byteStream next: 2) asInteger) ] ]