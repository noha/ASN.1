as yet unclassified
contents: aString
	| hexString |
	hexString := aString size odd
		ifTrue: [ '0', aString ]
		ifFalse: [ aString ].
	contents := String streamContents: [ :stream |	
		(ByteArray readHexFrom: hexString) do: [ :byte |
			stream nextPutAll: (byte printStringBase: 2 nDigits: 8) ]]