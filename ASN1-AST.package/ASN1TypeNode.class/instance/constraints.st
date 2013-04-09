accessing
constraints
	^ self propertyAt: #constraints ifAbsentPut: [ Set new]