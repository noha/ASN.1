accessing
parameters: aCollection
	"((aCollection notNil and: [aCollection notEmpty]) and: [ aCollection first isCollection ]) ifTrue: [ self halt ]."
	^ self propertyAt: #parameters put: aCollection