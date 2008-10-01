# Modules.
use Test::Pod::Coverage 'tests' => 9;

pod_coverage_ok('Indent', 'Indent is covered');
pod_coverage_ok('Indent::Block', 'Indent::Block is covered');
pod_coverage_ok('Indent::Comment', 'Indent::Comment is covered');
pod_coverage_ok('Indent::Data', 'Indent::Data is covered');
pod_coverage_ok('Indent::Form', 'Indent::Form is covered');
pod_coverage_ok('Indent::PerlStruct', 'Indent::PerlStruct');
pod_coverage_ok('Indent::Tag', 'Indent::Tag');
pod_coverage_ok('Indent::Utils', 'Indent::Utils');
pod_coverage_ok('Indent::Word', 'Indent::Word');
