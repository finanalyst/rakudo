# This file contains the Dutch deparsing logic for the Raku
# Programming Language.

#- start of generated part of localization ------------------------------------
#- Generated on 2023-10-29T01:51:53Z by tools/build/makeL10N.raku
#- PLEASE DON'T CHANGE ANYTHING BELOW THIS LINE

my %xlation = "adverb-pc-delete", "verwijder", "adverb-pc-exists", "bestaat", "adverb-pc-k", "s", "adverb-pc-kv", "sw", "adverb-pc-v", "w", "adverb-q-double", "dubbel", "adverb-q-exec", "voer-uit", "adverb-q-function", "functies", "adverb-q-heredoc", "tot-teken", "adverb-q-single", "enkel", "adverb-q-to", "tot", "adverb-q-val", "allomorph", "adverb-q-words", "woorden", "adverb-rx-continue", "continueer", "adverb-rx-ex", "ui", "adverb-rx-exhaustive", "uitputtend", "adverb-rx-global", "globaal", "adverb-rx-i", "nk", "adverb-rx-ignorecase", "negeerkast", "adverb-rx-ignoremark", "negeeraccent", "adverb-rx-ii", "zk", "adverb-rx-m", "na", "adverb-rx-mm", "za", "adverb-rx-nd", "de", "adverb-rx-nth", "de", "adverb-rx-ratchet", "ratel", "adverb-rx-rd", "de", "adverb-rx-samecase", "zelfdekast", "adverb-rx-samemark", "zelfdeaccent", "adverb-rx-samespace", "zelfdespatie", "adverb-rx-sigspace", "sigspatie", "adverb-rx-ss", "zs", "adverb-rx-st", "ste", "adverb-rx-to", "tot", "adverb-rx-x", "keer", "block-default", "gebrek", "block-else", "anders", "block-elsif", "andersals", "block-for", "vooralle", "block-given", "gegeven", "block-if", "als", "block-loop", "lus", "block-orwith", "ofmet", "block-repeat", "herhaal", "block-unless", "tenzij", "block-until", "totdat", "block-when", "indien", "block-whenever", "zodra", "block-while", "zolang", "block-with", "met", "block-without", "zonder", "constraint-where", "waar", "core-all", "alle", "core-antipairs", "antiparen", "core-any", "elke", "core-append", "voeg-achteraan", "core-await", "wacht-op", "core-bag", "tas", "core-bail-out", "geef-op", "core-bless", "zegen", "core-can-ok", "kan-ok", "core-categorize", "categoriseer", "core-ceiling", "plafond", "core-chars", "letters", "core-chomp", "kap-regeleinde", "core-chop", "kap", "core-chr", "als-letter", "core-chrs", "als-letters", "core-classify", "classificeer", "core-close", "sluit", "core-comb", "kam", "core-combinations", "combinaties", "core-contains", "bevat", "core-cross", "kruis", "core-decode", "decodeer", "core-deepmap", "diep-arrangeer", "core-defined", "gedefinieerd", "core-die", "sterf", "core-done", "klaar", "core-duckmap", "duik-arrangeer", "core-elems", "elementen", "core-emit", "zend", "core-encode", "codeer", "core-end", "einde", "core-ends-with", "eindigt-met", "core-eval-dies-ok", "eval-sterft-ok", "core-eval-lives-ok", "eval-leeft-ok", "core-exit", "verlaat", "core-fail", "faal", "core-fails-like", "faalt-als", "core-fc", "vouw-kast", "core-first", "eerste", "core-flat", "plat", "core-flip", "draaiom", "core-floor", "vloer", "core-flunk", "gezakt", "core-get", "pak", "core-getc", "pakc", "core-gist", "kern", "core-grep", "filter", "core-hash", "moes", "core-head", "hoofd", "core-indent", "indenteer", "core-is-approx", "is-ongeveer", "core-is-deeply", "is-helemaal", "core-is-prime", "is-priem", "core-isa-ok", "iseen-ok", "core-isnt", "isniet", "core-join", "plak", "core-key", "sleutel", "core-keys", "sleutels", "core-kv", "sw", "core-last", "laatste", "core-lastcall", "laatste-aanroep", "core-lc", "onder-kast", "core-like", "lijkt-op", "core-lines", "regels", "core-link", "koppeling", "core-list", "lijst", "core-lives-ok", "leeft-ok", "core-lsb", "minst-belangrijke-bit", "core-make", "maak", "core-map", "arrangeer", "core-move", "verplaats", "core-msb", "belangrijkste-bit", "core-new", "nieuw", "core-next", "volgende", "core-nok", "niet-ok", "core-none", "geen", "core-not", "niet", "core-note", "merk-op", "core-one", "een", "core-ord", "als-getal", "core-ords", "als-getallen", "core-pair", "paar", "core-pairs", "paren", "core-parse-base", "ontleed-nummer", "core-pass", "geslaagd", "core-permutations", "permutaties", "core-pick", "kies", "core-plan", "verwacht", "core-pop", "floep", "core-prepend", "voeg-voor", "core-print", "druk", "core-printf", "drukf", "core-proceed", "ga-door", "core-prompt", "vraag", "core-push", "stapel-op", "core-put", "zeg-het", "core-rand", "willekeurig", "core-redo", "nog-eens", "core-reduce", "reduceer", "core-repeated", "herhaaldelijk", "core-return", "retour", "core-return-rw", "retour-rw", "core-reverse", "keer-om", "core-rindex", "om-index", "core-roll", "gooi", "core-roots", "wortels", "core-rotate", "roteer", "core-round", "rond-af", "core-roundrobin", "ieder-een", "core-run", "voer-uit", "core-samecase", "zelfde-kast", "core-samemark", "zelfde-accent", "core-samewith", "zelfde-met", "core-say", "zeg", "core-set", "verzameling", "core-shift", "onderuit", "core-sign", "teken", "core-signal", "signaal", "core-skip", "sla-over", "core-skip-rest", "sla-rest-over", "core-sleep", "slaap", "core-sleep-timer", "wekker", "core-sleep-until", "slaap-tot", "core-slip", "glip", "core-snip", "knip", "core-snitch", "spiek", "core-so", "dus", "core-sort", "sorteer", "core-splice", "splits-lijst", "core-split", "splits-letters", "core-sprintf", "sdrukf", "core-spurt", "spuit", "core-sqrt", "wortel", "core-squish", "plet", "core-srand", "zo-willekeurig", "core-starts-with", "begint-met", "core-subst", "substitueer", "core-substr-eq", "substr-gelijk", "core-succeed", "slaag", "core-sum", "sommeer", "core-symlink", "symbolische-koppeling", "core-tail", "staart", "core-take", "neem", "core-take-rw", "neem-rw", "core-tc", "titel-kast", "core-tclc", "titel-onder-kast", "core-throws-like", "knalt-als", "core-todo", "tedoen", "core-trans", "vertaal", "core-trim-leading", "trim-vooraan", "core-trim-trailing", "trim-achteraan", "core-truncate", "kap-af", "core-uc", "boven-kast", "core-unique", "uniek", "core-unlike", "lijkt-niet-als", "core-unlink", "ontkoppel", "core-unshift", "onderin", "core-use-ok", "gebruik-ok", "core-val", "als-nummers", "core-value", "waarde", "core-values", "waardes", "core-warn", "waarschuw", "core-wordcase", "woord-kast", "core-words", "woorden", "core-zip", "rits", "infix-(cont)", "(bevat)", "infix-(elem)", "(element)", "infix-after", "na", "infix-and", "en", "infix-andthen", "endan", "infix-before", "voor", "infix-but", "maar", "infix-cmp", "vergelijk", "infix-div", "deel", "infix-does", "doet", "infix-eq", "ge", "infix-ge", "gg", "infix-le", "kg", "infix-leg", "kgg", "infix-lt", "kn", "infix-mod", "modulo", "infix-ne", "ongelijk", "infix-notandthen", "nietendan", "infix-or", "of", "infix-orelse", "ofanders", "infix-Z", "R", "meta-R", "O", "meta-Z", "R", "modifier-for", "vooralle", "modifier-given", "gegeven", "modifier-if", "als", "modifier-unless", "tenzij", "modifier-until", "tot", "modifier-when", "indien", "modifier-while", "terwijl", "modifier-with", "met", "modifier-without", "zonder", "multi-only", "alleen", "named-absolute", "absoluut", "named-actions", "acties", "named-append", "voegtoe", "named-catch", "vangfout", "named-chomp", "kap-regeleinde", "named-close", "sluit", "named-command", "commando", "named-completely", "volledig", "named-continue", "continueer", "named-control", "controle", "named-count", "aantal", "named-create", "maak-aan", "named-createonly", "maak-nieuw-aan", "named-date", "datum", "named-day", "dag", "named-degree", "vrijheidsgraad", "named-delete", "verwijder", "named-elems", "elementen", "named-enc", "cod", "named-encoding", "codering", "named-end", "vaneinde", "named-every", "elke", "named-ex", "ui", "named-exclusive", "exclusief", "named-exhaustive", "uitputtend", "named-expires", "verloopt", "named-family", "familie", "named-filename", "bestandsnaam", "named-global", "globaal", "named-hour", "uur", "named-i", "nk", "named-ignorecase", "negeerkast", "named-ignoremark", "negeeraccent", "named-ii", "zk", "named-k", "s", "named-key", "sleutel", "named-kv", "sw", "named-listen", "luister", "named-minute", "minuut", "named-mm", "za", "named-month", "maand", "named-name", "naam", "named-nd", "de", "named-nth", "de", "named-off", "uit", "named-partial", "gedeeltelijk", "named-parts", "delen", "named-port", "poort", "named-primary", "eerste", "named-quaternary", "vierde", "named-rd", "de", "named-replacement", "vervanging", "named-samecase", "zelfdekast", "named-samemark", "zelfdeaccent", "named-samespace", "zelfdespatie", "named-second", "seconde", "named-secondary", "tweede", "named-seconds", "seconden", "named-size", "grootte", "named-squash", "drukplat", "named-ss", "zs", "named-st", "ste", "named-tertiary", "derde", "named-th", "de", "named-times", "herhalingen", "named-timezone", "tijdzone", "named-truncate", "kap-af", "named-v", "w", "named-value", "waarde", "named-where", "waar", "named-x", "keer", "named-year", "jaar", "package-class", "klasse", "package-grammar", "grammatica", "package-package", "pakket", "package-role", "rol", "phaser-CATCH", "VANGFOUT", "phaser-CONTROL", "VANGBERICHT", "phaser-END", "EINDE", "phaser-ENTER", "BINNENKOMST", "phaser-FIRST", "EERSTE", "phaser-INIT", "INITIALISATIE", "phaser-KEEP", "ACCEPTEER", "phaser-LAST", "LAATSTE", "phaser-LEAVE", "AFSCHEID", "phaser-NEXT", "VOLGENDE", "phaser-POST", "ACHTERAF", "phaser-PRE", "VOORAF", "phaser-QUIT", "STOP", "phaser-UNDO", "NEGEER", "pragma-dynamic-scope", "dynamische-ruimte", "pragma-fatal", "fataal", "pragma-internals", "interne-functies", "pragma-invocant", "aanroeper", "pragma-lib", "bibliotheek", "pragma-precompilation", "compilatie-vooraf", "pragma-soft", "zacht", "pragma-strict", "strikt", "pragma-trace", "verloop", "pragma-variables", "variablen", "pragma-worries", "zorgen", "prefix-not", "niet", "prefix-so", "wel", "quote-lang-qq", "dq", "routine-method", "methode", "routine-rule", "regel", "routine-sub", "functie", "routine-submethod", "submethode", "scope-anon", "anoniem", "scope-augment", "verbeter", "scope-has", "heeft", "scope-HAS", "HEEFT", "scope-my", "mijn", "scope-our", "onze", "scope-state", "steeds", "scope-unit", "eenheid", "stmt-prefix-also", "eveneens", "stmt-prefix-do", "doe", "stmt-prefix-eager", "vlijtig", "stmt-prefix-gather", "verzamel", "stmt-prefix-lazy", "lui", "stmt-prefix-quietly", "stilletjes", "stmt-prefix-react", "reageer", "stmt-prefix-sink", "zink", "stmt-prefix-supply", "lever", "stmt-prefix-try", "probeer", "term-now", "nu", "term-rand", "willekeurig", "term-self", "zelf", "term-time", "tijd", "trait-is-copy", "kopie", "trait-is-default", "verstek", "trait-is-DEPRECATED", "VEROUDERD", "trait-is-equiv", "equivalent", "trait-is-implementation-detail", "implementatie-detail", "trait-is-looser", "losser", "trait-is-pure", "puur", "trait-is-raw", "rauw", "trait-is-rw", "lezen-schrijven", "trait-is-test-assertion", "test-assertie", "trait-is-tighter", "strakker", "traitmod-does", "doet", "traitmod-handles", "begrijpt", "traitmod-hides", "verbergt", "traitmod-of", "netals", "traitmod-returns", "geeft-terug", "traitmod-trusts", "vertrouwd", "use-import", "importeer", "use-need", "behoeft", "use-no", "geen", "use-require", "vereist", "use-use", "gebruik";
role RakuAST::Deparse::L10N::NL {
    method xsyn (str $prefix, str $key) {
                %xlation{"$prefix-$key"} // $key
    }
}

#- PLEASE DON'T CHANGE ANYTHING ABOVE THIS LINE
#- end of generated part of localization --------------------------------------

# vim: expandtab shiftwidth=4
