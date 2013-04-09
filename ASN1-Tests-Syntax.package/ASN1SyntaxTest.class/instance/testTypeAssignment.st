tests
testTypeAssignment
	self parse: 'PersonnelRecord ::= [APPLICATION 0] SET { 
		name                  Name,
      	title                    VisibleString,
		number               EmployeeNumber,
		dateOfHire         Date,
		nameOfSpouse   Name,
		children              SEQUENCE OF ChildInformation DEFAULT {}
	}' rule: #typeAssignment.
	
	self parse: 'FrameOffset          ::= INTEGER   (0 | 8..20)' rule: #typeAssignment.
	self parse: 'RlcFrequencyList     ::= SEQUENCE  (SIZE(32)) OF PairOfCarrierFrequencies' rule: #typeAssignment.
	self parse: 'Abort ::= SEQUENCE { dtid    DestTransactionID }' rule: #typeAssignment.
	self parse: 'DialoguePortion ::= [APPLICATION 11] EXPLICIT EXTERNAL' rule: #typeAssignment.
	self parse: 'OrigTransactionID ::= [APPLICATION 8]  OCTET STRING(SIZE (1..4))' rule: #typeAssignment.