actions
addModuleFrom: aString
	"add module from a text source. Prevent modules being added if parsing has gone
	wrong"
	^ self addModule: (self parseModuleFrom: aString)
