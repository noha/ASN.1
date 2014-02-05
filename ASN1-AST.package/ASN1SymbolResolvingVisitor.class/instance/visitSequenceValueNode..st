visiting
visitSequenceValueNode: aNode 
	"Resolve each named value in the nodes' elements to a sequence type slot
	value. Each named values 'name' refers to a slot in the sequence type. The
	named values 'value' refers to a value defined by that slot being found"
	aNode resolvedValue: (
		aNode elements collect: [ :namedValue | | type |
			namedValue name -> 
				((self resolveLabel: namedValue name)
					 type bindingOf: namedValue value label) ] ) 