tests
testClassWithMultipleConstraints
	self parse: 'TelephonyString ::=
  IA5String
    (FROM ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" | "*" |
           "#"))(SIZE (1..15))' rule: #assignmentList.