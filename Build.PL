
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Easy to generate feed rss or atom for Dancer2 applications.",
  "dist_author" => [
    "Natal Ng\303\251tal"
  ],
  "dist_name" => "Dancer2-Plugin-Feed",
  "dist_version" => "1.132820",
  "license" => "perl",
  "module_name" => "Dancer2::Plugin::Feed",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Dancer" => "1.2001",
    "Dancer2" => 0,
    "Dancer2::Plugin" => 0,
    "XML::Feed" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Dancer2::Test" => 0,
    "Test::More" => 0,
    "lib" => 0,
    "strict" => 0,
    "warnings" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
