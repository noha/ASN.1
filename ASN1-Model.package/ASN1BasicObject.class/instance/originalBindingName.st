accessing
originalBindingName
	"finds the left value of the assignment in the module where the type has been
	originally defined. Mostly useful for convenience and debugging purposes"
	^ self definingModule fields keyAtValue: self 