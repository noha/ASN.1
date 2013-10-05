private
writeDefiniteLongForm: aStream
	| data |
	data := self contentLength asByteArray.
	data size >= 127
		ifTrue: [^self error: 'Content length number of length must be smallter than 127'. ].

	aStream nextPut: (data size bitAt: 8 put: 1).
	aStream nextPutAll: data.