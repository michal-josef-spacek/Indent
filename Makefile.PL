# $Id: Makefile.PL,v 1.10 2006-03-15 20:35:41 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Error::Simple::Multiple' => 0.02,
		'Tag::Parse' => 0.01,
	},
	'VERSION' => 0.01,
);
