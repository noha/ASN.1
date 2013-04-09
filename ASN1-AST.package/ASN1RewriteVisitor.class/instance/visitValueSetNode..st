visiting
visitValueSetNode: aValueSet 
	^ aValueSet elementsSpec: (self visit: aValueSet elementsSpec)