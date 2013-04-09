printing
printOn: aStream
	"identifier encodingReferenceDefault tagDefault extensionDefault exports imports assignments encodingControlSections"
	identifier printOn: aStream.
"	aStream nextPut: Character cr.
	
	aStream nextPutAll: '[exports] '.
	exports printOn: aStream.
	aStream nextPut: Character cr.
	
	aStream nextPutAll: '[imports] '.
	imports printOn: aStream.
	aStream nextPut: Character cr.
	
	aStream nextPutAll: '[assignments] '.
	assignments ifNotNil: [
		assignments do: [:each|
			each printOn: aStream
			] separatedBy: [ aStream nextPut: Character cr].
		aStream nextPut: Character cr ]."