# $Id: 11_pod.t,v 1.1 2008-05-11 13:40:28 skim Exp $

# Modules.
use Test::More;

eval "use Test::Pod 1.00";
plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
all_pod_files_ok();
