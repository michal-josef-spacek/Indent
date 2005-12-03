# $Id: Makefile.PL,v 1.9 2005-12-03 11:58:07 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Error::Simple::Multiple' => 0.01,
		'Tag::Parse' => 0.01,
	},
	'VERSION' => 0.01,
);
