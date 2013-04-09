as yet unclassified
operationPackageClass
	<definition: #example>
	^ 'OPERATION-PACKAGE ::= CLASS {
  &Both      OPERATION OPTIONAL,
  &Consumer  OPERATION OPTIONAL,
  &Supplier  OPERATION OPTIONAL,
  &id        OBJECT IDENTIFIER UNIQUE OPTIONAL
}
-- continued on the next page
WITH SYNTAX {
  [OPERATIONS &Both]
  [CONSUMER INVOKES &Supplier]
  [SUPPLIER INVOKES &Consumer]
  [ID &id]
}

'
