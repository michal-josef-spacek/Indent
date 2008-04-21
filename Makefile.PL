# $Id: Makefile.PL,v 1.16 2008-04-21 00:10:34 skim Exp $

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
	'VERSION' => 0.03,
);
