X.680 grammar
encodingInstructionsAssignmentList
	self flag: #incomplete.
	self flag: #nottested.
	^ 'encodingInstructionsAssignmentList' asParser star ==> [:n| n ]