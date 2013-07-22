as yet unclassified
classNumberOf: aString
	(aString = 'UNIVERSAL') ifTrue: [
		^ 0 ].
	(aString = 'APPLICATION') ifTrue: [
		^  1 ].
	aString isNil ifTrue: [
		^ 2 ].
	(aString = 'PRIVATE') ifTrue: [
		^ 3 ].
	Error signal: 'class identifier cannot be found'