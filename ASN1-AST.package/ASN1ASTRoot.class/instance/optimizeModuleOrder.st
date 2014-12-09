as yet unclassified
optimizeModuleOrder
	modules := modules copy sort: [ :a :b |
		a imports anySatisfy: [:import| import moduleIdentifier name label= b identifier name ] ] 