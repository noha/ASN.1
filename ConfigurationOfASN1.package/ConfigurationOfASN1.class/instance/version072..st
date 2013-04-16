versions
version072: spec
	<version: '0.7.2' imports: #('0.7.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.7.1 : packaging issues. No dependencies introduced for cleaner load'.
		spec author: 'NorbertHartl'.
		spec timestamp: '4/16/2013 11:23'.
		spec project: 'PetitParser' with: '1.5'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.4';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.4';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.56';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.5';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.45';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.4';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.2';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.16';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-NorbertHartl.1';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.34';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.2'. ].
