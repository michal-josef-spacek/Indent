# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Spacek',
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Error::Simple::Multiple' => 0.04,
		'Tag::Parse' => 0.03,
		'Scalar::Util' => 0,
	},
	'VERSION' => 0.04,
);
