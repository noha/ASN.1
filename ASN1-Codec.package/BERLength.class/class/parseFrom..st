decoding
parseFrom: aStream
	"create a BERLength instance by reading its values from a stream"
	| berLength octet number |
	berLength := self new.
	octet := aStream next asInteger.
	number := octet bitAnd: 16r7f.
	((octet bitAnd: 16r80) = 16r80)
		ifTrue: [ 
			(number = 0) 
				ifTrue: [ berLength definiteForm: false ]
				ifFalse: [ berLength contentLength: (self readMultipleOctets: number from: aStream) ]]
		ifFalse: [ berLength contentLength: number ].
	^ berLength 