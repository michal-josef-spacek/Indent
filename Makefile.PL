# $Id: Makefile.PL,v 1.7 2005-08-27 11:03:45 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Tag::Parse' => 0.01,
	},
	'VERSION' => 0.01,
);
