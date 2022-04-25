#!/usr/bin/env raku

# This script reads the native_array.pm6 file, and generates the
# shaped1intarray, shaped1numarray and shaped1strarray postcircumfix
# candidates and writes it back to the file.

# always use highest version of Raku
use v6.*;

my $generator = $*PROGRAM-NAME;
my $generated = DateTime.now.gist.subst(/\.\d+/,'');
my $start     = '#- start of shaped1 postcircumfix candidates of ';
my $idpos     = $start.chars;
my $idchars   = 3;
my $end       = '#- end of shaped1 postcircumfix candidates of ';

my %type_mapper = (
  int => ( :postfix<i>,
           :push_postfix<i>,
           :type<int>,
           :Type<Int>,
           :value<int>,
           :Value<Int>,
         ).Map,
  num => ( :postfix<n>,
           :push_postfix<n>,
           :type<num>,
           :Type<Num>,
           :value<num>,
           :Value<Num>,
         ).Map,
  str => ( :postfix<s>,
           :push_postfix<s>,
           :type<str>,
           :Type<Str>,
           :value<str>,
           :Value<Str>,
         ).Map,
  uint => ( :postfix<u>,
            :push_postfix<i>,
            :type<uint>,
            :Type<UInt>,
            :value<int>,
            :Value<Int>,
          ).Map,
);

# slurp the whole file and set up writing to it
my $filename = "src/core.c/native_array.pm6";
my @lines = $filename.IO.lines;
$*OUT = $filename.IO.open(:w);

# for all the lines in the source that don't need special handling
while @lines {
    my $line := @lines.shift;

    # nothing to do yet
    unless $line.starts-with($start) {
        say $line;
        next;
    }

    # found header, check validity and set up mapper
    my $type = $line.substr($idpos,$idchars);
    $type = "uint" if $type eq "uin";
    die "Don't know how to handle $type"
      unless my %mapper := %type_mapper{$type};

    say $start ~ $type ~ "array -----------------------";
    say "#- Generated on $generated by $generator";
    say "#- PLEASE DON'T CHANGE ANYTHING BELOW THIS LINE";

    # skip the old version of the code
    while @lines {
        last if @lines.shift.starts-with($end);
    }

    # spurt the candidates
    say Q:to/SOURCE/.subst(/ '#' (\w+) '#' /, -> $/ { %mapper{$0} }, :g).chomp;

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Int:D $pos
) is default is raw {
    nqp::atposref_#postfix#(nqp::decont(SELF),$pos)
}

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Int:D $pos, #Type#:D \assignee
) is default is raw {
    nqp::bindpos_#postfix#(nqp::decont(SELF),$pos,assignee)
}

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Int:D $pos, :$exists!, *%_
) is default {
    my int $state =
      nqp::isge_i($pos,0) && nqp::islt_i($pos,nqp::elems(nqp::decont(SELF)));
    my $value := nqp::hllbool($exists ?? $state !! nqp::not_i($state));

    $state
      ?? nqp::elems(my $adverbs := nqp::getattr(%_,Map,'$!storage'))
        ?? nqp::atkey($adverbs,'kv')
          ?? ($pos,$value)
          !! nqp::atkey($adverbs,'p')
            ?? Pair.new($pos,$value)
            !! X::Adverb.new(
                 what   => "slice",
                 source => "native shaped1 #type# array",
                 nogo   => ('exists', |%_.keys).sort
               ).Failure
        !! $value
      !! $value
}

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Int:D $pos, :$kv!
) is default is raw {
    $kv
      ?? nqp::list($pos,nqp::atpos_#postfix#(nqp::decont(SELF),$pos))
      !! nqp::atposref_#postfix#(nqp::decont(SELF),$pos)
}

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Int:D $pos, :$p!
) is default is raw {
    $p
      ?? Pair.new($pos,nqp::atpos_#postfix#(nqp::decont(SELF),$pos))
      !! nqp::atposref_#postfix#(nqp::decont(SELF),$pos)
}

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Int:D $pos, :$k!
) is default is raw {
    $k ?? $pos !! nqp::atposref_#postfix#(nqp::decont(SELF),$pos)
}

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Int:D $pos, :$v!
) is default is raw {
    $v
      ?? nqp::isge_i($pos,0) && nqp::islt_i($pos,nqp::elems(nqp::decont(SELF)))
        ?? nqp::list(nqp::atpos_#postfix#(nqp::decont(SELF),$pos))
        !! ()
      !! nqp::atpos_#postfix#(nqp::decont(SELF),$pos)
}

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Iterable:D $pos is rw
) is default is raw {
    nqp::atposref_#postfix#(nqp::decont(SELF),$pos.Int)
}

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Callable:D $pos
) is default is raw {
    nqp::atposref_#postfix#(
      nqp::decont(SELF),
      $pos(nqp::elems(nqp::decont(SELF)))
    )
}

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Iterable:D $pos
) is default is raw {
    my $self     := nqp::decont(SELF);
    my $iterator := $pos.iterator;
    my #type# @result;

    nqp::until(
      nqp::eqaddr((my $pulled := $iterator.pull-one),IterationEnd),
      nqp::push_#push_postfix#(
        @result,
        nqp::atpos_#postfix#(
          $self,
          nqp::if(
            nqp::istype($pulled,Callable),
            $pulled(nqp::elems($self)),
            $pulled.Int
          )
        )
      )
    );

    @result
}

multi sub postcircumfix:<[ ]>(
  array::shaped1#type#array:D \SELF, Iterable:D $pos, array::#type#array:D $values
) is default is raw {
    my $self    := nqp::decont(SELF);
    my $indices := $pos.iterator;
    my int $i    = -1;
    my #type# @result;

    nqp::until(
      nqp::eqaddr((my $pulled := $indices.pull-one),IterationEnd),
      nqp::push_#push_postfix#(
        @result,
        nqp::bindpos_#postfix#(
          $self,
          nqp::if(
            nqp::istype($pulled,Callable),
            $pulled(nqp::elems($self)),
            $pulled.Int
          ),
          nqp::atpos_#postfix#($values,++$i)
        )
      )
    );

    @result
}

SOURCE

    # we're done for this role
    say "#- PLEASE DON'T CHANGE ANYTHING ABOVE THIS LINE";
    say $end ~ $type ~ "array -------------------------";
}

# close the file properly
$*OUT.close;

# vim: expandtab sw=4
