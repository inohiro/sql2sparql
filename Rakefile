# coding: utf-8
require 'rubygems'
require 'rspec'
$:.unshift File.join( File.dirname( __FILE__ ), 'lib' )

require 'rspec/core'
require 'rspec/core/rake_task'

task :default => :test

desc 'Run all specs in spec directory'
RSpec::Core::RakeTask.new(:spec)

