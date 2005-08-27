# $Id: Makefile.PL,v 1.8 2005-08-27 12:45:32 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Error::Simple' => 0.01,
		'Tag::Parse' => 0.01,
	},
	'VERSION' => 0.01,
);
