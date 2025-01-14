It turns out that Notcurses changed the layout of the `ncinput` struct
between 3.0.9 and 3.0.10. (That's not supposed to happen in a patch
release...) This broke the ABI.

There was another ABI break between 3.0.11 and 3.0.12. We now assume
that ABI is unstable and pin the exact version of `Ncurses_Jll`.

The current version of the headers in the `include` directory here are
taken from Notcurses 3.0.12.
