# Pragmas.
use strict;
use warnings;

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Špaček <skim@cpan.org>',
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Class::Utils' => 0.01,
		'Error::Pure' => 0.01,
		'File::Object' => 0,
		'Readonly' => 0,
		'Scalar::Util' => 0,
		'Tag::Parse' => 0.03,
	},
	'VERSION' => 0.04,
	'test' => {
		'TESTS' => 't/Indent/*t '.
			't/Indent::Block/*.t '.
			't/Indent::Comment/*.t '.
			't/Indent::Data/*.t '.
			't/Indent::Form/*.t '.
			't/Indent::String/*.t '.
			't/Indent::Tag/*.t '.
			't/Indent::Utils/*.t '.
			't/Indent::Word/*.t',
	},
);
