as yet unclassified
tagEnvironment: aTaggingMode
	aTaggingMode ifNil: [  ^ self  ].
	self propertyAt: #tagEnvironment put: aTaggingMode 