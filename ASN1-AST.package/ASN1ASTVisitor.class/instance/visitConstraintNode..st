visiting
visitConstraintNode: aConstraint
	self visit: aConstraint constraint.
	self flag: #hack.
	self visit: aConstraint exception.
	^ aConstraint