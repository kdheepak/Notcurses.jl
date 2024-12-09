It turns out that Notcurses changed the layout of the `ncinput` struct
between 3.0.9 and 3.0.10. (That's not supposed to happen in a patch
release...) This broke the ABI. We thus require at least `Notcurses_jll @3.0.10`.

The current version of the headers in the `include` directory here are
taken from Notcurses 3.0.11.
