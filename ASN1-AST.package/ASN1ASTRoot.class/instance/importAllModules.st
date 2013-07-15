actions
importAllModules
	"read recursively imported modules. start with a list of modules and resolve all imports.
	 If imports are found that are not already loaded put them at the end of the list."
	| list |
	list := LinkedList withAll: self modules.
	[ list notEmpty ] whileTrue: [ |module|
		module := list removeFirst. 
		(self importsOfModule: module identifier) do: [:identifier| | mod |
			(self moduleWithIdentifier: identifier) ifNil: [ 
				self addModuleFrom: (ASN1MissingModule new identifier: identifier; signal).
				mod := self moduleWithIdentifier: identifier.
				mod ifNil: [^self error: 'Failed to resolve identifier to module'].
				list addLast: mod]]]