NAME
====

Games::Maze - Maze generator.

SYNOPSIS
========

```raku
use Games::Maze;

my $maze = Games::Maze.new( :height(10), :width(10) );
$maze.make.render.say;
```

DESCRIPTION
===========

Games::Maze is the implementation of the work that I contributed to the [Raku Advent Calendar 2019](https://raku-advent.blog/2019/12/17/maze-maker-for-fun/).

It was my first ever participation to the Advent Calendar for Raku. I used the opportunity to explore the language.

I was meant to package it as library and release it long time ago but for some reason it didn't work out.

I have finally managed to find the time to bundle the package.

AUTHOR
======

Mohammad S Anwar <mohammad.anwar@yahoo.com>

COPYRIGHT AND LICENSE
=====================

Copyright 2020 Mohammad S Anwar

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

