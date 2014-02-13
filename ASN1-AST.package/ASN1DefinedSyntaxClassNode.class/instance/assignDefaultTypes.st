as yet unclassified
assignDefaultTypes
	"default values should have type information. It is safe to set it to the fields type if
	not already set otherwise"
	self fields do: [ :field |
		field hasDefaultValue ifTrue: [ 
			field defaultValue type ifNil: [
				field defaultValue type: field type ] ] ]