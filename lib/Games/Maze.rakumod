class Games::Maze:ver<0.0.1> {

    has Int $.height is required;
    has Int $.width  is required;
    has $!maze;

    my %opposite-of = (
        'north' => 'south',
        'south' => 'north',
        'west'  => 'east',
        'east'  => 'west'
    );

    my @directions = %opposite-of.keys;

    method make(Int $x = 0, Int $y = 0) returns Games::Maze {

        for (@directions.pick(@directions)) -> $direction {
            my ($new_x, $new_y) = ($x, $y);

            if    ('east'  eq $direction) { $new_x += 1; }
            elsif ('west'  eq $direction) { $new_x -= 1; }
            elsif ('south' eq $direction) { $new_y += 1; }
            else                          { $new_y -= 1; }

            if self.not-visited($new_x, $new_y) {
                $!maze[$y][$x]{$direction} = 1;
                $!maze[$new_y][$new_x]{ %opposite-of{$direction} } = 1;
                self.make($new_x.Int, $new_y.Int);
            }
        }

        return self;
    }

    method not-visited(Int $x, Int $y) returns Bool {

        # check the boundary
        return False if $x < 0 or $y < 0;
        return False if $x > self.width - 1 or $y > self.height - 1;

        # return false if already visited
        return False if $!maze[$y][$x];

        # return true
        return True;
    }

    method render() returns Str {

        my $as_string = " " ~ ("_ " x self.width);
        $as_string ~= "\n";

        for (0 .. self.height - 1) -> $y {
            $as_string ~= "|";
            for (0 .. self.width - 1) -> $x {
                my $cell = $!maze[$y][$x];
                $as_string ~= $cell<south> ?? " " !! "_";
                $as_string ~= $cell<east>  ?? " " !! "|";
            }
            $as_string ~= "\n";
        }

        return $as_string;
    }
}

=begin pod

=head1 NAME

Games::Maze - Maze generator.

=head1 SYNOPSIS

=begin code :lang<raku>

use Games::Maze;

my $maze = Games::Maze.new( :height(10), :width(10) );
$maze.make.render.say;

=end code

=head1 DESCRIPTION

Games::Maze is the implementation of the work that I contributed to
the L<Raku Advent Calendar 2019|https://raku-advent.blog/2019/12/17/maze-maker-for-fun/>.

It was my first ever participation to the Advent Calendar for Raku.
I used the opportunity to explore the language.

I was meant to package it as library and release it long time ago but
for some reason it didn't work out.

I have finally managed to find the time to bundle the package.

=head1 AUTHOR

Mohammad S Anwar <mohammad.anwar@yahoo.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2020 Mohammad S Anwar

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
