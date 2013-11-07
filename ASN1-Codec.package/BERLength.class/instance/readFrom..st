initialize-release
readFrom: aStream
	"we are an instance of a length specification. This method reads the computate length
	of bytes from a stream and returns them"
	^ self hasDefiniteForm 
		ifTrue: [ 
			((aStream size - aStream position) >=  self contentLength) ifFalse: [ ^ ASN1StreamError  new ]. 
			aStream next: self contentLength ]
		ifFalse: [ 
			ByteArray streamContents: [:writeStream| | byte |
				byte := aStream next.
				[ (byte = 0) and: [ aStream peek = 0 ]] whileFalse: [
					writeStream nextPut: byte.
					byte := aStream next ].
				aStream next ]]