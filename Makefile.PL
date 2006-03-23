# $Id: Makefile.PL,v 1.11 2006-03-23 22:15:19 skim Exp $

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Spacek',
	'NAME' => 'Indent',
	'PREREQ_PM' => {
		'Error::Simple::Multiple' => 0.02,
		'Tag::Parse' => 0.01,
	},
	'VERSION' => 0.01,
);
