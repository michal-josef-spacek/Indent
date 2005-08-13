# $Id: Makefile.PL,v 1.6 2005-08-13 20:43:21 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'NAME' => 'Indent',
	'VERSION_FROM' => 'Indent.pm',
	'PREREQ_PM' => {
		'Tag::Parse' => 0.01,
	},
);
