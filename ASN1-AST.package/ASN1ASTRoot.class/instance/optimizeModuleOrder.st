as yet unclassified
optimizeModuleOrder
	modules := modules copy sort: [ :a :b |
		b imports anySatisfy: [:import| import moduleIdentifier name label= a identifier name ] ] 