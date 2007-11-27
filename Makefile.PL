# $Id: Makefile.PL,v 1.15 2007-11-27 13:14:27 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Spacek',
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Error::Simple::Multiple' => 0.04,
		'Tag::Parse' => 0.03,
	},
	'VERSION' => 0.02,
);
