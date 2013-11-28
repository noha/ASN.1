versions
version0813: spec
	<version: '0.8.13' imports: #('0.8.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8.12 : Some fixes for the handling of defined syntax objects and resolving of values with the scope of their types. '.
		spec author: 'NorbertHartl'.
		spec timestamp: '11/28/2013 17:21'.
		spec 
			project: 'PetitParser' with: '1.8-snapshot';
			project: 'PetitParser Tests' with: '1.8-snapshot'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.10';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.69';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.10';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.64';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.12';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.4';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.35';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.8';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.52';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.11'. ].
