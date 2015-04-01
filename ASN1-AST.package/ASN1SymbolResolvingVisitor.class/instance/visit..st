visiting
visit: anObject

	super visit: anObject.
	"In order to be able to associate definitions to their modules
	we tag every object with its module. Only references can be in 
	separate modules so we don't treat them. The defintion of a
	reference will be treated in their respective module anyway"
	(anObject notNil & anObject isAsn1ReferenceNode not) ifTrue: [
			anObject propertyAt: #definingModule put: module ]