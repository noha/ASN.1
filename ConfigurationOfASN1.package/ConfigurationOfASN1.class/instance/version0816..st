versions
version0816: spec
	<version: '0.8.16' imports: #('0.8.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: '0.8.15 : unified ASN1Oid handling. String instVar is removed and accesses are using value now
0.8.16 : Added support vor ComponentType. ComponentType is a named type that can have modifiers for optionality and default values. Moved the storage of modifier information awy from Association into the dedicated type ComponentType. Adjusted ComponentType to act as the wrapper of a type. Resolving this issue opened the revival of the ambiguous type. A new approach to handle these has been implemented. But it is far from being perfect. Finally a read visitor does not only check for optionality of a field but also for a default value. If a default value is present it is added to the dictionary being created.'.
		spec author: 'NorbertHartl'.
		spec timestamp: '1/23/2014 15:09'.
		spec 
			project: 'PetitParser' with: '1.8-snapshot';
			project: 'PetitParser Tests' with: '1.8-snapshot'.
		spec 
			package: 'ASN1-Common' with: 'ASN1-Common-NorbertHartl.6';
			package: 'ASN1-Syntax' with: 'ASN1-Syntax-NorbertHartl.10';
			package: 'ASN1-Tests-Syntax' with: 'ASN1-Tests-Syntax-NorbertHartl.2';
			package: 'ASN1-AST' with: 'ASN1-AST-NorbertHartl.72';
			package: 'ASN1-Tests-AST' with: 'ASN1-Tests-AST-NorbertHartl.11';
			package: 'ASN1-Model' with: 'ASN1-Model-NorbertHartl.68';
			package: 'ASN1-Tests-Model' with: 'ASN1-Tests-Model-NorbertHartl.4';
			package: 'ASN1-Builder' with: 'ASN1-Builder-NorbertHartl.16';
			package: 'ASN1-Tests-Builder' with: 'ASN1-Tests-Builder-NorbertHartl.7';
			package: 'ASN1-Codec' with: 'ASN1-Codec-NorbertHartl.35';
			package: 'ASN1-Tests-Codec' with: 'ASN1-Tests-Codec-HolgerHansPeterFreyther.8';
			package: 'ASN1-Tool' with: 'ASN1-Tool-NorbertHartl.55';
			package: 'ASN1-Tests-Tool' with: 'ASN1-Tests-Tool-NorbertHartl.11'. ].
