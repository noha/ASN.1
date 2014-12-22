accessing
originalBindingName
	"finds the left value of the assignment in the module where the type has been
	originally defined. Mostly useful for convenience and debugging purposes. 
	If multiple bindings reference the same value only one is returned.  So it is 
	possible that some names are not findable"
	^ self definingModule fields keyAtValue: self 