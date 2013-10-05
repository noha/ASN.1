initialize-release
readFrom: aStream
	"Who is using that? There is BERLength>>#parseFrom:?"
	^ self hasDefiniteForm 
		ifTrue: [ 
			((aStream size - aStream position) >=  self contentLength) ifFalse: [ self halt ]. 
			aStream next: self contentLength ]
		ifFalse: [ 
			ByteArray streamContents: [:writeStream| | byte |
				byte := aStream next.
				[ (byte = 0) and: [ aStream peek = 0 ]] whileFalse: [
					writeStream nextPut: byte.
					byte := aStream next ].
				aStream next ]]