as yet unclassified
classLabelOf:  aNumber
	((aNumber bitAnd: 3) = 0) ifTrue: [
		^ 'UNIVERSAL' ].
	((aNumber bitAnd: 3) = 1) ifTrue: [
		^ 'APPLICATION' ].
	((aNumber bitAnd: 3) = 2) ifTrue: [
		^ nil ].
	((aNumber bitAnd: 3) = 3) ifTrue: [
		^ 'PRIVATE' ].
	Error signal: 'invalid tag class number'