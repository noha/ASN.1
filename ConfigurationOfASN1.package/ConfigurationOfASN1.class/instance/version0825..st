versions
version0825: spec
	<version: '0.8.25' imports: #('0.8.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8.24 : once more for the changes in object identifier visiting
0.8.25 : - added inconsistency resolving visitor. After all symbols have been resolved there could still be some ambiguities/inconsistencies that could only be resolved because the types of the ambiguous nodes have been resolved. There the inconsistency visitor is added after resolving symbols. After that visitor has been run the symbols must be resolved again because new references could have been introduced.
- renamed ASN1Literal to its real name ASN1LiteralNode 
'.
		spec author: 'NorbertHartl'.
		spec timestamp: '2/12/2014 13:44'.
		spec 
			project: 'PetitParser' with: '1.8-snapshot';
			project: 'PetitParser Tests' with: '1.8-snapshot'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.11';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.3';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.81';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.15';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.74';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.21';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.7';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.37';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.9';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.60';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.12'. ].
