# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Spacek',
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Error::Simple::Multiple' => 0.04,
		'Tag::Parse' => 0.03,
		'Readonly' => 0,
		'Scalar::Util' => 0,
	},
	'VERSION' => 0.04,
	'test' => {
		'TESTS' => 't/Indent/*t '.
			't/Indent::Block/*.t '.
			't/Indent::Comment/*.t '.
			't/Indent::Data/*.t '.
			't/Indent::Form/*.t '.
			't/Indent::PerlStruct/*.t '.
			't/Indent::Tag/*.t '.
			't/Indent::Utils/*.t '.
			't/Indent::Word/*.t',
	},
);
