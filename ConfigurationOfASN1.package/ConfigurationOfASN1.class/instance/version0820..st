versions
version0820: spec
	<version: '0.8.20' imports: #('0.8.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8.19 : * Refactoring for proper treatment of bit string values. A bit string value is per ASN.1 syntax ambiguous. It can be parsed as valueSet, objectSet or bit string value. We create ambiguous nodes in that situation and parse all alternatives. In a second pass using a visitor a value finds its closest type information climbing up the syntax and selects the right alternative value that fits the type.
* Improvement of type matching capabilities in nodes. 
* Improvement in symbol resolving. Scope chains were rather huge due to the fact that a traversal can cross multiple modules. Now each module isolates the scope chain making it much more right and short
* Added BitString and NamedValue (for named bits) to ASN1 model
'.
		spec author: 'NorbertHartl'.
		spec timestamp: '2/3/2014 14:51'.
		spec 
			project: 'PetitParser' with: '1.8-snapshot';
			project: 'PetitParser Tests' with: '1.8-snapshot'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.11';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.3';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.76';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.13';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.71';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.19';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.7';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.37';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.9';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.58';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.12'. ].
