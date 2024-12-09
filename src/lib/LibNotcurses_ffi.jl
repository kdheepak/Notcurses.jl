"""
    ncdirect_set_bg_rgb8(nc, r, g, b)


### Prototype
```c
static inline int ncdirect_set_bg_rgb8(struct ncdirect* nc, unsigned r, unsigned g, unsigned b);
```
"""
function ncdirect_set_bg_rgb8(nc, r, g, b)
    @ccall libnotcurses_ffi.ncdirect_set_bg_rgb8(nc::Ptr{ncdirect}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    ncdirect_set_fg_rgb8(nc, r, g, b)


### Prototype
```c
static inline int ncdirect_set_fg_rgb8(struct ncdirect* nc, unsigned r, unsigned g, unsigned b);
```
"""
function ncdirect_set_fg_rgb8(nc, r, g, b)
    @ccall libnotcurses_ffi.ncdirect_set_fg_rgb8(nc::Ptr{ncdirect}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    ncdirect_light_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)


### Prototype
```c
__attribute__ ((nonnull (1))) static inline int ncdirect_light_box(struct ncdirect* n, uint64_t ul, uint64_t ur, uint64_t ll, uint64_t lr, unsigned ylen, unsigned xlen, unsigned ctlword);
```
"""
function ncdirect_light_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    @ccall libnotcurses_ffi.ncdirect_light_box(n::Ptr{ncdirect}, ul::Cint, ur::Cint, ll::Cint, lr::Cint, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

"""
    ncdirect_heavy_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)


### Prototype
```c
__attribute__ ((nonnull (1))) static inline int ncdirect_heavy_box(struct ncdirect* n, uint64_t ul, uint64_t ur, uint64_t ll, uint64_t lr, unsigned ylen, unsigned xlen, unsigned ctlword);
```
"""
function ncdirect_heavy_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    @ccall libnotcurses_ffi.ncdirect_heavy_box(n::Ptr{ncdirect}, ul::Cint, ur::Cint, ll::Cint, lr::Cint, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

"""
    ncdirect_ascii_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)


### Prototype
```c
__attribute__ ((nonnull (1))) static inline int ncdirect_ascii_box(struct ncdirect* n, uint64_t ul, uint64_t ur, uint64_t ll, uint64_t lr, unsigned ylen, unsigned xlen, unsigned ctlword);
```
"""
function ncdirect_ascii_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    @ccall libnotcurses_ffi.ncdirect_ascii_box(n::Ptr{ncdirect}, ul::Cint, ur::Cint, ll::Cint, lr::Cint, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

"""
    ncdirect_get_nblock(n, ni)

'ni' may be NULL if the caller is uninterested in event details. If no event
is ready, returns 0.
### Prototype
```c
static inline uint32_t ncdirect_get_nblock(struct ncdirect* n, ncinput* ni);
```
"""
function ncdirect_get_nblock(n, ni)
    @ccall libnotcurses_ffi.ncdirect_get_nblock(n::Ptr{ncdirect}, ni::Ptr{Cint})::Cint
end

"""
    ncdirect_get_blocking(n, ni)

'ni' may be NULL if the caller is uninterested in event details. Blocks
until an event is processed or a signal is received.
### Prototype
```c
static inline uint32_t ncdirect_get_blocking(struct ncdirect* n, ncinput* ni);
```
"""
function ncdirect_get_blocking(n, ni)
    @ccall libnotcurses_ffi.ncdirect_get_blocking(n::Ptr{ncdirect}, ni::Ptr{Cint})::Cint
end

"""
    ncdirect_cantruecolor(n)

Can we directly specify RGB values per cell, or only use palettes?
### Prototype
```c
static inline bool ncdirect_cantruecolor(const struct ncdirect* n);
```
"""
function ncdirect_cantruecolor(n)
    @ccall libnotcurses_ffi.ncdirect_cantruecolor(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_canchangecolor(n)

Can we set the "hardware" palette? Requires the "ccc" terminfo capability.
### Prototype
```c
static inline bool ncdirect_canchangecolor(const struct ncdirect* n);
```
"""
function ncdirect_canchangecolor(n)
    @ccall libnotcurses_ffi.ncdirect_canchangecolor(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_canfade(n)

Can we fade? Fading requires either the "rgb" or "ccc" terminfo capability.
### Prototype
```c
static inline bool ncdirect_canfade(const struct ncdirect* n);
```
"""
function ncdirect_canfade(n)
    @ccall libnotcurses_ffi.ncdirect_canfade(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_canopen_images(n)

Can we load images? This requires being built against FFmpeg/OIIO.
### Prototype
```c
static inline bool ncdirect_canopen_images(const struct ncdirect* n __attribute__ ((unused)));
```
"""
function ncdirect_canopen_images(n)
    @ccall libnotcurses_ffi.ncdirect_canopen_images(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_canopen_videos(n)

Can we load videos? This requires being built against FFmpeg.
### Prototype
```c
static inline bool ncdirect_canopen_videos(const struct ncdirect* n __attribute__ ((unused)));
```
"""
function ncdirect_canopen_videos(n)
    @ccall libnotcurses_ffi.ncdirect_canopen_videos(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_canhalfblock(nc)

Can we reliably use Unicode halfblocks?
### Prototype
```c
static inline bool ncdirect_canhalfblock(const struct ncdirect* nc);
```
"""
function ncdirect_canhalfblock(nc)
    @ccall libnotcurses_ffi.ncdirect_canhalfblock(nc::Ptr{ncdirect})::Cint
end

"""
    ncdirect_canquadrant(nc)

Can we reliably use Unicode quadrants?
### Prototype
```c
static inline bool ncdirect_canquadrant(const struct ncdirect* nc);
```
"""
function ncdirect_canquadrant(nc)
    @ccall libnotcurses_ffi.ncdirect_canquadrant(nc::Ptr{ncdirect})::Cint
end

"""
    ncdirect_cansextant(nc)

Can we reliably use Unicode 13 sextants?
### Prototype
```c
static inline bool ncdirect_cansextant(const struct ncdirect* nc);
```
"""
function ncdirect_cansextant(nc)
    @ccall libnotcurses_ffi.ncdirect_cansextant(nc::Ptr{ncdirect})::Cint
end

"""
    ncdirect_canbraille(nc)

Can we reliably use Unicode Braille?
### Prototype
```c
static inline bool ncdirect_canbraille(const struct ncdirect* nc);
```
"""
function ncdirect_canbraille(nc)
    @ccall libnotcurses_ffi.ncdirect_canbraille(nc::Ptr{ncdirect})::Cint
end

"""
    nckey_synthesized_p(w)

Is this uint32_t a synthesized event?
### Prototype
```c
static inline bool nckey_synthesized_p(uint32_t w);
```
"""
function nckey_synthesized_p(w)
    @ccall libnotcurses_ffi.nckey_synthesized_p(w::UInt32)::Bool
end

"""
    nckey_pua_p(w)

Is this uint32_t from the Private Use Area in the BMP (Plane 0)?
### Prototype
```c
static inline bool nckey_pua_p(uint32_t w);
```
"""
function nckey_pua_p(w)
    @ccall libnotcurses_ffi.nckey_pua_p(w::UInt32)::Bool
end

"""
    nckey_supppuaa_p(w)

Is this uint32_t a Supplementary Private Use Area-A codepoint?
### Prototype
```c
static inline bool nckey_supppuaa_p(uint32_t w);
```
"""
function nckey_supppuaa_p(w)
    @ccall libnotcurses_ffi.nckey_supppuaa_p(w::UInt32)::Bool
end

"""
    nckey_supppuab_p(w)

Is this uint32_t a Supplementary Private Use Area-B codepoint?
### Prototype
```c
static inline bool nckey_supppuab_p(uint32_t w);
```
"""
function nckey_supppuab_p(w)
    @ccall libnotcurses_ffi.nckey_supppuab_p(w::UInt32)::Bool
end

"""
    ncchannel_alpha(channel)

Extract the 2-bit alpha component from a 32-bit channel. It is not
shifted down, and can be directly compared to NCALPHA_* values.
### Prototype
```c
static inline uint32_t ncchannel_alpha(uint32_t channel);
```
"""
function ncchannel_alpha(channel)
    @ccall libnotcurses_ffi.ncchannel_alpha(channel::UInt32)::UInt32
end

"""
    ncchannel_set_alpha(channel, alpha)

Set the 2-bit alpha component of the 32-bit channel. Background channels
must not be set to NCALPHA_HIGHCONTRAST. It is an error if alpha contains
any bits other than NCALPHA_*.
### Prototype
```c
static inline int ncchannel_set_alpha(uint32_t* channel, unsigned alpha);
```
"""
function ncchannel_set_alpha(channel, alpha)
    @ccall libnotcurses_ffi.ncchannel_set_alpha(channel::Ptr{UInt32}, alpha::Cuint)::Cint
end

"""
    ncchannel_default_p(channel)

Is this channel using the "default color" rather than RGB/palette-indexed?
### Prototype
```c
static inline bool ncchannel_default_p(uint32_t channel);
```
"""
function ncchannel_default_p(channel)
    @ccall libnotcurses_ffi.ncchannel_default_p(channel::UInt32)::Bool
end

"""
    ncchannel_set_default(channel)

Mark the channel as using its default color. Alpha is set opaque.
### Prototype
```c
static inline uint32_t ncchannel_set_default(uint32_t* channel);
```
"""
function ncchannel_set_default(channel)
    @ccall libnotcurses_ffi.ncchannel_set_default(channel::Ptr{UInt32})::UInt32
end

"""
    ncchannel_palindex_p(channel)

Is this channel using palette-indexed color?
### Prototype
```c
static inline bool ncchannel_palindex_p(uint32_t channel);
```
"""
function ncchannel_palindex_p(channel)
    @ccall libnotcurses_ffi.ncchannel_palindex_p(channel::UInt32)::Bool
end

"""
    ncchannel_palindex(channel)

Extract the palette index from a channel. Only valid if
ncchannel_palindex_p() would return true for the channel.
### Prototype
```c
static inline unsigned ncchannel_palindex(uint32_t channel);
```
"""
function ncchannel_palindex(channel)
    @ccall libnotcurses_ffi.ncchannel_palindex(channel::UInt32)::Cuint
end

"""
    ncchannel_set_palindex(channel, idx)

Mark the channel as using the specified palette color. It is an error if
the index is greater than NCPALETTESIZE. Alpha is set opaque.
### Prototype
```c
static inline int ncchannel_set_palindex(uint32_t* channel, unsigned idx);
```
"""
function ncchannel_set_palindex(channel, idx)
    @ccall libnotcurses_ffi.ncchannel_set_palindex(channel::Ptr{UInt32}, idx::Cuint)::Cint
end

"""
    ncchannel_rgb_p(channel)

Is this channel using RGB color?
### Prototype
```c
static inline bool ncchannel_rgb_p(uint32_t channel);
```
"""
function ncchannel_rgb_p(channel)
    @ccall libnotcurses_ffi.ncchannel_rgb_p(channel::UInt32)::Bool
end

"""
    ncchannel_r(channel)

Extract the 8-bit red component from a 32-bit channel. Only valid if
ncchannel_rgb_p() would return true for the channel.
### Prototype
```c
static inline unsigned ncchannel_r(uint32_t channel);
```
"""
function ncchannel_r(channel)
    @ccall libnotcurses_ffi.ncchannel_r(channel::UInt32)::Cuint
end

"""
    ncchannel_g(channel)

Extract the 8-bit green component from a 32-bit channel. Only valid if
ncchannel_rgb_p() would return true for the channel.
### Prototype
```c
static inline unsigned ncchannel_g(uint32_t channel);
```
"""
function ncchannel_g(channel)
    @ccall libnotcurses_ffi.ncchannel_g(channel::UInt32)::Cuint
end

"""
    ncchannel_b(channel)

Extract the 8-bit blue component from a 32-bit channel. Only valid if
ncchannel_rgb_p() would return true for the channel.
### Prototype
```c
static inline unsigned ncchannel_b(uint32_t channel);
```
"""
function ncchannel_b(channel)
    @ccall libnotcurses_ffi.ncchannel_b(channel::UInt32)::Cuint
end

"""
    ncchannel_rgb(channel)

Extract the 24-bit RGB value from a 32-bit channel.
Only valid if ncchannel_rgb_p() would return true for the channel.
### Prototype
```c
static inline uint32_t ncchannel_rgb(uint32_t channel);
```
"""
function ncchannel_rgb(channel)
    @ccall libnotcurses_ffi.ncchannel_rgb(channel::UInt32)::UInt32
end

"""
    ncchannel_rgb8(channel, r, g, b)

Extract the three 8-bit R/G/B components from a 32-bit channel.
Only valid if ncchannel_rgb_p() would return true for the channel.
### Prototype
```c
static inline uint32_t ncchannel_rgb8(uint32_t channel, unsigned* RESTRICT r, unsigned* RESTRICT g, unsigned* RESTRICT b);
```
"""
function ncchannel_rgb8(channel, r, g, b)
    @ccall libnotcurses_ffi.ncchannel_rgb8(channel::UInt32, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

"""
    ncchannel_set_rgb8(channel, r, g, b)

Set the three 8-bit components of a 32-bit channel, and mark it as not using
the default color. Retain the other bits unchanged. Any value greater than
255 will result in a return of -1 and no change to the channel.
### Prototype
```c
static inline int ncchannel_set_rgb8(uint32_t* channel, unsigned r, unsigned g, unsigned b);
```
"""
function ncchannel_set_rgb8(channel, r, g, b)
    @ccall libnotcurses_ffi.ncchannel_set_rgb8(channel::Ptr{UInt32}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    ncchannel_set(channel, rgb)

Same, but provide an assembled, packed 24 bits of rgb.
### Prototype
```c
static inline int ncchannel_set(uint32_t* channel, uint32_t rgb);
```
"""
function ncchannel_set(channel, rgb)
    @ccall libnotcurses_ffi.ncchannel_set(channel::Ptr{UInt32}, rgb::UInt32)::Cint
end

"""
    ncchannel_set_rgb8_clipped(channel, r, g, b)

Set the three 8-bit components of a 32-bit channel, and mark it as not using
the default color. Retain the other bits unchanged. r, g, and b will be
clipped to the range [0..255].
### Prototype
```c
static inline void ncchannel_set_rgb8_clipped(uint32_t* channel, int r, int g, int b);
```
"""
function ncchannel_set_rgb8_clipped(channel, r, g, b)
    @ccall libnotcurses_ffi.ncchannel_set_rgb8_clipped(channel::Ptr{UInt32}, r::Cint, g::Cint, b::Cint)::Cvoid
end

"""
    ncchannels_bchannel(channels)

Extract the background alpha and coloring bits from a 64-bit channel
pair as a single 32-bit value.
### Prototype
```c
static inline uint32_t ncchannels_bchannel(uint64_t channels);
```
"""
function ncchannels_bchannel(channels)
    @ccall libnotcurses_ffi.ncchannels_bchannel(channels::UInt64)::UInt32
end

"""
    ncchannels_fchannel(channels)

Extract the foreground alpha and coloring bits from a 64-bit channel
pair as a single 32-bit value.
### Prototype
```c
static inline uint32_t ncchannels_fchannel(uint64_t channels);
```
"""
function ncchannels_fchannel(channels)
    @ccall libnotcurses_ffi.ncchannels_fchannel(channels::UInt64)::UInt32
end

"""
    ncchannels_channels(channels)

Extract the background alpha and coloring bits from a 64-bit channel pair.
### Prototype
```c
static inline uint64_t ncchannels_channels(uint64_t channels);
```
"""
function ncchannels_channels(channels)
    @ccall libnotcurses_ffi.ncchannels_channels(channels::UInt64)::UInt64
end

"""
    ncchannels_bg_rgb_p(channels)


### Prototype
```c
static inline bool ncchannels_bg_rgb_p(uint64_t channels);
```
"""
function ncchannels_bg_rgb_p(channels)
    @ccall libnotcurses_ffi.ncchannels_bg_rgb_p(channels::UInt64)::Bool
end

"""
    ncchannels_fg_rgb_p(channels)


### Prototype
```c
static inline bool ncchannels_fg_rgb_p(uint64_t channels);
```
"""
function ncchannels_fg_rgb_p(channels)
    @ccall libnotcurses_ffi.ncchannels_fg_rgb_p(channels::UInt64)::Bool
end

"""
    ncchannels_bg_alpha(channels)

Extract 2 bits of background alpha from 'channels', shifted to LSBs.
### Prototype
```c
static inline unsigned ncchannels_bg_alpha(uint64_t channels);
```
"""
function ncchannels_bg_alpha(channels)
    @ccall libnotcurses_ffi.ncchannels_bg_alpha(channels::UInt64)::Cuint
end

"""
    ncchannels_set_bchannel(channels, channel)

Set the background alpha and coloring bits of the 64-bit channel pair
from a single 32-bit value.
### Prototype
```c
static inline uint64_t ncchannels_set_bchannel(uint64_t* channels, uint32_t channel);
```
"""
function ncchannels_set_bchannel(channels, channel)
    @ccall libnotcurses_ffi.ncchannels_set_bchannel(channels::Ptr{UInt64}, channel::UInt32)::UInt64
end

"""
    ncchannels_set_fchannel(channels, channel)

Set the foreground alpha and coloring bits of the 64-bit channel pair
from a single 32-bit value.
### Prototype
```c
static inline uint64_t ncchannels_set_fchannel(uint64_t* channels, uint32_t channel);
```
"""
function ncchannels_set_fchannel(channels, channel)
    @ccall libnotcurses_ffi.ncchannels_set_fchannel(channels::Ptr{UInt64}, channel::UInt32)::UInt64
end

"""
    ncchannels_set_channels(dst, channels)

Set the alpha and coloring bits of a channel pair from another channel pair.
### Prototype
```c
static inline uint64_t ncchannels_set_channels(uint64_t* dst, uint64_t channels);
```
"""
function ncchannels_set_channels(dst, channels)
    @ccall libnotcurses_ffi.ncchannels_set_channels(dst::Ptr{UInt64}, channels::UInt64)::UInt64
end

"""
    ncchannels_set_bg_alpha(channels, alpha)

Set the 2-bit alpha component of the background channel.
### Prototype
```c
static inline int ncchannels_set_bg_alpha(uint64_t* channels, unsigned alpha);
```
"""
function ncchannels_set_bg_alpha(channels, alpha)
    @ccall libnotcurses_ffi.ncchannels_set_bg_alpha(channels::Ptr{UInt64}, alpha::Cuint)::Cint
end

"""
    ncchannels_fg_alpha(channels)

Extract 2 bits of foreground alpha from 'channels', shifted to LSBs.
### Prototype
```c
static inline unsigned ncchannels_fg_alpha(uint64_t channels);
```
"""
function ncchannels_fg_alpha(channels)
    @ccall libnotcurses_ffi.ncchannels_fg_alpha(channels::UInt64)::Cuint
end

"""
    ncchannels_set_fg_alpha(channels, alpha)

Set the 2-bit alpha component of the foreground channel.
### Prototype
```c
static inline int ncchannels_set_fg_alpha(uint64_t* channels, unsigned alpha);
```
"""
function ncchannels_set_fg_alpha(channels, alpha)
    @ccall libnotcurses_ffi.ncchannels_set_fg_alpha(channels::Ptr{UInt64}, alpha::Cuint)::Cint
end

"""
    ncchannels_reverse(channels)

Returns the channels with the fore- and background's color information
swapped, but without touching housekeeping bits. Alpha is retained unless
it would lead to an illegal state: HIGHCONTRAST, TRANSPARENT, and BLEND
are taken to OPAQUE unless the new value is RGB.
### Prototype
```c
static inline uint64_t ncchannels_reverse(uint64_t channels);
```
"""
function ncchannels_reverse(channels)
    @ccall libnotcurses_ffi.ncchannels_reverse(channels::UInt64)::UInt64
end

"""
    ncchannels_combine(fchan, bchan)

Creates a new channel pair using 'fchan' as the foreground channel
and 'bchan' as the background channel.
### Prototype
```c
static inline uint64_t ncchannels_combine(uint32_t fchan, uint32_t bchan);
```
"""
function ncchannels_combine(fchan, bchan)
    @ccall libnotcurses_ffi.ncchannels_combine(fchan::UInt32, bchan::UInt32)::UInt64
end

"""
    ncchannels_fg_palindex(channels)


### Prototype
```c
static inline unsigned ncchannels_fg_palindex(uint64_t channels);
```
"""
function ncchannels_fg_palindex(channels)
    @ccall libnotcurses_ffi.ncchannels_fg_palindex(channels::UInt64)::Cuint
end

"""
    ncchannels_bg_palindex(channels)


### Prototype
```c
static inline unsigned ncchannels_bg_palindex(uint64_t channels);
```
"""
function ncchannels_bg_palindex(channels)
    @ccall libnotcurses_ffi.ncchannels_bg_palindex(channels::UInt64)::Cuint
end

"""
    ncchannels_fg_rgb(channels)

Extract 24 bits of foreground RGB from 'channels', shifted to LSBs.
### Prototype
```c
static inline uint32_t ncchannels_fg_rgb(uint64_t channels);
```
"""
function ncchannels_fg_rgb(channels)
    @ccall libnotcurses_ffi.ncchannels_fg_rgb(channels::UInt64)::UInt32
end

"""
    ncchannels_bg_rgb(channels)

Extract 24 bits of background RGB from 'channels', shifted to LSBs.
### Prototype
```c
static inline uint32_t ncchannels_bg_rgb(uint64_t channels);
```
"""
function ncchannels_bg_rgb(channels)
    @ccall libnotcurses_ffi.ncchannels_bg_rgb(channels::UInt64)::UInt32
end

"""
    ncchannels_fg_rgb8(channels, r, g, b)

Extract 24 bits of foreground RGB from 'channels', split into subchannels.
### Prototype
```c
static inline uint32_t ncchannels_fg_rgb8(uint64_t channels, unsigned* r, unsigned* g, unsigned* b);
```
"""
function ncchannels_fg_rgb8(channels, r, g, b)
    @ccall libnotcurses_ffi.ncchannels_fg_rgb8(channels::UInt64, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

"""
    ncchannels_bg_rgb8(channels, r, g, b)

Extract 24 bits of background RGB from 'channels', split into subchannels.
### Prototype
```c
static inline uint32_t ncchannels_bg_rgb8(uint64_t channels, unsigned* r, unsigned* g, unsigned* b);
```
"""
function ncchannels_bg_rgb8(channels, r, g, b)
    @ccall libnotcurses_ffi.ncchannels_bg_rgb8(channels::UInt64, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

"""
    ncchannels_set_fg_rgb8(channels, r, g, b)

Set the r, g, and b channels for the foreground component of this 64-bit
'channels' variable, and mark it as not using the default color.
### Prototype
```c
static inline int ncchannels_set_fg_rgb8(uint64_t* channels, unsigned r, unsigned g, unsigned b);
```
"""
function ncchannels_set_fg_rgb8(channels, r, g, b)
    @ccall libnotcurses_ffi.ncchannels_set_fg_rgb8(channels::Ptr{UInt64}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    ncchannels_set_fg_rgb8_clipped(channels, r, g, b)

Same, but clips to [0..255].
### Prototype
```c
static inline void ncchannels_set_fg_rgb8_clipped(uint64_t* channels, int r, int g, int b);
```
"""
function ncchannels_set_fg_rgb8_clipped(channels, r, g, b)
    @ccall libnotcurses_ffi.ncchannels_set_fg_rgb8_clipped(channels::Ptr{UInt64}, r::Cint, g::Cint, b::Cint)::Cvoid
end

"""
    ncchannels_set_fg_palindex(channels, idx)


### Prototype
```c
static inline int ncchannels_set_fg_palindex(uint64_t* channels, unsigned idx);
```
"""
function ncchannels_set_fg_palindex(channels, idx)
    @ccall libnotcurses_ffi.ncchannels_set_fg_palindex(channels::Ptr{UInt64}, idx::Cuint)::Cint
end

"""
    ncchannels_set_fg_rgb(channels, rgb)

Same, but set an assembled 24 bit channel at once.
### Prototype
```c
static inline int ncchannels_set_fg_rgb(uint64_t* channels, unsigned rgb);
```
"""
function ncchannels_set_fg_rgb(channels, rgb)
    @ccall libnotcurses_ffi.ncchannels_set_fg_rgb(channels::Ptr{UInt64}, rgb::Cuint)::Cint
end

"""
    ncchannels_set_bg_rgb8(channels, r, g, b)

Set the r, g, and b channels for the background component of this 64-bit
'channels' variable, and mark it as not using the default color.
### Prototype
```c
static inline int ncchannels_set_bg_rgb8(uint64_t* channels, unsigned r, unsigned g, unsigned b);
```
"""
function ncchannels_set_bg_rgb8(channels, r, g, b)
    @ccall libnotcurses_ffi.ncchannels_set_bg_rgb8(channels::Ptr{UInt64}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    ncchannels_set_bg_rgb8_clipped(channels, r, g, b)

Same, but clips to [0..255].
### Prototype
```c
static inline void ncchannels_set_bg_rgb8_clipped(uint64_t* channels, int r, int g, int b);
```
"""
function ncchannels_set_bg_rgb8_clipped(channels, r, g, b)
    @ccall libnotcurses_ffi.ncchannels_set_bg_rgb8_clipped(channels::Ptr{UInt64}, r::Cint, g::Cint, b::Cint)::Cvoid
end

"""
    ncchannels_set_bg_palindex(channels, idx)

Set the cell's background palette index, set the background palette index
bit, set it background-opaque, and clear the background default color bit.
### Prototype
```c
static inline int ncchannels_set_bg_palindex(uint64_t* channels, unsigned idx);
```
"""
function ncchannels_set_bg_palindex(channels, idx)
    @ccall libnotcurses_ffi.ncchannels_set_bg_palindex(channels::Ptr{UInt64}, idx::Cuint)::Cint
end

"""
    ncchannels_set_bg_rgb(channels, rgb)

Same, but set an assembled 24 bit channel at once.
### Prototype
```c
static inline int ncchannels_set_bg_rgb(uint64_t* channels, unsigned rgb);
```
"""
function ncchannels_set_bg_rgb(channels, rgb)
    @ccall libnotcurses_ffi.ncchannels_set_bg_rgb(channels::Ptr{UInt64}, rgb::Cuint)::Cint
end

"""
    ncchannels_fg_default_p(channels)

Is the foreground using the "default foreground color"?
### Prototype
```c
static inline bool ncchannels_fg_default_p(uint64_t channels);
```
"""
function ncchannels_fg_default_p(channels)
    @ccall libnotcurses_ffi.ncchannels_fg_default_p(channels::UInt64)::Bool
end

"""
    ncchannels_fg_palindex_p(channels)

Is the foreground using indexed palette color?
### Prototype
```c
static inline bool ncchannels_fg_palindex_p(uint64_t channels);
```
"""
function ncchannels_fg_palindex_p(channels)
    @ccall libnotcurses_ffi.ncchannels_fg_palindex_p(channels::UInt64)::Bool
end

"""
    ncchannels_bg_default_p(channels)

Is the background using the "default background color"? The "default
background color" must generally be used to take advantage of
terminal-effected transparency.
### Prototype
```c
static inline bool ncchannels_bg_default_p(uint64_t channels);
```
"""
function ncchannels_bg_default_p(channels)
    @ccall libnotcurses_ffi.ncchannels_bg_default_p(channels::UInt64)::Bool
end

"""
    ncchannels_bg_palindex_p(channels)

Is the background using indexed palette color?
### Prototype
```c
static inline bool ncchannels_bg_palindex_p(uint64_t channels);
```
"""
function ncchannels_bg_palindex_p(channels)
    @ccall libnotcurses_ffi.ncchannels_bg_palindex_p(channels::UInt64)::Bool
end

"""
    ncchannels_set_fg_default(channels)

Mark the foreground channel as using its default color.
### Prototype
```c
static inline uint64_t ncchannels_set_fg_default(uint64_t* channels);
```
"""
function ncchannels_set_fg_default(channels)
    @ccall libnotcurses_ffi.ncchannels_set_fg_default(channels::Ptr{UInt64})::UInt64
end

"""
    ncchannels_set_bg_default(channels)

Mark the background channel as using its default color.
### Prototype
```c
static inline uint64_t ncchannels_set_bg_default(uint64_t* channels);
```
"""
function ncchannels_set_bg_default(channels)
    @ccall libnotcurses_ffi.ncchannels_set_bg_default(channels::Ptr{UInt64})::UInt64
end

"""
    nccell_init(c)


### Prototype
```c
static inline void nccell_init(nccell* c);
```
"""
function nccell_init(c)
    @ccall libnotcurses_ffi.nccell_init(c::Ptr{nccell})::Cvoid
end

"""
    nccell_prime(n, c, gcluster, stylemask, channels)

nccell_load(), plus blast the styling with 'attr' and 'channels'.
### Prototype
```c
static inline int nccell_prime(struct ncplane* n, nccell* c, const char* gcluster, uint16_t stylemask, uint64_t channels);
```
"""
function nccell_prime(n, c, gcluster, stylemask, channels)
    @ccall libnotcurses_ffi.nccell_prime(n::Ptr{ncplane}, c::Ptr{nccell}, gcluster::Ptr{Cchar}, stylemask::UInt16, channels::UInt64)::Cint
end

"""
    nccell_set_styles(c, stylebits)

Set the specified style bits for the nccell 'c', whether they're actively
supported or not. Only the lower 16 bits are meaningful.
### Prototype
```c
static inline void nccell_set_styles(nccell* c, unsigned stylebits);
```
"""
function nccell_set_styles(c, stylebits)
    @ccall libnotcurses_ffi.nccell_set_styles(c::Ptr{nccell}, stylebits::Cuint)::Cvoid
end

"""
    nccell_styles(c)

Extract the style bits from the nccell.
### Prototype
```c
static inline uint16_t nccell_styles(const nccell* c);
```
"""
function nccell_styles(c)
    @ccall libnotcurses_ffi.nccell_styles(c::Ptr{nccell})::UInt16
end

"""
    nccell_on_styles(c, stylebits)

Add the specified styles (in the LSBs) to the nccell's existing spec,
whether they're actively supported or not.
### Prototype
```c
static inline void nccell_on_styles(nccell* c, unsigned stylebits);
```
"""
function nccell_on_styles(c, stylebits)
    @ccall libnotcurses_ffi.nccell_on_styles(c::Ptr{nccell}, stylebits::Cuint)::Cvoid
end

"""
    nccell_off_styles(c, stylebits)

Remove the specified styles (in the LSBs) from the nccell's existing spec.
### Prototype
```c
static inline void nccell_off_styles(nccell* c, unsigned stylebits);
```
"""
function nccell_off_styles(c, stylebits)
    @ccall libnotcurses_ffi.nccell_off_styles(c::Ptr{nccell}, stylebits::Cuint)::Cvoid
end

"""
    nccell_set_fg_default(c)

Use the default color for the foreground.
### Prototype
```c
static inline void nccell_set_fg_default(nccell* c);
```
"""
function nccell_set_fg_default(c)
    @ccall libnotcurses_ffi.nccell_set_fg_default(c::Ptr{nccell})::Cvoid
end

"""
    nccell_set_bg_default(c)

Use the default color for the background.
### Prototype
```c
static inline void nccell_set_bg_default(nccell* c);
```
"""
function nccell_set_bg_default(c)
    @ccall libnotcurses_ffi.nccell_set_bg_default(c::Ptr{nccell})::Cvoid
end

"""
    nccell_set_fg_alpha(c, alpha)


### Prototype
```c
static inline int nccell_set_fg_alpha(nccell* c, unsigned alpha);
```
"""
function nccell_set_fg_alpha(c, alpha)
    @ccall libnotcurses_ffi.nccell_set_fg_alpha(c::Ptr{nccell}, alpha::Cuint)::Cint
end

"""
    nccell_set_bg_alpha(c, alpha)


### Prototype
```c
static inline int nccell_set_bg_alpha(nccell* c, unsigned alpha);
```
"""
function nccell_set_bg_alpha(c, alpha)
    @ccall libnotcurses_ffi.nccell_set_bg_alpha(c::Ptr{nccell}, alpha::Cuint)::Cint
end

"""
    nccell_set_bchannel(c, channel)


### Prototype
```c
static inline uint64_t nccell_set_bchannel(nccell* c, uint32_t channel);
```
"""
function nccell_set_bchannel(c, channel)
    @ccall libnotcurses_ffi.nccell_set_bchannel(c::Ptr{nccell}, channel::UInt32)::UInt64
end

"""
    nccell_set_fchannel(c, channel)


### Prototype
```c
static inline uint64_t nccell_set_fchannel(nccell* c, uint32_t channel);
```
"""
function nccell_set_fchannel(c, channel)
    @ccall libnotcurses_ffi.nccell_set_fchannel(c::Ptr{nccell}, channel::UInt32)::UInt64
end

"""
    nccell_set_channels(c, channels)


### Prototype
```c
static inline uint64_t nccell_set_channels(nccell* c, uint64_t channels);
```
"""
function nccell_set_channels(c, channels)
    @ccall libnotcurses_ffi.nccell_set_channels(c::Ptr{nccell}, channels::UInt64)::UInt64
end

"""
    nccell_double_wide_p(c)

Is the cell part of a multicolumn element?
### Prototype
```c
static inline bool nccell_double_wide_p(const nccell* c);
```
"""
function nccell_double_wide_p(c)
    @ccall libnotcurses_ffi.nccell_double_wide_p(c::Ptr{nccell})::Bool
end

"""
    nccell_wide_right_p(c)

Is this the right half of a wide character?
### Prototype
```c
static inline bool nccell_wide_right_p(const nccell* c);
```
"""
function nccell_wide_right_p(c)
    @ccall libnotcurses_ffi.nccell_wide_right_p(c::Ptr{nccell})::Bool
end

"""
    nccell_wide_left_p(c)

Is this the left half of a wide character?
### Prototype
```c
static inline bool nccell_wide_left_p(const nccell* c);
```
"""
function nccell_wide_left_p(c)
    @ccall libnotcurses_ffi.nccell_wide_left_p(c::Ptr{nccell})::Bool
end

"""
    nccell_channels(c)


### Prototype
```c
static inline uint64_t nccell_channels(const nccell* c);
```
"""
function nccell_channels(c)
    @ccall libnotcurses_ffi.nccell_channels(c::Ptr{nccell})::UInt64
end

"""
    nccell_bchannel(cl)

Extract the background alpha and coloring bits from a cell's channels
as a single 32-bit value.
### Prototype
```c
static inline uint32_t nccell_bchannel(const nccell* cl);
```
"""
function nccell_bchannel(cl)
    @ccall libnotcurses_ffi.nccell_bchannel(cl::Ptr{nccell})::UInt32
end

"""
    nccell_fchannel(cl)

Extract the foreground alpha and coloring bits from a cell's channels
as a single 32-bit value.
### Prototype
```c
static inline uint32_t nccell_fchannel(const nccell* cl);
```
"""
function nccell_fchannel(cl)
    @ccall libnotcurses_ffi.nccell_fchannel(cl::Ptr{nccell})::UInt32
end

"""
    nccell_cols(c)

return the number of columns occupied by 'c'. see ncstrwidth() for an
equivalent for multiple EGCs.
### Prototype
```c
static inline unsigned nccell_cols(const nccell* c);
```
"""
function nccell_cols(c)
    @ccall libnotcurses_ffi.nccell_cols(c::Ptr{nccell})::Cuint
end

"""
    nccell_strdup(n, c)

copy the UTF8-encoded EGC out of the nccell. the result is not tied to any
ncplane, and persists across erases / destruction.
### Prototype
```c
ALLOC static inline char* nccell_strdup(const struct ncplane* n, const nccell* c);
```
"""
function nccell_strdup(n, c)
    @ccall libnotcurses_ffi.nccell_strdup(n::Ptr{ncplane}, c::Ptr{nccell})::Ptr{Cchar}
end

"""
    nccell_extract(n, c, stylemask, channels)

Extract the three elements of a nccell.
### Prototype
```c
static inline char* nccell_extract(const struct ncplane* n, const nccell* c, uint16_t* stylemask, uint64_t* channels);
```
"""
function nccell_extract(n, c, stylemask, channels)
    @ccall libnotcurses_ffi.nccell_extract(n::Ptr{ncplane}, c::Ptr{nccell}, stylemask::Ptr{UInt16}, channels::Ptr{UInt64})::Ptr{Cchar}
end

"""
    nccellcmp(n1, c1, n2, c2)

Returns true if the two nccells are distinct EGCs, attributes, or channels.
The actual egcpool index needn't be the same--indeed, the planes needn't even
be the same. Only the expanded EGC must be equal. The EGC must be bit-equal;
it would probably be better to test whether they're Unicode-equal FIXME.
probably needs be fixed up for sprixels FIXME.
### Prototype
```c
static inline bool nccellcmp(const struct ncplane* n1, const nccell* RESTRICT c1, const struct ncplane* n2, const nccell* RESTRICT c2);
```
"""
function nccellcmp(n1, c1, n2, c2)
    @ccall libnotcurses_ffi.nccellcmp(n1::Ptr{ncplane}, c1::Ptr{nccell}, n2::Ptr{ncplane}, c2::Ptr{nccell})::Bool
end

"""
    nccell_load_char(n, c, ch)

Load a 7-bit char 'ch' into the nccell 'c'. Returns the number of bytes
used, or -1 on error.
### Prototype
```c
static inline int nccell_load_char(struct ncplane* n, nccell* c, char ch);
```
"""
function nccell_load_char(n, c, ch)
    @ccall libnotcurses_ffi.nccell_load_char(n::Ptr{ncplane}, c::Ptr{nccell}, ch::Cchar)::Cint
end

"""
    nccell_load_egc32(n, c, egc)

Load a UTF-8 encoded EGC of up to 4 bytes into the nccell 'c'. Returns the
number of bytes used, or -1 on error.
### Prototype
```c
static inline int nccell_load_egc32(struct ncplane* n, nccell* c, uint32_t egc);
```
"""
function nccell_load_egc32(n, c, egc)
    @ccall libnotcurses_ffi.nccell_load_egc32(n::Ptr{ncplane}, c::Ptr{nccell}, egc::UInt32)::Cint
end

"""
    nccell_load_ucs32(n, c, u)

Load a UCS-32 codepoint into the nccell 'c'. Returns the number of bytes
used, or -1 on error.
### Prototype
```c
static inline int nccell_load_ucs32(struct ncplane* n, nccell* c, uint32_t u);
```
"""
function nccell_load_ucs32(n, c, u)
    @ccall libnotcurses_ffi.nccell_load_ucs32(n::Ptr{ncplane}, c::Ptr{nccell}, u::UInt32)::Cint
end

"""
    notcurses_top(n)

Return the topmost plane of the standard pile.
### Prototype
```c
static inline struct ncplane* notcurses_top(struct notcurses* n);
```
"""
function notcurses_top(n)
    @ccall libnotcurses_ffi.notcurses_top(n::Ptr{notcurses})::Ptr{ncplane}
end

"""
    notcurses_bottom(n)

Return the bottommost plane of the standard pile.
### Prototype
```c
static inline struct ncplane* notcurses_bottom(struct notcurses* n);
```
"""
function notcurses_bottom(n)
    @ccall libnotcurses_ffi.notcurses_bottom(n::Ptr{notcurses})::Ptr{ncplane}
end

"""
    notcurses_render(nc)

Renders and rasterizes the standard pile in one shot. Blocking call.
### Prototype
```c
static inline int notcurses_render(struct notcurses* nc);
```
"""
function notcurses_render(nc)
    @ccall libnotcurses_ffi.notcurses_render(nc::Ptr{notcurses})::Cint
end

"""
    nckey_mouse_p(r)

Is the event a synthesized mouse event?
### Prototype
```c
static inline bool nckey_mouse_p(uint32_t r);
```
"""
function nckey_mouse_p(r)
    @ccall libnotcurses_ffi.nckey_mouse_p(r::UInt32)::Bool
end

"""
    ncinput_shift_p(n)


### Prototype
```c
static inline bool ncinput_shift_p(const ncinput* n);
```
"""
function ncinput_shift_p(n)
    @ccall libnotcurses_ffi.ncinput_shift_p(n::Ptr{ncinput})::Bool
end

"""
    ncinput_ctrl_p(n)


### Prototype
```c
static inline bool ncinput_ctrl_p(const ncinput* n);
```
"""
function ncinput_ctrl_p(n)
    @ccall libnotcurses_ffi.ncinput_ctrl_p(n::Ptr{ncinput})::Bool
end

"""
    ncinput_alt_p(n)


### Prototype
```c
static inline bool ncinput_alt_p(const ncinput* n);
```
"""
function ncinput_alt_p(n)
    @ccall libnotcurses_ffi.ncinput_alt_p(n::Ptr{ncinput})::Bool
end

"""
    ncinput_meta_p(n)


### Prototype
```c
static inline bool ncinput_meta_p(const ncinput* n);
```
"""
function ncinput_meta_p(n)
    @ccall libnotcurses_ffi.ncinput_meta_p(n::Ptr{ncinput})::Bool
end

"""
    ncinput_super_p(n)


### Prototype
```c
static inline bool ncinput_super_p(const ncinput* n);
```
"""
function ncinput_super_p(n)
    @ccall libnotcurses_ffi.ncinput_super_p(n::Ptr{ncinput})::Bool
end

"""
    ncinput_hyper_p(n)


### Prototype
```c
static inline bool ncinput_hyper_p(const ncinput* n);
```
"""
function ncinput_hyper_p(n)
    @ccall libnotcurses_ffi.ncinput_hyper_p(n::Ptr{ncinput})::Bool
end

"""
    ncinput_capslock_p(n)


### Prototype
```c
static inline bool ncinput_capslock_p(const ncinput* n);
```
"""
function ncinput_capslock_p(n)
    @ccall libnotcurses_ffi.ncinput_capslock_p(n::Ptr{ncinput})::Bool
end

"""
    ncinput_numlock_p(n)


### Prototype
```c
static inline bool ncinput_numlock_p(const ncinput* n);
```
"""
function ncinput_numlock_p(n)
    @ccall libnotcurses_ffi.ncinput_numlock_p(n::Ptr{ncinput})::Bool
end

"""
    ncinput_equal_p(n1, n2)

compare two ncinput structs for data equality. NCTYPE_PRESS and
NCTYPE_UNKNOWN are considered to be equivalent. NCKEY_MOD_CAPSLOCK
and NCKEY_MOD_NUMLOCK are not considered relevant.
### Prototype
```c
static inline bool ncinput_equal_p(const ncinput* n1, const ncinput* n2);
```
"""
function ncinput_equal_p(n1, n2)
    @ccall libnotcurses_ffi.ncinput_equal_p(n1::Ptr{ncinput}, n2::Ptr{ncinput})::Bool
end

"""
    notcurses_get_nblock(n, ni)

'ni' may be NULL if the caller is uninterested in event details. If no event
is immediately ready, returns 0.
### Prototype
```c
static inline uint32_t notcurses_get_nblock(struct notcurses* n, ncinput* ni);
```
"""
function notcurses_get_nblock(n, ni)
    @ccall libnotcurses_ffi.notcurses_get_nblock(n::Ptr{notcurses}, ni::Ptr{ncinput})::UInt32
end

"""
    notcurses_get_blocking(n, ni)

'ni' may be NULL if the caller is uninterested in event details. Blocks
until an event is processed or a signal is received (including resize events).
### Prototype
```c
static inline uint32_t notcurses_get_blocking(struct notcurses* n, ncinput* ni);
```
"""
function notcurses_get_blocking(n, ni)
    @ccall libnotcurses_ffi.notcurses_get_blocking(n::Ptr{notcurses}, ni::Ptr{ncinput})::UInt32
end

"""
    ncinput_nomod_p(ni)

Was 'ni' free of modifiers?
### Prototype
```c
static inline bool ncinput_nomod_p(const ncinput* ni);
```
"""
function ncinput_nomod_p(ni)
    @ccall libnotcurses_ffi.ncinput_nomod_p(ni::Ptr{ncinput})::Bool
end

"""
    notcurses_mice_disable(n)

Disable mouse events. Any events in the input queue can still be delivered.
### Prototype
```c
__attribute__ ((nonnull (1))) static inline int notcurses_mice_disable(struct notcurses* n);
```
"""
function notcurses_mice_disable(n)
    @ccall libnotcurses_ffi.notcurses_mice_disable(n::Ptr{notcurses})::Cint
end

"""
    notcurses_stddim_yx(nc, y, x)

notcurses_stdplane(), plus free bonus dimensions written to non-NULL y/x!
### Prototype
```c
static inline struct ncplane* notcurses_stddim_yx(struct notcurses* nc, unsigned* RESTRICT y, unsigned* RESTRICT x);
```
"""
function notcurses_stddim_yx(nc, y, x)
    @ccall libnotcurses_ffi.notcurses_stddim_yx(nc::Ptr{notcurses}, y::Ptr{Cuint}, x::Ptr{Cuint})::Ptr{ncplane}
end

"""
    notcurses_stddim_yx_const(nc, y, x)


### Prototype
```c
static inline const struct ncplane* notcurses_stddim_yx_const(const struct notcurses* nc, unsigned* RESTRICT y, unsigned* RESTRICT x);
```
"""
function notcurses_stddim_yx_const(nc, y, x)
    @ccall libnotcurses_ffi.notcurses_stddim_yx_const(nc::Ptr{notcurses}, y::Ptr{Cuint}, x::Ptr{Cuint})::Ptr{ncplane}
end

"""
    ncplane_dim_y(n)


### Prototype
```c
static inline unsigned ncplane_dim_y(const struct ncplane* n);
```
"""
function ncplane_dim_y(n)
    @ccall libnotcurses_ffi.ncplane_dim_y(n::Ptr{ncplane})::Cuint
end

"""
    ncplane_dim_x(n)


### Prototype
```c
static inline unsigned ncplane_dim_x(const struct ncplane* n);
```
"""
function ncplane_dim_x(n)
    @ccall libnotcurses_ffi.ncplane_dim_x(n::Ptr{ncplane})::Cuint
end

"""
    notcurses_term_dim_yx(n, rows, cols)

Return our current idea of the terminal dimensions in rows and cols.
### Prototype
```c
static inline void notcurses_term_dim_yx(const struct notcurses* n, unsigned* RESTRICT rows, unsigned* RESTRICT cols);
```
"""
function notcurses_term_dim_yx(n, rows, cols)
    @ccall libnotcurses_ffi.notcurses_term_dim_yx(n::Ptr{notcurses}, rows::Ptr{Cuint}, cols::Ptr{Cuint})::Cvoid
end

"""
    ncpalette_set_rgb8(p, idx, r, g, b)

Manipulate entries in the palette store 'p'. These are *not* locked.
### Prototype
```c
static inline int ncpalette_set_rgb8(ncpalette* p, int idx, unsigned r, unsigned g, unsigned b);
```
"""
function ncpalette_set_rgb8(p, idx, r, g, b)
    @ccall libnotcurses_ffi.ncpalette_set_rgb8(p::Ptr{ncpalette}, idx::Cint, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    ncpalette_set(p, idx, rgb)


### Prototype
```c
static inline int ncpalette_set(ncpalette* p, int idx, unsigned rgb);
```
"""
function ncpalette_set(p, idx, rgb)
    @ccall libnotcurses_ffi.ncpalette_set(p::Ptr{ncpalette}, idx::Cint, rgb::Cuint)::Cint
end

"""
    ncpalette_get(p, idx, palent)


### Prototype
```c
static inline int ncpalette_get(const ncpalette* p, int idx, uint32_t* palent);
```
"""
function ncpalette_get(p, idx, palent)
    @ccall libnotcurses_ffi.ncpalette_get(p::Ptr{ncpalette}, idx::Cint, palent::Ptr{UInt32})::Cint
end

"""
    ncpalette_get_rgb8(p, idx, r, g, b)


### Prototype
```c
static inline int ncpalette_get_rgb8(const ncpalette* p, int idx, unsigned* RESTRICT r, unsigned* RESTRICT g, unsigned* RESTRICT b);
```
"""
function ncpalette_get_rgb8(p, idx, r, g, b)
    @ccall libnotcurses_ffi.ncpalette_get_rgb8(p::Ptr{ncpalette}, idx::Cint, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::Cint
end

"""
    nccapability_canchangecolor(caps)

Can we set the "hardware" palette? Requires the "ccc" terminfo capability,
and that the number of colors supported is at least the size of our
ncpalette structure.
### Prototype
```c
__attribute__ ((nonnull (1))) __attribute__ ((pure)) static inline bool nccapability_canchangecolor(const nccapabilities* caps);
```
"""
function nccapability_canchangecolor(caps)
    @ccall libnotcurses_ffi.nccapability_canchangecolor(caps::Ptr{nccapabilities})::Bool
end

"""
    notcurses_cantruecolor(nc)

Can we emit 24-bit, three-channel RGB foregrounds and backgrounds?
### Prototype
```c
__attribute__ ((nonnull (1))) __attribute__ ((pure)) static inline bool notcurses_cantruecolor(const struct notcurses* nc);
```
"""
function notcurses_cantruecolor(nc)
    @ccall libnotcurses_ffi.notcurses_cantruecolor(nc::Ptr{notcurses})::Bool
end

"""
    notcurses_canchangecolor(nc)

Can we directly specify RGB values per cell, or only use palettes?
### Prototype
```c
__attribute__ ((nonnull (1))) __attribute__ ((pure)) static inline bool notcurses_canchangecolor(const struct notcurses* nc);
```
"""
function notcurses_canchangecolor(nc)
    @ccall libnotcurses_ffi.notcurses_canchangecolor(nc::Ptr{notcurses})::Bool
end

"""
    notcurses_canfade(n)

Can we fade? Fading requires either the "rgb" or "ccc" terminfo capability.
### Prototype
```c
__attribute__ ((nonnull (1))) __attribute__ ((pure)) static inline bool notcurses_canfade(const struct notcurses* n);
```
"""
function notcurses_canfade(n)
    @ccall libnotcurses_ffi.notcurses_canfade(n::Ptr{notcurses})::Bool
end

"""
    notcurses_canutf8(nc)

Is our encoding UTF-8? Requires LANG being set to a UTF8 locale.
### Prototype
```c
__attribute__ ((nonnull (1))) __attribute__ ((pure)) static inline bool notcurses_canutf8(const struct notcurses* nc);
```
"""
function notcurses_canutf8(nc)
    @ccall libnotcurses_ffi.notcurses_canutf8(nc::Ptr{notcurses})::Bool
end

"""
    notcurses_canhalfblock(nc)

Can we reliably use Unicode halfblocks? Any Unicode implementation can.
### Prototype
```c
__attribute__ ((nonnull (1))) __attribute__ ((pure)) static inline bool notcurses_canhalfblock(const struct notcurses* nc);
```
"""
function notcurses_canhalfblock(nc)
    @ccall libnotcurses_ffi.notcurses_canhalfblock(nc::Ptr{notcurses})::Bool
end

"""
    notcurses_canquadrant(nc)

Can we reliably use Unicode quadrants?
### Prototype
```c
__attribute__ ((nonnull (1))) __attribute__ ((pure)) static inline bool notcurses_canquadrant(const struct notcurses* nc);
```
"""
function notcurses_canquadrant(nc)
    @ccall libnotcurses_ffi.notcurses_canquadrant(nc::Ptr{notcurses})::Bool
end

"""
    notcurses_cansextant(nc)

Can we reliably use Unicode 13 sextants?
### Prototype
```c
__attribute__ ((nonnull (1))) __attribute__ ((pure)) static inline bool notcurses_cansextant(const struct notcurses* nc);
```
"""
function notcurses_cansextant(nc)
    @ccall libnotcurses_ffi.notcurses_cansextant(nc::Ptr{notcurses})::Bool
end

"""
    notcurses_canbraille(nc)

Can we reliably use Unicode Braille?
### Prototype
```c
__attribute__ ((nonnull (1))) __attribute__ ((pure)) static inline bool notcurses_canbraille(const struct notcurses* nc);
```
"""
function notcurses_canbraille(nc)
    @ccall libnotcurses_ffi.notcurses_canbraille(nc::Ptr{notcurses})::Bool
end

"""
    notcurses_canpixel(nc)

Can we blit pixel-accurate bitmaps?
### Prototype
```c
__attribute__ ((nonnull (1))) __attribute__ ((pure)) static inline bool notcurses_canpixel(const struct notcurses* nc);
```
"""
function notcurses_canpixel(nc)
    @ccall libnotcurses_ffi.notcurses_canpixel(nc::Ptr{notcurses})::Bool
end

"""
    ncplane_resize_simple(n, ylen, xlen)

Resize the plane, retaining what data we can (everything, unless we're
shrinking in some dimension). Keep the origin where it is.
### Prototype
```c
static inline int ncplane_resize_simple(struct ncplane* n, unsigned ylen, unsigned xlen);
```
"""
function ncplane_resize_simple(n, ylen, xlen)
    @ccall libnotcurses_ffi.ncplane_resize_simple(n::Ptr{ncplane}, ylen::Cuint, xlen::Cuint)::Cint
end

"""
    ncplane_move_rel(n, y, x)

Move this plane relative to its current location. Negative values move up
and left, respectively. Pass 0 to hold an axis constant.
### Prototype
```c
__attribute__ ((nonnull (1))) static inline int ncplane_move_rel(struct ncplane* n, int y, int x);
```
"""
function ncplane_move_rel(n, y, x)
    @ccall libnotcurses_ffi.ncplane_move_rel(n::Ptr{ncplane}, y::Cint, x::Cint)::Cint
end

"""
    ncplane_descendant_p(n, ancestor)

Return non-zero iff 'n' is a proper descendent of 'ancestor'.
### Prototype
```c
static inline int ncplane_descendant_p(const struct ncplane* n, const struct ncplane* ancestor);
```
"""
function ncplane_descendant_p(n, ancestor)
    @ccall libnotcurses_ffi.ncplane_descendant_p(n::Ptr{ncplane}, ancestor::Ptr{ncplane})::Cint
end

"""
    ncplane_move_top(n)

Splice ncplane 'n' out of the z-buffer; reinsert it at the top or bottom.
### Prototype
```c
__attribute__ ((nonnull (1))) static inline void ncplane_move_top(struct ncplane* n);
```
"""
function ncplane_move_top(n)
    @ccall libnotcurses_ffi.ncplane_move_top(n::Ptr{ncplane})::Cvoid
end

"""
    ncplane_move_bottom(n)


### Prototype
```c
__attribute__ ((nonnull (1))) static inline void ncplane_move_bottom(struct ncplane* n);
```
"""
function ncplane_move_bottom(n)
    @ccall libnotcurses_ffi.ncplane_move_bottom(n::Ptr{ncplane})::Cvoid
end

"""
    ncplane_move_family_top(n)


### Prototype
```c
__attribute__ ((nonnull (1))) static inline void ncplane_move_family_top(struct ncplane* n);
```
"""
function ncplane_move_family_top(n)
    @ccall libnotcurses_ffi.ncplane_move_family_top(n::Ptr{ncplane})::Cvoid
end

"""
    ncplane_move_family_bottom(n)


### Prototype
```c
__attribute__ ((nonnull (1))) static inline void ncplane_move_family_bottom(struct ncplane* n);
```
"""
function ncplane_move_family_bottom(n)
    @ccall libnotcurses_ffi.ncplane_move_family_bottom(n::Ptr{ncplane})::Cvoid
end

"""
    notcurses_align(availu, align, u)

Return the offset into 'availu' at which 'u' ought be output given the
requirements of 'align'. Return -INT_MAX on invalid 'align'. Undefined
behavior on negative 'availu' or 'u'.
### Prototype
```c
static inline int notcurses_align(int availu, ncalign_e align, int u);
```
"""
function notcurses_align(availu, align, u)
    @ccall libnotcurses_ffi.notcurses_align(availu::Cint, align::ncalign_e, u::Cint)::Cint
end

"""
    ncplane_halign(n, align, c)

Return the column at which 'c' cols ought start in order to be aligned
according to 'align' within ncplane 'n'. Return -INT_MAX on invalid
'align'. Undefined behavior on negative 'c'.
### Prototype
```c
static inline int ncplane_halign(const struct ncplane* n, ncalign_e align, int c);
```
"""
function ncplane_halign(n, align, c)
    @ccall libnotcurses_ffi.ncplane_halign(n::Ptr{ncplane}, align::ncalign_e, c::Cint)::Cint
end

"""
    ncplane_valign(n, align, r)

Return the row at which 'r' rows ought start in order to be aligned
according to 'align' within ncplane 'n'. Return -INT_MAX on invalid
'align'. Undefined behavior on negative 'r'.
### Prototype
```c
static inline int ncplane_valign(const struct ncplane* n, ncalign_e align, int r);
```
"""
function ncplane_valign(n, align, r)
    @ccall libnotcurses_ffi.ncplane_valign(n::Ptr{ncplane}, align::ncalign_e, r::Cint)::Cint
end

"""
    ncplane_cursor_y(n)


### Prototype
```c
static inline unsigned ncplane_cursor_y(const struct ncplane* n);
```
"""
function ncplane_cursor_y(n)
    @ccall libnotcurses_ffi.ncplane_cursor_y(n::Ptr{ncplane})::Cuint
end

"""
    ncplane_cursor_x(n)


### Prototype
```c
static inline unsigned ncplane_cursor_x(const struct ncplane* n);
```
"""
function ncplane_cursor_x(n)
    @ccall libnotcurses_ffi.ncplane_cursor_x(n::Ptr{ncplane})::Cuint
end

"""
    ncplane_putc(n, c)

Call ncplane_putc_yx() for the current cursor location.
### Prototype
```c
static inline int ncplane_putc(struct ncplane* n, const nccell* c);
```
"""
function ncplane_putc(n, c)
    @ccall libnotcurses_ffi.ncplane_putc(n::Ptr{ncplane}, c::Ptr{nccell})::Cint
end

"""
    ncplane_putchar_yx(n, y, x, c)

Replace the cell at the specified coordinates with the provided 7-bit char
'c'. Advance the cursor by 1. On success, returns the number of columns the
cursor was advanced. On failure, returns -1. This works whether the
underlying char is signed or unsigned.
### Prototype
```c
static inline int ncplane_putchar_yx(struct ncplane* n, int y, int x, char c);
```
"""
function ncplane_putchar_yx(n, y, x, c)
    @ccall libnotcurses_ffi.ncplane_putchar_yx(n::Ptr{ncplane}, y::Cint, x::Cint, c::Cchar)::Cint
end

"""
    ncplane_putchar(n, c)

Call ncplane_putchar_yx() at the current cursor location.
### Prototype
```c
static inline int ncplane_putchar(struct ncplane* n, char c);
```
"""
function ncplane_putchar(n, c)
    @ccall libnotcurses_ffi.ncplane_putchar(n::Ptr{ncplane}, c::Cchar)::Cint
end

"""
    ncplane_putegc(n, gclust, sbytes)

Call ncplane_putegc_yx() at the current cursor location.
### Prototype
```c
static inline int ncplane_putegc(struct ncplane* n, const char* gclust, size_t* sbytes);
```
"""
function ncplane_putegc(n, gclust, sbytes)
    @ccall libnotcurses_ffi.ncplane_putegc(n::Ptr{ncplane}, gclust::Ptr{Cchar}, sbytes::Ptr{Csize_t})::Cint
end

"""
    ncwcsrtombs(src)

generate a heap-allocated UTF-8 encoding of the wide string 'src'.
### Prototype
```c
ALLOC static inline char* ncwcsrtombs(const wchar_t* src);
```
"""
function ncwcsrtombs(src)
    @ccall libnotcurses_ffi.ncwcsrtombs(src::Ptr{Cwchar_t})::Ptr{Cchar}
end

"""
    ncplane_putwegc(n, gclust, sbytes)

ncplane_putegc(), but following a conversion from wchar_t to UTF-8 multibyte.
### Prototype
```c
static inline int ncplane_putwegc(struct ncplane* n, const wchar_t* gclust, size_t* sbytes);
```
"""
function ncplane_putwegc(n, gclust, sbytes)
    @ccall libnotcurses_ffi.ncplane_putwegc(n::Ptr{ncplane}, gclust::Ptr{Cwchar_t}, sbytes::Ptr{Csize_t})::Cint
end

"""
    ncplane_putwegc_yx(n, y, x, gclust, sbytes)

Call ncplane_putwegc() after successfully moving to y, x.
### Prototype
```c
static inline int ncplane_putwegc_yx(struct ncplane* n, int y, int x, const wchar_t* gclust, size_t* sbytes);
```
"""
function ncplane_putwegc_yx(n, y, x, gclust, sbytes)
    @ccall libnotcurses_ffi.ncplane_putwegc_yx(n::Ptr{ncplane}, y::Cint, x::Cint, gclust::Ptr{Cwchar_t}, sbytes::Ptr{Csize_t})::Cint
end

"""
    ncplane_putstr_yx(n, y, x, gclusters)

Write a series of EGCs to the current location, using the current style.
They will be interpreted as a series of columns (according to the definition
of ncplane_putc()). Advances the cursor by some positive number of columns
(though not beyond the end of the plane); this number is returned on success.
On error, a non-positive number is returned, indicating the number of columns
which were written before the error.
### Prototype
```c
static inline int ncplane_putstr_yx(struct ncplane* n, int y, int x, const char* gclusters);
```
"""
function ncplane_putstr_yx(n, y, x, gclusters)
    @ccall libnotcurses_ffi.ncplane_putstr_yx(n::Ptr{ncplane}, y::Cint, x::Cint, gclusters::Ptr{Cchar})::Cint
end

"""
    ncplane_putstr(n, gclustarr)


### Prototype
```c
static inline int ncplane_putstr(struct ncplane* n, const char* gclustarr);
```
"""
function ncplane_putstr(n, gclustarr)
    @ccall libnotcurses_ffi.ncplane_putstr(n::Ptr{ncplane}, gclustarr::Ptr{Cchar})::Cint
end

"""
    ncplane_putstr_aligned(n, y, align, s)


### Prototype
```c
static inline int ncplane_putstr_aligned(struct ncplane* n, int y, ncalign_e align, const char* s);
```
"""
function ncplane_putstr_aligned(n, y, align, s)
    @ccall libnotcurses_ffi.ncplane_putstr_aligned(n::Ptr{ncplane}, y::Cint, align::ncalign_e, s::Ptr{Cchar})::Cint
end

"""
    ncplane_putstr_stained(n, gclusters)

Replace a string's worth of glyphs at the current cursor location, but
retain the styling. The current styling of the plane will not be changed.
### Prototype
```c
static inline int ncplane_putstr_stained(struct ncplane* n, const char* gclusters);
```
"""
function ncplane_putstr_stained(n, gclusters)
    @ccall libnotcurses_ffi.ncplane_putstr_stained(n::Ptr{ncplane}, gclusters::Ptr{Cchar})::Cint
end

"""
    ncplane_putnstr_yx(n, y, x, s, gclusters)

Write a series of EGCs to the current location, using the current style.
They will be interpreted as a series of columns (according to the definition
of ncplane_putc()). Advances the cursor by some positive number of columns
(though not beyond the end of the plane); this number is returned on success.
On error, a non-positive number is returned, indicating the number of columns
which were written before the error. No more than 's' bytes will be written.
### Prototype
```c
static inline int ncplane_putnstr_yx(struct ncplane* n, int y, int x, size_t s, const char* gclusters);
```
"""
function ncplane_putnstr_yx(n, y, x, s, gclusters)
    @ccall libnotcurses_ffi.ncplane_putnstr_yx(n::Ptr{ncplane}, y::Cint, x::Cint, s::Csize_t, gclusters::Ptr{Cchar})::Cint
end

"""
    ncplane_putnstr(n, s, gclustarr)


### Prototype
```c
static inline int ncplane_putnstr(struct ncplane* n, size_t s, const char* gclustarr);
```
"""
function ncplane_putnstr(n, s, gclustarr)
    @ccall libnotcurses_ffi.ncplane_putnstr(n::Ptr{ncplane}, s::Csize_t, gclustarr::Ptr{Cchar})::Cint
end

"""
    ncplane_putwstr_yx(n, y, x, gclustarr)

ncplane_putstr(), but following a conversion from wchar_t to UTF-8 multibyte.
FIXME do this as a loop over ncplane_putegc_yx and save the big allocation+copy
### Prototype
```c
static inline int ncplane_putwstr_yx(struct ncplane* n, int y, int x, const wchar_t* gclustarr);
```
"""
function ncplane_putwstr_yx(n, y, x, gclustarr)
    @ccall libnotcurses_ffi.ncplane_putwstr_yx(n::Ptr{ncplane}, y::Cint, x::Cint, gclustarr::Ptr{Cwchar_t})::Cint
end

"""
    ncplane_putwstr_aligned(n, y, align, gclustarr)


### Prototype
```c
static inline int ncplane_putwstr_aligned(struct ncplane* n, int y, ncalign_e align, const wchar_t* gclustarr);
```
"""
function ncplane_putwstr_aligned(n, y, align, gclustarr)
    @ccall libnotcurses_ffi.ncplane_putwstr_aligned(n::Ptr{ncplane}, y::Cint, align::ncalign_e, gclustarr::Ptr{Cwchar_t})::Cint
end

"""
    ncplane_putwstr(n, gclustarr)


### Prototype
```c
static inline int ncplane_putwstr(struct ncplane* n, const wchar_t* gclustarr);
```
"""
function ncplane_putwstr(n, gclustarr)
    @ccall libnotcurses_ffi.ncplane_putwstr(n::Ptr{ncplane}, gclustarr::Ptr{Cwchar_t})::Cint
end

"""
    ncplane_pututf32_yx(n, y, x, u)

Replace the cell at the specified coordinates with the provided UTF-32
'u'. Advance the cursor by the character's width as reported by wcwidth().
On success, returns the number of columns written. On failure, returns -1.
### Prototype
```c
static inline int ncplane_pututf32_yx(struct ncplane* n, int y, int x, uint32_t u);
```
"""
function ncplane_pututf32_yx(n, y, x, u)
    @ccall libnotcurses_ffi.ncplane_pututf32_yx(n::Ptr{ncplane}, y::Cint, x::Cint, u::UInt32)::Cint
end

"""
    ncplane_putwc_yx(n, y, x, w)


### Prototype
```c
static inline int ncplane_putwc_yx(struct ncplane* n, int y, int x, wchar_t w);
```
"""
function ncplane_putwc_yx(n, y, x, w)
    @ccall libnotcurses_ffi.ncplane_putwc_yx(n::Ptr{ncplane}, y::Cint, x::Cint, w::Cwchar_t)::Cint
end

"""
    ncplane_putwc(n, w)

Write 'w' at the current cursor position, using the plane's current styling.
### Prototype
```c
static inline int ncplane_putwc(struct ncplane* n, wchar_t w);
```
"""
function ncplane_putwc(n, w)
    @ccall libnotcurses_ffi.ncplane_putwc(n::Ptr{ncplane}, w::Cwchar_t)::Cint
end

"""
    ncplane_putwc_utf32(n, w, wchars)

Write the first Unicode character from 'w' at the current cursor position,
using the plane's current styling. In environments where wchar_t is only
16 bits (Windows, essentially), a single Unicode might require two wchar_t
values forming a surrogate pair. On environments with 32-bit wchar_t, this
should not happen. If w[0] is a surrogate, it is decoded together with
w[1], and passed as a single reconstructed UTF-32 character to
ncplane_pututf32(); 'wchars' will get a value of 2 in this case. 'wchars'
otherwise gets a value of 1. A surrogate followed by an invalid pairing
will set 'wchars' to 2, but return -1 immediately.
### Prototype
```c
static inline int ncplane_putwc_utf32(struct ncplane* n, const wchar_t* w, unsigned* wchars);
```
"""
function ncplane_putwc_utf32(n, w, wchars)
    @ccall libnotcurses_ffi.ncplane_putwc_utf32(n::Ptr{ncplane}, w::Ptr{Cwchar_t}, wchars::Ptr{Cuint})::Cint
end

"""
    ncplane_putwc_stained(n, w)

Write 'w' at the current cursor position, using any preexisting styling
at that cell.
### Prototype
```c
static inline int ncplane_putwc_stained(struct ncplane* n, wchar_t w);
```
"""
function ncplane_putwc_stained(n, w)
    @ccall libnotcurses_ffi.ncplane_putwc_stained(n::Ptr{ncplane}, w::Cwchar_t)::Cint
end

"""
    ncplane_hline(n, c, len)


### Prototype
```c
__attribute__ ((nonnull (1, 2))) static inline int ncplane_hline(struct ncplane* n, const nccell* c, unsigned len);
```
"""
function ncplane_hline(n, c, len)
    @ccall libnotcurses_ffi.ncplane_hline(n::Ptr{ncplane}, c::Ptr{nccell}, len::Cuint)::Cint
end

"""
    ncplane_vline(n, c, len)


### Prototype
```c
__attribute__ ((nonnull (1, 2))) static inline int ncplane_vline(struct ncplane* n, const nccell* c, unsigned len);
```
"""
function ncplane_vline(n, c, len)
    @ccall libnotcurses_ffi.ncplane_vline(n::Ptr{ncplane}, c::Ptr{nccell}, len::Cuint)::Cint
end

"""
    ncplane_box_sized(n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)

Draw a box with its upper-left corner at the current cursor position, having
dimensions 'ylen'x'xlen'. See ncplane_box() for more information. The
minimum box size is 2x2, and it cannot be drawn off-plane.
### Prototype
```c
static inline int ncplane_box_sized(struct ncplane* n, const nccell* ul, const nccell* ur, const nccell* ll, const nccell* lr, const nccell* hline, const nccell* vline, unsigned ystop, unsigned xstop, unsigned ctlword);
```
"""
function ncplane_box_sized(n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)
    @ccall libnotcurses_ffi.ncplane_box_sized(n::Ptr{ncplane}, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hline::Ptr{nccell}, vline::Ptr{nccell}, ystop::Cuint, xstop::Cuint, ctlword::Cuint)::Cint
end

"""
    ncplane_perimeter(n, ul, ur, ll, lr, hline, vline, ctlword)


### Prototype
```c
static inline int ncplane_perimeter(struct ncplane* n, const nccell* ul, const nccell* ur, const nccell* ll, const nccell* lr, const nccell* hline, const nccell* vline, unsigned ctlword);
```
"""
function ncplane_perimeter(n, ul, ur, ll, lr, hline, vline, ctlword)
    @ccall libnotcurses_ffi.ncplane_perimeter(n::Ptr{ncplane}, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hline::Ptr{nccell}, vline::Ptr{nccell}, ctlword::Cuint)::Cint
end

"""
    nccell_fg_rgb(cl)

Extract 24 bits of foreground RGB from 'cl', shifted to LSBs.
### Prototype
```c
static inline uint32_t nccell_fg_rgb(const nccell* cl);
```
"""
function nccell_fg_rgb(cl)
    @ccall libnotcurses_ffi.nccell_fg_rgb(cl::Ptr{nccell})::UInt32
end

"""
    nccell_bg_rgb(cl)

Extract 24 bits of background RGB from 'cl', shifted to LSBs.
### Prototype
```c
static inline uint32_t nccell_bg_rgb(const nccell* cl);
```
"""
function nccell_bg_rgb(cl)
    @ccall libnotcurses_ffi.nccell_bg_rgb(cl::Ptr{nccell})::UInt32
end

"""
    nccell_fg_alpha(cl)

Extract 2 bits of foreground alpha from 'cl', shifted to LSBs.
### Prototype
```c
static inline uint32_t nccell_fg_alpha(const nccell* cl);
```
"""
function nccell_fg_alpha(cl)
    @ccall libnotcurses_ffi.nccell_fg_alpha(cl::Ptr{nccell})::UInt32
end

"""
    nccell_bg_alpha(cl)

Extract 2 bits of background alpha from 'cl', shifted to LSBs.
### Prototype
```c
static inline uint32_t nccell_bg_alpha(const nccell* cl);
```
"""
function nccell_bg_alpha(cl)
    @ccall libnotcurses_ffi.nccell_bg_alpha(cl::Ptr{nccell})::UInt32
end

"""
    nccell_fg_rgb8(cl, r, g, b)

Extract 24 bits of foreground RGB from 'cl', split into components.
### Prototype
```c
static inline uint32_t nccell_fg_rgb8(const nccell* cl, unsigned* r, unsigned* g, unsigned* b);
```
"""
function nccell_fg_rgb8(cl, r, g, b)
    @ccall libnotcurses_ffi.nccell_fg_rgb8(cl::Ptr{nccell}, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

"""
    nccell_bg_rgb8(cl, r, g, b)

Extract 24 bits of background RGB from 'cl', split into components.
### Prototype
```c
static inline uint32_t nccell_bg_rgb8(const nccell* cl, unsigned* r, unsigned* g, unsigned* b);
```
"""
function nccell_bg_rgb8(cl, r, g, b)
    @ccall libnotcurses_ffi.nccell_bg_rgb8(cl::Ptr{nccell}, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

"""
    nccell_set_fg_rgb8(cl, r, g, b)

Set the r, g, and b cell for the foreground component of this 64-bit
'cl' variable, and mark it as not using the default color.
### Prototype
```c
static inline int nccell_set_fg_rgb8(nccell* cl, unsigned r, unsigned g, unsigned b);
```
"""
function nccell_set_fg_rgb8(cl, r, g, b)
    @ccall libnotcurses_ffi.nccell_set_fg_rgb8(cl::Ptr{nccell}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    nccell_set_fg_rgb8_clipped(cl, r, g, b)

Same, but clipped to [0..255].
### Prototype
```c
static inline void nccell_set_fg_rgb8_clipped(nccell* cl, int r, int g, int b);
```
"""
function nccell_set_fg_rgb8_clipped(cl, r, g, b)
    @ccall libnotcurses_ffi.nccell_set_fg_rgb8_clipped(cl::Ptr{nccell}, r::Cint, g::Cint, b::Cint)::Cvoid
end

"""
    nccell_set_fg_rgb(c, channel)

Same, but with an assembled 24-bit RGB value.
### Prototype
```c
static inline int nccell_set_fg_rgb(nccell* c, uint32_t channel);
```
"""
function nccell_set_fg_rgb(c, channel)
    @ccall libnotcurses_ffi.nccell_set_fg_rgb(c::Ptr{nccell}, channel::UInt32)::Cint
end

"""
    nccell_set_fg_palindex(cl, idx)

Set the cell's foreground palette index, set the foreground palette index
bit, set it foreground-opaque, and clear the foreground default color bit.
### Prototype
```c
static inline int nccell_set_fg_palindex(nccell* cl, unsigned idx);
```
"""
function nccell_set_fg_palindex(cl, idx)
    @ccall libnotcurses_ffi.nccell_set_fg_palindex(cl::Ptr{nccell}, idx::Cuint)::Cint
end

"""
    nccell_fg_palindex(cl)


### Prototype
```c
static inline uint32_t nccell_fg_palindex(const nccell* cl);
```
"""
function nccell_fg_palindex(cl)
    @ccall libnotcurses_ffi.nccell_fg_palindex(cl::Ptr{nccell})::UInt32
end

"""
    nccell_set_bg_rgb8(cl, r, g, b)

Set the r, g, and b cell for the background component of this 64-bit
'cl' variable, and mark it as not using the default color.
### Prototype
```c
static inline int nccell_set_bg_rgb8(nccell* cl, unsigned r, unsigned g, unsigned b);
```
"""
function nccell_set_bg_rgb8(cl, r, g, b)
    @ccall libnotcurses_ffi.nccell_set_bg_rgb8(cl::Ptr{nccell}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    nccell_set_bg_rgb8_clipped(cl, r, g, b)

Same, but clipped to [0..255].
### Prototype
```c
static inline void nccell_set_bg_rgb8_clipped(nccell* cl, int r, int g, int b);
```
"""
function nccell_set_bg_rgb8_clipped(cl, r, g, b)
    @ccall libnotcurses_ffi.nccell_set_bg_rgb8_clipped(cl::Ptr{nccell}, r::Cint, g::Cint, b::Cint)::Cvoid
end

"""
    nccell_set_bg_rgb(c, channel)

Same, but with an assembled 24-bit RGB value. A value over 0xffffff
will be rejected, with a non-zero return value.
### Prototype
```c
static inline int nccell_set_bg_rgb(nccell* c, uint32_t channel);
```
"""
function nccell_set_bg_rgb(c, channel)
    @ccall libnotcurses_ffi.nccell_set_bg_rgb(c::Ptr{nccell}, channel::UInt32)::Cint
end

"""
    nccell_set_bg_palindex(cl, idx)

Set the cell's background palette index, set the background palette index
bit, set it background-opaque, and clear the background default color bit.
### Prototype
```c
static inline int nccell_set_bg_palindex(nccell* cl, unsigned idx);
```
"""
function nccell_set_bg_palindex(cl, idx)
    @ccall libnotcurses_ffi.nccell_set_bg_palindex(cl::Ptr{nccell}, idx::Cuint)::Cint
end

"""
    nccell_bg_palindex(cl)


### Prototype
```c
static inline uint32_t nccell_bg_palindex(const nccell* cl);
```
"""
function nccell_bg_palindex(cl)
    @ccall libnotcurses_ffi.nccell_bg_palindex(cl::Ptr{nccell})::UInt32
end

"""
    nccell_fg_default_p(cl)

Is the foreground using the "default foreground color"?
### Prototype
```c
static inline bool nccell_fg_default_p(const nccell* cl);
```
"""
function nccell_fg_default_p(cl)
    @ccall libnotcurses_ffi.nccell_fg_default_p(cl::Ptr{nccell})::Bool
end

"""
    nccell_fg_palindex_p(cl)


### Prototype
```c
static inline bool nccell_fg_palindex_p(const nccell* cl);
```
"""
function nccell_fg_palindex_p(cl)
    @ccall libnotcurses_ffi.nccell_fg_palindex_p(cl::Ptr{nccell})::Bool
end

"""
    nccell_bg_default_p(cl)

Is the background using the "default background color"? The "default
background color" must generally be used to take advantage of
terminal-effected transparency.
### Prototype
```c
static inline bool nccell_bg_default_p(const nccell* cl);
```
"""
function nccell_bg_default_p(cl)
    @ccall libnotcurses_ffi.nccell_bg_default_p(cl::Ptr{nccell})::Bool
end

"""
    nccell_bg_palindex_p(cl)


### Prototype
```c
static inline bool nccell_bg_palindex_p(const nccell* cl);
```
"""
function nccell_bg_palindex_p(cl)
    @ccall libnotcurses_ffi.nccell_bg_palindex_p(cl::Ptr{nccell})::Bool
end

"""
    ncplane_bchannel(n)

Extract the background alpha and coloring bits from a 64-bit channel
pair as a single 32-bit value.
### Prototype
```c
static inline uint32_t ncplane_bchannel(const struct ncplane* n);
```
"""
function ncplane_bchannel(n)
    @ccall libnotcurses_ffi.ncplane_bchannel(n::Ptr{ncplane})::UInt32
end

"""
    ncplane_fchannel(n)

Extract the foreground alpha and coloring bits from a 64-bit channel
pair as a single 32-bit value.
### Prototype
```c
static inline uint32_t ncplane_fchannel(const struct ncplane* n);
```
"""
function ncplane_fchannel(n)
    @ccall libnotcurses_ffi.ncplane_fchannel(n::Ptr{ncplane})::UInt32
end

"""
    ncplane_fg_rgb(n)

Extract 24 bits of working foreground RGB from an ncplane, shifted to LSBs.
### Prototype
```c
static inline uint32_t ncplane_fg_rgb(const struct ncplane* n);
```
"""
function ncplane_fg_rgb(n)
    @ccall libnotcurses_ffi.ncplane_fg_rgb(n::Ptr{ncplane})::UInt32
end

"""
    ncplane_bg_rgb(n)

Extract 24 bits of working background RGB from an ncplane, shifted to LSBs.
### Prototype
```c
static inline uint32_t ncplane_bg_rgb(const struct ncplane* n);
```
"""
function ncplane_bg_rgb(n)
    @ccall libnotcurses_ffi.ncplane_bg_rgb(n::Ptr{ncplane})::UInt32
end

"""
    ncplane_fg_alpha(n)

Extract 2 bits of foreground alpha from 'struct ncplane', shifted to LSBs.
### Prototype
```c
static inline uint32_t ncplane_fg_alpha(const struct ncplane* n);
```
"""
function ncplane_fg_alpha(n)
    @ccall libnotcurses_ffi.ncplane_fg_alpha(n::Ptr{ncplane})::UInt32
end

"""
    ncplane_fg_default_p(n)

Is the plane's foreground using the "default foreground color"?
### Prototype
```c
static inline bool ncplane_fg_default_p(const struct ncplane* n);
```
"""
function ncplane_fg_default_p(n)
    @ccall libnotcurses_ffi.ncplane_fg_default_p(n::Ptr{ncplane})::Bool
end

"""
    ncplane_bg_alpha(n)

Extract 2 bits of background alpha from 'struct ncplane', shifted to LSBs.
### Prototype
```c
static inline uint32_t ncplane_bg_alpha(const struct ncplane* n);
```
"""
function ncplane_bg_alpha(n)
    @ccall libnotcurses_ffi.ncplane_bg_alpha(n::Ptr{ncplane})::UInt32
end

"""
    ncplane_bg_default_p(n)

Is the plane's background using the "default background color"?
### Prototype
```c
static inline bool ncplane_bg_default_p(const struct ncplane* n);
```
"""
function ncplane_bg_default_p(n)
    @ccall libnotcurses_ffi.ncplane_bg_default_p(n::Ptr{ncplane})::Bool
end

"""
    ncplane_fg_rgb8(n, r, g, b)

Extract 24 bits of foreground RGB from 'n', split into components.
### Prototype
```c
static inline uint32_t ncplane_fg_rgb8(const struct ncplane* n, unsigned* r, unsigned* g, unsigned* b);
```
"""
function ncplane_fg_rgb8(n, r, g, b)
    @ccall libnotcurses_ffi.ncplane_fg_rgb8(n::Ptr{ncplane}, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

"""
    ncplane_bg_rgb8(n, r, g, b)

Extract 24 bits of background RGB from 'n', split into components.
### Prototype
```c
static inline uint32_t ncplane_bg_rgb8(const struct ncplane* n, unsigned* r, unsigned* g, unsigned* b);
```
"""
function ncplane_bg_rgb8(n, r, g, b)
    @ccall libnotcurses_ffi.ncplane_bg_rgb8(n::Ptr{ncplane}, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})::UInt32
end

"""
    nccells_load_box(n, styles, channels, ul, ur, ll, lr, hl, vl, gclusters)

load up six cells with the EGCs necessary to draw a box. returns 0 on
success, -1 on error. on error, any cells this function might
have loaded before the error are nccell_release()d. There must be at least
six EGCs in gcluster.
### Prototype
```c
static inline int nccells_load_box(struct ncplane* n, uint16_t styles, uint64_t channels, nccell* ul, nccell* ur, nccell* ll, nccell* lr, nccell* hl, nccell* vl, const char* gclusters);
```
"""
function nccells_load_box(n, styles, channels, ul, ur, ll, lr, hl, vl, gclusters)
    @ccall libnotcurses_ffi.nccells_load_box(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell}, gclusters::Ptr{Cchar})::Cint
end

"""
    nccells_ascii_box(n, attr, channels, ul, ur, ll, lr, hl, vl)


### Prototype
```c
static inline int nccells_ascii_box(struct ncplane* n, uint16_t attr, uint64_t channels, nccell* ul, nccell* ur, nccell* ll, nccell* lr, nccell* hl, nccell* vl);
```
"""
function nccells_ascii_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    @ccall libnotcurses_ffi.nccells_ascii_box(n::Ptr{ncplane}, attr::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell})::Cint
end

"""
    nccells_double_box(n, attr, channels, ul, ur, ll, lr, hl, vl)


### Prototype
```c
static inline int nccells_double_box(struct ncplane* n, uint16_t attr, uint64_t channels, nccell* ul, nccell* ur, nccell* ll, nccell* lr, nccell* hl, nccell* vl);
```
"""
function nccells_double_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    @ccall libnotcurses_ffi.nccells_double_box(n::Ptr{ncplane}, attr::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell})::Cint
end

"""
    nccells_rounded_box(n, attr, channels, ul, ur, ll, lr, hl, vl)


### Prototype
```c
static inline int nccells_rounded_box(struct ncplane* n, uint16_t attr, uint64_t channels, nccell* ul, nccell* ur, nccell* ll, nccell* lr, nccell* hl, nccell* vl);
```
"""
function nccells_rounded_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    @ccall libnotcurses_ffi.nccells_rounded_box(n::Ptr{ncplane}, attr::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell})::Cint
end

"""
    nccells_light_box(n, attr, channels, ul, ur, ll, lr, hl, vl)


### Prototype
```c
static inline int nccells_light_box(struct ncplane* n, uint16_t attr, uint64_t channels, nccell* ul, nccell* ur, nccell* ll, nccell* lr, nccell* hl, nccell* vl);
```
"""
function nccells_light_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    @ccall libnotcurses_ffi.nccells_light_box(n::Ptr{ncplane}, attr::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell})::Cint
end

"""
    nccells_heavy_box(n, attr, channels, ul, ur, ll, lr, hl, vl)


### Prototype
```c
static inline int nccells_heavy_box(struct ncplane* n, uint16_t attr, uint64_t channels, nccell* ul, nccell* ur, nccell* ll, nccell* lr, nccell* hl, nccell* vl);
```
"""
function nccells_heavy_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    @ccall libnotcurses_ffi.nccells_heavy_box(n::Ptr{ncplane}, attr::UInt16, channels::UInt64, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hl::Ptr{nccell}, vl::Ptr{nccell})::Cint
end

"""
    ncplane_rounded_box(n, styles, channels, ystop, xstop, ctlword)


### Prototype
```c
static inline int ncplane_rounded_box(struct ncplane* n, uint16_t styles, uint64_t channels, unsigned ystop, unsigned xstop, unsigned ctlword);
```
"""
function ncplane_rounded_box(n, styles, channels, ystop, xstop, ctlword)
    @ccall libnotcurses_ffi.ncplane_rounded_box(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ystop::Cuint, xstop::Cuint, ctlword::Cuint)::Cint
end

"""
    ncplane_perimeter_rounded(n, stylemask, channels, ctlword)


### Prototype
```c
static inline int ncplane_perimeter_rounded(struct ncplane* n, uint16_t stylemask, uint64_t channels, unsigned ctlword);
```
"""
function ncplane_perimeter_rounded(n, stylemask, channels, ctlword)
    @ccall libnotcurses_ffi.ncplane_perimeter_rounded(n::Ptr{ncplane}, stylemask::UInt16, channels::UInt64, ctlword::Cuint)::Cint
end

"""
    ncplane_rounded_box_sized(n, styles, channels, ylen, xlen, ctlword)


### Prototype
```c
static inline int ncplane_rounded_box_sized(struct ncplane* n, uint16_t styles, uint64_t channels, unsigned ylen, unsigned xlen, unsigned ctlword);
```
"""
function ncplane_rounded_box_sized(n, styles, channels, ylen, xlen, ctlword)
    @ccall libnotcurses_ffi.ncplane_rounded_box_sized(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

"""
    ncplane_double_box(n, styles, channels, ylen, xlen, ctlword)


### Prototype
```c
static inline int ncplane_double_box(struct ncplane* n, uint16_t styles, uint64_t channels, unsigned ylen, unsigned xlen, unsigned ctlword);
```
"""
function ncplane_double_box(n, styles, channels, ylen, xlen, ctlword)
    @ccall libnotcurses_ffi.ncplane_double_box(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

"""
    ncplane_ascii_box(n, styles, channels, ylen, xlen, ctlword)


### Prototype
```c
static inline int ncplane_ascii_box(struct ncplane* n, uint16_t styles, uint64_t channels, unsigned ylen, unsigned xlen, unsigned ctlword);
```
"""
function ncplane_ascii_box(n, styles, channels, ylen, xlen, ctlword)
    @ccall libnotcurses_ffi.ncplane_ascii_box(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

"""
    ncplane_perimeter_double(n, stylemask, channels, ctlword)


### Prototype
```c
static inline int ncplane_perimeter_double(struct ncplane* n, uint16_t stylemask, uint64_t channels, unsigned ctlword);
```
"""
function ncplane_perimeter_double(n, stylemask, channels, ctlword)
    @ccall libnotcurses_ffi.ncplane_perimeter_double(n::Ptr{ncplane}, stylemask::UInt16, channels::UInt64, ctlword::Cuint)::Cint
end

"""
    ncplane_double_box_sized(n, styles, channels, ylen, xlen, ctlword)


### Prototype
```c
static inline int ncplane_double_box_sized(struct ncplane* n, uint16_t styles, uint64_t channels, unsigned ylen, unsigned xlen, unsigned ctlword);
```
"""
function ncplane_double_box_sized(n, styles, channels, ylen, xlen, ctlword)
    @ccall libnotcurses_ffi.ncplane_double_box_sized(n::Ptr{ncplane}, styles::UInt16, channels::UInt64, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

"""
    ncvisualplane_create(nc, opts, ncv, vopts)

Create a new plane as prescribed in opts, either as a child of 'vopts->n',
or the root of a new pile if 'vopts->n' is NULL (or 'vopts' itself is NULL).
Blit 'ncv' to the created plane according to 'vopts'. If 'vopts->n' is
non-NULL, NCVISUAL_OPTION_CHILDPLANE must be supplied.
### Prototype
```c
__attribute__ ((nonnull (1, 2, 3))) static inline struct ncplane* ncvisualplane_create(struct notcurses* nc, const struct ncplane_options* opts, struct ncvisual* ncv, struct ncvisual_options* vopts);
```
"""
function ncvisualplane_create(nc, opts, ncv, vopts)
    @ccall libnotcurses_ffi.ncvisualplane_create(nc::Ptr{notcurses}, opts::Ptr{ncplane_options}, ncv::Ptr{ncvisual}, vopts::Ptr{ncvisual_options})::Ptr{ncplane}
end

"""
    ncpixel_a(pixel)

Extract the 8-bit alpha component from a pixel
### Prototype
```c
static inline unsigned ncpixel_a(uint32_t pixel);
```
"""
function ncpixel_a(pixel)
    @ccall libnotcurses_ffi.ncpixel_a(pixel::UInt32)::Cuint
end

"""
    ncpixel_r(pixel)

Extract the 8-bit red component from an ABGR pixel
### Prototype
```c
static inline unsigned ncpixel_r(uint32_t pixel);
```
"""
function ncpixel_r(pixel)
    @ccall libnotcurses_ffi.ncpixel_r(pixel::UInt32)::Cuint
end

"""
    ncpixel_g(pixel)

Extract the 8-bit green component from an ABGR pixel
### Prototype
```c
static inline unsigned ncpixel_g(uint32_t pixel);
```
"""
function ncpixel_g(pixel)
    @ccall libnotcurses_ffi.ncpixel_g(pixel::UInt32)::Cuint
end

"""
    ncpixel_b(pixel)

Extract the 8-bit blue component from an ABGR pixel
### Prototype
```c
static inline unsigned ncpixel_b(uint32_t pixel);
```
"""
function ncpixel_b(pixel)
    @ccall libnotcurses_ffi.ncpixel_b(pixel::UInt32)::Cuint
end

"""
    ncpixel_set_a(pixel, a)

Set the 8-bit alpha component of an ABGR pixel
### Prototype
```c
static inline int ncpixel_set_a(uint32_t* pixel, unsigned a);
```
"""
function ncpixel_set_a(pixel, a)
    @ccall libnotcurses_ffi.ncpixel_set_a(pixel::Ptr{UInt32}, a::Cuint)::Cint
end

"""
    ncpixel_set_r(pixel, r)

Set the 8-bit red component of an ABGR pixel
### Prototype
```c
static inline int ncpixel_set_r(uint32_t* pixel, unsigned r);
```
"""
function ncpixel_set_r(pixel, r)
    @ccall libnotcurses_ffi.ncpixel_set_r(pixel::Ptr{UInt32}, r::Cuint)::Cint
end

"""
    ncpixel_set_g(pixel, g)

Set the 8-bit green component of an ABGR pixel
### Prototype
```c
static inline int ncpixel_set_g(uint32_t* pixel, unsigned g);
```
"""
function ncpixel_set_g(pixel, g)
    @ccall libnotcurses_ffi.ncpixel_set_g(pixel::Ptr{UInt32}, g::Cuint)::Cint
end

"""
    ncpixel_set_b(pixel, b)

Set the 8-bit blue component of an ABGR pixel
### Prototype
```c
static inline int ncpixel_set_b(uint32_t* pixel, unsigned b);
```
"""
function ncpixel_set_b(pixel, b)
    @ccall libnotcurses_ffi.ncpixel_set_b(pixel::Ptr{UInt32}, b::Cuint)::Cint
end

"""
    ncpixel(r, g, b)

Construct a libav-compatible ABGR pixel, clipping at [0, 255).
### Prototype
```c
static inline uint32_t ncpixel(unsigned r, unsigned g, unsigned b);
```
"""
function ncpixel(r, g, b)
    @ccall libnotcurses_ffi.ncpixel(r::Cuint, g::Cuint, b::Cuint)::UInt32
end

"""
    ncpixel_set_rgb8(pixel, r, g, b)

set the RGB values of an RGB pixel
### Prototype
```c
static inline int ncpixel_set_rgb8(uint32_t* pixel, unsigned r, unsigned g, unsigned b);
```
"""
function ncpixel_set_rgb8(pixel, r, g, b)
    @ccall libnotcurses_ffi.ncpixel_set_rgb8(pixel::Ptr{UInt32}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    ncqprefix(val, decimal, buf, omitdec)

Mega, kilo, gigafoo. Use PREFIXSTRLEN + 1 and PREFIXCOLUMNS.
### Prototype
```c
static inline const char* ncqprefix(uintmax_t val, uintmax_t decimal, char* buf, int omitdec);
```
"""
function ncqprefix(val, decimal, buf, omitdec)
    @ccall libnotcurses_ffi.ncqprefix(val::uintmax_t, decimal::uintmax_t, buf::Ptr{Cchar}, omitdec::Cint)::Ptr{Cchar}
end

"""
    nciprefix(val, decimal, buf, omitdec)

Mibi, kebi, gibibytes sans 'i' suffix. Use IPREFIXSTRLEN + 1.
### Prototype
```c
static inline const char* nciprefix(uintmax_t val, uintmax_t decimal, char* buf, int omitdec);
```
"""
function nciprefix(val, decimal, buf, omitdec)
    @ccall libnotcurses_ffi.nciprefix(val::uintmax_t, decimal::uintmax_t, buf::Ptr{Cchar}, omitdec::Cint)::Ptr{Cchar}
end

"""
    ncbprefix(val, decimal, buf, omitdec)

Mibi, kebi, gibibytes. Use BPREFIXSTRLEN + 1 and BPREFIXCOLUMNS.
### Prototype
```c
static inline const char* ncbprefix(uintmax_t val, uintmax_t decimal, char* buf, int omitdec);
```
"""
function ncbprefix(val, decimal, buf, omitdec)
    @ccall libnotcurses_ffi.ncbprefix(val::uintmax_t, decimal::uintmax_t, buf::Ptr{Cchar}, omitdec::Cint)::Ptr{Cchar}
end

"""
    nctabbed_hdrchan(nt)


### Prototype
```c
static inline uint64_t nctabbed_hdrchan(struct nctabbed* nt);
```
"""
function nctabbed_hdrchan(nt)
    @ccall libnotcurses_ffi.nctabbed_hdrchan(nt::Ptr{nctabbed})::UInt64
end

"""
    nctabbed_selchan(nt)


### Prototype
```c
static inline uint64_t nctabbed_selchan(struct nctabbed* nt);
```
"""
function nctabbed_selchan(nt)
    @ccall libnotcurses_ffi.nctabbed_selchan(nt::Ptr{nctabbed})::UInt64
end

"""
    nctabbed_sepchan(nt)


### Prototype
```c
static inline uint64_t nctabbed_sepchan(struct nctabbed* nt);
```
"""
function nctabbed_sepchan(nt)
    @ccall libnotcurses_ffi.nctabbed_sepchan(nt::Ptr{nctabbed})::UInt64
end

