as yet unclassified
writeOn: aStream
	(self hasDefiniteForm) 
		ifTrue: [(self contentLength < 16r7f)
			ifTrue:[ aStream nextPut: self contentLength ]
			ifFalse: [ self halt ]]
		ifFalse: [ aStream nextPut: 128 ]