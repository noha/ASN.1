actions
addModuleFrom: aString
	"add module from a text source. Prevent modules being added if parsing has gone
	wrong"
	| module |
	module := self parseModuleFrom: aString.
	module isPetitFailure
		ifFalse: [ self addModule: module ]
		ifTrue: [ Transcript show: 'failed to parse module from file named ', aString asString; cr ]