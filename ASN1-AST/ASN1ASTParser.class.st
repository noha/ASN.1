Class {
	#name : #ASN1ASTParser,
	#superclass : #ASN1Syntax,
	#category : 'ASN1-AST'
}

{ #category : #'X.683 grammar' }
ASN1ASTParser >> actualParameterList [
	^ super actualParameterList "==> [:nodes| self halt ]"
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> ambiguousMatch: aProductionSymbol withAlternatives: aCollection [ 
	"try to parse a set of alternatives that all match the same rule. The 
	match needs to be determined in a later step. At the same time track
	stream progress for the case the rule fails we need to reset the stream
	to its old position like a normal production rule would do"
	^ self 
		parseAmbiguous: (super perform: aProductionSymbol withArguments: #()  inSuperclass: ASN1Syntax )  
		using: [:parsed :contents|
			parsed isAsn1Node 
				ifTrue: [ parsed ]
				ifFalse: [ | alt |
					alt := (aCollection
							collect: [:each| self class parse: contents startingAt: each ])
								select: [:each| each isPetitFailure not ].
					alt ifEmpty: [ Error signal: 'could not find alternative for ambiguous node' ].
					"alternative types do not parse equally under all cicrumstances. Regarding 
					the matched pattern only one type could match. In that case we try to look
					like a normal production rule and return a single value"
					(alt size = 1) 
						ifTrue: [ alt anyOne ]
						ifFalse: [
							ASN1AmbiguousNode new
								name: (aProductionSymbol, ' ambiguity') asString;
								alternatives: alt ]]]
]

{ #category : #'x.680 grammer 1998' }
ASN1ASTParser >> anyType [
	^ super anyType ==> [:nodes| 
		ASN1AnyTypeNode new
			id: (nodes second 
				ifNotNil: [ nodes second third asn1Reference ]
				ifNil: [ nil ]) ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> assignmentList [
	^ super assignmentList
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> bString [ 
	^ super bString ==> [:nodes| 
		ASN1BinaryBitStringValueNode new
			type: (ASN1BitStringTypeNode new); 
			value: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> bitStringType [
	^ super bitStringType ==> [:nodes| | bitString |
		bitString := ASN1BitStringTypeNode new.
		nodes second notNil ifTrue: [
			bitString bits: nodes second second ].
		bitString ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> bitStringValue [
	^ self
	 	ambiguousMatch: #bitStringValue 
		withAlternatives: #( valueSet objectSet bitStringValuePlain)
							
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> bitStringValuePlain [
	^ super bitStringValue ==> [:nodes|
		"this is an empty bit string value so we assign a type without bits"
		ASN1BitStringValueNode new
			value: (nodes ifNil: [ Array new ] ) ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> booleanType [
	^ super booleanType ==> [:node|
		ASN1BooleanTypeNode name: node ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> booleanValue [
	^ super booleanValue ==> [:nodes|
		ASN1BooleanValueNode new 
			type: (ASN1BooleanTypeNode new); 
			value: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> builtinValue [
	^ super builtinValue ==> [:nodes| nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> choiceType [
	^ super choiceType ==> [:nodes|   
		ASN1ChoiceNode new
			elements: nodes first;
			rest: (nodes copyFrom: 2 to: 4)] 
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> choiceValue [
	^ super choiceValue ==> [:n|
		ASN1ChoiceValueNode new 
			choice: n first;
			value: n third ] 
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> componentType [
	^ super componentType ==> [:nodes|
		(nodes first = 'COMPONENTS OF') 
			ifTrue: [ ASN1ComponentsOfNode new type: nodes second ]
			ifFalse: [ | component |
				component := ASN1ComponentTypeNode new 
					type: nodes first.
				nodes second ifNotNil: [ 
					component modifiers: ((nodes second = 'OPTIONAL')
						ifTrue: [ ASN1ModifierOptionalNode new ]
						ifFalse: [ ASN1ModifierDefaultValueNode new value: nodes second second ])].
				component ]]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> componentTypeLists [ 
	" there can be quite a few combinations of components, extensions and extensionadditions.
	Extension comes as string and the others as collection"
	^ super componentTypeLists ==> [:nodes| | col |
		col := OrderedCollection new. 
		(nodes reject: #isNil) do: [ :each |
			(each isCollection and: [ each isString not ])
				ifTrue: [ col addAll: each  ]
				ifFalse: [  col add: each ]].
			col ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> constraint [
	^ super constraint ==> [:nodes| 
		ASN1ConstraintNode 
			constraint: nodes first
			exception: nodes second ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> containedSubtype [
	^ super containedSubtype ==> [:nodes| 
		ASN1ConstraintNode new
			constraint: nodes ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> defaultSyntax [
	^ super defaultSyntax ==> [:nodes| 
		nodes] 
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> definedObjectClass [
	^ super definedObjectClass ==> [:node|
		node asn1Reference ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> definedSyntax [
	^ super definedSyntax ==> [:node|
		ASN1DefinedSyntaxObjectNode new
			syntax: node second ] 
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> definitiveIdentification [
	"disabling iri value for now"
	self flag: #incomplete.
	^ super definitiveIdentification ==> [:nodes| 
		nodes 
			ifNotNil: [ nodes first ]
			ifNil: [ nil ] ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> definitiveNameAndNumberForm [
	^ super definitiveNameAndNumberForm ==> [:nodes|
		ASN1ObjectIdComponentNode new
			name: nodes first;
			number: (Number readFrom: nodes second) ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> definitiveObjIdComponent [
	^ super definitiveObjIdComponent ==> [:nodes| 
		ASN1ObjectIdComponentNode nodes: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> definitiveOid [
	^ super definitiveOid ==> [:nodes| ASN1ObjectIdNode components: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> durationType [
	^ super durationType ==> [:node|
		ASN1PrimitiveTypeNode name: node ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> elementSetSpecs [
	^ super elementSetSpecs ==> [ :nodes | | set |
		set := nodes first .
		nodes second ifNotNil: [ :ext |
			set add: ASN1ExtensionNode new.
			ext third ifNotNil: [ 
				set := set merge: ext third second ] ].
		set ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> enumeratedType [
	^super enumeratedType ==> [:nodes|
		ASN1EnumeratedNode new elements: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> enumeration [
	"If we get named numbers the have values assigned. If we get just an identifier we create
	a dummy named number with nil value that can be assigned later"
	^ super enumeration ==> [:nodes| 
		nodes collect: [ :node |
			node isString
				ifTrue: [ ASN1NamedNumberNode name: node number: nil ]
				ifFalse: [ node ] ] ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> enumerations [
	^ super enumerations ==> [:nodes| | enum |
		enum := nodes first asOrderedCollection.
		nodes second ifNotNil: [ :ext |
			 enum add: ASN1ExtensionNode new.
			 ext third ifNotNil: [
				enum addAll: ext third ]].
		enum ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> extensionAdditions [
	^ super extensionAdditions ==> [:nodes|
		nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> extensionAndException [
	^ super extensionAndException ==> [:nodes|
		ASN1ExtensionAndExceptionNode new
			exception: nodes second]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> extensionEndMarker [
	^ super extensionEndMarker ==> [:nodes|
		ASN1ExtensionEndMarkerNode new ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> externalType [
	^ super externalType ==> [:nodes|
		ASN1ExternalTypeNode new ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> fixedTypeValueFieldSpec [
	self flag: #incomplete.
	^ super fixedTypeValueFieldSpec ==> [:nodes| | node |
		node := ASN1FieldSpecNode new 
			name: (nodes first declaration: true);
			type: nodes second.
		nodes third ifNotNil: [
			node addModifier: ASN1ModifierUniqueNode new ].
		nodes fourth ifNotNil: [
			node addModifier: nodes fourth ].
		node]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> fixedTypeValueSetFieldSpec [
	^ super fixedTypeValueSetFieldSpec ==> [:nodes| | node |
		node := ASN1FieldSpecNode new
			name: (nodes first declaration: true);
			type: nodes second.
		nodes third ifNotNil: [
			node addModifier: ASN1ModifierOptionalNode new ].
		node ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> globalModuleReference [
	^ super globalModuleReference ==> [:nodes|
		ASN1ModuleIdentifierNode new
			name: nodes first;
			oid: nodes second ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> hString [
	^ super hString ==> [:nodes|
		ASN1HexBitStringValueNode new
			type: (ASN1BitStringTypeNode new);
			value: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> innerTypeConstraints [ 
	^ super innerTypeConstraints ==> [:nodes|
		ASN1ConstraintNode new
			constraint: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> integerType [
	^ super integerType ==> [:nodes| | intergerType |
		integerType := ASN1IntegerTypeNode new.
		nodes second ifNotNil: [:namedNumbers|
			namedNumbers do: [:each|
				integerType addNamedNumber: each ]].
		integerType]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> integerValue [
	"^ (signedNumber flatten ==> [:node|  ASN1IntegerValueNode new value: node ])
		/ (identifier ==> [:node| | ambi |
			ambi := ASN1AmbiguousNode new.
			ambi name: node.
			ambi addAlternative: (ASN1IntegerValueNode new value: node ).
			ambi addAlternative: node asn1Reference ])"
 
	^ super integerValue  ==> [:node|  
		(Number 
			readFrom: node
			ifFail: [ nil ])
				ifNotNil: [:num| ASN1IntegerValueNode new value: num ]
				ifNil: [ node asn1Reference ]] 
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> intersections [
	^ super intersections ==> [:nodes| | intersectionElements |
		intersectionElements := nodes collect: [:each|
			self flag: #disabledForNow.
			"(each first isCollection ifTrue: [ self halt ])."
			ASN1ElementsNode new
				entity: each first;
				exclusions: each second].
		(intersectionElements size > 1) 
			ifTrue: [
				ASN1IntersectionNode new
					elements: intersectionElements first.]
			ifFalse: [ intersectionElements first ] ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> literal [
	^ super literal ==> [:nodes| 
		ASN1LiteralNode new string: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> moduleDefinition [
	^ super moduleDefinition ==> [:nodes| 
		ASN1ModuleDefinitionNode new
			identifier: nodes first;
			encodingReferenceDefault: nodes second;
			tagDefault: nodes third;
			extensionDefault: nodes fourth;
			exports: nodes fifth first;
			imports: nodes fifth second;
			assignments: nodes fifth third;
			encodingControlSections: nodes sixth ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> moduleIdentifier [
	^ super moduleIdentifier ==> [:nodes| ASN1ModuleIdentifierNode nodes: nodes. ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> nameAndNumberForm [
	^ super nameAndNumberForm ==> [:nodes|
		ASN1ObjectIdComponentNode new
			name: nodes first;
			number: nodes second ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> namedBit [
	^ super namedBit ==> [:nodes|
		ASN1NamedBitNode new
			name: nodes first;
			value: nodes second ] 
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> namedNumber [
	^ super namedNumber ==> [:nodes| 
			ASN1NamedNumberNode 
				name: nodes first
				number: nodes second ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> namedType [
	^ super namedType ==> [:nodes| 
		ASN1NamedTypeNode new
			name: nodes first;
			type: nodes second ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> namedValue [
	^ super namedValue ==> [:nodes| 
		ASN1NamedValueNode new
			name: nodes first; 
			value: nodes second]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> nullType [
	^ super nullType ==> [:node|
		ASN1NullTypeNode new ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> numberForm [
	^ super numberForm ==> [:node|
		node isAllDigits 
			ifTrue: [ Number readFrom: node ]
			ifFalse: [ node ]]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> objIdComponents [
	^ super objIdComponents ==> [:nodes| 
		ASN1ObjectIdComponentNode nodes: nodes ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> object [
	^ super object 
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectAssignment [
	^ super objectAssignment ==> [:nodes|
		ASN1AssignmentNode new
			left: (nodes first
				type: nodes second;
				declaration: true);
			right: (nodes fourth
				type: nodes second) ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectClassAssignment [
	^ super objectClassAssignment ==> [:nodes| 
		ASN1AssignmentNode new 
			left: (nodes first
				declaration: true);
			right:  nodes third ] 
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectClassDefn [
	^ super objectClassDefn ==> [:nodes| 
		(nodes second isNil 
			ifTrue: [ ASN1DefaultSyntaxClassNode new ]
			ifFalse: [ ASN1DefinedSyntaxClassNode new syntax: nodes second ])
				fields: nodes first ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectClassFieldType [
	^ super objectClassFieldType ==> [:nodes| 
		ASN1TypeFieldNode new
			type: nodes first;
			fields: nodes third]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectClassReference [
	^ super objectClassReference ==> [:node| 
		 node asn1Reference ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> objectIdentifierType [
	^super objectIdentifierType ==> [:nodes|
		ASN1ObjectIdentifierTypeNode new
			name: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> objectIdentifierValue [ 
	^ self ambiguousMatch: #objectIdentifierValue withAlternatives: #( #objectIdentifierValuePlain #sequenceValue) 
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> objectIdentifierValuePlain [
	^ super objectIdentifierValue ==> [:nodes|
		ASN1ObjectIdNode components: (
			(nodes size = 1) 
				ifTrue: [ Array with: nodes first ]
				ifFalse: [
					nodes second isCollection 
						ifTrue: [ nodes first 
							ifNotNil: [ nodes second copyWithFirst: nodes first ]
							ifNil: [ nodes second ] ]
						ifFalse: [  nodes ]] )  ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectReference [
	^ super objectReference ==> [:node|
		node asn1Reference ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectSet [
	^ super objectSet ==> [:nodes| 
		(nodes = '...') 
			ifTrue: [ ASN1ObjectSetNode new ]
			ifFalse: [
				ASN1ObjectSetNode new
					elementsSpec: (
						(nodes reject: [:each| each isNil or: [each isString]])
						fold: [:a :b| a merge: b]) ]] 
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectSetAssignment [
	^ super objectSetAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first
				type: nodes second;
				declaration: true);
			right: (nodes third type: nodes second) ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectSetFieldSpec [
	^ super objectSetFieldSpec ==> [:nodes | | node |
		node := ASN1FieldSpecNode new 
			name: (nodes first declaration: true);
			type: nodes second.
		nodes third ifNotNil: [
			node addModifier: ASN1ModifierOptionalNode new ].
		node]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectSetReference [
	^ super objectSetReference ==> [:node| 
		node asn1Reference ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> objectSetSpec [
	^ super objectSetSpec ==> [ :nodes | 
		nodes collect: [ :node |
			(node = '...')
				ifTrue: [ ASN1ExtensionNode new asUnion ]
				ifFalse: [ node ] ] ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> octetStringType [
	^ super octetStringType ==> [:node|
		 ASN1PrimitiveTypeNode new
			name: node ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> optionalExtensionMarker [
	^ super optionalExtensionMarker ==> [:nodes|
		nodes ifNotNil: [  
			ASN1ExtensionNode new  ]]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> optionalGroup [
	^ super optionalGroup ==> [:nodes| 
		ASN1ValueCollectionNode new
			elements: nodes;
			addModifier: ASN1ModifierOptionalNode new] 
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameter [
	^ super parameter ==> [:nodes| | paramType |
		nodes first ifNotNil: [
			paramType := nodes first first isString 
				ifTrue: [ nodes first first asn1Reference ]
				ifFalse: [ nodes first first ]].
		ASN1ParameterNode new
			type: paramType;
			reference: nodes second ]
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedObject [
	^ super parameterizedObject ==> [:nodes|
		nodes first parameters: nodes second]
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedObjectAssignment [
	^ super parameterizedObjectAssignment ==> [:nodes| 
		 ASN1AssignmentNode new
			left: (nodes first
					type: nodes third;
					declaration: true;
					parameters: nodes second);
			right: (nodes fifth
				type: nodes third) ] 
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedObjectClass [
	^ super parameterizedObjectClass ==> [:nodes|
		nodes first parameters: nodes second ]
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedObjectClassAssignment [
	^ super parameterizedObjectClassAssignment ==> [:nodes| 
		self notYetImplemented 
		 "ASN1AssignmentNode new
			left: (nodes first
					declaration: true;
					parameters: nodes second);
			right: nodes third "] 
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedObjectSet [
	^ super parameterizedObjectSet ==> [:nodes|
		nodes first parameters: nodes second]
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedObjectSetAssignment [
	^ super parameterizedObjectSetAssignment ==> [:nodes| 
		 ASN1AssignmentNode new
			left: (nodes first
					type: nodes third;
					declaration: true;
					parameters: nodes second);
			right: nodes fourth ] 
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedReference [ 
	^ super parameterizedReference ==> [:nodes| | params |
		params := nodes second 
			ifNotNil: [ nodes second allButFirst allButLast ]
			ifNil: [ nil ].
		 nodes first parameters: params ]
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedType [
	^ super parameterizedType ==> [:nodes|
		nodes first parameters: nodes second ]
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedTypeAssignment [
	^ super parameterizedTypeAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first
					declaration: true;
					parameters: nodes second);
			right: nodes fourth ]
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedValue [
	^ super parameterizedValue ==> [:nodes|
		nodes first parameters: nodes second]
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedValueAssignment [
	^ super parameterizedValueAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first
					type: nodes third;
					declaration: true;
					parameters: nodes second);
			right: nodes fourth ]
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedValueSetType [
	^ super parameterizedValueSetType ==> [:nodes|
		nodes first parameters: nodes second]
]

{ #category : #'X.683 grammar' }
ASN1ASTParser >> parameterizedValueSetTypeAssignment [
	^ super parameterizedValueSetTypeAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first
					type: nodes third;
					declaration: true;
					parameters: nodes second);
			right: nodes fifth]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> parseAmbiguous: aParser using: aBlock [
	^ aParser >=> [:stream :block| | startPos parsed |
		startPos := stream position.
		parsed := block value.
		parsed isPetitFailure
			ifTrue: [ 
				stream position: startPos.
				parsed ]
			ifFalse: [ 
				aBlock 
					value: parsed 
					value: (stream collection copyFrom: startPos + 1 to: stream position )]]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> reference [
	^ super reference ==> [:node| 
		(node class = ASN1ReferenceNode ) ifFalse: [ 
			Transcript show: self class name printString ,'>>reference: got non-reference ', node name; cr ] .
		 node asn1Reference  ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> relativeOidComponents [
	^ super relativeOidComponents ==> [:nodes| 
		ASN1ObjectIdComponentNode nodes: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> relativeOidValue [
	^ super relativeOidValue ==> [:nodes| 
		ASN1ObjectIdNode components: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> restrictedCharacterStringType [
	^ super restrictedCharacterStringType ==> [:node|
		ASN1PrimitiveTypeNode new 
			name: node ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> selectionType [
	^ super selectionType ==> [:nodes|
		ASN1SelectionTypeNode new
			name: nodes first;
			type: nodes third ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> sequenceOfType [
	^ super sequenceOfType ==> [:nodes| 
		ASN1TypedSequenceNode new
			type: nodes  ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> sequenceOfValue [ 	
	^ super sequenceOfValue ==> [:nodes| 
			ASN1SequenceOfValueNode new
				elements: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> sequenceType [
	^ super sequenceType ==> [:nodes|
		ASN1SequenceNode new elements: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> sequenceValue [
	^ super sequenceValue ==> [:nodes|
		ASN1SequenceValueNode new
			elements: nodes  ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> setOfType [
	^ super setOfType ==> [:nodes| 
		ASN1TypedSetNode new
			type: nodes  ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> setType [
	^ super setType ==> [:nodes|
		ASN1SetNode new elements: nodes ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> setting [
	^ super setting
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> signedNumber [
	^ super signedNumber ==> [:nodes| 
		nodes first notNil 
			ifTrue: [ nodes second asNumber negated ]
			ifFalse: [ nodes second asNumber ]]
]

{ #category : #'X.682 grammar' }
ASN1ASTParser >> sizeConstraint [ 
	^ super sizeConstraint ==> [:nodes|
		ASN1ConstraintNode new
			constraint: nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> symbolsFromModule [
	^ super symbolsFromModule ==> [:nodes| 
		ASN1ImportNode new
			symbols: nodes first;
			moduleIdentifier: nodes second ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> syntaxList [ 
	^ super syntaxList ==> [:nodes|
		ASN1ValueCollectionNode new
			elements: nodes ] 
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> tag [
	^ super tag ==> [:nodes| 
		ASN1TagNode new
			encodingReference: nodes second;
			tagClass: nodes third;
			tagNumber: nodes fourth 
		]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> tagDefault [
	^ super tagDefault ==> [:nodes| 
		nodes 
			ifNotNil: [ ASN1TagEnvironment labelled: ($  split: nodes) first ]
			ifNil: [ ASN1ExplicitTags ]]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> taggedType [
	^ super taggedType ==> [:nodes|
		ASN1TaggedTypeNode new
			tag: nodes first;
			tagEnvironment: (nodes second ifNotNil: [:mod| ASN1TagEnvironment labelled: mod  ]);
			type: nodes third ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> type [
	^ super type ==> [:nodes|
		nodes second do: [:each|
			nodes first addConstraint: each ].
		nodes first ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> typeAssignment [
	^ super typeAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first asn1Reference declaration: true);
			right: nodes second ]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> typeFieldSpec [
	^ super typeFieldSpec ==> [:nodes| | node |
		node := ASN1FieldSpecNode new
			name: (nodes first declaration: true).
		nodes second ifNotNil: [
			node addModifier: ASN1ModifierOptionalNode new ].
		node ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> typeFromObject [
	^ super typeFromObject ==> [:nodes|
		ASN1TypeFromObjectNode new
			object: nodes first;
			field: nodes third ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> typeReference [
	^ super typeReference ==> [:node| 
		node asn1Reference ]  
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> typeReferenceToken [
	^ super typeReferenceToken ==> [:node| 
		node asn1Reference ] 
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> typeWithConstraint [
	^ super typeWithConstraint ==> [:nodes| | collection |
		collection := (nodes first = 'SET')
			ifTrue: [ ASN1TypedSetNode new ]
			ifFalse: [ ASN1TypedSequenceNode new ].
		collection addConstraint: nodes second.
		collection type: nodes fourth.
		]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> unions [
	^ super unions ==> [:nodes|
		ASN1UnionNode new
			elements: nodes]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> usefulType [
	^ super usefulType ==> [:nodes|
		ASN1PrimitiveTypeNode new
			name: nodes]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> value [ 
	^ super value ==> [:nodes| nodes ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> valueAssignment [
	^ super valueAssignment ==> [:nodes| 
		ASN1AssignmentNode new
			left: (nodes first
					type: nodes second;
					declaration: true);
			right:  nodes third 
		]
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> valueFromObject [
	^ super valueFromObject ==> [:nodes|
		ASN1ValueFromObjectNode new
			object: nodes first;
			fields: nodes second ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> valueOptionalitySpec [
	^ super valueOptionalitySpec ==> [:nodes|
		(nodes = 'OPTIONAL')
			ifTrue: [ ASN1ModifierOptionalNode new ]
			ifFalse: [ ASN1ModifierDefaultValueNode new value: nodes second]]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> valueRange [
	^ super valueRange ==> [:nodes| 
		(ASN1RangeConstraintNode 
			lowerValue: nodes first first
			upperValue: nodes second second)
				lowerExcluded: (nodes first second = $<);
				upperExcluded: (nodes second first = $<);
				yourself ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> valueReference [
	^ super valueReference ==> [:node| 
		node asn1Reference ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> valueReferenceToken [
	^super valueReferenceToken ==> [:node|
		node asn1Reference ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> valueSet [
	"a possible extension marker in between makes constructing a bit weird. Base set spec is in the first element but the
	additional set spec is nested deeply"
	^ super valueSet ==> [:nodes|
		ASN1ValueSetNode new elementsSpec: nodes ] 
]

{ #category : #'X.681 grammar' }
ASN1ASTParser >> valueSetFieldReference [
	^ super valueSetFieldReference ==> [:node|
		node asn1Reference ]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> valueSetOptionalitySpec [
	^ super valueSetOptionalitySpec ==> [:nodes|
		(nodes = 'OPTIONAL')
			ifTrue: [ ASN1ModifierOptionalNode new ]
			ifFalse: [ ASN1ModifierDefaultValueNode new value: nodes second]]
]

{ #category : #'X.680 grammar' }
ASN1ASTParser >> valueSetTypeAssignment [
	^ super valueSetTypeAssignment ==> [:nodes|
		ASN1AssignmentNode new
			left: (nodes first asn1Reference 
					type: nodes second;
					declaration: true);
			right: (nodes third type: nodes second) ]
]
