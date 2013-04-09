visiting
visitModuleDefinitionNode: aNode
	aNode assignments do: [:each| self candidates at: each right put: each left].
	self visitAll: aNode assignments.