as yet unclassified
clean: aModel
	self mappings associations do: [  :mapping |
		 (aModel typeNamed: mapping key) valueFactory: nil ]