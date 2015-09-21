as yet unclassified
applyTo: aModel
	self mappings associations do: [  :mapping |
		 (aModel typeNamed: mapping key) valueFactory: mapping value ]