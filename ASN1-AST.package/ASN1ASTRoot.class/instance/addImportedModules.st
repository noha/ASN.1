actions
addImportedModules
	"load modules that are imported by existing modules recursively"
	| list seen |
	list := LinkedList withAll: self modules.
	seen := OrderedCollection new.
	[ list notEmpty ] whileTrue: [ |module|
		module := list removeFirst. 
		(seen includes: module) ifFalse:[
			seen add: module.
			module importIdentifiers do: [:identifier|
				list addLast: (self moduleWithIdentifier: identifier) ]]]