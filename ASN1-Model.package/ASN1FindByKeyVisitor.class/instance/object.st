accessing
object
	(objects size > 1) ifTrue: [ 
		self error: 'multiple objects found with key', key asString ].
	^ objects 
		ifNotEmpty: [  objects first ]
		ifEmpty: [ nil ]