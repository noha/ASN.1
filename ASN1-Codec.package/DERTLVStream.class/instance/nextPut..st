bla
nextPut: aTuple
	aTuple first writeOn: stream.
        aTuple first isConstructed
            ifTrue: [
                | writeStream der |
                writeStream := WriteStream on: (stream species new: 1).
                (self class on: writeStream) nextPutAll: aTuple second.

                BERLength writeLength: writeStream contents size on: stream.
                stream nextPutAll: writeStream contents.
            ]
            ifFalse: [
                BERLength writeLength: aTuple second size on: stream.
                stream nextPutAll: aTuple second.
            ].
