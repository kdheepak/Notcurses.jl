"""
    ncdirect_init(termtype, fp, flags)

Initialize a direct-mode Notcurses context on the connected terminal at 'fp'.
'fp' must be a tty. You'll usually want stdout. Direct mode supports a
limited subset of Notcurses routines which directly affect 'fp', and neither
supports nor requires notcurses_render(). This can be used to add color and
styling to text in the standard output paradigm. 'flags' is a bitmask over
NCDIRECT_OPTION_*.
Returns NULL on error, including any failure initializing terminfo.

### Prototype

```c
API ALLOC struct ncdirect* ncdirect_init(const char* termtype, FILE* fp, uint64_t flags);
```
"""
function ncdirect_init(termtype, fp, flags)
  @ccall libnotcurses.ncdirect_init(termtype::Ptr{Cchar}, fp::Ptr{Libc.FILE}, flags::UInt64)::Ptr{ncdirect}
end

"""
    notcurses_init(opts, fp)

Initialize a Notcurses context on the connected terminal at 'fp'. 'fp' must
be a tty. You'll usually want stdout. NULL can be supplied for 'fp', in
which case /dev/tty will be opened. Returns NULL on error, including any
failure initializing terminfo.

### Prototype

```c
API ALLOC struct notcurses* notcurses_init(const notcurses_options* opts, FILE* fp);
```
"""
function notcurses_init(opts, fp)
  @ccall libnotcurses.notcurses_init(opts::Ptr{notcurses_options}, fp::Ptr{Libc.FILE})::Ptr{notcurses}
end
