# amavis #

master branch: [![Build Status](https://secure.travis-ci.org/mjhas/amavis.png?branch=master)](http://travis-ci.org/mjhas/amavis)

This is the amavis module. It provides installation and configuration routines using Puppet.

Simplest Configuration:
=============


    include amavis


It will just install the amavis package and ensure that amavis is running.


Simple Configuration:
=============


    include amavis

    class { 'amavis::config':
      final_virus_destiny      => 'D_REJECT; # (defaults to D_BOUNCE)',
    }

It will just install the amavis package and ensure that amavis is rejecting content containg a virus.
