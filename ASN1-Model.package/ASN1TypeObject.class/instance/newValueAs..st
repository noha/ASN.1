instance-creation
newValueAs: aClass
	"restrict overriding of value classes to subclasses of the default value class. This 
	way we are not hiding subtle bugs if a misplaced class is provided here"
	(aClass inheritsFrom: self basicType asn1ValueClass) ifFalse: [ 
		Error signal: 'incompatible value class for ', self asString ]. 
	^ aClass new
		type: self basicType