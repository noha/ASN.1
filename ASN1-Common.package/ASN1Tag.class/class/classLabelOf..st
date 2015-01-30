as yet unclassified
classLabelOf:  aNumber
	| label |
	label := aNumber bitAnd: 3.
	(label = 0) ifTrue: [
		^ 'UNIVERSAL' ].
	(label = 1) ifTrue: [
		^ 'APPLICATION' ].
	(label = 2) ifTrue: [
		^ nil ].
	(label = 3) ifTrue: [
		^ 'PRIVATE' ].
	Error signal: 'invalid tag class number'