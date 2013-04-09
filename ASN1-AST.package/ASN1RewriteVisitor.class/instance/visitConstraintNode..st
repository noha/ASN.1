visiting
visitConstraintNode: aNode
	self flag: #disabledForNow.
	"aNode constraint: (self visit: aNode constraint)."
	aNode exception: (self visit: aNode exception).
	^ aNode