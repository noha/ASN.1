as yet unclassified
personnelNotation
	^ 'PersonnelRecord ::= [APPLICATION 0] SET
{
      name                  Name,
      title                    VisibleString,
	number               EmployeeNumber,
	dateOfHire         Date,
	nameOfSpouse   Name,
	children              SEQUENCE OF ChildInformation DEFAULT {}
}

ChildInformation ::= SET { 
	name	               Name,
	dateOfBirthDate  Date
}

Name ::= [APPLICATION 1] SEQUENCE
{	
	givenName  VisibleString,
	initial           VisibleString,
	familyName VisibleString
}

EmployeeNumber ::= [APPLICATION 2] INTEGER

Date ::= [APPLICATION 3] VisibleString -- YYYY MMDD '