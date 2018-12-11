my class Mix does Mixy {
    has $!WHICH;
    has Real $!total;
    has Real $!total-positive;

#--- interface methods
    multi method STORE(Mix:D: *@pairs, :$INITIALIZE! --> Mix:D) {
        (my $iterator := @pairs.iterator).is-lazy
          ?? Failure.new(
               X::Cannot::Lazy.new(:action<initialize>,:what(self.^name)))
          !! self.SET-SELF(Rakudo::QuantHash.ADD-PAIRS-TO-MIX(
               nqp::create(Rakudo::Internals::IterationSet), $iterator))
    }
    multi method STORE(Mix:D: \objects, \values, :$INITIALIZE! --> Mix:D) {
        self.SET-SELF(
          Rakudo::QuantHash.ADD-OBJECTS-VALUES-TO-MIX(
            nqp::create(Rakudo::Internals::IterationSet), 
            objects.iterator,
            values.iterator
          )
        )
    }

    multi method DELETE-KEY(Mix:D: \k) {
        X::Immutable.new(method => 'DELETE-KEY', typename => self.^name).throw;
    }

#--- introspection methods
    multi method WHICH(Mix:D:)    {
        nqp::if(
          nqp::attrinited(self,Mix,'$!WHICH'),
          $!WHICH,
          $!WHICH := ValueObjAt.new('Mix|' ~ nqp::sha1(
            nqp::join('\0',Rakudo::Sorting.MERGESORT-str(
              Rakudo::QuantHash.BAGGY-RAW-KEY-VALUES(self)
            ))
          ))
        )
    }
    method total(Mix:D: --> Real:D) {
        nqp::if(
          nqp::attrinited(self,Mix,'$!total'),
          $!total,
          $!total := Rakudo::QuantHash.MIX-TOTAL($!elems)
        )
    }
    method !total-positive(Mix:D: --> Real:D) {
        nqp::if(
          nqp::attrinited(self,Mix,'$!total-positive'),
          $!total-positive,
          $!total-positive := Rakudo::QuantHash.MIX-TOTAL-POSITIVE($!elems)
        )
    }

#--- selection methods
    multi method grab($count? --> Real:D) {
        X::Immutable.new( method => 'grab', typename => self.^name ).throw;
    }
    multi method grabpairs($count? --> Real:D) {
        X::Immutable.new( method => 'grabpairs', typename => self.^name ).throw;
    }

#--- coercion methods
    multi method Mix(Mix:D:) { self }
    multi method MixHash(Mix:D) {
        nqp::if(
          $!elems && nqp::elems($!elems),
          nqp::create(MixHash).SET-SELF(Rakudo::QuantHash.BAGGY-CLONE($!elems)),
          nqp::create(MixHash)
        )
    }

    multi method Setty(Mix:U:) { Set }
    multi method Setty(Mix:D:) { self.Set }
    multi method Baggy(Mix:U:) { Bag }
    multi method Baggy(Mix:D:) { self.Bag }
    multi method Mixy (Mix:U:) { Mix }
    multi method Mixy (Mix:D:) { self }

#--- illegal methods
    proto method classify-list(|) {
        X::Immutable.new(:method<classify-list>, :typename(self.^name)).throw;
    }
    proto method categorize-list(|) {
        X::Immutable.new(:method<categorize-list>, :typename(self.^name)).throw;
    }
}

# vim: ft=perl6 expandtab sw=4
