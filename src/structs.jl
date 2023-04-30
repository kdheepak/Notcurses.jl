"""
Capabilities, derived from terminfo, environment variables, and queries
"""
struct Capabilities
  colors::Int
  utf8::Bool
  rgb::Bool
  can_change_colors::Bool
  halfblocks::Bool
  quadrants::Bool
  sextants::Bool
  braille::Bool
end

# Has to be `mutable` struct for finalizer to work
mutable struct NotcursesObject
  opts::Options
  ptr::Ptr{L.notcurses}
end
function NotcursesObject(; file::Union{IOStream,Nothing} = nothing, opts = Options())
  nc = init(NotcursesObject, opts, file)
  nc
end

Base.cconvert(::Type{Ptr{L.notcurses}}, nc::NotcursesObject) = nc.ptr
Base.close(nc::NotcursesObject) = stop(nc)

mutable struct Direct
  ptr::Ptr{L.ncdirect}
end
function Direct(; file::Union{IOStream,Nothing} = nothing, opts = Options())
  nc = init(Direct, opts, file)
  nc
end

struct Plane
  ptr::Ptr{L.ncplane}
end
Base.cconvert(::Type{Ptr{L.ncplane}}, nc::Plane) = nc.ptr

"""
An nccell corresponds to a single character cell on some plane, which can be
occupied by a single grapheme cluster (some root spacing glyph, along with
possible combining characters, which might span multiple columns). At any
cell, we can have a theoretically arbitrarily long UTF-8 EGC, a foreground
color, a background color, and an attribute set. Valid grapheme cluster
contents include:

  - A NUL terminator,
  - A single control character, followed by a NUL terminator,
  - At most one spacing character, followed by zero or more nonspacing
    characters, followed by a NUL terminator.

Multi-column characters can only have a single style/color throughout.
Existence is suffering, and thus wcwidth() is not reliable. It's just
quoting whether or not the EGC contains a "Wide Asian" double-width
character. This is set for some things, like most emoji, and not set for
other things, like cuneiform. True display width is a *function of the
font and terminal*. Among the longest Unicode codepoints is

U+FDFD ARABIC LIGATURE BISMILLAH AR-RAHMAN AR-RAHEEM ﷽

wcwidth() rather optimistically claims this most exalted glyph to occupy
a single column. BiDi text is too complicated for me to even get into here.
Be assured there are no easy answers; ours is indeed a disturbing Universe.

Each nccell occupies 16 static bytes (128 bits). The surface is thus ~1.6MB
for a (pretty large) 500x200 terminal. At 80x43, it's less than 64KB.
Dynamic requirements (the egcpool) can add up to 16MB to an ncplane, but
such large pools are unlikely in common use.

We implement some small alpha compositing. Foreground and background both
have two bits of inverted alpha. The actual grapheme written to a cell is
the topmost non-zero grapheme. If its alpha is 00, its foreground color is
used unchanged. If its alpha is 10, its foreground color is derived entirely
from cells underneath it. Otherwise, the result will be a composite.
Likewise for the background. If the bottom of a coordinate's zbuffer is
reached with a cumulative alpha of zero, the default is used. In this way,
a terminal configured with transparent background can be supported through
multiple occluding ncplanes. A foreground alpha of 11 requests high-contrast
text (relative to the computed background). A background alpha of 11 is
currently forbidden.

Default color takes precedence over palette or RGB, and cannot be used with
transparency. Indexed palette takes precedence over RGB. It cannot
meaningfully set transparency, but it can be mixed into a cascading color.
RGB is used if neither default terminal colors nor palette indexing are in
play, and fully supports all transparency options.

This structure is exposed only so that most functions can be inlined. Do not
directly modify or access the fields of this structure; use the API.
"""
mutable struct Cell
  cell::L.nccell
  ptr::Ptr{L.nccell}
  function Cell()
    cell = L.nccell(0, 0, 0, 0, 0)
    ptr = pointer(cell)
    new(ptr, cell)
  end
end
Base.cconvert(::Type{Ptr{L.nccell}}, c::Cell) = c.ptr

mutable struct Visual
  ptr::Ptr{L.ncvisual}
end
Base.cconvert(::Type{Ptr{L.ncvisual}}, c::Visual) = c.ptr

function Visual(height::Integer, width::Integer)
  buf = zeros(UInt8, height * width * 4)
  for i in 0:(height*width-1)
    buf[4*i+1] = 0
    buf[4*i+2] = 0
    buf[4*i+3] = 0
    buf[4*i+4] = 255
  end
  Visual(L.ncvisual_from_rgba(pointer(buf), height, width * 4, width))
end
