# $Id: Makefile.PL,v 1.14 2007-09-11 07:53:38 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Spacek',
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Error::Simple::Multiple' => 0.03,
		'Tag::Parse' => 0.03,
	},
	'VERSION' => 0.02,
);
