use MONKEY-SEE-NO-EVAL;
use Test;

plan 10;

sub no-args() {
    444
}
is-deeply
        EVAL(RakuAST::Call::Name.new(
            name => RakuAST::Name.from-identifier('no-args')
        )),
        444,
        'Can make a named call with no arguments';

sub one-arg($x) {
    9 * $x
}
is-deeply
        EVAL(RakuAST::Call::Name.new(
            name => RakuAST::Name.from-identifier('one-arg'),
            args => RakuAST::ArgList.new(RakuAST::IntLiteral.new(5))
        )),
        45,
        'Can make a named call with one positional argument';

sub two-args($x, $y) {
    $x - $y
}
is-deeply
        EVAL(RakuAST::Call::Name.new(
            name => RakuAST::Name.from-identifier('two-args'),
            args => RakuAST::ArgList.new(
                RakuAST::IntLiteral.new(5),
                RakuAST::IntLiteral.new(3),
            )
        )),
        2,
        'Can make a named call with two positional arguments';

my $target = -> $a, $b { $a - $b }
is-deeply
        EVAL(RakuAST::ApplyPostfix.new(
            operand => RakuAST::Var::Lexical.new('$target'),
            postfix => RakuAST::Call::Term.new(
                args => RakuAST::ArgList.new(
                    RakuAST::IntLiteral.new(9),
                    RakuAST::IntLiteral.new(4),
                )
            )
        )),
        5,
        'Can make a call on a term with two positional arguments';

class TestTarget {
    my $.route = 66;
    method subtract($x, $y) { $x - $y }
}
is-deeply
        EVAL(RakuAST::ApplyPostfix.new(
            operand => RakuAST::Type::Simple.new('TestTarget'),
            postfix => RakuAST::Call::Method.new(
                name => RakuAST::Name.from-identifier('route')
            )
        )),
        66,
        'Can make a call on a method without arguments';
is-deeply
        EVAL(RakuAST::ApplyPostfix.new(
            operand => RakuAST::Type::Simple.new('TestTarget'),
            postfix => RakuAST::Call::Method.new(
                name => RakuAST::Name.from-identifier('subtract'),
                args => RakuAST::ArgList.new(
                    RakuAST::IntLiteral.new(14),
                    RakuAST::IntLiteral.new(6),
                )
            )
        )),
        8,
        'Can make a call on a method with positional arguments';

{
    my @args;
    is-deeply
            EVAL(RakuAST::Call::Name.new(
                name => RakuAST::Name.from-identifier('no-args'),
                args => RakuAST::ArgList.new(
                    RakuAST::ApplyPrefix.new(
                        prefix => RakuAST::Prefix.new('|'),
                        operand => RakuAST::Var::Lexical.new('@args')
                    )
                )
            )),
            444,
            'Can make a call that flattens arguments (empty flattening list)';

    @args = 95, 40;
    is-deeply
            EVAL(RakuAST::Call::Name.new(
                name => RakuAST::Name.from-identifier('two-args'),
                args => RakuAST::ArgList.new(
                    RakuAST::ApplyPrefix.new(
                        prefix => RakuAST::Prefix.new('|'),
                        operand => RakuAST::Var::Lexical.new('@args')
                    )
                )
            )),
            55,
            'Can make a call that flattens two positional arguments';

    my %args;
    is-deeply
            EVAL(RakuAST::Call::Name.new(
                name => RakuAST::Name.from-identifier('no-args'),
                args => RakuAST::ArgList.new(
                    RakuAST::ApplyPrefix.new(
                        prefix => RakuAST::Prefix.new('|'),
                        operand => RakuAST::Var::Lexical.new('%args')
                    )
                )
            )),
            444,
            'Can make a call that flattens arguments (empty flattening hash)';

    sub two-named(:$n1, :$n2) { $n1 / $n2 }
    %args<n1 n2> = 60, 12;
    is-deeply
            EVAL(RakuAST::Call::Name.new(
                name => RakuAST::Name.from-identifier('two-named'),
                args => RakuAST::ArgList.new(
                    RakuAST::ApplyPrefix.new(
                        prefix => RakuAST::Prefix.new('|'),
                        operand => RakuAST::Var::Lexical.new('%args')
                    )
                )
            )),
            5.0,
            'Can make a call that flattens two named arguments';
}