# $Id: Makefile.PL,v 1.17 2008-05-09 13:43:01 skim Exp $

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
	'VERSION' => 0.04,
);
