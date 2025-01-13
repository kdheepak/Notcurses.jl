const uintmax_t = Culong

mutable struct ncdirect end

"""
    ncdirect_core_init(termtype, fp, flags)

The same as ncdirect_init(), but without any multimedia functionality,
allowing for a svelter binary. Link with notcurses-core if this is used.
### Prototype
```c
API ALLOC struct ncdirect* ncdirect_core_init(const char* termtype, FILE* fp, uint64_t flags);
```
"""
function ncdirect_core_init(termtype, fp, flags)
    @ccall libnotcurses_core.ncdirect_core_init(termtype::Ptr{Cchar}, fp::Ptr{Cint}, flags::Cint)::Ptr{ncdirect}
end

"""
    ncdirect_readline(nc, prompt)

Read a (heap-allocated) newline-delimited chunk of text, after printing the
prompt. The newline itself, if present, is included. Returns NULL on error.
### Prototype
```c
__attribute__ ((nonnull (1))) API ALLOC char* ncdirect_readline(struct ncdirect* nc, const char* prompt);
```
"""
function ncdirect_readline(nc, prompt)
    @ccall libnotcurses_core.ncdirect_readline(nc::Ptr{ncdirect}, prompt::Ptr{Cchar})::Ptr{Cchar}
end

"""
    ncdirect_set_fg_rgb(nc, rgb)

Direct mode. This API can be used to colorize and stylize output generated
outside of notcurses, without ever calling notcurses_render(). These should
not be intermixed with standard Notcurses rendering.
### Prototype
```c
API int ncdirect_set_fg_rgb(struct ncdirect* nc, unsigned rgb) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_set_fg_rgb(nc, rgb)
    @ccall libnotcurses_core.ncdirect_set_fg_rgb(nc::Ptr{ncdirect}, rgb::Cuint)::Cint
end

"""
    ncdirect_set_bg_rgb(nc, rgb)


### Prototype
```c
API int ncdirect_set_bg_rgb(struct ncdirect* nc, unsigned rgb) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_set_bg_rgb(nc, rgb)
    @ccall libnotcurses_core.ncdirect_set_bg_rgb(nc::Ptr{ncdirect}, rgb::Cuint)::Cint
end

"""
    ncdirect_set_fg_palindex(nc, pidx)


### Prototype
```c
API int ncdirect_set_fg_palindex(struct ncdirect* nc, int pidx) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_set_fg_palindex(nc, pidx)
    @ccall libnotcurses_core.ncdirect_set_fg_palindex(nc::Ptr{ncdirect}, pidx::Cint)::Cint
end

"""
    ncdirect_set_bg_palindex(nc, pidx)


### Prototype
```c
API int ncdirect_set_bg_palindex(struct ncdirect* nc, int pidx) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_set_bg_palindex(nc, pidx)
    @ccall libnotcurses_core.ncdirect_set_bg_palindex(nc::Ptr{ncdirect}, pidx::Cint)::Cint
end

"""
    ncdirect_palette_size(nc)

Returns the number of simultaneous colors claimed to be supported, or 1 if
there is no color support. Note that several terminal emulators advertise
more colors than they actually support, downsampling internally.
### Prototype
```c
API unsigned ncdirect_palette_size(const struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_palette_size(nc)
    @ccall libnotcurses_core.ncdirect_palette_size(nc::Ptr{ncdirect})::Cuint
end

"""
    ncdirect_putstr(nc, channels, utf8)

Output the string |utf8| according to the channels |channels|. Note that
ncdirect_putstr() does not explicitly flush output buffers, so it will not
necessarily be immediately visible. Returns EOF on error.
### Prototype
```c
API int ncdirect_putstr(struct ncdirect* nc, uint64_t channels, const char* utf8) __attribute__ ((nonnull (1, 3)));
```
"""
function ncdirect_putstr(nc, channels, utf8)
    @ccall libnotcurses_core.ncdirect_putstr(nc::Ptr{ncdirect}, channels::Cint, utf8::Ptr{Cchar})::Cint
end

"""
    ncdirect_putegc(nc, channels, utf8, sbytes)

Output a single EGC (this might be several characters) from |utf8|,
according to the channels |channels|. On success, the number of columns
thought to have been used is returned, and if |sbytes| is not NULL,
the number of bytes consumed will be written there.
### Prototype
```c
API int ncdirect_putegc(struct ncdirect* nc, uint64_t channels, const char* utf8, int* sbytes) __attribute__ ((nonnull (1, 3)));
```
"""
function ncdirect_putegc(nc, channels, utf8, sbytes)
    @ccall libnotcurses_core.ncdirect_putegc(nc::Ptr{ncdirect}, channels::Cint, utf8::Ptr{Cchar}, sbytes::Ptr{Cint})::Cint
end

"""
    ncdirect_flush(nc)

Force a flush. Returns 0 on success, -1 on failure.
### Prototype
```c
API int ncdirect_flush(const struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_flush(nc)
    @ccall libnotcurses_core.ncdirect_flush(nc::Ptr{ncdirect})::Cint
end

"""
    ncdirect_set_fg_default(nc)


### Prototype
```c
API int ncdirect_set_fg_default(struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_set_fg_default(nc)
    @ccall libnotcurses_core.ncdirect_set_fg_default(nc::Ptr{ncdirect})::Cint
end

"""
    ncdirect_set_bg_default(nc)


### Prototype
```c
API int ncdirect_set_bg_default(struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_set_bg_default(nc)
    @ccall libnotcurses_core.ncdirect_set_bg_default(nc::Ptr{ncdirect})::Cint
end

"""
    ncdirect_dim_x(nc)

Get the current number of columns/rows.
### Prototype
```c
API unsigned ncdirect_dim_x(struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_dim_x(nc)
    @ccall libnotcurses_core.ncdirect_dim_x(nc::Ptr{ncdirect})::Cuint
end

"""
    ncdirect_dim_y(nc)


### Prototype
```c
API unsigned ncdirect_dim_y(struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_dim_y(nc)
    @ccall libnotcurses_core.ncdirect_dim_y(nc::Ptr{ncdirect})::Cuint
end

"""
    ncdirect_supported_styles(nc)

Returns a 16-bit bitmask of supported curses-style attributes
(NCSTYLE_UNDERLINE, NCSTYLE_BOLD, etc.) The attribute is only
indicated as supported if the terminal can support it together with color.
For more information, see the "ncv" capability in terminfo(5).
### Prototype
```c
API uint16_t ncdirect_supported_styles(const struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_supported_styles(nc)
    @ccall libnotcurses_core.ncdirect_supported_styles(nc::Ptr{ncdirect})::Cint
end

"""
    ncdirect_set_styles(n, stylebits)

ncplane_styles_*() analogues
### Prototype
```c
API int ncdirect_set_styles(struct ncdirect* n, unsigned stylebits) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_set_styles(n, stylebits)
    @ccall libnotcurses_core.ncdirect_set_styles(n::Ptr{ncdirect}, stylebits::Cuint)::Cint
end

"""
    ncdirect_on_styles(n, stylebits)


### Prototype
```c
API int ncdirect_on_styles(struct ncdirect* n, unsigned stylebits) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_on_styles(n, stylebits)
    @ccall libnotcurses_core.ncdirect_on_styles(n::Ptr{ncdirect}, stylebits::Cuint)::Cint
end

"""
    ncdirect_off_styles(n, stylebits)


### Prototype
```c
API int ncdirect_off_styles(struct ncdirect* n, unsigned stylebits) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_off_styles(n, stylebits)
    @ccall libnotcurses_core.ncdirect_off_styles(n::Ptr{ncdirect}, stylebits::Cuint)::Cint
end

"""
    ncdirect_styles(n)


### Prototype
```c
API uint16_t ncdirect_styles(const struct ncdirect* n) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_styles(n)
    @ccall libnotcurses_core.ncdirect_styles(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_cursor_move_yx(n, y, x)

Move the cursor in direct mode. -1 to retain current location on that axis.
### Prototype
```c
API int ncdirect_cursor_move_yx(struct ncdirect* n, int y, int x) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_cursor_move_yx(n, y, x)
    @ccall libnotcurses_core.ncdirect_cursor_move_yx(n::Ptr{ncdirect}, y::Cint, x::Cint)::Cint
end

"""
    ncdirect_cursor_enable(nc)


### Prototype
```c
API int ncdirect_cursor_enable(struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_cursor_enable(nc)
    @ccall libnotcurses_core.ncdirect_cursor_enable(nc::Ptr{ncdirect})::Cint
end

"""
    ncdirect_cursor_disable(nc)


### Prototype
```c
API int ncdirect_cursor_disable(struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_cursor_disable(nc)
    @ccall libnotcurses_core.ncdirect_cursor_disable(nc::Ptr{ncdirect})::Cint
end

"""
    ncdirect_cursor_up(nc, num)


### Prototype
```c
API int ncdirect_cursor_up(struct ncdirect* nc, int num) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_cursor_up(nc, num)
    @ccall libnotcurses_core.ncdirect_cursor_up(nc::Ptr{ncdirect}, num::Cint)::Cint
end

"""
    ncdirect_cursor_left(nc, num)


### Prototype
```c
API int ncdirect_cursor_left(struct ncdirect* nc, int num) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_cursor_left(nc, num)
    @ccall libnotcurses_core.ncdirect_cursor_left(nc::Ptr{ncdirect}, num::Cint)::Cint
end

"""
    ncdirect_cursor_right(nc, num)


### Prototype
```c
API int ncdirect_cursor_right(struct ncdirect* nc, int num) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_cursor_right(nc, num)
    @ccall libnotcurses_core.ncdirect_cursor_right(nc::Ptr{ncdirect}, num::Cint)::Cint
end

"""
    ncdirect_cursor_down(nc, num)


### Prototype
```c
API int ncdirect_cursor_down(struct ncdirect* nc, int num) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_cursor_down(nc, num)
    @ccall libnotcurses_core.ncdirect_cursor_down(nc::Ptr{ncdirect}, num::Cint)::Cint
end

"""
    ncdirect_cursor_yx(n, y, x)

Get the cursor position, when supported. This requires writing to the
terminal, and then reading from it. If the terminal doesn't reply, or
doesn't reply in a way we understand, the results might be deleterious.
### Prototype
```c
API int ncdirect_cursor_yx(struct ncdirect* n, unsigned* y, unsigned* x) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_cursor_yx(n, y, x)
    @ccall libnotcurses_core.ncdirect_cursor_yx(n::Ptr{ncdirect}, y::Ptr{Cuint}, x::Ptr{Cuint})::Cint
end

"""
    ncdirect_cursor_push(n)

Push or pop the cursor location to the terminal's stack. The depth of this
stack, and indeed its existence, is terminal-dependent.
### Prototype
```c
API int ncdirect_cursor_push(struct ncdirect* n) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_cursor_push(n)
    @ccall libnotcurses_core.ncdirect_cursor_push(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_cursor_pop(n)


### Prototype
```c
API int ncdirect_cursor_pop(struct ncdirect* n) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_cursor_pop(n)
    @ccall libnotcurses_core.ncdirect_cursor_pop(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_clear(nc)

Clear the screen.
### Prototype
```c
API int ncdirect_clear(struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_clear(nc)
    @ccall libnotcurses_core.ncdirect_clear(nc::Ptr{ncdirect})::Cint
end

"""
    ncdirect_capabilities(n)


### Prototype
```c
API const nccapabilities* ncdirect_capabilities(const struct ncdirect* n) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_capabilities(n)
    @ccall libnotcurses_core.ncdirect_capabilities(n::Ptr{ncdirect})::Ptr{Cint}
end

"""
    ncdirect_hline_interp(n, egc, len, h1, h2)

Draw horizontal/vertical lines using the specified channels, interpolating
between them as we go. The EGC may not use more than one column. For a
horizontal line, |len| cannot exceed the screen width minus the cursor's
offset. For a vertical line, it may be as long as you'd like; the screen
will scroll as necessary. All lines start at the current cursor position.
### Prototype
```c
API int ncdirect_hline_interp(struct ncdirect* n, const char* egc, unsigned len, uint64_t h1, uint64_t h2) __attribute__ ((nonnull (1, 2)));
```
"""
function ncdirect_hline_interp(n, egc, len, h1, h2)
    @ccall libnotcurses_core.ncdirect_hline_interp(n::Ptr{ncdirect}, egc::Ptr{Cchar}, len::Cuint, h1::Cint, h2::Cint)::Cint
end

"""
    ncdirect_vline_interp(n, egc, len, h1, h2)


### Prototype
```c
API int ncdirect_vline_interp(struct ncdirect* n, const char* egc, unsigned len, uint64_t h1, uint64_t h2) __attribute__ ((nonnull (1, 2)));
```
"""
function ncdirect_vline_interp(n, egc, len, h1, h2)
    @ccall libnotcurses_core.ncdirect_vline_interp(n::Ptr{ncdirect}, egc::Ptr{Cchar}, len::Cuint, h1::Cint, h2::Cint)::Cint
end

"""
    ncdirect_box(n, ul, ur, ll, lr, wchars, ylen, xlen, ctlword)

Draw a box with its upper-left corner at the current cursor position, having
dimensions |ylen|x|xlen|. See ncplane_box() for more information. The
minimum box size is 2x2, and it cannot be drawn off-screen. |wchars| is an
array of 6 wide characters: UL, UR, LL, LR, HL, VL.
### Prototype
```c
API int ncdirect_box(struct ncdirect* n, uint64_t ul, uint64_t ur, uint64_t ll, uint64_t lr, const wchar_t* wchars, unsigned ylen, unsigned xlen, unsigned ctlword) __attribute__ ((nonnull (1, 6)));
```
"""
function ncdirect_box(n, ul, ur, ll, lr, wchars, ylen, xlen, ctlword)
    @ccall libnotcurses_core.ncdirect_box(n::Ptr{ncdirect}, ul::Cint, ur::Cint, ll::Cint, lr::Cint, wchars::Ptr{Cint}, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

"""
    ncdirect_rounded_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)

ncdirect_box() with the rounded box-drawing characters
### Prototype
```c
API int ncdirect_rounded_box(struct ncdirect* n, uint64_t ul, uint64_t ur, uint64_t ll, uint64_t lr, unsigned ylen, unsigned xlen, unsigned ctlword) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_rounded_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    @ccall libnotcurses_core.ncdirect_rounded_box(n::Ptr{ncdirect}, ul::Cint, ur::Cint, ll::Cint, lr::Cint, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

"""
    ncdirect_double_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)

ncdirect_box() with the double box-drawing characters
### Prototype
```c
API int ncdirect_double_box(struct ncdirect* n, uint64_t ul, uint64_t ur, uint64_t ll, uint64_t lr, unsigned ylen, unsigned xlen, unsigned ctlword) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_double_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    @ccall libnotcurses_core.ncdirect_double_box(n::Ptr{ncdirect}, ul::Cint, ur::Cint, ll::Cint, lr::Cint, ylen::Cuint, xlen::Cuint, ctlword::Cuint)::Cint
end

"""
    ncdirect_get(n, absdl, ni)

Provide a NULL 'ts' to block at length, a 'ts' of 0 for non-blocking
operation, and otherwise an absolute deadline in terms of CLOCK_MONOTONIC.
Returns a single Unicode code point, a synthesized special key constant,
or (uint32_t)-1 on error. Returns 0 on a timeout. If an event is processed,
the return value is the 'id' field from that event. 'ni' may be NULL.
### Prototype
```c
API uint32_t ncdirect_get(struct ncdirect* n, const struct timespec* absdl, ncinput* ni) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_get(n, absdl, ni)
    @ccall libnotcurses_core.ncdirect_get(n::Ptr{ncdirect}, absdl::Ptr{Cvoid}, ni::Ptr{Cint})::Cint
end

"""
    ncdirect_inputready_fd(n)

Get a file descriptor suitable for input event poll()ing. When this
descriptor becomes available, you can call ncdirect_get_nblock(),
and input ought be ready. This file descriptor is *not* necessarily
the file descriptor associated with stdin (but it might be!).
### Prototype
```c
API int ncdirect_inputready_fd(struct ncdirect* n) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_inputready_fd(n)
    @ccall libnotcurses_core.ncdirect_inputready_fd(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_stop(nc)

Release 'nc' and any associated resources. 0 on success, non-0 on failure.
### Prototype
```c
API int ncdirect_stop(struct ncdirect* nc);
```
"""
function ncdirect_stop(nc)
    @ccall libnotcurses_core.ncdirect_stop(nc::Ptr{ncdirect})::Cint
end

mutable struct ncplane end

const ncdirectv = ncplane

mutable struct ncvisual end

const ncdirectf = ncvisual

"""
    ncdirect_render_image(n, filename, align, blitter, scale)

Display an image using the specified blitter and scaling. The image may
be arbitrarily many rows -- the output will scroll -- but will only occupy
the column of the cursor, and those to the right. The render/raster process
can be split by using ncdirect_render_frame() and ncdirect_raster_frame().
### Prototype
```c
API int ncdirect_render_image(struct ncdirect* n, const char* filename, ncalign_e align, ncblitter_e blitter, ncscale_e scale) __attribute__ ((nonnull (1, 2)));
```
"""
function ncdirect_render_image(n, filename, align, blitter, scale)
    @ccall libnotcurses_core.ncdirect_render_image(n::Ptr{ncdirect}, filename::Ptr{Cchar}, align::Cint, blitter::Cint, scale::Cint)::Cint
end

"""
    ncdirect_render_frame(n, filename, blitter, scale, maxy, maxx)

Render an image using the specified blitter and scaling, but do not write
the result. The image may be arbitrarily many rows -- the output will scroll
-- but will only occupy the column of the cursor, and those to the right.
To actually write (and free) this, invoke ncdirect_raster_frame(). 'maxx'
and 'maxy' (cell geometry, *not* pixel), if greater than 0, are used for
scaling; the terminal's geometry is otherwise used.
### Prototype
```c
API ALLOC ncdirectv* ncdirect_render_frame(struct ncdirect* n, const char* filename, ncblitter_e blitter, ncscale_e scale, int maxy, int maxx) __attribute__ ((nonnull (1, 2)));
```
"""
function ncdirect_render_frame(n, filename, blitter, scale, maxy, maxx)
    @ccall libnotcurses_core.ncdirect_render_frame(n::Ptr{ncdirect}, filename::Ptr{Cchar}, blitter::Cint, scale::Cint, maxy::Cint, maxx::Cint)::Ptr{ncdirectv}
end

"""
    ncdirect_raster_frame(n, ncdv, align)

Takes the result of ncdirect_render_frame() and writes it to the output,
freeing it on all paths.
### Prototype
```c
API int ncdirect_raster_frame(struct ncdirect* n, ncdirectv* ncdv, ncalign_e align) __attribute__ ((nonnull (1, 2)));
```
"""
function ncdirect_raster_frame(n, ncdv, align)
    @ccall libnotcurses_core.ncdirect_raster_frame(n::Ptr{ncdirect}, ncdv::Ptr{ncdirectv}, align::Cint)::Cint
end

"""
    ncdirectf_from_file(n, filename)

Load media from disk, but do not yet render it (presumably because you want
to get its geometry via ncdirectf_geom(), or to use the same file with
ncdirect_render_loaded_frame() multiple times). You must destroy the result
with ncdirectf_free();
### Prototype
```c
API ALLOC ncdirectf* ncdirectf_from_file(struct ncdirect* n, const char* filename) __attribute__ ((nonnull (1, 2)));
```
"""
function ncdirectf_from_file(n, filename)
    @ccall libnotcurses_core.ncdirectf_from_file(n::Ptr{ncdirect}, filename::Ptr{Cchar})::Ptr{ncdirectf}
end

"""
    ncdirectf_free(frame)

Free a ncdirectf returned from ncdirectf_from_file().
### Prototype
```c
API void ncdirectf_free(ncdirectf* frame);
```
"""
function ncdirectf_free(frame)
    @ccall libnotcurses_core.ncdirectf_free(frame::Ptr{ncdirectf})::Cvoid
end

"""
    ncscale_e

How to scale an ncvisual during rendering. NCSCALE_NONE will apply no
scaling. NCSCALE_SCALE scales a visual to the plane's size, maintaining
aspect ratio. NCSCALE_STRETCH stretches and scales the image in an attempt
to fill the entirety of the plane. NCSCALE_NONE_HIRES and
NCSCALE_SCALE_HIRES behave like their counterparts, but admit blitters
which don't preserve aspect ratio.
"""
@enum ncscale_e::UInt32 begin
    NCSCALE_NONE = 0
    NCSCALE_SCALE = 1
    NCSCALE_STRETCH = 2
    NCSCALE_NONE_HIRES = 3
    NCSCALE_SCALE_HIRES = 4
end

"""
    ncblitter_e

we never blit full blocks, but instead spaces (more efficient) with the
background set to the desired foreground. these need be kept in the same
order as the blitters[] definition in lib/blit.c.
"""
@enum ncblitter_e::UInt32 begin
    NCBLIT_DEFAULT = 0
    NCBLIT_1x1 = 1
    NCBLIT_2x1 = 2
    NCBLIT_2x2 = 3
    NCBLIT_3x2 = 4
    NCBLIT_4x2 = 5
    NCBLIT_BRAILLE = 6
    NCBLIT_PIXEL = 7
    NCBLIT_4x1 = 8
    NCBLIT_8x1 = 9
end

struct ncvisual_options
    n::Ptr{ncplane}
    scaling::ncscale_e
    y::Cint
    x::Cint
    begy::Cuint
    begx::Cuint
    leny::Cuint
    lenx::Cuint
    blitter::ncblitter_e
    flags::UInt64
    transcolor::UInt32
    pxoffy::Cuint
    pxoffx::Cuint
end

"""
    ncdirectf_render(n, frame, vopts)

Same as ncdirect_render_frame(), except 'frame' must already have been
loaded. A loaded frame may be rendered in different ways before it is
destroyed.
### Prototype
```c
API ALLOC ncdirectv* ncdirectf_render(struct ncdirect* n, ncdirectf* frame, const struct ncvisual_options* vopts) __attribute__ ((nonnull (1, 2)));
```
"""
function ncdirectf_render(n, frame, vopts)
    @ccall libnotcurses_core.ncdirectf_render(n::Ptr{ncdirect}, frame::Ptr{ncdirectf}, vopts::Ptr{ncvisual_options})::Ptr{ncdirectv}
end

"""
    ncdirectf_geom(n, frame, vopts, geom)

Having loaded the frame 'frame', get the geometry of a potential render.
### Prototype
```c
API int ncdirectf_geom(struct ncdirect* n, ncdirectf* frame, const struct ncvisual_options* vopts, ncvgeom* geom) __attribute__ ((nonnull (1, 2)));
```
"""
function ncdirectf_geom(n, frame, vopts, geom)
    @ccall libnotcurses_core.ncdirectf_geom(n::Ptr{ncdirect}, frame::Ptr{ncdirectf}, vopts::Ptr{ncvisual_options}, geom::Ptr{Cint})::Cint
end

"""
    ncdirect_stream(n, filename, streamer, vopts, curry)

Load successive frames from a file, invoking 'streamer' on each.
### Prototype
```c
API int ncdirect_stream(struct ncdirect* n, const char* filename, ncstreamcb streamer, struct ncvisual_options* vopts, void* curry) __attribute__ ((nonnull (1, 2)));
```
"""
function ncdirect_stream(n, filename, streamer, vopts, curry)
    @ccall libnotcurses_core.ncdirect_stream(n::Ptr{ncdirect}, filename::Ptr{Cchar}, streamer::Cint, vopts::Ptr{ncvisual_options}, curry::Ptr{Cvoid})::Cint
end

"""
    ncdirect_detected_terminal(n)

Capabilites
### Prototype
```c
ALLOC API char* ncdirect_detected_terminal(const struct ncdirect* n) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_detected_terminal(n)
    @ccall libnotcurses_core.ncdirect_detected_terminal(n::Ptr{ncdirect})::Ptr{Cchar}
end

"""
    ncdirect_canutf8(n)

Is our encoding UTF-8? Requires LANG being set to a UTF8 locale.
### Prototype
```c
API bool ncdirect_canutf8(const struct ncdirect* n) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_canutf8(n)
    @ccall libnotcurses_core.ncdirect_canutf8(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_check_pixel_support(n)

Can we blit pixel-accurate bitmaps?
### Prototype
```c
API int ncdirect_check_pixel_support(const struct ncdirect* n) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_check_pixel_support(n)
    @ccall libnotcurses_core.ncdirect_check_pixel_support(n::Ptr{ncdirect})::Cint
end

"""
    ncdirect_canget_cursor(nc)

Is there support for acquiring the cursor's current position? Requires the
u7 terminfo capability, and that we are connected to an actual terminal.
### Prototype
```c
API bool ncdirect_canget_cursor(const struct ncdirect* nc) __attribute__ ((nonnull (1)));
```
"""
function ncdirect_canget_cursor(nc)
    @ccall libnotcurses_core.ncdirect_canget_cursor(nc::Ptr{ncdirect})::Cint
end

"""
    ncstrwidth(egcs, validbytes, validwidth)

Returns the number of columns occupied by the longest valid prefix of a
multibyte (UTF-8) string. If an invalid character is encountered, -1 will be
returned, and the number of valid bytes and columns will be written into
*|validbytes| and *|validwidth| (assuming them non-NULL). If the entire
string is valid, *|validbytes| and *|validwidth| reflect the entire string.
### Prototype
```c
API int ncstrwidth(const char* egcs, int* validbytes, int* validwidth) __attribute__ ((nonnull (1)));
```
"""
function ncstrwidth(egcs, validbytes, validwidth)
    @ccall libnotcurses_core.ncstrwidth(egcs::Ptr{Cchar}, validbytes::Ptr{Cint}, validwidth::Ptr{Cint})::Cint
end

"""
    notcurses_version()

Get a human-readable string describing the running Notcurses version.
### Prototype
```c
API const char* notcurses_version(void);
```
"""
function notcurses_version()
    @ccall libnotcurses_core.notcurses_version()::Ptr{Cchar}
end

"""
    notcurses_version_components(major, minor, patch, tweak)

Cannot be inline, as we want to get the versions of the actual Notcurses
library we loaded, not what we compile against.
### Prototype
```c
API void notcurses_version_components(int* major, int* minor, int* patch, int* tweak);
```
"""
function notcurses_version_components(major, minor, patch, tweak)
    @ccall libnotcurses_core.notcurses_version_components(major::Ptr{Cint}, minor::Ptr{Cint}, patch::Ptr{Cint}, tweak::Ptr{Cint})::Cvoid
end

mutable struct notcurses end

mutable struct ncuplot end

mutable struct ncdplot end

mutable struct ncprogbar end

mutable struct ncfdplane end

mutable struct ncsubproc end

mutable struct ncselector end

mutable struct ncmultiselector end

mutable struct ncreader end

mutable struct ncfadectx end

mutable struct nctablet end

mutable struct ncreel end

mutable struct nctab end

mutable struct nctabbed end

"""
    ncalign_e

Alignment within a plane or terminal. Left/right-justified, or centered.
"""
@enum ncalign_e::UInt32 begin
    NCALIGN_UNALIGNED = 0
    NCALIGN_LEFT = 1
    NCALIGN_CENTER = 2
    NCALIGN_RIGHT = 3
end

"""
    notcurses_ucs32_to_utf8(ucs32, ucs32count, resultbuf, buflen)

input functions like notcurses_get() return ucs32-encoded uint32_t. convert
a series of uint32_t to utf8. result must be at least 4 bytes per input
uint32_t (6 bytes per uint32_t will future-proof against Unicode expansion).
the number of bytes used is returned, or -1 if passed illegal ucs32, or too
small of a buffer.
### Prototype
```c
API int notcurses_ucs32_to_utf8(const uint32_t* ucs32, unsigned ucs32count, unsigned char* resultbuf, size_t buflen) __attribute__ ((nonnull (1, 3)));
```
"""
function notcurses_ucs32_to_utf8(ucs32, ucs32count, resultbuf, buflen)
    @ccall libnotcurses_core.notcurses_ucs32_to_utf8(ucs32::Ptr{UInt32}, ucs32count::Cuint, resultbuf::Ptr{Cuchar}, buflen::Csize_t)::Cint
end

"""
    nccell

An nccell corresponds to a single character cell on some plane, which can be
occupied by a single grapheme cluster (some root spacing glyph, along with
possible combining characters, which might span multiple columns). At any
cell, we can have a theoretically arbitrarily long UTF-8 EGC, a foreground
color, a background color, and an attribute set. Valid grapheme cluster
contents include:

 * A NUL terminator,
 * A single control character, followed by a NUL terminator,
 * At most one spacing character, followed by zero or more nonspacing
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
struct nccell
    gcluster::UInt32
    gcluster_backstop::UInt8
    width::UInt8
    stylemask::UInt16
    channels::UInt64
end

"""
    nccell_load(n, c, gcluster)

Breaks the UTF-8 string in 'gcluster' down, setting up the nccell 'c'.
Returns the number of bytes copied out of 'gcluster', or -1 on failure. The
styling of the cell is left untouched, but any resources are released.
### Prototype
```c
API int nccell_load(struct ncplane* n, nccell* c, const char* gcluster);
```
"""
function nccell_load(n, c, gcluster)
    @ccall libnotcurses_core.nccell_load(n::Ptr{ncplane}, c::Ptr{nccell}, gcluster::Ptr{Cchar})::Cint
end

"""
    nccell_duplicate(n, targ, c)

Duplicate 'c' into 'targ'; both must be/will be bound to 'n'. Returns -1 on
failure, and 0 on success.
### Prototype
```c
API int nccell_duplicate(struct ncplane* n, nccell* targ, const nccell* c);
```
"""
function nccell_duplicate(n, targ, c)
    @ccall libnotcurses_core.nccell_duplicate(n::Ptr{ncplane}, targ::Ptr{nccell}, c::Ptr{nccell})::Cint
end

"""
    nccell_release(n, c)

Release resources held by the nccell 'c'.
### Prototype
```c
API void nccell_release(struct ncplane* n, nccell* c);
```
"""
function nccell_release(n, c)
    @ccall libnotcurses_core.nccell_release(n::Ptr{ncplane}, c::Ptr{nccell})::Cvoid
end

"""
    nccell_extended_gcluster(n, c)

return a pointer to the NUL-terminated EGC referenced by 'c'. this pointer
can be invalidated by any further operation on the plane 'n', so...watch out!
### Prototype
```c
API __attribute__ ((returns_nonnull)) const char* nccell_extended_gcluster(const struct ncplane* n, const nccell* c);
```
"""
function nccell_extended_gcluster(n, c)
    @ccall libnotcurses_core.nccell_extended_gcluster(n::Ptr{ncplane}, c::Ptr{nccell})::Ptr{Cchar}
end

"""
    ncloglevel_e

These log levels consciously map cleanly to those of libav; Notcurses itself
does not use this full granularity. The log level does not affect the opening
and closing banners, which can be disabled via the notcurses_option struct's
'suppress_banner'. Note that if stderr is connected to the same terminal on
which we're rendering, any kind of logging will disrupt the output (which is
undesirable). The "default" zero value is NCLOGLEVEL_PANIC.
"""
@enum ncloglevel_e::Int32 begin
    NCLOGLEVEL_SILENT = -1
    NCLOGLEVEL_PANIC = 0
    NCLOGLEVEL_FATAL = 1
    NCLOGLEVEL_ERROR = 2
    NCLOGLEVEL_WARNING = 3
    NCLOGLEVEL_INFO = 4
    NCLOGLEVEL_VERBOSE = 5
    NCLOGLEVEL_DEBUG = 6
    NCLOGLEVEL_TRACE = 7
end

"""
    notcurses_options

Configuration for notcurses_init().
"""
struct notcurses_options
    termtype::Ptr{Cchar}
    loglevel::ncloglevel_e
    margin_t::Cuint
    margin_r::Cuint
    margin_b::Cuint
    margin_l::Cuint
    flags::UInt64
end

"""
    notcurses_lex_margins(op, opts)

Lex a margin argument according to the standard Notcurses definition. There
can be either a single number, which will define all margins equally, or
there can be four numbers separated by commas.
### Prototype
```c
API int notcurses_lex_margins(const char* op, notcurses_options* opts) __attribute__ ((nonnull (1)));
```
"""
function notcurses_lex_margins(op, opts)
    @ccall libnotcurses_core.notcurses_lex_margins(op::Ptr{Cchar}, opts::Ptr{notcurses_options})::Cint
end

"""
    notcurses_lex_blitter(op, blitter)

Lex a blitter.
### Prototype
```c
API int notcurses_lex_blitter(const char* op, ncblitter_e* blitter) __attribute__ ((nonnull (1)));
```
"""
function notcurses_lex_blitter(op, blitter)
    @ccall libnotcurses_core.notcurses_lex_blitter(op::Ptr{Cchar}, blitter::Ptr{ncblitter_e})::Cint
end

"""
    notcurses_str_blitter(blitter)

Get the name of a blitter.
### Prototype
```c
API const char* notcurses_str_blitter(ncblitter_e blitter);
```
"""
function notcurses_str_blitter(blitter)
    @ccall libnotcurses_core.notcurses_str_blitter(blitter::ncblitter_e)::Ptr{Cchar}
end

"""
    notcurses_lex_scalemode(op, scalemode)

Lex a scaling mode (one of "none", "stretch", "scale", "hires",
"scalehi", or "inflate").
### Prototype
```c
API int notcurses_lex_scalemode(const char* op, ncscale_e* scalemode) __attribute__ ((nonnull (1)));
```
"""
function notcurses_lex_scalemode(op, scalemode)
    @ccall libnotcurses_core.notcurses_lex_scalemode(op::Ptr{Cchar}, scalemode::Ptr{ncscale_e})::Cint
end

"""
    notcurses_str_scalemode(scalemode)

Get the name of a scaling mode.
### Prototype
```c
API const char* notcurses_str_scalemode(ncscale_e scalemode);
```
"""
function notcurses_str_scalemode(scalemode)
    @ccall libnotcurses_core.notcurses_str_scalemode(scalemode::ncscale_e)::Ptr{Cchar}
end

"""
    notcurses_core_init(opts, fp)

The same as notcurses_init(), but without any multimedia functionality,
allowing for a svelter binary. Link with notcurses-core if this is used.
### Prototype
```c
API ALLOC struct notcurses* notcurses_core_init(const notcurses_options* opts, FILE* fp);
```
"""
function notcurses_core_init(opts, fp)
    @ccall libnotcurses_core.notcurses_core_init(opts::Ptr{notcurses_options}, fp::Ptr{Libc.FILE})::Ptr{notcurses}
end

"""
    notcurses_stop(nc)

Destroy a Notcurses context. A NULL 'nc' is a no-op.
### Prototype
```c
API int notcurses_stop(struct notcurses* nc);
```
"""
function notcurses_stop(nc)
    @ccall libnotcurses_core.notcurses_stop(nc::Ptr{notcurses})::Cint
end

"""
    notcurses_enter_alternate_screen(nc)

Shift to the alternate screen, if available. If already using the alternate
screen, this returns 0 immediately. If the alternate screen is not
available, this returns -1 immediately. Entering the alternate screen turns
off scrolling for the standard plane.
### Prototype
```c
API int notcurses_enter_alternate_screen(struct notcurses* nc) __attribute__ ((nonnull (1)));
```
"""
function notcurses_enter_alternate_screen(nc)
    @ccall libnotcurses_core.notcurses_enter_alternate_screen(nc::Ptr{notcurses})::Cint
end

"""
    notcurses_leave_alternate_screen(nc)

Exit the alternate screen. Immediately returns 0 if not currently using the
alternate screen.
### Prototype
```c
API int notcurses_leave_alternate_screen(struct notcurses* nc) __attribute__ ((nonnull (1)));
```
"""
function notcurses_leave_alternate_screen(nc)
    @ccall libnotcurses_core.notcurses_leave_alternate_screen(nc::Ptr{notcurses})::Cint
end

"""
    notcurses_stdplane(nc)

Get a reference to the standard plane (one matching our current idea of the
terminal size) for this terminal. The standard plane always exists, and its
origin is always at the uppermost, leftmost cell of the terminal.
### Prototype
```c
API struct ncplane* notcurses_stdplane(struct notcurses* nc) __attribute__ ((nonnull (1)));
```
"""
function notcurses_stdplane(nc)
    @ccall libnotcurses_core.notcurses_stdplane(nc::Ptr{notcurses})::Ptr{ncplane}
end

"""
    notcurses_stdplane_const(nc)


### Prototype
```c
API const struct ncplane* notcurses_stdplane_const(const struct notcurses* nc) __attribute__ ((nonnull (1)));
```
"""
function notcurses_stdplane_const(nc)
    @ccall libnotcurses_core.notcurses_stdplane_const(nc::Ptr{notcurses})::Ptr{ncplane}
end

"""
    ncpile_top(n)

Return the topmost plane of the pile containing 'n'.
### Prototype
```c
API struct ncplane* ncpile_top(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncpile_top(n)
    @ccall libnotcurses_core.ncpile_top(n::Ptr{ncplane})::Ptr{ncplane}
end

"""
    ncpile_bottom(n)

Return the bottommost plane of the pile containing 'n'.
### Prototype
```c
API struct ncplane* ncpile_bottom(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncpile_bottom(n)
    @ccall libnotcurses_core.ncpile_bottom(n::Ptr{ncplane})::Ptr{ncplane}
end

"""
    ncpile_render(n)

Renders the pile of which 'n' is a part. Rendering this pile again will blow
away the render. To actually write out the render, call ncpile_rasterize().
### Prototype
```c
API int ncpile_render(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncpile_render(n)
    @ccall libnotcurses_core.ncpile_render(n::Ptr{ncplane})::Cint
end

"""
    ncpile_rasterize(n)

Make the physical screen match the last rendered frame from the pile of
which 'n' is a part. This is a blocking call. Don't call this before the
pile has been rendered (doing so will likely result in a blank screen).
### Prototype
```c
API int ncpile_rasterize(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncpile_rasterize(n)
    @ccall libnotcurses_core.ncpile_rasterize(n::Ptr{ncplane})::Cint
end

"""
    ncpile_render_to_buffer(p, buf, buflen)

Perform the rendering and rasterization portion of ncpile_render() and
ncpile_rasterize(), but do not write the resulting buffer out to the
terminal. Using this function, the user can control the writeout process.
The returned buffer must be freed by the caller.
### Prototype
```c
API int ncpile_render_to_buffer(struct ncplane* p, char** buf, size_t* buflen) __attribute__ ((nonnull (1, 2, 3)));
```
"""
function ncpile_render_to_buffer(p, buf, buflen)
    @ccall libnotcurses_core.ncpile_render_to_buffer(p::Ptr{ncplane}, buf::Ptr{Ptr{Cchar}}, buflen::Ptr{Csize_t})::Cint
end

"""
    ncpile_render_to_file(p, fp)

Write the last rendered frame, in its entirety, to 'fp'. If a frame has
not yet been rendered, nothing will be written.
### Prototype
```c
API int ncpile_render_to_file(struct ncplane* p, FILE* fp) __attribute__ ((nonnull (1, 2)));
```
"""
function ncpile_render_to_file(p, fp)
    @ccall libnotcurses_core.ncpile_render_to_file(p::Ptr{ncplane}, fp::Ptr{Libc.FILE})::Cint
end

"""
    notcurses_drop_planes(nc)

Destroy all ncplanes other than the stdplane.
### Prototype
```c
API void notcurses_drop_planes(struct notcurses* nc) __attribute__ ((nonnull (1)));
```
"""
function notcurses_drop_planes(nc)
    @ccall libnotcurses_core.notcurses_drop_planes(nc::Ptr{notcurses})::Cvoid
end

@enum ncintype_e::UInt32 begin
    NCTYPE_UNKNOWN = 0
    NCTYPE_PRESS = 1
    NCTYPE_REPEAT = 2
    NCTYPE_RELEASE = 3
end

"""
    ncinput

An input event. Cell coordinates are currently defined only for mouse
events. It is not guaranteed that we can set the modifiers for a given
ncinput. We encompass single Unicode codepoints, not complete EGCs.
FIXME for abi4, combine the bools into |modifiers|
"""
struct ncinput
    id::UInt32
    y::Cint
    x::Cint
    utf8::NTuple{5, Cchar}
    alt::Bool
    shift::Bool
    ctrl::Bool
    evtype::ncintype_e
    modifiers::Cuint
    ypx::Cint
    xpx::Cint
    eff_text::NTuple{4, UInt32}
end

"""
    notcurses_get(n, ts, ni)

Read a UTF-32-encoded Unicode codepoint from input. This might only be part
of a larger EGC. Provide a NULL 'ts' to block at length, and otherwise a
timespec specifying an absolute deadline calculated using CLOCK_MONOTONIC.
Returns a single Unicode code point, or a synthesized special key constant,
or (uint32_t)-1 on error. Returns 0 on a timeout. If an event is processed,
the return value is the 'id' field from that event. 'ni' may be NULL.
### Prototype
```c
API uint32_t notcurses_get(struct notcurses* n, const struct timespec* ts, ncinput* ni) __attribute__ ((nonnull (1)));
```
"""
function notcurses_get(n, ts, ni)
    @ccall libnotcurses_core.notcurses_get(n::Ptr{notcurses}, ts::Ptr{Cvoid}, ni::Ptr{ncinput})::UInt32
end

"""
    notcurses_getvec(n, ts, ni, vcount)

Acquire up to 'vcount' ncinputs at the vector 'ni'. The number read will be
returned, or -1 on error without any reads, 0 on timeout.
### Prototype
```c
API int notcurses_getvec(struct notcurses* n, const struct timespec* ts, ncinput* ni, int vcount) __attribute__ ((nonnull (1, 3)));
```
"""
function notcurses_getvec(n, ts, ni, vcount)
    @ccall libnotcurses_core.notcurses_getvec(n::Ptr{notcurses}, ts::Ptr{Cvoid}, ni::Ptr{ncinput}, vcount::Cint)::Cint
end

"""
    notcurses_inputready_fd(n)

Get a file descriptor suitable for input event poll()ing. When this
descriptor becomes available, you can call notcurses_get_nblock(),
and input ought be ready. This file descriptor is *not* necessarily
the file descriptor associated with stdin (but it might be!).
### Prototype
```c
API int notcurses_inputready_fd(struct notcurses* n) __attribute__ ((nonnull (1)));
```
"""
function notcurses_inputready_fd(n)
    @ccall libnotcurses_core.notcurses_inputready_fd(n::Ptr{notcurses})::Cint
end

"""
    notcurses_mice_enable(n, eventmask)

Enable mice events according to 'eventmask'; an eventmask of 0 will disable
all mice tracking. On failure, -1 is returned. On success, 0 is returned, and
mouse events will be published to notcurses_get().
### Prototype
```c
API int notcurses_mice_enable(struct notcurses* n, unsigned eventmask) __attribute__ ((nonnull (1)));
```
"""
function notcurses_mice_enable(n, eventmask)
    @ccall libnotcurses_core.notcurses_mice_enable(n::Ptr{notcurses}, eventmask::Cuint)::Cint
end

"""
    notcurses_linesigs_disable(n)

Disable signals originating from the terminal's line discipline, i.e.
SIGINT (^C), SIGQUIT (^\\), and SIGTSTP (^Z). They are enabled by default.
### Prototype
```c
API int notcurses_linesigs_disable(struct notcurses* n) __attribute__ ((nonnull (1)));
```
"""
function notcurses_linesigs_disable(n)
    @ccall libnotcurses_core.notcurses_linesigs_disable(n::Ptr{notcurses})::Cint
end

"""
    notcurses_linesigs_enable(n)

Restore signals originating from the terminal's line discipline, i.e.
SIGINT (^C), SIGQUIT (^\\), and SIGTSTP (^Z), if disabled.
### Prototype
```c
API int notcurses_linesigs_enable(struct notcurses* n) __attribute__ ((nonnull (1)));
```
"""
function notcurses_linesigs_enable(n)
    @ccall libnotcurses_core.notcurses_linesigs_enable(n::Ptr{notcurses})::Cint
end

"""
    notcurses_refresh(n, y, x)

Refresh the physical screen to match what was last rendered (i.e., without
reflecting any changes since the last call to notcurses_render()). This is
primarily useful if the screen is externally corrupted, or if an
NCKEY_RESIZE event has been read and you're not yet ready to render. The
current screen geometry is returned in 'y' and 'x', if they are not NULL.
### Prototype
```c
API int notcurses_refresh(struct notcurses* n, unsigned* RESTRICT y, unsigned* RESTRICT x) __attribute__ ((nonnull (1)));
```
"""
function notcurses_refresh(n, y, x)
    @ccall libnotcurses_core.notcurses_refresh(n::Ptr{notcurses}, y::Ptr{Cuint}, x::Ptr{Cuint})::Cint
end

"""
    ncplane_notcurses(n)

Extract the Notcurses context to which this plane is attached.
### Prototype
```c
API struct notcurses* ncplane_notcurses(const struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_notcurses(n)
    @ccall libnotcurses_core.ncplane_notcurses(n::Ptr{ncplane})::Ptr{notcurses}
end

"""
    ncplane_notcurses_const(n)


### Prototype
```c
API const struct notcurses* ncplane_notcurses_const(const struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_notcurses_const(n)
    @ccall libnotcurses_core.ncplane_notcurses_const(n::Ptr{ncplane})::Ptr{notcurses}
end

"""
    ncplane_dim_yx(n, y, x)

Return the dimensions of this ncplane. y or x may be NULL.
### Prototype
```c
API void ncplane_dim_yx(const struct ncplane* n, unsigned* RESTRICT y, unsigned* RESTRICT x) __attribute__ ((nonnull (1)));
```
"""
function ncplane_dim_yx(n, y, x)
    @ccall libnotcurses_core.ncplane_dim_yx(n::Ptr{ncplane}, y::Ptr{Cuint}, x::Ptr{Cuint})::Cvoid
end

"""
    ncplane_pixel_geom(n, pxy, pxx, celldimy, celldimx, maxbmapy, maxbmapx)

Retrieve pixel geometry for the display region ('pxy', 'pxx'), each cell
('celldimy', 'celldimx'), and the maximum displayable bitmap ('maxbmapy',
'maxbmapx'). If bitmaps are not supported, or if there is no artificial
limit on bitmap size, 'maxbmapy' and 'maxbmapx' will be 0. Any of the
geometry arguments may be NULL.
### Prototype
```c
API void ncplane_pixel_geom(const struct ncplane* n, unsigned* RESTRICT pxy, unsigned* RESTRICT pxx, unsigned* RESTRICT celldimy, unsigned* RESTRICT celldimx, unsigned* RESTRICT maxbmapy, unsigned* RESTRICT maxbmapx) __attribute__ ((nonnull (1)));
```
"""
function ncplane_pixel_geom(n, pxy, pxx, celldimy, celldimx, maxbmapy, maxbmapx)
    @ccall libnotcurses_core.ncplane_pixel_geom(n::Ptr{ncplane}, pxy::Ptr{Cuint}, pxx::Ptr{Cuint}, celldimy::Ptr{Cuint}, celldimx::Ptr{Cuint}, maxbmapy::Ptr{Cuint}, maxbmapx::Ptr{Cuint})::Cvoid
end

"""
    notcurses_at_yx(nc, yoff, xoff, stylemask, channels)

Retrieve the contents of the specified cell as last rendered. Returns the EGC
or NULL on error. This EGC must be free()d by the caller. The stylemask and
channels are written to 'stylemask' and 'channels', respectively.
### Prototype
```c
API char* notcurses_at_yx(struct notcurses* nc, unsigned yoff, unsigned xoff, uint16_t* stylemask, uint64_t* channels) __attribute__ ((nonnull (1)));
```
"""
function notcurses_at_yx(nc, yoff, xoff, stylemask, channels)
    @ccall libnotcurses_core.notcurses_at_yx(nc::Ptr{notcurses}, yoff::Cuint, xoff::Cuint, stylemask::Ptr{UInt16}, channels::Ptr{UInt64})::Ptr{Cchar}
end

struct ncplane_options
    y::Cint
    x::Cint
    rows::Cuint
    cols::Cuint
    userptr::Ptr{Cvoid}
    name::Ptr{Cchar}
    resizecb::Ptr{Cvoid}
    flags::UInt64
    margin_b::Cuint
    margin_r::Cuint
end

"""
    ncplane_create(n, nopts)

Create a new ncplane bound to plane 'n', at the offset 'y'x'x' (relative to
the origin of 'n') and the specified size. The number of 'rows' and 'cols'
must both be positive. This plane is initially at the top of the z-buffer,
as if ncplane_move_top() had been called on it. The void* 'userptr' can be
retrieved (and reset) later. A 'name' can be set, used in debugging.
### Prototype
```c
API ALLOC struct ncplane* ncplane_create(struct ncplane* n, const ncplane_options* nopts) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_create(n, nopts)
    @ccall libnotcurses_core.ncplane_create(n::Ptr{ncplane}, nopts::Ptr{ncplane_options})::Ptr{ncplane}
end

"""
    ncpile_create(nc, nopts)

Same as ncplane_create(), but creates a new pile. The returned plane will
be the top, bottom, and root of this new pile.
### Prototype
```c
API ALLOC struct ncplane* ncpile_create(struct notcurses* nc, const ncplane_options* nopts) __attribute__ ((nonnull (1, 2)));
```
"""
function ncpile_create(nc, nopts)
    @ccall libnotcurses_core.ncpile_create(nc::Ptr{notcurses}, nopts::Ptr{ncplane_options})::Ptr{ncplane}
end

"""
    ncplane_resize_maximize(n)

resize the plane to the visual region's size (used for the standard plane).
### Prototype
```c
API int ncplane_resize_maximize(struct ncplane* n);
```
"""
function ncplane_resize_maximize(n)
    @ccall libnotcurses_core.ncplane_resize_maximize(n::Ptr{ncplane})::Cint
end

"""
    ncplane_resize_marginalized(n)

resize the plane to its parent's size, attempting to enforce the margins
supplied along with NCPLANE_OPTION_MARGINALIZED.
### Prototype
```c
API int ncplane_resize_marginalized(struct ncplane* n);
```
"""
function ncplane_resize_marginalized(n)
    @ccall libnotcurses_core.ncplane_resize_marginalized(n::Ptr{ncplane})::Cint
end

"""
    ncplane_resize_realign(n)

realign the plane 'n' against its parent, using the alignments specified
with NCPLANE_OPTION_HORALIGNED and/or NCPLANE_OPTION_VERALIGNED.
### Prototype
```c
API int ncplane_resize_realign(struct ncplane* n);
```
"""
function ncplane_resize_realign(n)
    @ccall libnotcurses_core.ncplane_resize_realign(n::Ptr{ncplane})::Cint
end

"""
    ncplane_resize_placewithin(n)

move the plane such that it is entirely within its parent, if possible.
no resizing is performed.
### Prototype
```c
API int ncplane_resize_placewithin(struct ncplane* n);
```
"""
function ncplane_resize_placewithin(n)
    @ccall libnotcurses_core.ncplane_resize_placewithin(n::Ptr{ncplane})::Cint
end

"""
    ncplane_set_resizecb(n, resizecb)

Replace the ncplane's existing resizecb with 'resizecb' (which may be NULL).
The standard plane's resizecb may not be changed.
### Prototype
```c
API void ncplane_set_resizecb(struct ncplane* n, int(*resizecb)(struct ncplane*));
```
"""
function ncplane_set_resizecb(n, resizecb)
    @ccall libnotcurses_core.ncplane_set_resizecb(n::Ptr{ncplane}, resizecb::Ptr{Cvoid})::Cvoid
end

"""
    ncplane_resizecb(n)

Returns the ncplane's current resize callback.
### Prototype
```c
API int (*ncplane_resizecb(const struct ncplane* n))(struct ncplane*);
```
"""
function ncplane_resizecb(n)
    @ccall libnotcurses_core.ncplane_resizecb(n::Ptr{ncplane})::Ptr{Cvoid}
end

"""
    ncplane_set_name(n, name)

Set the plane's name (may be NULL), replacing any current name.
### Prototype
```c
API int ncplane_set_name(struct ncplane* n, const char* name) __attribute__ ((nonnull (1)));
```
"""
function ncplane_set_name(n, name)
    @ccall libnotcurses_core.ncplane_set_name(n::Ptr{ncplane}, name::Ptr{Cchar})::Cint
end

"""
    ncplane_name(n)

Return a heap-allocated copy of the plane's name, or NULL if it has none.
### Prototype
```c
API ALLOC char* ncplane_name(const struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_name(n)
    @ccall libnotcurses_core.ncplane_name(n::Ptr{ncplane})::Ptr{Cchar}
end

"""
    ncplane_reparent(n, newparent)

Plane 'n' will be unbound from its parent plane, and will be made a bound
child of 'newparent'. It is an error if 'n' or 'newparent' are NULL. If
'newparent' is equal to 'n', 'n' becomes the root of a new pile, unless 'n'
is already the root of a pile, in which case this is a no-op. Returns 'n'.
The standard plane cannot be reparented. Any planes bound to 'n' are
reparented to the previous parent of 'n'.
### Prototype
```c
API struct ncplane* ncplane_reparent(struct ncplane* n, struct ncplane* newparent) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_reparent(n, newparent)
    @ccall libnotcurses_core.ncplane_reparent(n::Ptr{ncplane}, newparent::Ptr{ncplane})::Ptr{ncplane}
end

"""
    ncplane_reparent_family(n, newparent)

The same as ncplane_reparent(), except any planes bound to 'n' come along
with it to its new destination. Their z-order is maintained. If 'newparent'
is an ancestor of 'n', NULL is returned, and no changes are made.
### Prototype
```c
API struct ncplane* ncplane_reparent_family(struct ncplane* n, struct ncplane* newparent) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_reparent_family(n, newparent)
    @ccall libnotcurses_core.ncplane_reparent_family(n::Ptr{ncplane}, newparent::Ptr{ncplane})::Ptr{ncplane}
end

"""
    ncplane_dup(n, opaque)

Duplicate an existing ncplane. The new plane will have the same geometry,
will duplicate all content, and will start with the same rendering state.
The new plane will be immediately above the old one on the z axis, and will
be bound to the same parent (unless 'n' is a root plane, in which case the
new plane will be bound to it). Bound planes are *not* duplicated; the new
plane is bound to the parent of 'n', but has no bound planes.
### Prototype
```c
API ALLOC struct ncplane* ncplane_dup(const struct ncplane* n, void* opaque) __attribute__ ((nonnull (1)));
```
"""
function ncplane_dup(n, opaque)
    @ccall libnotcurses_core.ncplane_dup(n::Ptr{ncplane}, opaque::Ptr{Cvoid})::Ptr{ncplane}
end

"""
    ncplane_translate(src, dst, y, x)

provided a coordinate relative to the origin of 'src', map it to the same
absolute coordinate relative to the origin of 'dst'. either or both of 'y'
and 'x' may be NULL. if 'dst' is NULL, it is taken to be the standard plane.
### Prototype
```c
API void ncplane_translate(const struct ncplane* src, const struct ncplane* dst, int* RESTRICT y, int* RESTRICT x) __attribute__ ((nonnull (1)));
```
"""
function ncplane_translate(src, dst, y, x)
    @ccall libnotcurses_core.ncplane_translate(src::Ptr{ncplane}, dst::Ptr{ncplane}, y::Ptr{Cint}, x::Ptr{Cint})::Cvoid
end

"""
    ncplane_translate_abs(n, y, x)

Fed absolute 'y'/'x' coordinates, determine whether that coordinate is
within the ncplane 'n'. If not, return false. If so, return true. Either
way, translate the absolute coordinates relative to 'n'. If the point is not
within 'n', these coordinates will not be within the dimensions of the plane.
### Prototype
```c
API bool ncplane_translate_abs(const struct ncplane* n, int* RESTRICT y, int* RESTRICT x) __attribute__ ((nonnull (1)));
```
"""
function ncplane_translate_abs(n, y, x)
    @ccall libnotcurses_core.ncplane_translate_abs(n::Ptr{ncplane}, y::Ptr{Cint}, x::Ptr{Cint})::Bool
end

"""
    ncplane_set_scrolling(n, scrollp)

All planes are created with scrolling disabled. Scrolling can be dynamically
controlled with ncplane_set_scrolling(). Returns true if scrolling was
previously enabled, or false if it was disabled.
### Prototype
```c
API bool ncplane_set_scrolling(struct ncplane* n, unsigned scrollp) __attribute__ ((nonnull (1)));
```
"""
function ncplane_set_scrolling(n, scrollp)
    @ccall libnotcurses_core.ncplane_set_scrolling(n::Ptr{ncplane}, scrollp::Cuint)::Bool
end

"""
    ncplane_scrolling_p(n)


### Prototype
```c
API bool ncplane_scrolling_p(const struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_scrolling_p(n)
    @ccall libnotcurses_core.ncplane_scrolling_p(n::Ptr{ncplane})::Bool
end

"""
    ncplane_set_autogrow(n, growp)

By default, planes are created with autogrow disabled. Autogrow can be
dynamically controlled with ncplane_set_autogrow(). Returns true if
autogrow was previously enabled, or false if it was disabled.
### Prototype
```c
API bool ncplane_set_autogrow(struct ncplane* n, unsigned growp) __attribute__ ((nonnull (1)));
```
"""
function ncplane_set_autogrow(n, growp)
    @ccall libnotcurses_core.ncplane_set_autogrow(n::Ptr{ncplane}, growp::Cuint)::Bool
end

"""
    ncplane_autogrow_p(n)


### Prototype
```c
API bool ncplane_autogrow_p(const struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_autogrow_p(n)
    @ccall libnotcurses_core.ncplane_autogrow_p(n::Ptr{ncplane})::Bool
end

"""
    ncpalette

Palette API. Some terminals only support 256 colors, but allow the full
palette to be specified with arbitrary RGB colors. In all cases, it's more
performant to use indexed colors, since it's much less data to write to the
terminal. If you can limit yourself to 256 colors, that's probably best.
"""
struct ncpalette
    chans::NTuple{256, UInt32}
end

"""
    ncpalette_new(nc)

Create a new palette store. It will be initialized with notcurses' best
knowledge of the currently configured palette.
### Prototype
```c
API ALLOC ncpalette* ncpalette_new(struct notcurses* nc) __attribute__ ((nonnull (1)));
```
"""
function ncpalette_new(nc)
    @ccall libnotcurses_core.ncpalette_new(nc::Ptr{notcurses})::Ptr{ncpalette}
end

"""
    ncpalette_use(nc, p)

Attempt to configure the terminal with the provided palette 'p'. Does not
transfer ownership of 'p'; ncpalette_free() can (ought) still be called.
### Prototype
```c
API int ncpalette_use(struct notcurses* nc, const ncpalette* p) __attribute__ ((nonnull (1, 2)));
```
"""
function ncpalette_use(nc, p)
    @ccall libnotcurses_core.ncpalette_use(nc::Ptr{notcurses}, p::Ptr{ncpalette})::Cint
end

"""
    ncpalette_free(p)

Free the palette store 'p'.
### Prototype
```c
API void ncpalette_free(ncpalette* p);
```
"""
function ncpalette_free(p)
    @ccall libnotcurses_core.ncpalette_free(p::Ptr{ncpalette})::Cvoid
end

"""
    nccapabilities

Capabilities, derived from terminfo, environment variables, and queries
"""
struct nccapabilities
    colors::Cuint
    utf8::Bool
    rgb::Bool
    can_change_colors::Bool
    halfblocks::Bool
    quadrants::Bool
    sextants::Bool
    octants::Bool
    braille::Bool
end

"""
    notcurses_supported_styles(nc)

Returns a 16-bit bitmask of supported curses-style attributes
(NCSTYLE_UNDERLINE, NCSTYLE_BOLD, etc.) The attribute is only
indicated as supported if the terminal can support it together with color.
For more information, see the "ncv" capability in terminfo(5).
### Prototype
```c
API uint16_t notcurses_supported_styles(const struct notcurses* nc) __attribute__ ((nonnull (1))) __attribute__ ((pure));
```
"""
function notcurses_supported_styles(nc)
    @ccall libnotcurses_core.notcurses_supported_styles(nc::Ptr{notcurses})::UInt16
end

"""
    notcurses_palette_size(nc)

Returns the number of simultaneous colors claimed to be supported, or 1 if
there is no color support. Note that several terminal emulators advertise
more colors than they actually support, downsampling internally.
### Prototype
```c
API unsigned notcurses_palette_size(const struct notcurses* nc) __attribute__ ((nonnull (1))) __attribute__ ((pure));
```
"""
function notcurses_palette_size(nc)
    @ccall libnotcurses_core.notcurses_palette_size(nc::Ptr{notcurses})::Cuint
end

"""
    notcurses_detected_terminal(nc)

Returns the name (and sometimes version) of the terminal, as Notcurses
has been best able to determine.
### Prototype
```c
ALLOC API char* notcurses_detected_terminal(const struct notcurses* nc) __attribute__ ((nonnull (1)));
```
"""
function notcurses_detected_terminal(nc)
    @ccall libnotcurses_core.notcurses_detected_terminal(nc::Ptr{notcurses})::Ptr{Cchar}
end

"""
    notcurses_capabilities(n)


### Prototype
```c
API const nccapabilities* notcurses_capabilities(const struct notcurses* n) __attribute__ ((nonnull (1)));
```
"""
function notcurses_capabilities(n)
    @ccall libnotcurses_core.notcurses_capabilities(n::Ptr{notcurses})::Ptr{nccapabilities}
end

"""
    ncpixelimpl_e

pixel blitting implementations. informative only; don't special-case
based off any of this information!
"""
@enum ncpixelimpl_e::UInt32 begin
    NCPIXEL_NONE = 0
    NCPIXEL_SIXEL = 1
    NCPIXEL_LINUXFB = 2
    NCPIXEL_ITERM2 = 3
    NCPIXEL_KITTY_STATIC = 4
    NCPIXEL_KITTY_ANIMATED = 5
    NCPIXEL_KITTY_SELFREF = 6
end

"""
    notcurses_check_pixel_support(nc)

Can we blit pixel-accurate bitmaps?
### Prototype
```c
API ncpixelimpl_e notcurses_check_pixel_support(const struct notcurses* nc) __attribute__ ((nonnull (1))) __attribute__ ((pure));
```
"""
function notcurses_check_pixel_support(nc)
    @ccall libnotcurses_core.notcurses_check_pixel_support(nc::Ptr{notcurses})::ncpixelimpl_e
end

"""
    notcurses_canopen_images(nc)

Can we load images? This requires being built against FFmpeg/OIIO.
### Prototype
```c
API bool notcurses_canopen_images(const struct notcurses* nc) __attribute__ ((pure));
```
"""
function notcurses_canopen_images(nc)
    @ccall libnotcurses_core.notcurses_canopen_images(nc::Ptr{notcurses})::Bool
end

"""
    notcurses_canopen_videos(nc)

Can we load videos? This requires being built against FFmpeg.
### Prototype
```c
API bool notcurses_canopen_videos(const struct notcurses* nc) __attribute__ ((pure));
```
"""
function notcurses_canopen_videos(nc)
    @ccall libnotcurses_core.notcurses_canopen_videos(nc::Ptr{notcurses})::Bool
end

"""
    ncstats

whenever a new field is added here, ensure we add the proper rule to
notcurses_stats_reset(), so that values are preserved in the stash stats.
"""
struct ncstats
    renders::UInt64
    writeouts::UInt64
    failed_renders::UInt64
    failed_writeouts::UInt64
    raster_bytes::UInt64
    raster_max_bytes::Int64
    raster_min_bytes::Int64
    render_ns::UInt64
    render_max_ns::Int64
    render_min_ns::Int64
    raster_ns::UInt64
    raster_max_ns::Int64
    raster_min_ns::Int64
    writeout_ns::UInt64
    writeout_max_ns::Int64
    writeout_min_ns::Int64
    cellelisions::UInt64
    cellemissions::UInt64
    fgelisions::UInt64
    fgemissions::UInt64
    bgelisions::UInt64
    bgemissions::UInt64
    defaultelisions::UInt64
    defaultemissions::UInt64
    refreshes::UInt64
    sprixelemissions::UInt64
    sprixelelisions::UInt64
    sprixelbytes::UInt64
    appsync_updates::UInt64
    input_errors::UInt64
    input_events::UInt64
    hpa_gratuitous::UInt64
    cell_geo_changes::UInt64
    pixel_geo_changes::UInt64
    fbbytes::UInt64
    planes::Cuint
end

"""
    notcurses_stats_alloc(nc)

Allocate an ncstats object. Use this rather than allocating your own, since
future versions of Notcurses might enlarge this structure.
### Prototype
```c
API ALLOC ncstats* notcurses_stats_alloc(const struct notcurses* nc __attribute__ ((unused))) __attribute__ ((nonnull (1)));
```
"""
function notcurses_stats_alloc(nc)
    @ccall libnotcurses_core.notcurses_stats_alloc(nc::Ptr{notcurses})::Ptr{ncstats}
end

"""
    notcurses_stats(nc, stats)

Acquire an atomic snapshot of the Notcurses object's stats.
### Prototype
```c
API void notcurses_stats(struct notcurses* nc, ncstats* stats) __attribute__ ((nonnull (1, 2)));
```
"""
function notcurses_stats(nc, stats)
    @ccall libnotcurses_core.notcurses_stats(nc::Ptr{notcurses}, stats::Ptr{ncstats})::Cvoid
end

"""
    notcurses_stats_reset(nc, stats)

Reset all cumulative stats (immediate ones, such as fbbytes, are not reset),
first copying them into |*stats| (if |stats| is not NULL).
### Prototype
```c
API void notcurses_stats_reset(struct notcurses* nc, ncstats* stats) __attribute__ ((nonnull (1)));
```
"""
function notcurses_stats_reset(nc, stats)
    @ccall libnotcurses_core.notcurses_stats_reset(nc::Ptr{notcurses}, stats::Ptr{ncstats})::Cvoid
end

"""
    ncplane_resize(n, keepy, keepx, keepleny, keeplenx, yoff, xoff, ylen, xlen)

Resize the specified ncplane. The four parameters 'keepy', 'keepx',
'keepleny', and 'keeplenx' define a subset of the ncplane to keep,
unchanged. This may be a region of size 0, though none of these four
parameters may be negative. 'keepx' and 'keepy' are relative to the ncplane.
They must specify a coordinate within the ncplane's totality. 'yoff' and
'xoff' are relative to 'keepy' and 'keepx', and place the upper-left corner
of the resized ncplane. Finally, 'ylen' and 'xlen' are the dimensions of the
ncplane after resizing. 'ylen' must be greater than or equal to 'keepleny',
and 'xlen' must be greater than or equal to 'keeplenx'. It is an error to
attempt to resize the standard plane. If either of 'keepleny' or 'keeplenx'
is non-zero, both must be non-zero.

Essentially, the kept material does not move. It serves to anchor the
resized plane. If there is no kept material, the plane can move freely.
### Prototype
```c
API int ncplane_resize(struct ncplane* n, int keepy, int keepx, unsigned keepleny, unsigned keeplenx, int yoff, int xoff, unsigned ylen, unsigned xlen);
```
"""
function ncplane_resize(n, keepy, keepx, keepleny, keeplenx, yoff, xoff, ylen, xlen)
    @ccall libnotcurses_core.ncplane_resize(n::Ptr{ncplane}, keepy::Cint, keepx::Cint, keepleny::Cuint, keeplenx::Cuint, yoff::Cint, xoff::Cint, ylen::Cuint, xlen::Cuint)::Cint
end

"""
    ncplane_destroy(n)

Destroy the specified ncplane. None of its contents will be visible after
the next call to notcurses_render(). It is an error to attempt to destroy
the standard plane.
### Prototype
```c
API int ncplane_destroy(struct ncplane* n);
```
"""
function ncplane_destroy(n)
    @ccall libnotcurses_core.ncplane_destroy(n::Ptr{ncplane})::Cint
end

"""
    ncplane_set_base_cell(n, c)

Set the ncplane's base nccell to 'c'. The base cell is used for purposes of
rendering anywhere that the ncplane's gcluster is 0. Note that the base cell
is not affected by ncplane_erase(). 'c' must not be a secondary cell from a
multicolumn EGC.
### Prototype
```c
API int ncplane_set_base_cell(struct ncplane* n, const nccell* c);
```
"""
function ncplane_set_base_cell(n, c)
    @ccall libnotcurses_core.ncplane_set_base_cell(n::Ptr{ncplane}, c::Ptr{nccell})::Cint
end

"""
    ncplane_set_base(n, egc, stylemask, channels)

Set the ncplane's base nccell. It will be used for purposes of rendering
anywhere that the ncplane's gcluster is 0. Note that the base cell is not
affected by ncplane_erase(). 'egc' must be an extended grapheme cluster.
Returns the number of bytes copied out of 'gcluster', or -1 on failure.
### Prototype
```c
API int ncplane_set_base(struct ncplane* n, const char* egc, uint16_t stylemask, uint64_t channels);
```
"""
function ncplane_set_base(n, egc, stylemask, channels)
    @ccall libnotcurses_core.ncplane_set_base(n::Ptr{ncplane}, egc::Ptr{Cchar}, stylemask::UInt16, channels::UInt64)::Cint
end

"""
    ncplane_base(n, c)

Extract the ncplane's base nccell into 'c'. The reference is invalidated if
'ncp' is destroyed.
### Prototype
```c
API int ncplane_base(struct ncplane* n, nccell* c);
```
"""
function ncplane_base(n, c)
    @ccall libnotcurses_core.ncplane_base(n::Ptr{ncplane}, c::Ptr{nccell})::Cint
end

"""
    ncplane_yx(n, y, x)

Get the origin of plane 'n' relative to its bound plane, or pile (if 'n' is
a root plane). To get absolute coordinates, use ncplane_abs_yx().
### Prototype
```c
API void ncplane_yx(const struct ncplane* n, int* RESTRICT y, int* RESTRICT x) __attribute__ ((nonnull (1)));
```
"""
function ncplane_yx(n, y, x)
    @ccall libnotcurses_core.ncplane_yx(n::Ptr{ncplane}, y::Ptr{Cint}, x::Ptr{Cint})::Cvoid
end

"""
    ncplane_y(n)


### Prototype
```c
API int ncplane_y(const struct ncplane* n) __attribute__ ((pure));
```
"""
function ncplane_y(n)
    @ccall libnotcurses_core.ncplane_y(n::Ptr{ncplane})::Cint
end

"""
    ncplane_x(n)


### Prototype
```c
API int ncplane_x(const struct ncplane* n) __attribute__ ((pure));
```
"""
function ncplane_x(n)
    @ccall libnotcurses_core.ncplane_x(n::Ptr{ncplane})::Cint
end

"""
    ncplane_move_yx(n, y, x)

Move this plane relative to the standard plane, or the plane to which it is
bound (if it is bound to a plane). It is an error to attempt to move the
standard plane.
### Prototype
```c
API int ncplane_move_yx(struct ncplane* n, int y, int x);
```
"""
function ncplane_move_yx(n, y, x)
    @ccall libnotcurses_core.ncplane_move_yx(n::Ptr{ncplane}, y::Cint, x::Cint)::Cint
end

"""
    ncplane_abs_yx(n, y, x)

Get the origin of plane 'n' relative to its pile. Either or both of 'x' and
'y' may be NULL.
### Prototype
```c
API void ncplane_abs_yx(const struct ncplane* n, int* RESTRICT y, int* RESTRICT x) __attribute__ ((nonnull (1)));
```
"""
function ncplane_abs_yx(n, y, x)
    @ccall libnotcurses_core.ncplane_abs_yx(n::Ptr{ncplane}, y::Ptr{Cint}, x::Ptr{Cint})::Cvoid
end

"""
    ncplane_abs_y(n)


### Prototype
```c
API int ncplane_abs_y(const struct ncplane* n) __attribute__ ((pure));
```
"""
function ncplane_abs_y(n)
    @ccall libnotcurses_core.ncplane_abs_y(n::Ptr{ncplane})::Cint
end

"""
    ncplane_abs_x(n)


### Prototype
```c
API int ncplane_abs_x(const struct ncplane* n) __attribute__ ((pure));
```
"""
function ncplane_abs_x(n)
    @ccall libnotcurses_core.ncplane_abs_x(n::Ptr{ncplane})::Cint
end

"""
    ncplane_parent(n)

Get the plane to which the plane 'n' is bound, if any.
### Prototype
```c
API struct ncplane* ncplane_parent(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_parent(n)
    @ccall libnotcurses_core.ncplane_parent(n::Ptr{ncplane})::Ptr{ncplane}
end

"""
    ncplane_parent_const(n)


### Prototype
```c
API const struct ncplane* ncplane_parent_const(const struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_parent_const(n)
    @ccall libnotcurses_core.ncplane_parent_const(n::Ptr{ncplane})::Ptr{ncplane}
end

"""
    ncplane_move_above(n, above)

Splice ncplane 'n' out of the z-buffer, and reinsert it above 'above'.
Returns non-zero if 'n' is already in the desired location. 'n' and
'above' must not be the same plane. If 'above' is NULL, 'n' is moved
to the bottom of its pile.
### Prototype
```c
API int ncplane_move_above(struct ncplane* RESTRICT n, struct ncplane* RESTRICT above) __attribute__ ((nonnull (1)));
```
"""
function ncplane_move_above(n, above)
    @ccall libnotcurses_core.ncplane_move_above(n::Ptr{ncplane}, above::Ptr{ncplane})::Cint
end

"""
    ncplane_move_below(n, below)

Splice ncplane 'n' out of the z-buffer, and reinsert it below 'below'.
Returns non-zero if 'n' is already in the desired location. 'n' and
'below' must not be the same plane. If 'below' is NULL, 'n' is moved to
the top of its pile.
### Prototype
```c
API int ncplane_move_below(struct ncplane* RESTRICT n, struct ncplane* RESTRICT below) __attribute__ ((nonnull (1)));
```
"""
function ncplane_move_below(n, below)
    @ccall libnotcurses_core.ncplane_move_below(n::Ptr{ncplane}, below::Ptr{ncplane})::Cint
end

"""
    ncplane_move_family_above(n, targ)

Splice ncplane 'n' and its bound planes out of the z-buffer, and reinsert
them above or below 'targ'. Relative order will be maintained between the
reinserted planes. For a plane E bound to C, with z-ordering A B C D E,
moving the C family to the top results in C E A B D, while moving it to
the bottom results in A B D C E.
### Prototype
```c
API int ncplane_move_family_above(struct ncplane* n, struct ncplane* targ) __attribute__ ((nonnull (1)));
```
"""
function ncplane_move_family_above(n, targ)
    @ccall libnotcurses_core.ncplane_move_family_above(n::Ptr{ncplane}, targ::Ptr{ncplane})::Cint
end

"""
    ncplane_move_family_below(n, targ)


### Prototype
```c
API int ncplane_move_family_below(struct ncplane* n, struct ncplane* targ) __attribute__ ((nonnull (1)));
```
"""
function ncplane_move_family_below(n, targ)
    @ccall libnotcurses_core.ncplane_move_family_below(n::Ptr{ncplane}, targ::Ptr{ncplane})::Cint
end

"""
    ncplane_below(n)

Return the plane below this one, or NULL if this is at the bottom.
### Prototype
```c
API struct ncplane* ncplane_below(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_below(n)
    @ccall libnotcurses_core.ncplane_below(n::Ptr{ncplane})::Ptr{ncplane}
end

"""
    ncplane_above(n)

Return the plane above this one, or NULL if this is at the top.
### Prototype
```c
API struct ncplane* ncplane_above(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_above(n)
    @ccall libnotcurses_core.ncplane_above(n::Ptr{ncplane})::Ptr{ncplane}
end

"""
    ncplane_scrollup(n, r)

Effect |r| scroll events on the plane |n|. Returns an error if |n| is not
a scrolling plane, and otherwise returns the number of lines scrolled.
### Prototype
```c
API int ncplane_scrollup(struct ncplane* n, int r) __attribute__ ((nonnull (1)));
```
"""
function ncplane_scrollup(n, r)
    @ccall libnotcurses_core.ncplane_scrollup(n::Ptr{ncplane}, r::Cint)::Cint
end

"""
    ncplane_scrollup_child(n, child)

Scroll |n| up until |child| is no longer hidden beneath it. Returns an
error if |child| is not a child of |n|, or |n| is not scrolling, or |child|
is fixed. Returns the number of scrolling events otherwise (might be 0).
If the child plane is not fixed, it will likely scroll as well.
### Prototype
```c
API int ncplane_scrollup_child(struct ncplane* n, const struct ncplane* child) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_scrollup_child(n, child)
    @ccall libnotcurses_core.ncplane_scrollup_child(n::Ptr{ncplane}, child::Ptr{ncplane})::Cint
end

"""
    ncplane_rotate_cw(n)

Rotate the plane π/2 radians clockwise or counterclockwise. This cannot
be performed on arbitrary planes, because glyphs cannot be arbitrarily
rotated. The glyphs which can be rotated are limited: line-drawing
characters, spaces, half blocks, and full blocks. The plane must have
an even number of columns. Use the ncvisual rotation for a more
flexible approach.
### Prototype
```c
API int ncplane_rotate_cw(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_rotate_cw(n)
    @ccall libnotcurses_core.ncplane_rotate_cw(n::Ptr{ncplane})::Cint
end

"""
    ncplane_rotate_ccw(n)


### Prototype
```c
API int ncplane_rotate_ccw(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_rotate_ccw(n)
    @ccall libnotcurses_core.ncplane_rotate_ccw(n::Ptr{ncplane})::Cint
end

"""
    ncplane_at_cursor(n, stylemask, channels)

Retrieve the current contents of the cell under the cursor. The EGC is
returned, or NULL on error. This EGC must be free()d by the caller. The
stylemask and channels are written to 'stylemask' and 'channels', respectively.
### Prototype
```c
API char* ncplane_at_cursor(const struct ncplane* n, uint16_t* stylemask, uint64_t* channels) __attribute__ ((nonnull (1)));
```
"""
function ncplane_at_cursor(n, stylemask, channels)
    @ccall libnotcurses_core.ncplane_at_cursor(n::Ptr{ncplane}, stylemask::Ptr{UInt16}, channels::Ptr{UInt64})::Ptr{Cchar}
end

"""
    ncplane_at_cursor_cell(n, c)

Retrieve the current contents of the cell under the cursor into 'c'. This
cell is invalidated if the associated plane is destroyed. Returns the number
of bytes in the EGC, or -1 on error.
### Prototype
```c
API int ncplane_at_cursor_cell(struct ncplane* n, nccell* c) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_at_cursor_cell(n, c)
    @ccall libnotcurses_core.ncplane_at_cursor_cell(n::Ptr{ncplane}, c::Ptr{nccell})::Cint
end

"""
    ncplane_at_yx(n, y, x, stylemask, channels)

Retrieve the current contents of the specified cell. The EGC is returned, or
NULL on error. This EGC must be free()d by the caller. The stylemask and
channels are written to 'stylemask' and 'channels', respectively. The return
represents how the cell will be used during rendering, and thus integrates
any base cell where appropriate. If called upon the secondary columns of a
wide glyph, the EGC will be returned (i.e. this function does not distinguish
between the primary and secondary columns of a wide glyph). If called on a
sprixel plane, its control sequence is returned for all valid locations.
### Prototype
```c
API char* ncplane_at_yx(const struct ncplane* n, int y, int x, uint16_t* stylemask, uint64_t* channels) __attribute__ ((nonnull (1)));
```
"""
function ncplane_at_yx(n, y, x, stylemask, channels)
    @ccall libnotcurses_core.ncplane_at_yx(n::Ptr{ncplane}, y::Cint, x::Cint, stylemask::Ptr{UInt16}, channels::Ptr{UInt64})::Ptr{Cchar}
end

"""
    ncplane_at_yx_cell(n, y, x, c)

Retrieve the current contents of the specified cell into 'c'. This cell is
invalidated if the associated plane is destroyed. Returns the number of
bytes in the EGC, or -1 on error. Unlike ncplane_at_yx(), when called upon
the secondary columns of a wide glyph, the return can be distinguished from
the primary column (nccell_wide_right_p(c) will return true). It is an
error to call this on a sprixel plane (unlike ncplane_at_yx()).
### Prototype
```c
API int ncplane_at_yx_cell(struct ncplane* n, int y, int x, nccell* c) __attribute__ ((nonnull (1, 4)));
```
"""
function ncplane_at_yx_cell(n, y, x, c)
    @ccall libnotcurses_core.ncplane_at_yx_cell(n::Ptr{ncplane}, y::Cint, x::Cint, c::Ptr{nccell})::Cint
end

"""
    ncplane_contents(n, begy, begx, leny, lenx)

Create a flat string from the EGCs of the selected region of the ncplane
'n'. Start at the plane's 'begy'x'begx' coordinate (which must lie on the
plane), continuing for 'leny'x'lenx' cells. Either or both of 'leny' and
'lenx' can be specified as 0 to go through the boundary of the plane.
-1 can be specified for 'begx'/'begy' to use the current cursor location.
### Prototype
```c
API char* ncplane_contents(struct ncplane* n, int begy, int begx, unsigned leny, unsigned lenx) __attribute__ ((nonnull (1)));
```
"""
function ncplane_contents(n, begy, begx, leny, lenx)
    @ccall libnotcurses_core.ncplane_contents(n::Ptr{ncplane}, begy::Cint, begx::Cint, leny::Cuint, lenx::Cuint)::Ptr{Cchar}
end

"""
    ncplane_set_userptr(n, opaque)

Manipulate the opaque user pointer associated with this plane.
ncplane_set_userptr() returns the previous userptr after replacing
it with 'opaque'. the others simply return the userptr.
### Prototype
```c
API void* ncplane_set_userptr(struct ncplane* n, void* opaque) __attribute__ ((nonnull (1)));
```
"""
function ncplane_set_userptr(n, opaque)
    @ccall libnotcurses_core.ncplane_set_userptr(n::Ptr{ncplane}, opaque::Ptr{Cvoid})::Ptr{Cvoid}
end

"""
    ncplane_userptr(n)


### Prototype
```c
API void* ncplane_userptr(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_userptr(n)
    @ccall libnotcurses_core.ncplane_userptr(n::Ptr{ncplane})::Ptr{Cvoid}
end

"""
    ncplane_center_abs(n, y, x)

Find the center coordinate of a plane, preferring the top/left in the
case of an even number of rows/columns (in such a case, there will be one
more cell to the bottom/right of the center than the top/left). The
center is then modified relative to the plane's origin.
### Prototype
```c
API void ncplane_center_abs(const struct ncplane* n, int* RESTRICT y, int* RESTRICT x) __attribute__ ((nonnull (1)));
```
"""
function ncplane_center_abs(n, y, x)
    @ccall libnotcurses_core.ncplane_center_abs(n::Ptr{ncplane}, y::Ptr{Cint}, x::Ptr{Cint})::Cvoid
end

"""
    ncplane_as_rgba(n, blit, begy, begx, leny, lenx, pxdimy, pxdimx)

Create an RGBA flat array from the selected region of the ncplane 'nc'.
Start at the plane's 'begy'x'begx' coordinate (which must lie on the
plane), continuing for 'leny'x'lenx' cells. Either or both of 'leny' and
'lenx' can be specified as 0 to go through the boundary of the plane.
Only glyphs from the specified ncblitset may be present. If 'pxdimy' and/or
'pxdimx' are non-NULL, they will be filled in with the total pixel geometry.
### Prototype
```c
API ALLOC uint32_t* ncplane_as_rgba(const struct ncplane* n, ncblitter_e blit, int begy, int begx, unsigned leny, unsigned lenx, unsigned* pxdimy, unsigned* pxdimx) __attribute__ ((nonnull (1)));
```
"""
function ncplane_as_rgba(n, blit, begy, begx, leny, lenx, pxdimy, pxdimx)
    @ccall libnotcurses_core.ncplane_as_rgba(n::Ptr{ncplane}, blit::ncblitter_e, begy::Cint, begx::Cint, leny::Cuint, lenx::Cuint, pxdimy::Ptr{Cuint}, pxdimx::Ptr{Cuint})::Ptr{UInt32}
end

"""
    ncplane_cursor_move_yx(n, y, x)

Move the cursor to the specified position (the cursor needn't be visible).
Pass -1 as either coordinate to hold that axis constant. Returns -1 if the
move would place the cursor outside the plane.
### Prototype
```c
API int ncplane_cursor_move_yx(struct ncplane* n, int y, int x) __attribute__ ((nonnull (1)));
```
"""
function ncplane_cursor_move_yx(n, y, x)
    @ccall libnotcurses_core.ncplane_cursor_move_yx(n::Ptr{ncplane}, y::Cint, x::Cint)::Cint
end

"""
    ncplane_cursor_move_rel(n, y, x)

Move the cursor relative to the current cursor position (the cursor needn't
be visible). Returns -1 on error, including target position exceeding the
plane's dimensions.
### Prototype
```c
API int ncplane_cursor_move_rel(struct ncplane* n, int y, int x) __attribute__ ((nonnull (1)));
```
"""
function ncplane_cursor_move_rel(n, y, x)
    @ccall libnotcurses_core.ncplane_cursor_move_rel(n::Ptr{ncplane}, y::Cint, x::Cint)::Cint
end

"""
    ncplane_home(n)

Move the cursor to 0, 0. Can't fail.
### Prototype
```c
API void ncplane_home(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_home(n)
    @ccall libnotcurses_core.ncplane_home(n::Ptr{ncplane})::Cvoid
end

"""
    ncplane_cursor_yx(n, y, x)

Get the current position of the cursor within n. y and/or x may be NULL.
### Prototype
```c
API void ncplane_cursor_yx(const struct ncplane* n, unsigned* RESTRICT y, unsigned* RESTRICT x) __attribute__ ((nonnull (1)));
```
"""
function ncplane_cursor_yx(n, y, x)
    @ccall libnotcurses_core.ncplane_cursor_yx(n::Ptr{ncplane}, y::Ptr{Cuint}, x::Ptr{Cuint})::Cvoid
end

"""
    ncplane_channels(n)

Get the current colors and alpha values for ncplane 'n'.
### Prototype
```c
API uint64_t ncplane_channels(const struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_channels(n)
    @ccall libnotcurses_core.ncplane_channels(n::Ptr{ncplane})::UInt64
end

"""
    ncplane_styles(n)

Get the current styling for the ncplane 'n'.
### Prototype
```c
API uint16_t ncplane_styles(const struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_styles(n)
    @ccall libnotcurses_core.ncplane_styles(n::Ptr{ncplane})::UInt16
end

"""
    ncplane_putc_yx(n, y, x, c)

Replace the cell at the specified coordinates with the provided cell 'c',
and advance the cursor by the width of the cell (but not past the end of the
plane). On success, returns the number of columns the cursor was advanced.
'c' must already be associated with 'n'. On failure, -1 is returned.
### Prototype
```c
API int ncplane_putc_yx(struct ncplane* n, int y, int x, const nccell* c) __attribute__ ((nonnull (1, 4)));
```
"""
function ncplane_putc_yx(n, y, x, c)
    @ccall libnotcurses_core.ncplane_putc_yx(n::Ptr{ncplane}, y::Cint, x::Cint, c::Ptr{nccell})::Cint
end

"""
    ncplane_putchar_stained(n, c)

Replace the EGC underneath us, but retain the styling. The current styling
of the plane will not be changed.
### Prototype
```c
API int ncplane_putchar_stained(struct ncplane* n, char c) __attribute__ ((nonnull (1)));
```
"""
function ncplane_putchar_stained(n, c)
    @ccall libnotcurses_core.ncplane_putchar_stained(n::Ptr{ncplane}, c::Cchar)::Cint
end

"""
    ncplane_putegc_yx(n, y, x, gclust, sbytes)

Replace the cell at the specified coordinates with the provided EGC, and
advance the cursor by the width of the cluster (but not past the end of the
plane). On success, returns the number of columns the cursor was advanced.
On failure, -1 is returned. The number of bytes converted from gclust is
written to 'sbytes' if non-NULL.
### Prototype
```c
API int ncplane_putegc_yx(struct ncplane* n, int y, int x, const char* gclust, size_t* sbytes) __attribute__ ((nonnull (1, 4)));
```
"""
function ncplane_putegc_yx(n, y, x, gclust, sbytes)
    @ccall libnotcurses_core.ncplane_putegc_yx(n::Ptr{ncplane}, y::Cint, x::Cint, gclust::Ptr{Cchar}, sbytes::Ptr{Csize_t})::Cint
end

"""
    ncplane_putegc_stained(n, gclust, sbytes)

Replace the EGC underneath us, but retain the styling. The current styling
of the plane will not be changed.
### Prototype
```c
API int ncplane_putegc_stained(struct ncplane* n, const char* gclust, size_t* sbytes) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_putegc_stained(n, gclust, sbytes)
    @ccall libnotcurses_core.ncplane_putegc_stained(n::Ptr{ncplane}, gclust::Ptr{Cchar}, sbytes::Ptr{Csize_t})::Cint
end

"""
    ncplane_putwegc_stained(n, gclust, sbytes)

Replace the EGC underneath us, but retain the styling. The current styling
of the plane will not be changed.
### Prototype
```c
API int ncplane_putwegc_stained(struct ncplane* n, const wchar_t* gclust, size_t* sbytes) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_putwegc_stained(n, gclust, sbytes)
    @ccall libnotcurses_core.ncplane_putwegc_stained(n::Ptr{ncplane}, gclust::Ptr{Cwchar_t}, sbytes::Ptr{Csize_t})::Cint
end

"""
    ncplane_putnstr_aligned(n, y, align, s, str)


### Prototype
```c
API int ncplane_putnstr_aligned(struct ncplane* n, int y, ncalign_e align, size_t s, const char* str) __attribute__ ((nonnull (1, 5)));
```
"""
function ncplane_putnstr_aligned(n, y, align, s, str)
    @ccall libnotcurses_core.ncplane_putnstr_aligned(n::Ptr{ncplane}, y::Cint, align::ncalign_e, s::Csize_t, str::Ptr{Cchar})::Cint
end

"""
    ncplane_putwstr_stained(n, gclustarr)


### Prototype
```c
API int ncplane_putwstr_stained(struct ncplane* n, const wchar_t* gclustarr) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_putwstr_stained(n, gclustarr)
    @ccall libnotcurses_core.ncplane_putwstr_stained(n::Ptr{ncplane}, gclustarr::Ptr{Cwchar_t})::Cint
end

"""
    ncplane_puttext(n, y, align, text, bytes)

Write the specified text to the plane, breaking lines sensibly, beginning at
the specified line. Returns the number of columns written. When breaking a
line, the line will be cleared to the end of the plane (the last line will
*not* be so cleared). The number of bytes written from the input is written
to '*bytes' if it is not NULL. Cleared columns are included in the return
value, but *not* included in the number of bytes written. Leaves the cursor
at the end of output. A partial write will be accomplished as far as it can;
determine whether the write completed by inspecting '*bytes'. Can output to
multiple rows even in the absence of scrolling, but not more rows than are
available. With scrolling enabled, arbitrary amounts of data can be emitted.
All provided whitespace is preserved -- ncplane_puttext() followed by an
appropriate ncplane_contents() will read back the original output.

If 'y' is -1, the first row of output is taken relative to the current
cursor: it will be left-, right-, or center-aligned in whatever remains
of the row. On subsequent rows -- or if 'y' is not -1 -- the entire row can
be used, and alignment works normally.

A newline at any point will move the cursor to the next row.
### Prototype
```c
API int ncplane_puttext(struct ncplane* n, int y, ncalign_e align, const char* text, size_t* bytes) __attribute__ ((nonnull (1, 4)));
```
"""
function ncplane_puttext(n, y, align, text, bytes)
    @ccall libnotcurses_core.ncplane_puttext(n::Ptr{ncplane}, y::Cint, align::ncalign_e, text::Ptr{Cchar}, bytes::Ptr{Csize_t})::Cint
end

"""
    ncplane_hline_interp(n, c, len, c1, c2)

Draw horizontal or vertical lines using the specified cell, starting at the
current cursor position. The cursor will end at the cell following the last
cell output (even, perhaps counter-intuitively, when drawing vertical
lines), just as if ncplane_putc() was called at that spot. Return the
number of cells drawn on success. On error, return the negative number of
cells drawn. A length of 0 is an error, resulting in a return of -1.
### Prototype
```c
API int ncplane_hline_interp(struct ncplane* n, const nccell* c, unsigned len, uint64_t c1, uint64_t c2) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_hline_interp(n, c, len, c1, c2)
    @ccall libnotcurses_core.ncplane_hline_interp(n::Ptr{ncplane}, c::Ptr{nccell}, len::Cuint, c1::UInt64, c2::UInt64)::Cint
end

"""
    ncplane_vline_interp(n, c, len, c1, c2)


### Prototype
```c
API int ncplane_vline_interp(struct ncplane* n, const nccell* c, unsigned len, uint64_t c1, uint64_t c2) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_vline_interp(n, c, len, c1, c2)
    @ccall libnotcurses_core.ncplane_vline_interp(n::Ptr{ncplane}, c::Ptr{nccell}, len::Cuint, c1::UInt64, c2::UInt64)::Cint
end

"""
    ncplane_box(n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)

Draw a box with its upper-left corner at the current cursor position, and its
lower-right corner at 'ystop'x'xstop'. The 6 cells provided are used to draw the
upper-left, ur, ll, and lr corners, then the horizontal and vertical lines.
'ctlword' is defined in the least significant byte, where bits [7, 4] are a
gradient mask, and [3, 0] are a border mask:
 * 7, 3: top
 * 6, 2: right
 * 5, 1: bottom
 * 4, 0: left
If the gradient bit is not set, the styling from the hl/vl cells is used for
the horizontal and vertical lines, respectively. If the gradient bit is set,
the color is linearly interpolated between the two relevant corner cells.

By default, vertexes are drawn whether their connecting edges are drawn or
not. The value of the bits corresponding to NCBOXCORNER_MASK control this,
and are interpreted as the number of connecting edges necessary to draw a
given corner. At 0 (the default), corners are always drawn. At 3, corners
are never drawn (since at most 2 edges can touch a box's corner).
### Prototype
```c
API int ncplane_box(struct ncplane* n, const nccell* ul, const nccell* ur, const nccell* ll, const nccell* lr, const nccell* hline, const nccell* vline, unsigned ystop, unsigned xstop, unsigned ctlword);
```
"""
function ncplane_box(n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)
    @ccall libnotcurses_core.ncplane_box(n::Ptr{ncplane}, ul::Ptr{nccell}, ur::Ptr{nccell}, ll::Ptr{nccell}, lr::Ptr{nccell}, hline::Ptr{nccell}, vline::Ptr{nccell}, ystop::Cuint, xstop::Cuint, ctlword::Cuint)::Cint
end

"""
    ncplane_polyfill_yx(n, y, x, c)

Starting at the specified coordinate, if its glyph is different from that of
'c', 'c' is copied into it, and the original glyph is considered the fill
target. We do the same to all cardinally-connected cells having this same
fill target. Returns the number of cells polyfilled. An invalid initial y, x
is an error. Returns the number of cells filled, or -1 on error. Does
not update cursor position.
### Prototype
```c
API int ncplane_polyfill_yx(struct ncplane* n, int y, int x, const nccell* c) __attribute__ ((nonnull (1, 4)));
```
"""
function ncplane_polyfill_yx(n, y, x, c)
    @ccall libnotcurses_core.ncplane_polyfill_yx(n::Ptr{ncplane}, y::Cint, x::Cint, c::Ptr{nccell})::Cint
end

"""
    ncplane_gradient(n, y, x, ylen, xlen, egc, styles, ul, ur, ll, lr)

Draw a gradient with its upper-left corner at the position specified by 'y'/'x',
where -1 means the current cursor position in that dimension. The area is
specified by 'ylen'/'xlen', where 0 means "everything remaining below or
to the right, respectively." The glyph composed of 'egc' and 'styles' is
used for all cells. The channels specified by 'ul', 'ur', 'll', and 'lr'
are composed into foreground and background gradients. To do a vertical
gradient, 'ul' ought equal 'ur' and 'll' ought equal 'lr'. To do a
horizontal gradient, 'ul' ought equal 'll' and 'ur' ought equal 'ul'. To
color everything the same, all four channels should be equivalent. The
resulting alpha values are equal to incoming alpha values. Returns the
number of cells filled on success, or -1 on failure.
Palette-indexed color is not supported. Does not update cursor position.

Preconditions for gradient operations (error otherwise):

 all: only RGB colors, unless all four channels match as default
 all: all alpha values must be the same
 1x1: all four colors must be the same
 1xN: both top and both bottom colors must be the same (vertical gradient)
Nx1: both left and both right colors must be the same (horizontal gradient)
### Prototype
```c
API int ncplane_gradient(struct ncplane* n, int y, int x, unsigned ylen, unsigned xlen, const char* egc, uint16_t styles, uint64_t ul, uint64_t ur, uint64_t ll, uint64_t lr) __attribute__ ((nonnull (1, 6)));
```
"""
function ncplane_gradient(n, y, x, ylen, xlen, egc, styles, ul, ur, ll, lr)
    @ccall libnotcurses_core.ncplane_gradient(n::Ptr{ncplane}, y::Cint, x::Cint, ylen::Cuint, xlen::Cuint, egc::Ptr{Cchar}, styles::UInt16, ul::UInt64, ur::UInt64, ll::UInt64, lr::UInt64)::Cint
end

"""
    ncplane_gradient2x1(n, y, x, ylen, xlen, ul, ur, ll, lr)

Do a high-resolution gradient using upper blocks and synced backgrounds.
This doubles the number of vertical gradations, but restricts you to
half blocks (appearing to be full blocks). Returns the number of cells
filled on success, or -1 on error. Does not update cursor position.
### Prototype
```c
API int ncplane_gradient2x1(struct ncplane* n, int y, int x, unsigned ylen, unsigned xlen, uint32_t ul, uint32_t ur, uint32_t ll, uint32_t lr) __attribute__ ((nonnull (1)));
```
"""
function ncplane_gradient2x1(n, y, x, ylen, xlen, ul, ur, ll, lr)
    @ccall libnotcurses_core.ncplane_gradient2x1(n::Ptr{ncplane}, y::Cint, x::Cint, ylen::Cuint, xlen::Cuint, ul::UInt32, ur::UInt32, ll::UInt32, lr::UInt32)::Cint
end

"""
    ncplane_format(n, y, x, ylen, xlen, stylemask)

Set the given style throughout the specified region, keeping content and
channels unchanged. The upper left corner is at 'y', 'x', and -1 may be
specified to indicate the cursor's position in that dimension. The area
is specified by 'ylen', 'xlen', and 0 may be specified to indicate everything
remaining to the right and below, respectively. It is an error for any
coordinate to be outside the plane. Returns the number of cells set,
or -1 on failure. Does not update the cursor position.
### Prototype
```c
API int ncplane_format(struct ncplane* n, int y, int x, unsigned ylen, unsigned xlen, uint16_t stylemask) __attribute__ ((nonnull (1)));
```
"""
function ncplane_format(n, y, x, ylen, xlen, stylemask)
    @ccall libnotcurses_core.ncplane_format(n::Ptr{ncplane}, y::Cint, x::Cint, ylen::Cuint, xlen::Cuint, stylemask::UInt16)::Cint
end

"""
    ncplane_stain(n, y, x, ylen, xlen, ul, ur, ll, lr)

Set the given channels throughout the specified region, keeping content and
channels unchanged. The upper left corner is at 'y', 'x', and -1 may be
specified to indicate the cursor's position in that dimension. The area
is specified by 'ylen', 'xlen', and 0 may be specified to indicate everything
remaining to the right and below, respectively. It is an error for any
coordinate to be outside the plane. Returns the number of cells set,
or -1 on failure. Does not update the cursor position.
### Prototype
```c
API int ncplane_stain(struct ncplane* n, int y, int x, unsigned ylen, unsigned xlen, uint64_t ul, uint64_t ur, uint64_t ll, uint64_t lr) __attribute__ ((nonnull (1)));
```
"""
function ncplane_stain(n, y, x, ylen, xlen, ul, ur, ll, lr)
    @ccall libnotcurses_core.ncplane_stain(n::Ptr{ncplane}, y::Cint, x::Cint, ylen::Cuint, xlen::Cuint, ul::UInt64, ur::UInt64, ll::UInt64, lr::UInt64)::Cint
end

"""
    ncplane_mergedown_simple(src, dst)

Merge the entirety of 'src' down onto the ncplane 'dst'. If 'src' does not
intersect with 'dst', 'dst' will not be changed, but it is not an error.
### Prototype
```c
API int ncplane_mergedown_simple(struct ncplane* RESTRICT src, struct ncplane* RESTRICT dst) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_mergedown_simple(src, dst)
    @ccall libnotcurses_core.ncplane_mergedown_simple(src::Ptr{ncplane}, dst::Ptr{ncplane})::Cint
end

"""
    ncplane_mergedown(src, dst, begsrcy, begsrcx, leny, lenx, dsty, dstx)

Merge the ncplane 'src' down onto the ncplane 'dst'. This is most rigorously
defined as "write to 'dst' the frame that would be rendered were the entire
stack made up only of the specified subregion of 'src' and, below it, the
subregion of 'dst' having the specified origin. Supply -1 to indicate the
current cursor position in the relevant dimension. Merging is independent of
the position of 'src' viz 'dst' on the z-axis. It is an error to define a
subregion that is not entirely contained within 'src'. It is an error to
define a target origin such that the projected subregion is not entirely
contained within 'dst'.  Behavior is undefined if 'src' and 'dst' are
equivalent. 'dst' is modified, but 'src' remains unchanged. Neither 'src'
nor 'dst' may have sprixels. Lengths of 0 mean "everything left".
### Prototype
```c
API int ncplane_mergedown(struct ncplane* RESTRICT src, struct ncplane* RESTRICT dst, int begsrcy, int begsrcx, unsigned leny, unsigned lenx, int dsty, int dstx) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_mergedown(src, dst, begsrcy, begsrcx, leny, lenx, dsty, dstx)
    @ccall libnotcurses_core.ncplane_mergedown(src::Ptr{ncplane}, dst::Ptr{ncplane}, begsrcy::Cint, begsrcx::Cint, leny::Cuint, lenx::Cuint, dsty::Cint, dstx::Cint)::Cint
end

"""
    ncplane_erase(n)

Erase every cell in the ncplane (each cell is initialized to the null glyph
and the default channels/styles). All cells associated with this ncplane are
invalidated, and must not be used after the call, *excluding* the base cell.
The cursor is homed. The plane's active attributes are unaffected.
### Prototype
```c
API void ncplane_erase(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_erase(n)
    @ccall libnotcurses_core.ncplane_erase(n::Ptr{ncplane})::Cvoid
end

"""
    ncplane_erase_region(n, ystart, xstart, ylen, xlen)

Erase every cell in the region starting at {ystart, xstart} and having size
{|ylen|x|xlen|} for non-zero lengths. If ystart and/or xstart are -1, the current
cursor position along that axis is used; other negative values are an error. A
negative ylen means to move up from the origin, and a negative xlen means to move
left from the origin. A positive ylen moves down, and a positive xlen moves right.
A value of 0 for the length erases everything along that dimension. It is an error
if the starting coordinate is not in the plane, but the ending coordinate may be
outside the plane.

For example, on a plane of 20 rows and 10 columns, with the cursor at row 10 and
column 5, the following would hold:

 (-1, -1, 0, 1): clears the column to the right of the cursor (column 6)
 (-1, -1, 0, -1): clears the column to the left of the cursor (column 4)
 (-1, -1, INT_MAX, 0): clears all rows with or below the cursor (rows 10--19)
 (-1, -1, -INT_MAX, 0): clears all rows with or above the cursor (rows 0--10)
 (-1, 4, 3, 3): clears from row 5, column 4 through row 7, column 6
 (-1, 4, -3, -3): clears from row 5, column 4 through row 3, column 2
 (4, -1, 0, 3): clears columns 5, 6, and 7
 (-1, -1, 0, 0): clears the plane *if the cursor is in a legal position*
(0, 0, 0, 0): clears the plane in all cases
### Prototype
```c
API int ncplane_erase_region(struct ncplane* n, int ystart, int xstart, int ylen, int xlen) __attribute__ ((nonnull (1)));
```
"""
function ncplane_erase_region(n, ystart, xstart, ylen, xlen)
    @ccall libnotcurses_core.ncplane_erase_region(n::Ptr{ncplane}, ystart::Cint, xstart::Cint, ylen::Cint, xlen::Cint)::Cint
end

"""
    ncplane_set_channels(n, channels)

Set the alpha and coloring bits of the plane's current channels from a
64-bit pair of channels.
### Prototype
```c
API void ncplane_set_channels(struct ncplane* n, uint64_t channels) __attribute__ ((nonnull (1)));
```
"""
function ncplane_set_channels(n, channels)
    @ccall libnotcurses_core.ncplane_set_channels(n::Ptr{ncplane}, channels::UInt64)::Cvoid
end

"""
    ncplane_set_bchannel(n, channel)

Set the background alpha and coloring bits of the plane's current
channels from a single 32-bit value.
### Prototype
```c
API uint64_t ncplane_set_bchannel(struct ncplane* n, uint32_t channel) __attribute__ ((nonnull (1)));
```
"""
function ncplane_set_bchannel(n, channel)
    @ccall libnotcurses_core.ncplane_set_bchannel(n::Ptr{ncplane}, channel::UInt32)::UInt64
end

"""
    ncplane_set_fchannel(n, channel)

Set the foreground alpha and coloring bits of the plane's current
channels from a single 32-bit value.
### Prototype
```c
API uint64_t ncplane_set_fchannel(struct ncplane* n, uint32_t channel) __attribute__ ((nonnull (1)));
```
"""
function ncplane_set_fchannel(n, channel)
    @ccall libnotcurses_core.ncplane_set_fchannel(n::Ptr{ncplane}, channel::UInt32)::UInt64
end

"""
    ncplane_set_styles(n, stylebits)

Set the specified style bits for the ncplane 'n', whether they're actively
supported or not.
### Prototype
```c
API void ncplane_set_styles(struct ncplane* n, unsigned stylebits) __attribute__ ((nonnull (1)));
```
"""
function ncplane_set_styles(n, stylebits)
    @ccall libnotcurses_core.ncplane_set_styles(n::Ptr{ncplane}, stylebits::Cuint)::Cvoid
end

"""
    ncplane_on_styles(n, stylebits)

Add the specified styles to the ncplane's existing spec.
### Prototype
```c
API void ncplane_on_styles(struct ncplane* n, unsigned stylebits) __attribute__ ((nonnull (1)));
```
"""
function ncplane_on_styles(n, stylebits)
    @ccall libnotcurses_core.ncplane_on_styles(n::Ptr{ncplane}, stylebits::Cuint)::Cvoid
end

"""
    ncplane_off_styles(n, stylebits)

Remove the specified styles from the ncplane's existing spec.
### Prototype
```c
API void ncplane_off_styles(struct ncplane* n, unsigned stylebits) __attribute__ ((nonnull (1)));
```
"""
function ncplane_off_styles(n, stylebits)
    @ccall libnotcurses_core.ncplane_off_styles(n::Ptr{ncplane}, stylebits::Cuint)::Cvoid
end

"""
    ncplane_set_fg_rgb8(n, r, g, b)

Set the current fore/background color using RGB specifications. If the
terminal does not support directly-specified 3x8b cells (24-bit "TrueColor",
indicated by the "RGB" terminfo capability), the provided values will be
interpreted in some lossy fashion. None of r, g, or b may exceed 255.
"HP-like" terminals require setting foreground and background at the same
time using "color pairs"; Notcurses will manage color pairs transparently.
### Prototype
```c
API int ncplane_set_fg_rgb8(struct ncplane* n, unsigned r, unsigned g, unsigned b);
```
"""
function ncplane_set_fg_rgb8(n, r, g, b)
    @ccall libnotcurses_core.ncplane_set_fg_rgb8(n::Ptr{ncplane}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    ncplane_set_bg_rgb8(n, r, g, b)


### Prototype
```c
API int ncplane_set_bg_rgb8(struct ncplane* n, unsigned r, unsigned g, unsigned b);
```
"""
function ncplane_set_bg_rgb8(n, r, g, b)
    @ccall libnotcurses_core.ncplane_set_bg_rgb8(n::Ptr{ncplane}, r::Cuint, g::Cuint, b::Cuint)::Cint
end

"""
    ncplane_set_bg_rgb8_clipped(n, r, g, b)

Same, but clipped to [0..255].
### Prototype
```c
API void ncplane_set_bg_rgb8_clipped(struct ncplane* n, int r, int g, int b);
```
"""
function ncplane_set_bg_rgb8_clipped(n, r, g, b)
    @ccall libnotcurses_core.ncplane_set_bg_rgb8_clipped(n::Ptr{ncplane}, r::Cint, g::Cint, b::Cint)::Cvoid
end

"""
    ncplane_set_fg_rgb8_clipped(n, r, g, b)


### Prototype
```c
API void ncplane_set_fg_rgb8_clipped(struct ncplane* n, int r, int g, int b);
```
"""
function ncplane_set_fg_rgb8_clipped(n, r, g, b)
    @ccall libnotcurses_core.ncplane_set_fg_rgb8_clipped(n::Ptr{ncplane}, r::Cint, g::Cint, b::Cint)::Cvoid
end

"""
    ncplane_set_fg_rgb(n, channel)

Same, but with rgb assembled into a channel (i.e. lower 24 bits).
### Prototype
```c
API int ncplane_set_fg_rgb(struct ncplane* n, uint32_t channel);
```
"""
function ncplane_set_fg_rgb(n, channel)
    @ccall libnotcurses_core.ncplane_set_fg_rgb(n::Ptr{ncplane}, channel::UInt32)::Cint
end

"""
    ncplane_set_bg_rgb(n, channel)


### Prototype
```c
API int ncplane_set_bg_rgb(struct ncplane* n, uint32_t channel);
```
"""
function ncplane_set_bg_rgb(n, channel)
    @ccall libnotcurses_core.ncplane_set_bg_rgb(n::Ptr{ncplane}, channel::UInt32)::Cint
end

"""
    ncplane_set_fg_default(n)

Use the default color for the foreground/background.
### Prototype
```c
API void ncplane_set_fg_default(struct ncplane* n);
```
"""
function ncplane_set_fg_default(n)
    @ccall libnotcurses_core.ncplane_set_fg_default(n::Ptr{ncplane})::Cvoid
end

"""
    ncplane_set_bg_default(n)


### Prototype
```c
API void ncplane_set_bg_default(struct ncplane* n);
```
"""
function ncplane_set_bg_default(n)
    @ccall libnotcurses_core.ncplane_set_bg_default(n::Ptr{ncplane})::Cvoid
end

"""
    ncplane_set_fg_palindex(n, idx)

Set the ncplane's foreground palette index, set the foreground palette index
bit, set it foreground-opaque, and clear the foreground default color bit.
### Prototype
```c
API int ncplane_set_fg_palindex(struct ncplane* n, unsigned idx);
```
"""
function ncplane_set_fg_palindex(n, idx)
    @ccall libnotcurses_core.ncplane_set_fg_palindex(n::Ptr{ncplane}, idx::Cuint)::Cint
end

"""
    ncplane_set_bg_palindex(n, idx)


### Prototype
```c
API int ncplane_set_bg_palindex(struct ncplane* n, unsigned idx);
```
"""
function ncplane_set_bg_palindex(n, idx)
    @ccall libnotcurses_core.ncplane_set_bg_palindex(n::Ptr{ncplane}, idx::Cuint)::Cint
end

"""
    ncplane_set_fg_alpha(n, alpha)

Set the alpha parameters for ncplane 'n'.
### Prototype
```c
API int ncplane_set_fg_alpha(struct ncplane* n, int alpha);
```
"""
function ncplane_set_fg_alpha(n, alpha)
    @ccall libnotcurses_core.ncplane_set_fg_alpha(n::Ptr{ncplane}, alpha::Cint)::Cint
end

"""
    ncplane_set_bg_alpha(n, alpha)


### Prototype
```c
API int ncplane_set_bg_alpha(struct ncplane* n, int alpha);
```
"""
function ncplane_set_bg_alpha(n, alpha)
    @ccall libnotcurses_core.ncplane_set_bg_alpha(n::Ptr{ncplane}, alpha::Cint)::Cint
end

# typedef int ( * fadecb ) ( struct notcurses * nc , struct ncplane * n , const struct timespec * , void * curry )
"""
Called for each fade iteration on 'ncp'. If anything but 0 is returned,
the fading operation ceases immediately, and that value is propagated out.
The recommended absolute display time target is passed in 'tspec'.
"""
const fadecb = Ptr{Cvoid}

"""
    ncplane_fadeout(n, ts, fader, curry)

Fade the ncplane out over the provided time, calling 'fader' at each
iteration. Requires a terminal which supports truecolor, or at least palette
modification (if the terminal uses a palette, our ability to fade planes is
limited, and affected by the complexity of the rest of the screen).
### Prototype
```c
API int ncplane_fadeout(struct ncplane* n, const struct timespec* ts, fadecb fader, void* curry) __attribute__ ((nonnull (1)));
```
"""
function ncplane_fadeout(n, ts, fader, curry)
    @ccall libnotcurses_core.ncplane_fadeout(n::Ptr{ncplane}, ts::Ptr{Cvoid}, fader::fadecb, curry::Ptr{Cvoid})::Cint
end

"""
    ncplane_fadein(n, ts, fader, curry)

Fade the ncplane in over the specified time. Load the ncplane with the
target cells without rendering, then call this function. When it's done, the
ncplane will have reached the target levels, starting from zeroes.
### Prototype
```c
API int ncplane_fadein(struct ncplane* n, const struct timespec* ts, fadecb fader, void* curry) __attribute__ ((nonnull (1)));
```
"""
function ncplane_fadein(n, ts, fader, curry)
    @ccall libnotcurses_core.ncplane_fadein(n::Ptr{ncplane}, ts::Ptr{Cvoid}, fader::fadecb, curry::Ptr{Cvoid})::Cint
end

"""
    ncfadectx_setup(n)

Rather than the simple ncplane_fade{in/out}(), ncfadectx_setup() can be
paired with a loop over ncplane_fade{in/out}_iteration() + ncfadectx_free().
### Prototype
```c
API ALLOC struct ncfadectx* ncfadectx_setup(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncfadectx_setup(n)
    @ccall libnotcurses_core.ncfadectx_setup(n::Ptr{ncplane})::Ptr{ncfadectx}
end

"""
    ncfadectx_iterations(nctx)

Return the number of iterations through which 'nctx' will fade.
### Prototype
```c
API int ncfadectx_iterations(const struct ncfadectx* nctx) __attribute__ ((nonnull (1)));
```
"""
function ncfadectx_iterations(nctx)
    @ccall libnotcurses_core.ncfadectx_iterations(nctx::Ptr{ncfadectx})::Cint
end

"""
    ncplane_fadeout_iteration(n, nctx, iter, fader, curry)

Fade out through 'iter' iterations, where
'iter' < 'ncfadectx_iterations(nctx)'.
### Prototype
```c
API int ncplane_fadeout_iteration(struct ncplane* n, struct ncfadectx* nctx, int iter, fadecb fader, void* curry) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_fadeout_iteration(n, nctx, iter, fader, curry)
    @ccall libnotcurses_core.ncplane_fadeout_iteration(n::Ptr{ncplane}, nctx::Ptr{ncfadectx}, iter::Cint, fader::fadecb, curry::Ptr{Cvoid})::Cint
end

"""
    ncplane_fadein_iteration(n, nctx, iter, fader, curry)

Fade in through 'iter' iterations, where
'iter' < 'ncfadectx_iterations(nctx)'.
### Prototype
```c
API int ncplane_fadein_iteration(struct ncplane* n, struct ncfadectx* nctx, int iter, fadecb fader, void* curry) __attribute__ ((nonnull (1, 2)));
```
"""
function ncplane_fadein_iteration(n, nctx, iter, fader, curry)
    @ccall libnotcurses_core.ncplane_fadein_iteration(n::Ptr{ncplane}, nctx::Ptr{ncfadectx}, iter::Cint, fader::fadecb, curry::Ptr{Cvoid})::Cint
end

"""
    ncplane_pulse(n, ts, fader, curry)

Pulse the plane in and out until the callback returns non-zero, relying on
the callback 'fader' to initiate rendering. 'ts' defines the half-period
(i.e. the transition from black to full brightness, or back again). Proper
use involves preparing (but not rendering) an ncplane, then calling
ncplane_pulse(), which will fade in from black to the specified colors.
### Prototype
```c
API int ncplane_pulse(struct ncplane* n, const struct timespec* ts, fadecb fader, void* curry) __attribute__ ((nonnull (1)));
```
"""
function ncplane_pulse(n, ts, fader, curry)
    @ccall libnotcurses_core.ncplane_pulse(n::Ptr{ncplane}, ts::Ptr{Cvoid}, fader::fadecb, curry::Ptr{Cvoid})::Cint
end

"""
    ncfadectx_free(nctx)

Release the resources associated with 'nctx'.
### Prototype
```c
API void ncfadectx_free(struct ncfadectx* nctx);
```
"""
function ncfadectx_free(nctx)
    @ccall libnotcurses_core.ncfadectx_free(nctx::Ptr{ncfadectx})::Cvoid
end

"""
    ncvisual_from_file(file)

Open a visual at 'file', extract a codec and parameters, decode the first
image to memory.
### Prototype
```c
API ALLOC struct ncvisual* ncvisual_from_file(const char* file) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_from_file(file)
    @ccall libnotcurses_core.ncvisual_from_file(file::Ptr{Cchar})::Ptr{ncvisual}
end

"""
    ncvisual_from_rgba(rgba, rows, rowstride, cols)

Prepare an ncvisual, and its underlying plane, based off RGBA content in
memory at 'rgba'. 'rgba' is laid out as 'rows' lines, each of which is
'rowstride' bytes in length. Each line has 'cols' 32-bit 8bpc RGBA pixels
followed by possible padding (there will be 'rowstride' - 'cols' * 4 bytes
of padding). The total size of 'rgba' is thus ('rows' * 'rowstride') bytes,
of which ('rows' * 'cols' * 4) bytes are actual non-padding data. It is an
error if any argument is not positive, if 'rowstride' is not a multiple of
4, or if 'rowstride' is less than 'cols' * 4.
### Prototype
```c
API ALLOC struct ncvisual* ncvisual_from_rgba(const void* rgba, int rows, int rowstride, int cols) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_from_rgba(rgba, rows, rowstride, cols)
    @ccall libnotcurses_core.ncvisual_from_rgba(rgba::Ptr{Cvoid}, rows::Cint, rowstride::Cint, cols::Cint)::Ptr{ncvisual}
end

"""
    ncvisual_from_rgb_packed(rgba, rows, rowstride, cols, alpha)

ncvisual_from_rgba(), but the pixels are 3-byte RGB. A is filled in
throughout using 'alpha'. It is an error if 'rows', 'rowstride', or 'cols'
is not positive, if 'rowstride' is not a multiple of 3, or if 'rowstride'
is less than 'cols' * 3.
### Prototype
```c
API ALLOC struct ncvisual* ncvisual_from_rgb_packed(const void* rgba, int rows, int rowstride, int cols, int alpha) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_from_rgb_packed(rgba, rows, rowstride, cols, alpha)
    @ccall libnotcurses_core.ncvisual_from_rgb_packed(rgba::Ptr{Cvoid}, rows::Cint, rowstride::Cint, cols::Cint, alpha::Cint)::Ptr{ncvisual}
end

"""
    ncvisual_from_rgb_loose(rgba, rows, rowstride, cols, alpha)

ncvisual_from_rgba(), but the pixels are 4-byte RGBx. A is filled in
throughout using 'alpha'. It is an error if 'rows', 'cols', or 'rowstride'
are not positive, if 'rowstride' is not a multiple of 4, or if 'rowstride'
is less than 'cols' * 4.
### Prototype
```c
API ALLOC struct ncvisual* ncvisual_from_rgb_loose(const void* rgba, int rows, int rowstride, int cols, int alpha) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_from_rgb_loose(rgba, rows, rowstride, cols, alpha)
    @ccall libnotcurses_core.ncvisual_from_rgb_loose(rgba::Ptr{Cvoid}, rows::Cint, rowstride::Cint, cols::Cint, alpha::Cint)::Ptr{ncvisual}
end

"""
    ncvisual_from_bgra(bgra, rows, rowstride, cols)

ncvisual_from_rgba(), but 'bgra' is arranged as BGRA. note that this is a
byte-oriented layout, despite being bunched in 32-bit pixels; the lowest
memory address ought be B, and A is reached by adding 3 to that address.
It is an error if 'rows', 'cols', or 'rowstride' are not positive, if
'rowstride' is not a multiple of 4, or if 'rowstride' is less than 'cols' * 4.
### Prototype
```c
API ALLOC struct ncvisual* ncvisual_from_bgra(const void* bgra, int rows, int rowstride, int cols) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_from_bgra(bgra, rows, rowstride, cols)
    @ccall libnotcurses_core.ncvisual_from_bgra(bgra::Ptr{Cvoid}, rows::Cint, rowstride::Cint, cols::Cint)::Ptr{ncvisual}
end

"""
    ncvisual_from_palidx(data, rows, rowstride, cols, palsize, pstride, palette)

ncvisual_from_rgba(), but 'data' is 'pstride'-byte palette-indexed pixels,
arranged in 'rows' lines of 'rowstride' bytes each, composed of 'cols'
pixels. 'palette' is an array of at least 'palsize' ncchannels.
It is an error if 'rows', 'cols', 'rowstride', or 'pstride' are not
positive, if 'rowstride' is not a multiple of 'pstride', or if 'rowstride'
is less than 'cols' * 'pstride'.
### Prototype
```c
API ALLOC struct ncvisual* ncvisual_from_palidx(const void* data, int rows, int rowstride, int cols, int palsize, int pstride, const uint32_t* palette) __attribute__ ((nonnull (1, 7)));
```
"""
function ncvisual_from_palidx(data, rows, rowstride, cols, palsize, pstride, palette)
    @ccall libnotcurses_core.ncvisual_from_palidx(data::Ptr{Cvoid}, rows::Cint, rowstride::Cint, cols::Cint, palsize::Cint, pstride::Cint, palette::Ptr{UInt32})::Ptr{ncvisual}
end

"""
    ncvisual_from_plane(n, blit, begy, begx, leny, lenx)

Promote an ncplane 'n' to an ncvisual. The plane may contain only spaces,
half blocks, and full blocks. The latter will be checked, and any other
glyph will result in a NULL being returned. This function exists so that
planes can be subjected to ncvisual transformations. If possible, it's
better to create the ncvisual from memory using ncvisual_from_rgba().
Lengths of 0 are interpreted to mean "all available remaining area".
### Prototype
```c
API ALLOC struct ncvisual* ncvisual_from_plane(const struct ncplane* n, ncblitter_e blit, int begy, int begx, unsigned leny, unsigned lenx) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_from_plane(n, blit, begy, begx, leny, lenx)
    @ccall libnotcurses_core.ncvisual_from_plane(n::Ptr{ncplane}, blit::ncblitter_e, begy::Cint, begx::Cint, leny::Cuint, lenx::Cuint)::Ptr{ncvisual}
end

"""
    ncvisual_from_sixel(s, leny, lenx)

Construct an ncvisual from a nul-terminated Sixel control sequence.
### Prototype
```c
API ALLOC struct ncvisual* ncvisual_from_sixel(const char* s, unsigned leny, unsigned lenx) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_from_sixel(s, leny, lenx)
    @ccall libnotcurses_core.ncvisual_from_sixel(s::Ptr{Cchar}, leny::Cuint, lenx::Cuint)::Ptr{ncvisual}
end

"""
    ncvgeom

describes all geometries of an ncvisual: those which are inherent, and those
dependent upon a given rendering regime. pixy and pixx are the true internal
pixel geometry, taken directly from the load (and updated by
ncvisual_resize()). cdimy/cdimx are the cell-pixel geometry *at the time
of this call* (it can change with a font change, in which case all values
other than pixy/pixx are invalidated). rpixy/rpixx are the pixel geometry as
handed to the blitter, following any scaling. scaley/scalex are the number
of input pixels drawn to a single cell; when using NCBLIT_PIXEL, they are
equivalent to cdimy/cdimx. rcelly/rcellx are the cell geometry as written by
the blitter, following any padding (there is padding whenever rpix{y, x} is
not evenly divided by scale{y, x}, and also sometimes for Sixel).
maxpixely/maxpixelx are defined only when NCBLIT_PIXEL is used, and specify
the largest bitmap that the terminal is willing to accept. blitter is the
blitter which will be used, a function of the requested blitter and the
blitters actually supported by this environment. if no ncvisual was
supplied, only cdimy/cdimx are filled in.
"""
struct ncvgeom
    pixy::Cuint
    pixx::Cuint
    cdimy::Cuint
    cdimx::Cuint
    rpixy::Cuint
    rpixx::Cuint
    rcelly::Cuint
    rcellx::Cuint
    scaley::Cuint
    scalex::Cuint
    begy::Cuint
    begx::Cuint
    leny::Cuint
    lenx::Cuint
    maxpixely::Cuint
    maxpixelx::Cuint
    blitter::ncblitter_e
end

"""
    ncvisual_geom(nc, n, vopts, geom)

all-purpose ncvisual geometry solver. one or both of 'nc' and 'n' must be
non-NULL. if 'nc' is NULL, only pixy/pixx will be filled in, with the true
pixel geometry of 'n'. if 'n' is NULL, only cdimy/cdimx, blitter,
scaley/scalex, and maxpixely/maxpixelx are filled in. cdimy/cdimx and
maxpixely/maxpixelx are only ever filled in if we know them.
### Prototype
```c
API int ncvisual_geom(const struct notcurses* nc, const struct ncvisual* n, const struct ncvisual_options* vopts, ncvgeom* geom) __attribute__ ((nonnull (4)));
```
"""
function ncvisual_geom(nc, n, vopts, geom)
    @ccall libnotcurses_core.ncvisual_geom(nc::Ptr{notcurses}, n::Ptr{ncvisual}, vopts::Ptr{ncvisual_options}, geom::Ptr{ncvgeom})::Cint
end

"""
    ncvisual_destroy(ncv)

Destroy an ncvisual. Rendered elements will not be disrupted, but the visual
can be neither decoded nor rendered any further.
### Prototype
```c
API void ncvisual_destroy(struct ncvisual* ncv);
```
"""
function ncvisual_destroy(ncv)
    @ccall libnotcurses_core.ncvisual_destroy(ncv::Ptr{ncvisual})::Cvoid
end

"""
    ncvisual_decode(nc)

extract the next frame from an ncvisual. returns 1 on end of file, 0 on
success, and -1 on failure.
### Prototype
```c
API int ncvisual_decode(struct ncvisual* nc) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_decode(nc)
    @ccall libnotcurses_core.ncvisual_decode(nc::Ptr{ncvisual})::Cint
end

"""
    ncvisual_decode_loop(nc)

decode the next frame ala ncvisual_decode(), but if we have reached the end,
rewind to the first frame of the ncvisual. a subsequent 'ncvisual_blit()'
will render the first frame, as if the ncvisual had been closed and reopened.
the return values remain the same as those of ncvisual_decode().
### Prototype
```c
API int ncvisual_decode_loop(struct ncvisual* nc) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_decode_loop(nc)
    @ccall libnotcurses_core.ncvisual_decode_loop(nc::Ptr{ncvisual})::Cint
end

"""
    ncvisual_rotate(n, rads)

Rotate the visual 'rads' radians. Only M_PI/2 and -M_PI/2 are supported at
the moment, but this might change in the future.
### Prototype
```c
API int ncvisual_rotate(struct ncvisual* n, double rads) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_rotate(n, rads)
    @ccall libnotcurses_core.ncvisual_rotate(n::Ptr{ncvisual}, rads::Cdouble)::Cint
end

"""
    ncvisual_resize(n, rows, cols)

Scale the visual to 'rows' X 'columns' pixels, using the best scheme
available. This is a lossy transformation, unless the size is unchanged.
### Prototype
```c
API int ncvisual_resize(struct ncvisual* n, int rows, int cols) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_resize(n, rows, cols)
    @ccall libnotcurses_core.ncvisual_resize(n::Ptr{ncvisual}, rows::Cint, cols::Cint)::Cint
end

"""
    ncvisual_resize_noninterpolative(n, rows, cols)

Scale the visual to 'rows' X 'columns' pixels, using non-interpolative
(naive) scaling. No new colors will be introduced as a result.
### Prototype
```c
API int ncvisual_resize_noninterpolative(struct ncvisual* n, int rows, int cols) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_resize_noninterpolative(n, rows, cols)
    @ccall libnotcurses_core.ncvisual_resize_noninterpolative(n::Ptr{ncvisual}, rows::Cint, cols::Cint)::Cint
end

"""
    ncvisual_polyfill_yx(n, y, x, rgba)

Polyfill at the specified location within the ncvisual 'n', using 'rgba'.
### Prototype
```c
API int ncvisual_polyfill_yx(struct ncvisual* n, unsigned y, unsigned x, uint32_t rgba) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_polyfill_yx(n, y, x, rgba)
    @ccall libnotcurses_core.ncvisual_polyfill_yx(n::Ptr{ncvisual}, y::Cuint, x::Cuint, rgba::UInt32)::Cint
end

"""
    ncvisual_at_yx(n, y, x, pixel)

Get the specified pixel from the specified ncvisual.
### Prototype
```c
API int ncvisual_at_yx(const struct ncvisual* n, unsigned y, unsigned x, uint32_t* pixel) __attribute__ ((nonnull (1, 4)));
```
"""
function ncvisual_at_yx(n, y, x, pixel)
    @ccall libnotcurses_core.ncvisual_at_yx(n::Ptr{ncvisual}, y::Cuint, x::Cuint, pixel::Ptr{UInt32})::Cint
end

"""
    ncvisual_set_yx(n, y, x, pixel)

Set the specified pixel in the specified ncvisual.
### Prototype
```c
API int ncvisual_set_yx(const struct ncvisual* n, unsigned y, unsigned x, uint32_t pixel) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_set_yx(n, y, x, pixel)
    @ccall libnotcurses_core.ncvisual_set_yx(n::Ptr{ncvisual}, y::Cuint, x::Cuint, pixel::UInt32)::Cint
end

"""
    ncvisual_blit(nc, ncv, vopts)

Render the decoded frame according to the provided options (which may be
NULL). The plane used for rendering depends on vopts->n and vopts->flags.
If NCVISUAL_OPTION_CHILDPLANE is set, vopts->n must not be NULL, and the
plane will always be created as a child of vopts->n. If this flag is not
set, and vopts->n is NULL, a new plane is created as root of a new pile.
If the flag is not set and vopts->n is not NULL, we render to vopts->n.
A subregion of the visual can be rendered using 'begx', 'begy', 'lenx', and
'leny'. Negative values for any of these are an error. It is an error to
specify any region beyond the boundaries of the frame. Returns the (possibly
newly-created) plane to which we drew. Pixels may not be blitted to the
standard plane.
### Prototype
```c
API struct ncplane* ncvisual_blit(struct notcurses* nc, struct ncvisual* ncv, const struct ncvisual_options* vopts) __attribute__ ((nonnull (2)));
```
"""
function ncvisual_blit(nc, ncv, vopts)
    @ccall libnotcurses_core.ncvisual_blit(nc::Ptr{notcurses}, ncv::Ptr{ncvisual}, vopts::Ptr{ncvisual_options})::Ptr{ncplane}
end

"""
    ncvisual_subtitle_plane(parent, ncv)

If a subtitle ought be displayed at this time, return a new plane (bound
to 'parent' containing the subtitle, which might be text or graphics
(depending on the input format).
### Prototype
```c
API ALLOC struct ncplane* ncvisual_subtitle_plane(struct ncplane* parent, const struct ncvisual* ncv) __attribute__ ((nonnull (1, 2)));
```
"""
function ncvisual_subtitle_plane(parent, ncv)
    @ccall libnotcurses_core.ncvisual_subtitle_plane(parent::Ptr{ncplane}, ncv::Ptr{ncvisual})::Ptr{ncplane}
end

"""
    ncvisual_media_defblitter(nc, scale)

Get the default *media* (not plot) blitter for this environment when using
the specified scaling method. Currently, this means:
 - if lacking UTF-8, NCBLIT_1x1
 - otherwise, if not NCSCALE_STRETCH, NCBLIT_2x1
 - otherwise, if octants are known to be good, NCBLIT_4x2
 - otherwise, if sextants are not known to be good, NCBLIT_2x2
 - otherwise NCBLIT_3x2
NCBLIT_2x2 and NCBLIT_3x2 both distort the original aspect ratio, thus
NCBLIT_2x1 is used outside of NCSCALE_STRETCH.
### Prototype
```c
API ncblitter_e ncvisual_media_defblitter(const struct notcurses* nc, ncscale_e scale) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_media_defblitter(nc, scale)
    @ccall libnotcurses_core.ncvisual_media_defblitter(nc::Ptr{notcurses}, scale::ncscale_e)::ncblitter_e
end

# typedef int ( * ncstreamcb ) ( struct ncvisual * , struct ncvisual_options * , const struct timespec * , void * )
"""
Called for each frame rendered from 'ncv'. If anything but 0 is returned,
the streaming operation ceases immediately, and that value is propagated out.
The recommended absolute display time target is passed in 'tspec'.
"""
const ncstreamcb = Ptr{Cvoid}

"""
    ncvisual_simple_streamer(ncv, vopts, tspec, curry)

Shut up and display my frames! Provide as an argument to ncvisual_stream().
If you'd like subtitles to be decoded, provide an ncplane as the curry. If the
curry is NULL, subtitles will not be displayed.
### Prototype
```c
API int ncvisual_simple_streamer(struct ncvisual* ncv, struct ncvisual_options* vopts, const struct timespec* tspec, void* curry) __attribute__ ((nonnull (1)));
```
"""
function ncvisual_simple_streamer(ncv, vopts, tspec, curry)
    @ccall libnotcurses_core.ncvisual_simple_streamer(ncv::Ptr{ncvisual}, vopts::Ptr{ncvisual_options}, tspec::Ptr{Cvoid}, curry::Ptr{Cvoid})::Cint
end

"""
    ncvisual_stream(nc, ncv, timescale, streamer, vopts, curry)

Stream the entirety of the media, according to its own timing. Blocking,
obviously. streamer may be NULL; it is otherwise called for each frame, and
its return value handled as outlined for streamcb. If streamer() returns
non-zero, the stream is aborted, and that value is returned. By convention,
return a positive number to indicate intentional abort from within
streamer(). 'timescale' allows the frame duration time to be scaled. For a
visual naturally running at 30FPS, a 'timescale' of 0.1 will result in
300FPS, and a 'timescale' of 10 will result in 3FPS. It is an error to
supply 'timescale' less than or equal to 0.
### Prototype
```c
API int ncvisual_stream(struct notcurses* nc, struct ncvisual* ncv, float timescale, ncstreamcb streamer, const struct ncvisual_options* vopts, void* curry) __attribute__ ((nonnull (1, 2)));
```
"""
function ncvisual_stream(nc, ncv, timescale, streamer, vopts, curry)
    @ccall libnotcurses_core.ncvisual_stream(nc::Ptr{notcurses}, ncv::Ptr{ncvisual}, timescale::Cfloat, streamer::ncstreamcb, vopts::Ptr{ncvisual_options}, curry::Ptr{Cvoid})::Cint
end

"""
    ncblit_rgba(data, linesize, vopts)

Blit a flat array 'data' of RGBA 32-bit values to the ncplane 'vopts->n',
which mustn't be NULL. the blit begins at 'vopts->y' and 'vopts->x' relative
to the specified plane. Each source row ought occupy 'linesize' bytes (this
might be greater than 'vopts->lenx' * 4 due to padding or partial blits). A
subregion of the input can be specified with the 'begy'x'begx' and
'leny'x'lenx' fields from 'vopts'. Returns the number of pixels blitted, or
-1 on error.
### Prototype
```c
API int ncblit_rgba(const void* data, int linesize, const struct ncvisual_options* vopts) __attribute__ ((nonnull (1)));
```
"""
function ncblit_rgba(data, linesize, vopts)
    @ccall libnotcurses_core.ncblit_rgba(data::Ptr{Cvoid}, linesize::Cint, vopts::Ptr{ncvisual_options})::Cint
end

"""
    ncblit_bgrx(data, linesize, vopts)

Same as ncblit_rgba(), but for BGRx.
### Prototype
```c
API int ncblit_bgrx(const void* data, int linesize, const struct ncvisual_options* vopts) __attribute__ ((nonnull (1)));
```
"""
function ncblit_bgrx(data, linesize, vopts)
    @ccall libnotcurses_core.ncblit_bgrx(data::Ptr{Cvoid}, linesize::Cint, vopts::Ptr{ncvisual_options})::Cint
end

"""
    ncblit_rgb_packed(data, linesize, vopts, alpha)

Supply an alpha value [0..255] to be applied throughout.
### Prototype
```c
API int ncblit_rgb_packed(const void* data, int linesize, const struct ncvisual_options* vopts, int alpha) __attribute__ ((nonnull (1)));
```
"""
function ncblit_rgb_packed(data, linesize, vopts, alpha)
    @ccall libnotcurses_core.ncblit_rgb_packed(data::Ptr{Cvoid}, linesize::Cint, vopts::Ptr{ncvisual_options}, alpha::Cint)::Cint
end

"""
    ncblit_rgb_loose(data, linesize, vopts, alpha)

Supply an alpha value [0..255] to be applied throughout. linesize must be
a multiple of 4 for this RGBx data.
### Prototype
```c
API int ncblit_rgb_loose(const void* data, int linesize, const struct ncvisual_options* vopts, int alpha) __attribute__ ((nonnull (1)));
```
"""
function ncblit_rgb_loose(data, linesize, vopts, alpha)
    @ccall libnotcurses_core.ncblit_rgb_loose(data::Ptr{Cvoid}, linesize::Cint, vopts::Ptr{ncvisual_options}, alpha::Cint)::Cint
end

struct ncreel_options
    bordermask::Cuint
    borderchan::UInt64
    tabletmask::Cuint
    tabletchan::UInt64
    focusedchan::UInt64
    flags::UInt64
end

"""
    ncreel_create(n, popts)

Take over the ncplane 'nc' and use it to draw a reel according to 'popts'.
The plane will be destroyed by ncreel_destroy(); this transfers ownership.
### Prototype
```c
API ALLOC struct ncreel* ncreel_create(struct ncplane* n, const ncreel_options* popts) __attribute__ ((nonnull (1)));
```
"""
function ncreel_create(n, popts)
    @ccall libnotcurses_core.ncreel_create(n::Ptr{ncplane}, popts::Ptr{ncreel_options})::Ptr{ncreel}
end

"""
    ncreel_plane(nr)

Returns the ncplane on which this ncreel lives.
### Prototype
```c
API struct ncplane* ncreel_plane(struct ncreel* nr) __attribute__ ((nonnull (1)));
```
"""
function ncreel_plane(nr)
    @ccall libnotcurses_core.ncreel_plane(nr::Ptr{ncreel})::Ptr{ncplane}
end

# typedef int ( * tabletcb ) ( struct nctablet * t , bool drawfromtop )
"""
Tablet draw callback, provided a tablet (from which the ncplane and userptr
may be extracted), and a bool indicating whether output ought be drawn from
the top (true) or bottom (false). Returns non-negative count of output lines,
which must be less than or equal to ncplane_dim_y(nctablet_plane(t)).
"""
const tabletcb = Ptr{Cvoid}

"""
    ncreel_add(nr, after, before, cb, opaque)

Add a new nctablet to the provided ncreel 'nr', having the callback object
'opaque'. Neither, either, or both of 'after' and 'before' may be specified.
If neither is specified, the new tablet can be added anywhere on the reel.
If one or the other is specified, the tablet will be added before or after
the specified tablet. If both are specified, the tablet will be added to the
resulting location, assuming it is valid (after->next == before->prev); if
it is not valid, or there is any other error, NULL will be returned.
### Prototype
```c
API ALLOC struct nctablet* ncreel_add(struct ncreel* nr, struct nctablet* after, struct nctablet* before, tabletcb cb, void* opaque) __attribute__ ((nonnull (1)));
```
"""
function ncreel_add(nr, after, before, cb, opaque)
    @ccall libnotcurses_core.ncreel_add(nr::Ptr{ncreel}, after::Ptr{nctablet}, before::Ptr{nctablet}, cb::tabletcb, opaque::Ptr{Cvoid})::Ptr{nctablet}
end

"""
    ncreel_tabletcount(nr)

Return the number of nctablets in the ncreel 'nr'.
### Prototype
```c
API int ncreel_tabletcount(const struct ncreel* nr) __attribute__ ((nonnull (1)));
```
"""
function ncreel_tabletcount(nr)
    @ccall libnotcurses_core.ncreel_tabletcount(nr::Ptr{ncreel})::Cint
end

"""
    ncreel_del(nr, t)

Delete the tablet specified by t from the ncreel 'nr'. Returns -1 if the
tablet cannot be found.
### Prototype
```c
API int ncreel_del(struct ncreel* nr, struct nctablet* t) __attribute__ ((nonnull (1)));
```
"""
function ncreel_del(nr, t)
    @ccall libnotcurses_core.ncreel_del(nr::Ptr{ncreel}, t::Ptr{nctablet})::Cint
end

"""
    ncreel_redraw(nr)

Redraw the ncreel 'nr' in its entirety. The reel will be cleared, and
tablets will be lain out, using the focused tablet as a fulcrum. Tablet
drawing callbacks will be invoked for each visible tablet.
### Prototype
```c
API int ncreel_redraw(struct ncreel* nr) __attribute__ ((nonnull (1)));
```
"""
function ncreel_redraw(nr)
    @ccall libnotcurses_core.ncreel_redraw(nr::Ptr{ncreel})::Cint
end

"""
    ncreel_offer_input(nr, ni)

Offer input 'ni' to the ncreel 'nr'. If it's relevant, this function returns
true, and the input ought not be processed further. If it's irrelevant to
the reel, false is returned. Relevant inputs include:
 * a mouse click on a tablet (focuses tablet)
 * a mouse scrollwheel event (rolls reel)
* up, down, pgup, or pgdown (navigates among items)
### Prototype
```c
API bool ncreel_offer_input(struct ncreel* nr, const ncinput* ni) __attribute__ ((nonnull (1, 2)));
```
"""
function ncreel_offer_input(nr, ni)
    @ccall libnotcurses_core.ncreel_offer_input(nr::Ptr{ncreel}, ni::Ptr{ncinput})::Bool
end

"""
    ncreel_focused(nr)

Return the focused tablet, if any tablets are present. This is not a copy;
be careful to use it only for the duration of a critical section.
### Prototype
```c
API struct nctablet* ncreel_focused(struct ncreel* nr) __attribute__ ((nonnull (1)));
```
"""
function ncreel_focused(nr)
    @ccall libnotcurses_core.ncreel_focused(nr::Ptr{ncreel})::Ptr{nctablet}
end

"""
    ncreel_next(nr)

Change focus to the next tablet, if one exists
### Prototype
```c
API struct nctablet* ncreel_next(struct ncreel* nr) __attribute__ ((nonnull (1)));
```
"""
function ncreel_next(nr)
    @ccall libnotcurses_core.ncreel_next(nr::Ptr{ncreel})::Ptr{nctablet}
end

"""
    ncreel_prev(nr)

Change focus to the previous tablet, if one exists
### Prototype
```c
API struct nctablet* ncreel_prev(struct ncreel* nr) __attribute__ ((nonnull (1)));
```
"""
function ncreel_prev(nr)
    @ccall libnotcurses_core.ncreel_prev(nr::Ptr{ncreel})::Ptr{nctablet}
end

"""
    ncreel_destroy(nr)

Destroy an ncreel allocated with ncreel_create().
### Prototype
```c
API void ncreel_destroy(struct ncreel* nr);
```
"""
function ncreel_destroy(nr)
    @ccall libnotcurses_core.ncreel_destroy(nr::Ptr{ncreel})::Cvoid
end

"""
    nctablet_userptr(t)

Returns a pointer to a user pointer associated with this nctablet.
### Prototype
```c
API void* nctablet_userptr(struct nctablet* t);
```
"""
function nctablet_userptr(t)
    @ccall libnotcurses_core.nctablet_userptr(t::Ptr{nctablet})::Ptr{Cvoid}
end

"""
    nctablet_plane(t)

Access the ncplane associated with nctablet 't', if one exists.
### Prototype
```c
API struct ncplane* nctablet_plane(struct nctablet* t);
```
"""
function nctablet_plane(t)
    @ccall libnotcurses_core.nctablet_plane(t::Ptr{nctablet})::Ptr{ncplane}
end

"""
    ncnmetric(val, s, decimal, buf, omitdec, mult, uprefix)

snprintf(3) is used internally, with 's' as its size bound. If the output
requires more size than is available, NULL will be returned.

Floating-point is never used, because an IEEE758 double can only losslessly
represent integers through 2^53-1.

2^64-1 is 18446744073709551615, 18.45E(xa). KMGTPEZY thus suffice to handle
an 89-bit uintmax_t. Beyond Z(etta) and Y(otta) lie lands unspecified by SI.
2^-63 is 0.000000000000000000108, 1.08a(tto).
val: value to print
s: maximum output size; see snprintf(3)
decimal: scaling. '1' if none has taken place.
buf: buffer in which string will be generated
omitdec: inhibit printing of all-0 decimal portions
mult: base of suffix system (almost always 1000 or 1024)
uprefix: character to print following suffix ('i' for kibibytes basically).
  only printed if suffix is actually printed (input >= mult).

You are encouraged to consult notcurses_metric(3).
### Prototype
```c
API const char* ncnmetric(uintmax_t val, size_t s, uintmax_t decimal, char* buf, int omitdec, uintmax_t mult, int uprefix) __attribute__ ((nonnull (4)));
```
"""
function ncnmetric(val, s, decimal, buf, omitdec, mult, uprefix)
    @ccall libnotcurses_core.ncnmetric(val::uintmax_t, s::Csize_t, decimal::uintmax_t, buf::Ptr{Cchar}, omitdec::Cint, mult::uintmax_t, uprefix::Cint)::Ptr{Cchar}
end

"""
    notcurses_default_foreground(nc, fg)

Get the default foreground color, if it is known. Returns -1 on error
(unknown foreground). On success, returns 0, writing the RGB value to
'fg' (if non-NULL)
### Prototype
```c
API int notcurses_default_foreground(const struct notcurses* nc, uint32_t* fg) __attribute__ ((nonnull (1)));
```
"""
function notcurses_default_foreground(nc, fg)
    @ccall libnotcurses_core.notcurses_default_foreground(nc::Ptr{notcurses}, fg::Ptr{UInt32})::Cint
end

"""
    notcurses_default_background(nc, bg)

Get the default background color, if it is known. Returns -1 on error
(unknown background). On success, returns 0, writing the RGB value to
'bg' (if non-NULL) and setting 'bgtrans' high iff the background color
is treated as transparent.
### Prototype
```c
API int notcurses_default_background(const struct notcurses* nc, uint32_t* bg) __attribute__ ((nonnull (1)));
```
"""
function notcurses_default_background(nc, bg)
    @ccall libnotcurses_core.notcurses_default_background(nc::Ptr{notcurses}, bg::Ptr{UInt32})::Cint
end

"""
    notcurses_cursor_enable(nc, y, x)

Enable or disable the terminal's cursor, if supported, placing it at
'y', 'x'. Immediate effect (no need for a call to notcurses_render()).
It is an error if 'y', 'x' lies outside the standard plane. Can be
called while already visible to move the cursor.
### Prototype
```c
API int notcurses_cursor_enable(struct notcurses* nc, int y, int x) __attribute__ ((nonnull (1)));
```
"""
function notcurses_cursor_enable(nc, y, x)
    @ccall libnotcurses_core.notcurses_cursor_enable(nc::Ptr{notcurses}, y::Cint, x::Cint)::Cint
end

"""
    notcurses_cursor_disable(nc)

Disable the hardware cursor. It is an error to call this while the
cursor is already disabled.
### Prototype
```c
API int notcurses_cursor_disable(struct notcurses* nc) __attribute__ ((nonnull (1)));
```
"""
function notcurses_cursor_disable(nc)
    @ccall libnotcurses_core.notcurses_cursor_disable(nc::Ptr{notcurses})::Cint
end

"""
    notcurses_cursor_yx(nc, y, x)

Get the current location of the terminal's cursor, whether visible or not.
### Prototype
```c
API int notcurses_cursor_yx(const struct notcurses* nc, int* y, int* x) __attribute__ ((nonnull (1)));
```
"""
function notcurses_cursor_yx(nc, y, x)
    @ccall libnotcurses_core.notcurses_cursor_yx(nc::Ptr{notcurses}, y::Ptr{Cint}, x::Ptr{Cint})::Cint
end

"""
    ncplane_greyscale(n)

Convert the plane's content to greyscale.
### Prototype
```c
API void ncplane_greyscale(struct ncplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncplane_greyscale(n)
    @ccall libnotcurses_core.ncplane_greyscale(n::Ptr{ncplane})::Cvoid
end

"""
    ncselector_item

selection widget -- an ncplane with a title header and a body section. the
body section supports infinite scrolling up and down.

At all times, exactly one item is selected.
"""
struct ncselector_item
    option::Ptr{Cchar}
    desc::Ptr{Cchar}
end

struct ncselector_options
    title::Ptr{Cchar}
    secondary::Ptr{Cchar}
    footer::Ptr{Cchar}
    items::Ptr{ncselector_item}
    defidx::Cuint
    maxdisplay::Cuint
    opchannels::UInt64
    descchannels::UInt64
    titlechannels::UInt64
    footchannels::UInt64
    boxchannels::UInt64
    flags::UInt64
end

"""
    ncselector_create(n, opts)


### Prototype
```c
API ALLOC struct ncselector* ncselector_create(struct ncplane* n, const ncselector_options* opts) __attribute__ ((nonnull (1)));
```
"""
function ncselector_create(n, opts)
    @ccall libnotcurses_core.ncselector_create(n::Ptr{ncplane}, opts::Ptr{ncselector_options})::Ptr{ncselector}
end

"""
    ncselector_additem(n, item)

Dynamically add or delete items. It is usually sufficient to supply a static
list of items via ncselector_options->items.
### Prototype
```c
API int ncselector_additem(struct ncselector* n, const struct ncselector_item* item);
```
"""
function ncselector_additem(n, item)
    @ccall libnotcurses_core.ncselector_additem(n::Ptr{ncselector}, item::Ptr{ncselector_item})::Cint
end

"""
    ncselector_delitem(n, item)


### Prototype
```c
API int ncselector_delitem(struct ncselector* n, const char* item);
```
"""
function ncselector_delitem(n, item)
    @ccall libnotcurses_core.ncselector_delitem(n::Ptr{ncselector}, item::Ptr{Cchar})::Cint
end

"""
    ncselector_selected(n)

Return reference to the selected option, or NULL if there are no items.
### Prototype
```c
API const char* ncselector_selected(const struct ncselector* n) __attribute__ ((nonnull (1)));
```
"""
function ncselector_selected(n)
    @ccall libnotcurses_core.ncselector_selected(n::Ptr{ncselector})::Ptr{Cchar}
end

"""
    ncselector_plane(n)

Return a reference to the ncselector's underlying ncplane.
### Prototype
```c
API struct ncplane* ncselector_plane(struct ncselector* n) __attribute__ ((nonnull (1)));
```
"""
function ncselector_plane(n)
    @ccall libnotcurses_core.ncselector_plane(n::Ptr{ncselector})::Ptr{ncplane}
end

"""
    ncselector_previtem(n)

Move up or down in the list. A reference to the newly-selected item is
returned, or NULL if there are no items in the list.
### Prototype
```c
API const char* ncselector_previtem(struct ncselector* n) __attribute__ ((nonnull (1)));
```
"""
function ncselector_previtem(n)
    @ccall libnotcurses_core.ncselector_previtem(n::Ptr{ncselector})::Ptr{Cchar}
end

"""
    ncselector_nextitem(n)


### Prototype
```c
API const char* ncselector_nextitem(struct ncselector* n) __attribute__ ((nonnull (1)));
```
"""
function ncselector_nextitem(n)
    @ccall libnotcurses_core.ncselector_nextitem(n::Ptr{ncselector})::Ptr{Cchar}
end

"""
    ncselector_offer_input(n, nc)

Offer the input to the ncselector. If it's relevant, this function returns
true, and the input ought not be processed further. If it's irrelevant to
the selector, false is returned. Relevant inputs include:
 * a mouse click on an item
 * a mouse scrollwheel event
 * a mouse click on the scrolling arrows
* up, down, pgup, or pgdown on an unrolled menu (navigates among items)
### Prototype
```c
API bool ncselector_offer_input(struct ncselector* n, const ncinput* nc) __attribute__ ((nonnull (1, 2)));
```
"""
function ncselector_offer_input(n, nc)
    @ccall libnotcurses_core.ncselector_offer_input(n::Ptr{ncselector}, nc::Ptr{ncinput})::Bool
end

"""
    ncselector_destroy(n, item)

Destroy the ncselector.
### Prototype
```c
API void ncselector_destroy(struct ncselector* n, char** item);
```
"""
function ncselector_destroy(n, item)
    @ccall libnotcurses_core.ncselector_destroy(n::Ptr{ncselector}, item::Ptr{Ptr{Cchar}})::Cvoid
end

struct ncmselector_item
    option::Ptr{Cchar}
    desc::Ptr{Cchar}
    selected::Bool
end

"""
    ncmultiselector_options

multiselection widget -- a selector supporting multiple selections.

Unlike the selector widget, zero to all of the items can be selected, but
also the widget does not support adding or removing items at runtime.
"""
struct ncmultiselector_options
    title::Ptr{Cchar}
    secondary::Ptr{Cchar}
    footer::Ptr{Cchar}
    items::Ptr{ncmselector_item}
    maxdisplay::Cuint
    opchannels::UInt64
    descchannels::UInt64
    titlechannels::UInt64
    footchannels::UInt64
    boxchannels::UInt64
    flags::UInt64
end

"""
    ncmultiselector_create(n, opts)


### Prototype
```c
API ALLOC struct ncmultiselector* ncmultiselector_create(struct ncplane* n, const ncmultiselector_options* opts) __attribute__ ((nonnull (1)));
```
"""
function ncmultiselector_create(n, opts)
    @ccall libnotcurses_core.ncmultiselector_create(n::Ptr{ncplane}, opts::Ptr{ncmultiselector_options})::Ptr{ncmultiselector}
end

"""
    ncmultiselector_selected(n, selected, count)

Return selected vector. An array of bools must be provided, along with its
length. If that length doesn't match the itemcount, it is an error.
### Prototype
```c
API int ncmultiselector_selected(struct ncmultiselector* n, bool* selected, unsigned count);
```
"""
function ncmultiselector_selected(n, selected, count)
    @ccall libnotcurses_core.ncmultiselector_selected(n::Ptr{ncmultiselector}, selected::Ptr{Bool}, count::Cuint)::Cint
end

"""
    ncmultiselector_plane(n)

Return a reference to the ncmultiselector's underlying ncplane.
### Prototype
```c
API struct ncplane* ncmultiselector_plane(struct ncmultiselector* n);
```
"""
function ncmultiselector_plane(n)
    @ccall libnotcurses_core.ncmultiselector_plane(n::Ptr{ncmultiselector})::Ptr{ncplane}
end

"""
    ncmultiselector_offer_input(n, nc)

Offer the input to the ncmultiselector. If it's relevant, this function
returns true, and the input ought not be processed further. If it's
irrelevant to the multiselector, false is returned. Relevant inputs include:
 * a mouse click on an item
 * a mouse scrollwheel event
 * a mouse click on the scrolling arrows
* up, down, pgup, or pgdown on an unrolled menu (navigates among items)
### Prototype
```c
API bool ncmultiselector_offer_input(struct ncmultiselector* n, const ncinput* nc) __attribute__ ((nonnull (1, 2)));
```
"""
function ncmultiselector_offer_input(n, nc)
    @ccall libnotcurses_core.ncmultiselector_offer_input(n::Ptr{ncmultiselector}, nc::Ptr{ncinput})::Bool
end

"""
    ncmultiselector_destroy(n)

Destroy the ncmultiselector.
### Prototype
```c
API void ncmultiselector_destroy(struct ncmultiselector* n);
```
"""
function ncmultiselector_destroy(n)
    @ccall libnotcurses_core.ncmultiselector_destroy(n::Ptr{ncmultiselector})::Cvoid
end

"""
    nctree_item

each item has a curry, and zero or more subitems.
"""
struct nctree_item
    curry::Ptr{Cvoid}
    subs::Ptr{nctree_item}
    subcount::Cuint
end

struct nctree_options
    items::Ptr{nctree_item}
    count::Cuint
    nctreecb::Ptr{Cvoid}
    indentcols::Cint
    flags::UInt64
end

mutable struct nctree end

"""
    nctree_create(n, opts)

|opts| may *not* be NULL, since it is necessary to define a callback
function.
### Prototype
```c
API ALLOC struct nctree* nctree_create(struct ncplane* n, const nctree_options* opts) __attribute__ ((nonnull (1, 2)));
```
"""
function nctree_create(n, opts)
    @ccall libnotcurses_core.nctree_create(n::Ptr{ncplane}, opts::Ptr{nctree_options})::Ptr{nctree}
end

"""
    nctree_plane(n)

Returns the ncplane on which this nctree lives.
### Prototype
```c
API struct ncplane* nctree_plane(struct nctree* n) __attribute__ ((nonnull (1)));
```
"""
function nctree_plane(n)
    @ccall libnotcurses_core.nctree_plane(n::Ptr{nctree})::Ptr{ncplane}
end

"""
    nctree_redraw(n)

Redraw the nctree 'n' in its entirety. The tree will be cleared, and items
will be lain out, using the focused item as a fulcrum. Item-drawing
callbacks will be invoked for each visible item.
### Prototype
```c
API int nctree_redraw(struct nctree* n) __attribute__ ((nonnull (1)));
```
"""
function nctree_redraw(n)
    @ccall libnotcurses_core.nctree_redraw(n::Ptr{nctree})::Cint
end

"""
    nctree_offer_input(n, ni)

Offer input 'ni' to the nctree 'n'. If it's relevant, this function returns
true, and the input ought not be processed further. If it's irrelevant to
the tree, false is returned. Relevant inputs include:
 * a mouse click on an item (focuses item)
 * a mouse scrollwheel event (srolls tree)
* up, down, pgup, or pgdown (navigates among items)
### Prototype
```c
API bool nctree_offer_input(struct nctree* n, const ncinput* ni) __attribute__ ((nonnull (1, 2)));
```
"""
function nctree_offer_input(n, ni)
    @ccall libnotcurses_core.nctree_offer_input(n::Ptr{nctree}, ni::Ptr{ncinput})::Bool
end

"""
    nctree_focused(n)

Return the focused item, if any items are present. This is not a copy;
be careful to use it only for the duration of a critical section.
### Prototype
```c
API void* nctree_focused(struct nctree* n) __attribute__ ((nonnull (1)));
```
"""
function nctree_focused(n)
    @ccall libnotcurses_core.nctree_focused(n::Ptr{nctree})::Ptr{Cvoid}
end

"""
    nctree_next(n)

Change focus to the next item.
### Prototype
```c
API void* nctree_next(struct nctree* n) __attribute__ ((nonnull (1)));
```
"""
function nctree_next(n)
    @ccall libnotcurses_core.nctree_next(n::Ptr{nctree})::Ptr{Cvoid}
end

"""
    nctree_prev(n)

Change focus to the previous item.
### Prototype
```c
API void* nctree_prev(struct nctree* n) __attribute__ ((nonnull (1)));
```
"""
function nctree_prev(n)
    @ccall libnotcurses_core.nctree_prev(n::Ptr{nctree})::Ptr{Cvoid}
end

"""
    nctree_goto(n, spec, failspec)

Go to the item specified by the array |spec| (a spec is a series of unsigned
values, each identifying a subelement in the hierarchy thus far, terminated
by UINT_MAX). If the spec is invalid, NULL is returned, and the depth of the
first invalid spec is written to *|failspec|. Otherwise, the true depth is
written to *|failspec|, and the curry is returned (|failspec| is necessary
because the curry could itself be NULL).
### Prototype
```c
API void* nctree_goto(struct nctree* n, const unsigned* spec, int* failspec);
```
"""
function nctree_goto(n, spec, failspec)
    @ccall libnotcurses_core.nctree_goto(n::Ptr{nctree}, spec::Ptr{Cuint}, failspec::Ptr{Cint})::Ptr{Cvoid}
end

"""
    nctree_add(n, spec, add)

Insert |add| into the nctree |n| at |spec|. The path up to the last element
must already exist. If an item already exists at the path, it will be moved
to make room for |add|.
### Prototype
```c
API int nctree_add(struct nctree* n, const unsigned* spec, const struct nctree_item* add) __attribute__ ((nonnull (1, 2, 3)));
```
"""
function nctree_add(n, spec, add)
    @ccall libnotcurses_core.nctree_add(n::Ptr{nctree}, spec::Ptr{Cuint}, add::Ptr{nctree_item})::Cint
end

"""
    nctree_del(n, spec)

Delete the item at |spec|, including any subitems.
### Prototype
```c
API int nctree_del(struct nctree* n, const unsigned* spec) __attribute__ ((nonnull (1, 2)));
```
"""
function nctree_del(n, spec)
    @ccall libnotcurses_core.nctree_del(n::Ptr{nctree}, spec::Ptr{Cuint})::Cint
end

"""
    nctree_destroy(n)

Destroy the nctree.
### Prototype
```c
API void nctree_destroy(struct nctree* n);
```
"""
function nctree_destroy(n)
    @ccall libnotcurses_core.nctree_destroy(n::Ptr{nctree})::Cvoid
end

"""
    ncmenu_item

Menus. Horizontal menu bars are supported, on the top and/or bottom rows.
If the menu bar is longer than the screen, it will be only partially
visible. Menus may be either visible or invisible by default. In the event of
a plane resize, menus will be automatically moved/resized. Elements can be
dynamically enabled or disabled at all levels (menu, section, and item),
"""
struct ncmenu_item
    desc::Ptr{Cchar}
    shortcut::ncinput
end

struct ncmenu_section
    name::Ptr{Cchar}
    itemcount::Cint
    items::Ptr{ncmenu_item}
    shortcut::ncinput
end

struct ncmenu_options
    sections::Ptr{ncmenu_section}
    sectioncount::Cint
    headerchannels::UInt64
    sectionchannels::UInt64
    flags::UInt64
end

mutable struct ncmenu end

"""
    ncmenu_create(n, opts)

Create a menu with the specified options, bound to the specified plane.
### Prototype
```c
API ALLOC struct ncmenu* ncmenu_create(struct ncplane* n, const ncmenu_options* opts) __attribute__ ((nonnull (1)));
```
"""
function ncmenu_create(n, opts)
    @ccall libnotcurses_core.ncmenu_create(n::Ptr{ncplane}, opts::Ptr{ncmenu_options})::Ptr{ncmenu}
end

"""
    ncmenu_unroll(n, sectionidx)

Unroll the specified menu section, making the menu visible if it was
invisible, and rolling up any menu section that is already unrolled.
### Prototype
```c
API int ncmenu_unroll(struct ncmenu* n, int sectionidx);
```
"""
function ncmenu_unroll(n, sectionidx)
    @ccall libnotcurses_core.ncmenu_unroll(n::Ptr{ncmenu}, sectionidx::Cint)::Cint
end

"""
    ncmenu_rollup(n)

Roll up any unrolled menu section, and hide the menu if using hiding.
### Prototype
```c
API int ncmenu_rollup(struct ncmenu* n) __attribute__ ((nonnull (1)));
```
"""
function ncmenu_rollup(n)
    @ccall libnotcurses_core.ncmenu_rollup(n::Ptr{ncmenu})::Cint
end

"""
    ncmenu_nextsection(n)

Unroll the previous/next section (relative to current unrolled). If no
section is unrolled, the first section will be unrolled.
### Prototype
```c
API int ncmenu_nextsection(struct ncmenu* n) __attribute__ ((nonnull (1)));
```
"""
function ncmenu_nextsection(n)
    @ccall libnotcurses_core.ncmenu_nextsection(n::Ptr{ncmenu})::Cint
end

"""
    ncmenu_prevsection(n)


### Prototype
```c
API int ncmenu_prevsection(struct ncmenu* n) __attribute__ ((nonnull (1)));
```
"""
function ncmenu_prevsection(n)
    @ccall libnotcurses_core.ncmenu_prevsection(n::Ptr{ncmenu})::Cint
end

"""
    ncmenu_nextitem(n)

Move to the previous/next item within the currently unrolled section. If no
section is unrolled, the first section will be unrolled.
### Prototype
```c
API int ncmenu_nextitem(struct ncmenu* n) __attribute__ ((nonnull (1)));
```
"""
function ncmenu_nextitem(n)
    @ccall libnotcurses_core.ncmenu_nextitem(n::Ptr{ncmenu})::Cint
end

"""
    ncmenu_previtem(n)


### Prototype
```c
API int ncmenu_previtem(struct ncmenu* n) __attribute__ ((nonnull (1)));
```
"""
function ncmenu_previtem(n)
    @ccall libnotcurses_core.ncmenu_previtem(n::Ptr{ncmenu})::Cint
end

"""
    ncmenu_item_set_status(n, section, item, enabled)

Disable or enable a menu item. Returns 0 if the item was found.
### Prototype
```c
API int ncmenu_item_set_status(struct ncmenu* n, const char* section, const char* item, bool enabled);
```
"""
function ncmenu_item_set_status(n, section, item, enabled)
    @ccall libnotcurses_core.ncmenu_item_set_status(n::Ptr{ncmenu}, section::Ptr{Cchar}, item::Ptr{Cchar}, enabled::Bool)::Cint
end

"""
    ncmenu_selected(n, ni)

Return the selected item description, or NULL if no section is unrolled. If
'ni' is not NULL, and the selected item has a shortcut, 'ni' will be filled
in with that shortcut--this can allow faster matching.
### Prototype
```c
API const char* ncmenu_selected(const struct ncmenu* n, ncinput* ni);
```
"""
function ncmenu_selected(n, ni)
    @ccall libnotcurses_core.ncmenu_selected(n::Ptr{ncmenu}, ni::Ptr{ncinput})::Ptr{Cchar}
end

"""
    ncmenu_mouse_selected(n, click, ni)

Return the item description corresponding to the mouse click 'click'. The
item must be on an actively unrolled section, and the click must be in the
area of a valid item. If 'ni' is not NULL, and the selected item has a
shortcut, 'ni' will be filled in with the shortcut.
### Prototype
```c
API const char* ncmenu_mouse_selected(const struct ncmenu* n, const ncinput* click, ncinput* ni);
```
"""
function ncmenu_mouse_selected(n, click, ni)
    @ccall libnotcurses_core.ncmenu_mouse_selected(n::Ptr{ncmenu}, click::Ptr{ncinput}, ni::Ptr{ncinput})::Ptr{Cchar}
end

"""
    ncmenu_plane(n)

Return the ncplane backing this ncmenu.
### Prototype
```c
API struct ncplane* ncmenu_plane(struct ncmenu* n);
```
"""
function ncmenu_plane(n)
    @ccall libnotcurses_core.ncmenu_plane(n::Ptr{ncmenu})::Ptr{ncplane}
end

"""
    ncmenu_offer_input(n, nc)

Offer the input to the ncmenu. If it's relevant, this function returns true,
and the input ought not be processed further. If it's irrelevant to the
menu, false is returned. Relevant inputs include:
 * mouse movement over a hidden menu
 * a mouse click on a menu section (the section is unrolled)
 * a mouse click outside of an unrolled menu (the menu is rolled up)
 * left or right on an unrolled menu (navigates among sections)
 * up or down on an unrolled menu (navigates among items)
* escape on an unrolled menu (the menu is rolled up)
### Prototype
```c
API bool ncmenu_offer_input(struct ncmenu* n, const ncinput* nc) __attribute__ ((nonnull (1, 2)));
```
"""
function ncmenu_offer_input(n, nc)
    @ccall libnotcurses_core.ncmenu_offer_input(n::Ptr{ncmenu}, nc::Ptr{ncinput})::Bool
end

"""
    ncmenu_destroy(n)

Destroy a menu created with ncmenu_create().
### Prototype
```c
API void ncmenu_destroy(struct ncmenu* n);
```
"""
function ncmenu_destroy(n)
    @ccall libnotcurses_core.ncmenu_destroy(n::Ptr{ncmenu})::Cvoid
end

struct ncprogbar_options
    ulchannel::UInt32
    urchannel::UInt32
    blchannel::UInt32
    brchannel::UInt32
    flags::UInt64
end

"""
    ncprogbar_create(n, opts)

Takes ownership of the ncplane 'n', which will be destroyed by
ncprogbar_destroy(). The progress bar is initially at 0%.
### Prototype
```c
API ALLOC struct ncprogbar* ncprogbar_create(struct ncplane* n, const ncprogbar_options* opts) __attribute__ ((nonnull (1)));
```
"""
function ncprogbar_create(n, opts)
    @ccall libnotcurses_core.ncprogbar_create(n::Ptr{ncplane}, opts::Ptr{ncprogbar_options})::Ptr{ncprogbar}
end

"""
    ncprogbar_plane(n)

Return a reference to the ncprogbar's underlying ncplane.
### Prototype
```c
API struct ncplane* ncprogbar_plane(struct ncprogbar* n) __attribute__ ((nonnull (1)));
```
"""
function ncprogbar_plane(n)
    @ccall libnotcurses_core.ncprogbar_plane(n::Ptr{ncprogbar})::Ptr{ncplane}
end

"""
    ncprogbar_set_progress(n, p)

Set the progress bar's completion, a double 0 <= 'p' <= 1.
### Prototype
```c
API int ncprogbar_set_progress(struct ncprogbar* n, double p) __attribute__ ((nonnull (1)));
```
"""
function ncprogbar_set_progress(n, p)
    @ccall libnotcurses_core.ncprogbar_set_progress(n::Ptr{ncprogbar}, p::Cdouble)::Cint
end

"""
    ncprogbar_progress(n)

Get the progress bar's completion, a double on [0, 1].
### Prototype
```c
API double ncprogbar_progress(const struct ncprogbar* n) __attribute__ ((nonnull (1)));
```
"""
function ncprogbar_progress(n)
    @ccall libnotcurses_core.ncprogbar_progress(n::Ptr{ncprogbar})::Cdouble
end

"""
    ncprogbar_destroy(n)

Destroy the progress bar and its underlying ncplane.
### Prototype
```c
API void ncprogbar_destroy(struct ncprogbar* n);
```
"""
function ncprogbar_destroy(n)
    @ccall libnotcurses_core.ncprogbar_destroy(n::Ptr{ncprogbar})::Cvoid
end

struct nctabbed_options
    selchan::UInt64
    hdrchan::UInt64
    sepchan::UInt64
    separator::Ptr{Cchar}
    flags::UInt64
end

# typedef void ( * tabcb ) ( struct nctab * t , struct ncplane * ncp , void * curry )
"""
Tab content drawing callback. Takes the tab it was associated to, the ncplane
on which tab content is to be drawn, and the user pointer of the tab.
It is called during nctabbed_redraw().
"""
const tabcb = Ptr{Cvoid}

"""
    nctabbed_create(n, opts)

Creates a new nctabbed widget, associated with the given ncplane 'n', and with
additional options given in 'opts'. When 'opts' is NULL, it acts as if it were
called with an all-zero opts. The widget takes ownership of 'n', and destroys
it when the widget is destroyed. Returns the newly created widget. Returns
NULL on failure, also destroying 'n'.
### Prototype
```c
API ALLOC struct nctabbed* nctabbed_create(struct ncplane* n, const nctabbed_options* opts) __attribute ((nonnull (1)));
```
"""
function nctabbed_create(n, opts)
    @ccall libnotcurses_core.nctabbed_create(n::Ptr{ncplane}, opts::Ptr{nctabbed_options})::Ptr{nctabbed}
end

"""
    nctabbed_destroy(nt)

Destroy an nctabbed widget. All memory belonging to 'nt' is deallocated,
including all tabs and their names. The plane associated with 'nt' is also
destroyed. Calling this with NULL does nothing.
### Prototype
```c
API void nctabbed_destroy(struct nctabbed* nt);
```
"""
function nctabbed_destroy(nt)
    @ccall libnotcurses_core.nctabbed_destroy(nt::Ptr{nctabbed})::Cvoid
end

"""
    nctabbed_redraw(nt)

Redraw the widget. This calls the tab callback of the currently selected tab
to draw tab contents, and draws tab headers. The tab content plane is not
modified by this function, apart from resizing the plane is necessary.
### Prototype
```c
API void nctabbed_redraw(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_redraw(nt)
    @ccall libnotcurses_core.nctabbed_redraw(nt::Ptr{nctabbed})::Cvoid
end

"""
    nctabbed_ensure_selected_header_visible(nt)

Make sure the tab header of the currently selected tab is at least partially
visible. (by rotating tabs until at least one column is displayed)
Does nothing if there are no tabs.
### Prototype
```c
API void nctabbed_ensure_selected_header_visible(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_ensure_selected_header_visible(nt)
    @ccall libnotcurses_core.nctabbed_ensure_selected_header_visible(nt::Ptr{nctabbed})::Cvoid
end

"""
    nctabbed_selected(nt)

Returns the currently selected tab, or NULL if there are no tabs.
### Prototype
```c
API struct nctab* nctabbed_selected(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_selected(nt)
    @ccall libnotcurses_core.nctabbed_selected(nt::Ptr{nctabbed})::Ptr{nctab}
end

"""
    nctabbed_leftmost(nt)

Returns the leftmost tab, or NULL if there are no tabs.
### Prototype
```c
API struct nctab* nctabbed_leftmost(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_leftmost(nt)
    @ccall libnotcurses_core.nctabbed_leftmost(nt::Ptr{nctabbed})::Ptr{nctab}
end

"""
    nctabbed_tabcount(nt)

Returns the number of tabs in the widget.
### Prototype
```c
API int nctabbed_tabcount(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_tabcount(nt)
    @ccall libnotcurses_core.nctabbed_tabcount(nt::Ptr{nctabbed})::Cint
end

"""
    nctabbed_plane(nt)

Returns the plane associated to 'nt'.
### Prototype
```c
API struct ncplane* nctabbed_plane(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_plane(nt)
    @ccall libnotcurses_core.nctabbed_plane(nt::Ptr{nctabbed})::Ptr{ncplane}
end

"""
    nctabbed_content_plane(nt)

Returns the tab content plane.
### Prototype
```c
API struct ncplane* nctabbed_content_plane(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_content_plane(nt)
    @ccall libnotcurses_core.nctabbed_content_plane(nt::Ptr{nctabbed})::Ptr{ncplane}
end

"""
    nctab_cb(t)

Returns the tab callback.
### Prototype
```c
API tabcb nctab_cb(struct nctab* t) __attribute__ ((nonnull (1)));
```
"""
function nctab_cb(t)
    @ccall libnotcurses_core.nctab_cb(t::Ptr{nctab})::tabcb
end

"""
    nctab_name(t)

Returns the tab name. This is not a copy and it should not be stored.
### Prototype
```c
API const char* nctab_name(struct nctab* t) __attribute__ ((nonnull (1)));
```
"""
function nctab_name(t)
    @ccall libnotcurses_core.nctab_name(t::Ptr{nctab})::Ptr{Cchar}
end

"""
    nctab_name_width(t)

Returns the width (in columns) of the tab's name.
### Prototype
```c
API int nctab_name_width(struct nctab* t) __attribute__ ((nonnull (1)));
```
"""
function nctab_name_width(t)
    @ccall libnotcurses_core.nctab_name_width(t::Ptr{nctab})::Cint
end

"""
    nctab_userptr(t)

Returns the tab's user pointer.
### Prototype
```c
API void* nctab_userptr(struct nctab* t) __attribute__ ((nonnull (1)));
```
"""
function nctab_userptr(t)
    @ccall libnotcurses_core.nctab_userptr(t::Ptr{nctab})::Ptr{Cvoid}
end

"""
    nctab_next(t)

Returns the tab to the right of 't'. This does not change which tab is selected.
### Prototype
```c
API struct nctab* nctab_next(struct nctab* t) __attribute__ ((nonnull (1)));
```
"""
function nctab_next(t)
    @ccall libnotcurses_core.nctab_next(t::Ptr{nctab})::Ptr{nctab}
end

"""
    nctab_prev(t)

Returns the tab to the left of 't'. This does not change which tab is selected.
### Prototype
```c
API struct nctab* nctab_prev(struct nctab* t) __attribute__ ((nonnull (1)));
```
"""
function nctab_prev(t)
    @ccall libnotcurses_core.nctab_prev(t::Ptr{nctab})::Ptr{nctab}
end

"""
    nctabbed_add(nt, after, before, tcb, name, opaque)

Add a new tab to 'nt' with the given tab callback, name, and user pointer.
If both 'before' and 'after' are NULL, the tab is inserted after the selected
tab. Otherwise, it gets put after 'after' (if not NULL) and before 'before'
(if not NULL). If both 'after' and 'before' are given, they must be two
neighboring tabs (the tab list is circular, so the last tab is immediately
before the leftmost tab), otherwise the function returns NULL. If 'name' is
NULL or a string containing illegal characters, the function returns NULL.
On all other failures the function also returns NULL. If it returns NULL,
none of the arguments are modified, and the widget state is not altered.
### Prototype
```c
API ALLOC struct nctab* nctabbed_add(struct nctabbed* nt, struct nctab* after, struct nctab* before, tabcb tcb, const char* name, void* opaque) __attribute__ ((nonnull (1, 5)));
```
"""
function nctabbed_add(nt, after, before, tcb, name, opaque)
    @ccall libnotcurses_core.nctabbed_add(nt::Ptr{nctabbed}, after::Ptr{nctab}, before::Ptr{nctab}, tcb::tabcb, name::Ptr{Cchar}, opaque::Ptr{Cvoid})::Ptr{nctab}
end

"""
    nctabbed_del(nt, t)

Remove a tab 't' from 'nt'. Its neighboring tabs become neighbors to each
other. If 't' if the selected tab, the tab after 't' becomes selected.
Likewise if 't' is the leftmost tab, the tab after 't' becomes leftmost.
If 't' is the only tab, there will no more be a selected or leftmost tab,
until a new tab is added. Returns -1 if 't' is NULL, and 0 otherwise.
### Prototype
```c
API int nctabbed_del(struct nctabbed* nt, struct nctab* t) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_del(nt, t)
    @ccall libnotcurses_core.nctabbed_del(nt::Ptr{nctabbed}, t::Ptr{nctab})::Cint
end

"""
    nctab_move(nt, t, after, before)

Move 't' after 'after' (if not NULL) and before 'before' (if not NULL).
If both 'after' and 'before' are NULL, the function returns -1, otherwise
it returns 0.
### Prototype
```c
API int nctab_move(struct nctabbed* nt, struct nctab* t, struct nctab* after, struct nctab* before) __attribute__ ((nonnull (1, 2)));
```
"""
function nctab_move(nt, t, after, before)
    @ccall libnotcurses_core.nctab_move(nt::Ptr{nctabbed}, t::Ptr{nctab}, after::Ptr{nctab}, before::Ptr{nctab})::Cint
end

"""
    nctab_move_right(nt, t)

Move 't' to the right by one tab, looping around to become leftmost if needed.
### Prototype
```c
API void nctab_move_right(struct nctabbed* nt, struct nctab* t) __attribute__ ((nonnull (1, 2)));
```
"""
function nctab_move_right(nt, t)
    @ccall libnotcurses_core.nctab_move_right(nt::Ptr{nctabbed}, t::Ptr{nctab})::Cvoid
end

"""
    nctab_move_left(nt, t)

Move 't' to the right by one tab, looping around to become the last tab if needed.
### Prototype
```c
API void nctab_move_left(struct nctabbed* nt, struct nctab* t) __attribute__ ((nonnull (1, 2)));
```
"""
function nctab_move_left(nt, t)
    @ccall libnotcurses_core.nctab_move_left(nt::Ptr{nctabbed}, t::Ptr{nctab})::Cvoid
end

"""
    nctabbed_rotate(nt, amt)

Rotate the tabs of 'nt' right by 'amt' tabs, or '-amt' tabs left if 'amt' is
negative. Tabs are rotated only by changing the leftmost tab; the selected tab
stays the same. If there are no tabs, nothing happens.
### Prototype
```c
API void nctabbed_rotate(struct nctabbed* nt, int amt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_rotate(nt, amt)
    @ccall libnotcurses_core.nctabbed_rotate(nt::Ptr{nctabbed}, amt::Cint)::Cvoid
end

"""
    nctabbed_next(nt)

Select the tab after the currently selected tab, and return the newly selected
tab. Returns NULL if there are no tabs.
### Prototype
```c
API struct nctab* nctabbed_next(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_next(nt)
    @ccall libnotcurses_core.nctabbed_next(nt::Ptr{nctabbed})::Ptr{nctab}
end

"""
    nctabbed_prev(nt)

Select the tab before the currently selected tab, and return the newly selected
tab. Returns NULL if there are no tabs.
### Prototype
```c
API struct nctab* nctabbed_prev(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_prev(nt)
    @ccall libnotcurses_core.nctabbed_prev(nt::Ptr{nctabbed})::Ptr{nctab}
end

"""
    nctabbed_select(nt, t)

Change the selected tab to be 't'. Returns the previously selected tab.
### Prototype
```c
API struct nctab* nctabbed_select(struct nctabbed* nt, struct nctab* t) __attribute__ ((nonnull (1, 2)));
```
"""
function nctabbed_select(nt, t)
    @ccall libnotcurses_core.nctabbed_select(nt::Ptr{nctabbed}, t::Ptr{nctab})::Ptr{nctab}
end

"""
    nctabbed_channels(nt, hdrchan, selchan, sepchan)

Write the channels for tab headers, the selected tab header, and the separator
to '*hdrchan', '*selchan', and '*sepchan' respectively.
### Prototype
```c
API void nctabbed_channels(struct nctabbed* nt, uint64_t* RESTRICT hdrchan, uint64_t* RESTRICT selchan, uint64_t* RESTRICT sepchan) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_channels(nt, hdrchan, selchan, sepchan)
    @ccall libnotcurses_core.nctabbed_channels(nt::Ptr{nctabbed}, hdrchan::Ptr{UInt64}, selchan::Ptr{UInt64}, sepchan::Ptr{UInt64})::Cvoid
end

"""
    nctabbed_separator(nt)

Returns the tab separator. This is not a copy and it should not be stored.
This can be NULL, if the separator was set to NULL in ncatbbed_create() or
nctabbed_set_separator().
### Prototype
```c
API const char* nctabbed_separator(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_separator(nt)
    @ccall libnotcurses_core.nctabbed_separator(nt::Ptr{nctabbed})::Ptr{Cchar}
end

"""
    nctabbed_separator_width(nt)

Returns the tab separator width, or zero if there is no separator.
### Prototype
```c
API int nctabbed_separator_width(struct nctabbed* nt) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_separator_width(nt)
    @ccall libnotcurses_core.nctabbed_separator_width(nt::Ptr{nctabbed})::Cint
end

"""
    nctabbed_set_hdrchan(nt, chan)

Set the tab headers channel for 'nt'.
### Prototype
```c
API void nctabbed_set_hdrchan(struct nctabbed* nt, uint64_t chan) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_set_hdrchan(nt, chan)
    @ccall libnotcurses_core.nctabbed_set_hdrchan(nt::Ptr{nctabbed}, chan::UInt64)::Cvoid
end

"""
    nctabbed_set_selchan(nt, chan)

Set the selected tab header channel for 'nt'.
### Prototype
```c
API void nctabbed_set_selchan(struct nctabbed* nt, uint64_t chan) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_set_selchan(nt, chan)
    @ccall libnotcurses_core.nctabbed_set_selchan(nt::Ptr{nctabbed}, chan::UInt64)::Cvoid
end

"""
    nctabbed_set_sepchan(nt, chan)

Set the tab separator channel for 'nt'.
### Prototype
```c
API void nctabbed_set_sepchan(struct nctabbed* nt, uint64_t chan) __attribute__ ((nonnull (1)));
```
"""
function nctabbed_set_sepchan(nt, chan)
    @ccall libnotcurses_core.nctabbed_set_sepchan(nt::Ptr{nctabbed}, chan::UInt64)::Cvoid
end

"""
    nctab_set_cb(t, newcb)

Set the tab callback function for 't'. Returns the previous tab callback.
### Prototype
```c
API tabcb nctab_set_cb(struct nctab* t, tabcb newcb) __attribute__ ((nonnull (1)));
```
"""
function nctab_set_cb(t, newcb)
    @ccall libnotcurses_core.nctab_set_cb(t::Ptr{nctab}, newcb::tabcb)::tabcb
end

"""
    nctab_set_name(t, newname)

Change the name of 't'. Returns -1 if 'newname' is NULL, and 0 otherwise.
### Prototype
```c
API int nctab_set_name(struct nctab* t, const char* newname) __attribute__ ((nonnull (1, 2)));
```
"""
function nctab_set_name(t, newname)
    @ccall libnotcurses_core.nctab_set_name(t::Ptr{nctab}, newname::Ptr{Cchar})::Cint
end

"""
    nctab_set_userptr(t, newopaque)

Set the user pointer of 't'. Returns the previous user pointer.
### Prototype
```c
API void* nctab_set_userptr(struct nctab* t, void* newopaque) __attribute__ ((nonnull (1)));
```
"""
function nctab_set_userptr(t, newopaque)
    @ccall libnotcurses_core.nctab_set_userptr(t::Ptr{nctab}, newopaque::Ptr{Cvoid})::Ptr{Cvoid}
end

"""
    nctabbed_set_separator(nt, separator)

Change the tab separator for 'nt'. Returns -1 if 'separator' is not NULL and
is not a valid string, and 0 otherwise.
### Prototype
```c
API int nctabbed_set_separator(struct nctabbed* nt, const char* separator) __attribute__ ((nonnull (1, 2)));
```
"""
function nctabbed_set_separator(nt, separator)
    @ccall libnotcurses_core.nctabbed_set_separator(nt::Ptr{nctabbed}, separator::Ptr{Cchar})::Cint
end

struct ncplot_options
    maxchannels::UInt64
    minchannels::UInt64
    legendstyle::UInt16
    gridtype::ncblitter_e
    rangex::Cint
    title::Ptr{Cchar}
    flags::UInt64
end

"""
    ncuplot_create(n, opts, miny, maxy)

Use the provided plane 'n' for plotting according to the options 'opts'. The
plot will make free use of the entirety of the plane. For domain
autodiscovery, set miny == maxy == 0. ncuplot holds uint64_ts, while
ncdplot holds doubles.
### Prototype
```c
API ALLOC struct ncuplot* ncuplot_create(struct ncplane* n, const ncplot_options* opts, uint64_t miny, uint64_t maxy) __attribute__ ((nonnull (1)));
```
"""
function ncuplot_create(n, opts, miny, maxy)
    @ccall libnotcurses_core.ncuplot_create(n::Ptr{ncplane}, opts::Ptr{ncplot_options}, miny::UInt64, maxy::UInt64)::Ptr{ncuplot}
end

"""
    ncdplot_create(n, opts, miny, maxy)


### Prototype
```c
API ALLOC struct ncdplot* ncdplot_create(struct ncplane* n, const ncplot_options* opts, double miny, double maxy) __attribute__ ((nonnull (1)));
```
"""
function ncdplot_create(n, opts, miny, maxy)
    @ccall libnotcurses_core.ncdplot_create(n::Ptr{ncplane}, opts::Ptr{ncplot_options}, miny::Cdouble, maxy::Cdouble)::Ptr{ncdplot}
end

"""
    ncuplot_plane(n)

Return a reference to the ncplot's underlying ncplane.
### Prototype
```c
API struct ncplane* ncuplot_plane(struct ncuplot* n) __attribute__ ((nonnull (1)));
```
"""
function ncuplot_plane(n)
    @ccall libnotcurses_core.ncuplot_plane(n::Ptr{ncuplot})::Ptr{ncplane}
end

"""
    ncdplot_plane(n)


### Prototype
```c
API struct ncplane* ncdplot_plane(struct ncdplot* n) __attribute__ ((nonnull (1)));
```
"""
function ncdplot_plane(n)
    @ccall libnotcurses_core.ncdplot_plane(n::Ptr{ncdplot})::Ptr{ncplane}
end

"""
    ncuplot_add_sample(n, x, y)

Add to or set the value corresponding to this x. If x is beyond the current
x window, the x window is advanced to include x, and values passing beyond
the window are lost. The first call will place the initial window. The plot
will be redrawn, but notcurses_render() is not called.
### Prototype
```c
API int ncuplot_add_sample(struct ncuplot* n, uint64_t x, uint64_t y) __attribute__ ((nonnull (1)));
```
"""
function ncuplot_add_sample(n, x, y)
    @ccall libnotcurses_core.ncuplot_add_sample(n::Ptr{ncuplot}, x::UInt64, y::UInt64)::Cint
end

"""
    ncdplot_add_sample(n, x, y)


### Prototype
```c
API int ncdplot_add_sample(struct ncdplot* n, uint64_t x, double y) __attribute__ ((nonnull (1)));
```
"""
function ncdplot_add_sample(n, x, y)
    @ccall libnotcurses_core.ncdplot_add_sample(n::Ptr{ncdplot}, x::UInt64, y::Cdouble)::Cint
end

"""
    ncuplot_set_sample(n, x, y)


### Prototype
```c
API int ncuplot_set_sample(struct ncuplot* n, uint64_t x, uint64_t y) __attribute__ ((nonnull (1)));
```
"""
function ncuplot_set_sample(n, x, y)
    @ccall libnotcurses_core.ncuplot_set_sample(n::Ptr{ncuplot}, x::UInt64, y::UInt64)::Cint
end

"""
    ncdplot_set_sample(n, x, y)


### Prototype
```c
API int ncdplot_set_sample(struct ncdplot* n, uint64_t x, double y) __attribute__ ((nonnull (1)));
```
"""
function ncdplot_set_sample(n, x, y)
    @ccall libnotcurses_core.ncdplot_set_sample(n::Ptr{ncdplot}, x::UInt64, y::Cdouble)::Cint
end

"""
    ncuplot_sample(n, x, y)


### Prototype
```c
API int ncuplot_sample(const struct ncuplot* n, uint64_t x, uint64_t* y) __attribute__ ((nonnull (1)));
```
"""
function ncuplot_sample(n, x, y)
    @ccall libnotcurses_core.ncuplot_sample(n::Ptr{ncuplot}, x::UInt64, y::Ptr{UInt64})::Cint
end

"""
    ncdplot_sample(n, x, y)


### Prototype
```c
API int ncdplot_sample(const struct ncdplot* n, uint64_t x, double* y) __attribute__ ((nonnull (1)));
```
"""
function ncdplot_sample(n, x, y)
    @ccall libnotcurses_core.ncdplot_sample(n::Ptr{ncdplot}, x::UInt64, y::Ptr{Cdouble})::Cint
end

"""
    ncuplot_destroy(n)


### Prototype
```c
API void ncuplot_destroy(struct ncuplot* n);
```
"""
function ncuplot_destroy(n)
    @ccall libnotcurses_core.ncuplot_destroy(n::Ptr{ncuplot})::Cvoid
end

"""
    ncdplot_destroy(n)


### Prototype
```c
API void ncdplot_destroy(struct ncdplot* n);
```
"""
function ncdplot_destroy(n)
    @ccall libnotcurses_core.ncdplot_destroy(n::Ptr{ncdplot})::Cvoid
end

# typedef int ( * ncfdplane_callback ) ( struct ncfdplane * n , const void * buf , size_t s , void * curry )
const ncfdplane_callback = Ptr{Cvoid}

# typedef int ( * ncfdplane_done_cb ) ( struct ncfdplane * n , int fderrno , void * curry )
const ncfdplane_done_cb = Ptr{Cvoid}

"""
    ncfdplane_options

read from an fd until EOF (or beyond, if follow is set), invoking the user's
callback each time. runs in its own context. on EOF or error, the finalizer
callback will be invoked, and the user ought destroy the ncfdplane. the
data is *not* guaranteed to be nul-terminated, and may contain arbitrary
zeroes.
"""
struct ncfdplane_options
    curry::Ptr{Cvoid}
    follow::Bool
    flags::UInt64
end

"""
    ncfdplane_create(n, opts, fd, cbfxn, donecbfxn)

Create an ncfdplane around the fd 'fd'. Consider this function to take
ownership of the file descriptor, which will be closed in ncfdplane_destroy().
### Prototype
```c
API ALLOC struct ncfdplane* ncfdplane_create(struct ncplane* n, const ncfdplane_options* opts, int fd, ncfdplane_callback cbfxn, ncfdplane_done_cb donecbfxn) __attribute__ ((nonnull (1)));
```
"""
function ncfdplane_create(n, opts, fd, cbfxn, donecbfxn)
    @ccall libnotcurses_core.ncfdplane_create(n::Ptr{ncplane}, opts::Ptr{ncfdplane_options}, fd::Cint, cbfxn::ncfdplane_callback, donecbfxn::ncfdplane_done_cb)::Ptr{ncfdplane}
end

"""
    ncfdplane_plane(n)


### Prototype
```c
API struct ncplane* ncfdplane_plane(struct ncfdplane* n) __attribute__ ((nonnull (1)));
```
"""
function ncfdplane_plane(n)
    @ccall libnotcurses_core.ncfdplane_plane(n::Ptr{ncfdplane})::Ptr{ncplane}
end

"""
    ncfdplane_destroy(n)


### Prototype
```c
API int ncfdplane_destroy(struct ncfdplane* n);
```
"""
function ncfdplane_destroy(n)
    @ccall libnotcurses_core.ncfdplane_destroy(n::Ptr{ncfdplane})::Cint
end

struct ncsubproc_options
    curry::Ptr{Cvoid}
    restart_period::UInt64
    flags::UInt64
end

"""
    ncsubproc_createv(n, opts, bin, arg, cbfxn, donecbfxn)

see exec(2). p-types use \$PATH. e-type passes environment vars.
### Prototype
```c
API ALLOC struct ncsubproc* ncsubproc_createv(struct ncplane* n, const ncsubproc_options* opts, const char* bin, const char* const arg[], ncfdplane_callback cbfxn, ncfdplane_done_cb donecbfxn) __attribute__ ((nonnull (1)));
```
"""
function ncsubproc_createv(n, opts, bin, arg, cbfxn, donecbfxn)
    @ccall libnotcurses_core.ncsubproc_createv(n::Ptr{ncplane}, opts::Ptr{ncsubproc_options}, bin::Ptr{Cchar}, arg::Ptr{Ptr{Cchar}}, cbfxn::ncfdplane_callback, donecbfxn::ncfdplane_done_cb)::Ptr{ncsubproc}
end

"""
    ncsubproc_createvp(n, opts, bin, arg, cbfxn, donecbfxn)


### Prototype
```c
API ALLOC struct ncsubproc* ncsubproc_createvp(struct ncplane* n, const ncsubproc_options* opts, const char* bin, const char* const arg[], ncfdplane_callback cbfxn, ncfdplane_done_cb donecbfxn) __attribute__ ((nonnull (1)));
```
"""
function ncsubproc_createvp(n, opts, bin, arg, cbfxn, donecbfxn)
    @ccall libnotcurses_core.ncsubproc_createvp(n::Ptr{ncplane}, opts::Ptr{ncsubproc_options}, bin::Ptr{Cchar}, arg::Ptr{Ptr{Cchar}}, cbfxn::ncfdplane_callback, donecbfxn::ncfdplane_done_cb)::Ptr{ncsubproc}
end

"""
    ncsubproc_createvpe(n, opts, bin, arg, env, cbfxn, donecbfxn)


### Prototype
```c
API ALLOC struct ncsubproc* ncsubproc_createvpe(struct ncplane* n, const ncsubproc_options* opts, const char* bin, const char* const arg[], const char* const env[], ncfdplane_callback cbfxn, ncfdplane_done_cb donecbfxn) __attribute__ ((nonnull (1)));
```
"""
function ncsubproc_createvpe(n, opts, bin, arg, env, cbfxn, donecbfxn)
    @ccall libnotcurses_core.ncsubproc_createvpe(n::Ptr{ncplane}, opts::Ptr{ncsubproc_options}, bin::Ptr{Cchar}, arg::Ptr{Ptr{Cchar}}, env::Ptr{Ptr{Cchar}}, cbfxn::ncfdplane_callback, donecbfxn::ncfdplane_done_cb)::Ptr{ncsubproc}
end

"""
    ncsubproc_plane(n)


### Prototype
```c
API struct ncplane* ncsubproc_plane(struct ncsubproc* n) __attribute__ ((nonnull (1)));
```
"""
function ncsubproc_plane(n)
    @ccall libnotcurses_core.ncsubproc_plane(n::Ptr{ncsubproc})::Ptr{ncplane}
end

"""
    ncsubproc_destroy(n)


### Prototype
```c
API int ncsubproc_destroy(struct ncsubproc* n);
```
"""
function ncsubproc_destroy(n)
    @ccall libnotcurses_core.ncsubproc_destroy(n::Ptr{ncsubproc})::Cint
end

"""
    ncplane_qrcode(n, ymax, xmax, data, len)

Draw a QR code at the current position on the plane. If there is insufficient
room to draw the code here, or there is any other error, non-zero will be
returned. Otherwise, the QR code "version" (size) is returned. The QR code
is (version * 4 + 17) columns wide, and ⌈version * 4 + 17⌉ rows tall (the
properly-scaled values are written back to '*ymax' and '*xmax').
NCBLIT_2x1 is always used, and the call will fail if it is not available,
as only this blitter can generate a proper aspect ratio.
### Prototype
```c
API int ncplane_qrcode(struct ncplane* n, unsigned* ymax, unsigned* xmax, const void* data, size_t len) __attribute__ ((nonnull (1, 4)));
```
"""
function ncplane_qrcode(n, ymax, xmax, data, len)
    @ccall libnotcurses_core.ncplane_qrcode(n::Ptr{ncplane}, ymax::Ptr{Cuint}, xmax::Ptr{Cuint}, data::Ptr{Cvoid}, len::Csize_t)::Cint
end

struct ncreader_options
    tchannels::UInt64
    tattrword::UInt32
    flags::UInt64
end

"""
    ncreader_create(n, opts)

ncreaders provide freeform input in a (possibly multiline) region, supporting
optional readline keybindings. takes ownership of 'n', destroying it on any
error (ncreader_destroy() otherwise destroys the ncplane).
### Prototype
```c
API ALLOC struct ncreader* ncreader_create(struct ncplane* n, const ncreader_options* opts) __attribute__ ((nonnull (1)));
```
"""
function ncreader_create(n, opts)
    @ccall libnotcurses_core.ncreader_create(n::Ptr{ncplane}, opts::Ptr{ncreader_options})::Ptr{ncreader}
end

"""
    ncreader_clear(n)

empty the ncreader of any user input, and home the cursor.
### Prototype
```c
API int ncreader_clear(struct ncreader* n) __attribute__ ((nonnull (1)));
```
"""
function ncreader_clear(n)
    @ccall libnotcurses_core.ncreader_clear(n::Ptr{ncreader})::Cint
end

"""
    ncreader_plane(n)


### Prototype
```c
API struct ncplane* ncreader_plane(struct ncreader* n) __attribute__ ((nonnull (1)));
```
"""
function ncreader_plane(n)
    @ccall libnotcurses_core.ncreader_plane(n::Ptr{ncreader})::Ptr{ncplane}
end

"""
    ncreader_offer_input(n, ni)

Offer the input to the ncreader. If it's relevant, this function returns
true, and the input ought not be processed further. Almost all inputs
are relevant to an ncreader, save synthesized ones.
### Prototype
```c
API bool ncreader_offer_input(struct ncreader* n, const ncinput* ni) __attribute__ ((nonnull (1, 2)));
```
"""
function ncreader_offer_input(n, ni)
    @ccall libnotcurses_core.ncreader_offer_input(n::Ptr{ncreader}, ni::Ptr{ncinput})::Bool
end

"""
    ncreader_move_left(n)

Atttempt to move in the specified direction. Returns 0 if a move was
successfully executed, -1 otherwise. Scrolling is taken into account.
### Prototype
```c
API int ncreader_move_left(struct ncreader* n) __attribute__ ((nonnull (1)));
```
"""
function ncreader_move_left(n)
    @ccall libnotcurses_core.ncreader_move_left(n::Ptr{ncreader})::Cint
end

"""
    ncreader_move_right(n)


### Prototype
```c
API int ncreader_move_right(struct ncreader* n) __attribute__ ((nonnull (1)));
```
"""
function ncreader_move_right(n)
    @ccall libnotcurses_core.ncreader_move_right(n::Ptr{ncreader})::Cint
end

"""
    ncreader_move_up(n)


### Prototype
```c
API int ncreader_move_up(struct ncreader* n) __attribute__ ((nonnull (1)));
```
"""
function ncreader_move_up(n)
    @ccall libnotcurses_core.ncreader_move_up(n::Ptr{ncreader})::Cint
end

"""
    ncreader_move_down(n)


### Prototype
```c
API int ncreader_move_down(struct ncreader* n) __attribute__ ((nonnull (1)));
```
"""
function ncreader_move_down(n)
    @ccall libnotcurses_core.ncreader_move_down(n::Ptr{ncreader})::Cint
end

"""
    ncreader_write_egc(n, egc)

Destructively write the provided EGC to the current cursor location. Move
the cursor as necessary, scrolling if applicable.
### Prototype
```c
API int ncreader_write_egc(struct ncreader* n, const char* egc) __attribute__ ((nonnull (1, 2)));
```
"""
function ncreader_write_egc(n, egc)
    @ccall libnotcurses_core.ncreader_write_egc(n::Ptr{ncreader}, egc::Ptr{Cchar})::Cint
end

"""
    ncreader_contents(n)

return a heap-allocated copy of the current (UTF-8) contents.
### Prototype
```c
API char* ncreader_contents(const struct ncreader* n) __attribute__ ((nonnull (1)));
```
"""
function ncreader_contents(n)
    @ccall libnotcurses_core.ncreader_contents(n::Ptr{ncreader})::Ptr{Cchar}
end

"""
    ncreader_destroy(n, contents)

destroy the reader and its bound plane. if 'contents' is not NULL, the
UTF-8 input will be heap-duplicated and written to 'contents'.
### Prototype
```c
API void ncreader_destroy(struct ncreader* n, char** contents);
```
"""
function ncreader_destroy(n, contents)
    @ccall libnotcurses_core.ncreader_destroy(n::Ptr{ncreader}, contents::Ptr{Ptr{Cchar}})::Cvoid
end

"""
    notcurses_accountname()

Returns a heap-allocated copy of the user name under which we are running.
### Prototype
```c
API ALLOC char* notcurses_accountname(void);
```
"""
function notcurses_accountname()
    @ccall libnotcurses_core.notcurses_accountname()::Ptr{Cchar}
end

"""
    notcurses_hostname()

Returns a heap-allocated copy of the local host name.
### Prototype
```c
API ALLOC char* notcurses_hostname(void);
```
"""
function notcurses_hostname()
    @ccall libnotcurses_core.notcurses_hostname()::Ptr{Cchar}
end

"""
    notcurses_osversion()

Returns a heap-allocated copy of human-readable OS name and version.
### Prototype
```c
API ALLOC char* notcurses_osversion(void);
```
"""
function notcurses_osversion()
    @ccall libnotcurses_core.notcurses_osversion()::Ptr{Cchar}
end

"""
    notcurses_debug(nc, debugfp)

Dump selected Notcurses state to the supplied 'debugfp'. Output is freeform,
newline-delimited, and subject to change. It includes geometry of all
planes, from all piles. No line has more than 80 columns' worth of output.
### Prototype
```c
API void notcurses_debug(const struct notcurses* nc, FILE* debugfp) __attribute__ ((nonnull (1, 2)));
```
"""
function notcurses_debug(nc, debugfp)
    @ccall libnotcurses_core.notcurses_debug(nc::Ptr{notcurses}, debugfp::Ptr{Libc.FILE})::Cvoid
end

# Skipping MacroDefinition: API __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: ALLOC __attribute__ ( ( malloc ) ) __attribute__ ( ( warn_unused_result ) )

const NCDIRECT_OPTION_INHIBIT_SETLOCALE = Culonglong(0x0001)

const NCDIRECT_OPTION_INHIBIT_CBREAK = Culonglong(0x0002)

const NCDIRECT_OPTION_DRAIN_INPUT = Culonglong(0x0004)

const NCDIRECT_OPTION_NO_QUIT_SIGHANDLERS = Culonglong(0x0008)

const NCDIRECT_OPTION_VERBOSE = Culonglong(0x0010)

const NCDIRECT_OPTION_VERY_VERBOSE = Culonglong(0x0020)

const PRETERUNICODEBASE = 1115000

preterunicode(w) = w + PRETERUNICODEBASE

const NCKEY_INVALID = preterunicode(0)

const NCKEY_RESIZE = preterunicode(1)

const NCKEY_UP = preterunicode(2)

const NCKEY_RIGHT = preterunicode(3)

const NCKEY_DOWN = preterunicode(4)

const NCKEY_LEFT = preterunicode(5)

const NCKEY_INS = preterunicode(6)

const NCKEY_DEL = preterunicode(7)

const NCKEY_BACKSPACE = preterunicode(8)

const NCKEY_PGDOWN = preterunicode(9)

const NCKEY_PGUP = preterunicode(10)

const NCKEY_HOME = preterunicode(11)

const NCKEY_END = preterunicode(12)

const NCKEY_F00 = preterunicode(20)

const NCKEY_F01 = preterunicode(21)

const NCKEY_F02 = preterunicode(22)

const NCKEY_F03 = preterunicode(23)

const NCKEY_F04 = preterunicode(24)

const NCKEY_F05 = preterunicode(25)

const NCKEY_F06 = preterunicode(26)

const NCKEY_F07 = preterunicode(27)

const NCKEY_F08 = preterunicode(28)

const NCKEY_F09 = preterunicode(29)

const NCKEY_F10 = preterunicode(30)

const NCKEY_F11 = preterunicode(31)

const NCKEY_F12 = preterunicode(32)

const NCKEY_F13 = preterunicode(33)

const NCKEY_F14 = preterunicode(34)

const NCKEY_F15 = preterunicode(35)

const NCKEY_F16 = preterunicode(36)

const NCKEY_F17 = preterunicode(37)

const NCKEY_F18 = preterunicode(38)

const NCKEY_F19 = preterunicode(39)

const NCKEY_F20 = preterunicode(40)

const NCKEY_F21 = preterunicode(41)

const NCKEY_F22 = preterunicode(42)

const NCKEY_F23 = preterunicode(43)

const NCKEY_F24 = preterunicode(44)

const NCKEY_F25 = preterunicode(45)

const NCKEY_F26 = preterunicode(46)

const NCKEY_F27 = preterunicode(47)

const NCKEY_F28 = preterunicode(48)

const NCKEY_F29 = preterunicode(49)

const NCKEY_F30 = preterunicode(50)

const NCKEY_F31 = preterunicode(51)

const NCKEY_F32 = preterunicode(52)

const NCKEY_F33 = preterunicode(53)

const NCKEY_F34 = preterunicode(54)

const NCKEY_F35 = preterunicode(55)

const NCKEY_F36 = preterunicode(56)

const NCKEY_F37 = preterunicode(57)

const NCKEY_F38 = preterunicode(58)

const NCKEY_F39 = preterunicode(59)

const NCKEY_F40 = preterunicode(60)

const NCKEY_F41 = preterunicode(61)

const NCKEY_F42 = preterunicode(62)

const NCKEY_F43 = preterunicode(63)

const NCKEY_F44 = preterunicode(64)

const NCKEY_F45 = preterunicode(65)

const NCKEY_F46 = preterunicode(66)

const NCKEY_F47 = preterunicode(67)

const NCKEY_F48 = preterunicode(68)

const NCKEY_F49 = preterunicode(69)

const NCKEY_F50 = preterunicode(70)

const NCKEY_F51 = preterunicode(71)

const NCKEY_F52 = preterunicode(72)

const NCKEY_F53 = preterunicode(73)

const NCKEY_F54 = preterunicode(74)

const NCKEY_F55 = preterunicode(75)

const NCKEY_F56 = preterunicode(76)

const NCKEY_F57 = preterunicode(77)

const NCKEY_F58 = preterunicode(78)

const NCKEY_F59 = preterunicode(79)

const NCKEY_F60 = preterunicode(80)

const NCKEY_ENTER = preterunicode(121)

const NCKEY_CLS = preterunicode(122)

const NCKEY_DLEFT = preterunicode(123)

const NCKEY_DRIGHT = preterunicode(124)

const NCKEY_ULEFT = preterunicode(125)

const NCKEY_URIGHT = preterunicode(126)

const NCKEY_CENTER = preterunicode(127)

const NCKEY_BEGIN = preterunicode(128)

const NCKEY_CANCEL = preterunicode(129)

const NCKEY_CLOSE = preterunicode(130)

const NCKEY_COMMAND = preterunicode(131)

const NCKEY_COPY = preterunicode(132)

const NCKEY_EXIT = preterunicode(133)

const NCKEY_PRINT = preterunicode(134)

const NCKEY_REFRESH = preterunicode(135)

const NCKEY_SEPARATOR = preterunicode(136)

const NCKEY_CAPS_LOCK = preterunicode(150)

const NCKEY_SCROLL_LOCK = preterunicode(151)

const NCKEY_NUM_LOCK = preterunicode(152)

const NCKEY_PRINT_SCREEN = preterunicode(153)

const NCKEY_PAUSE = preterunicode(154)

const NCKEY_MENU = preterunicode(155)

const NCKEY_MEDIA_PLAY = preterunicode(158)

const NCKEY_MEDIA_PAUSE = preterunicode(159)

const NCKEY_MEDIA_PPAUSE = preterunicode(160)

const NCKEY_MEDIA_REV = preterunicode(161)

const NCKEY_MEDIA_STOP = preterunicode(162)

const NCKEY_MEDIA_FF = preterunicode(163)

const NCKEY_MEDIA_REWIND = preterunicode(164)

const NCKEY_MEDIA_NEXT = preterunicode(165)

const NCKEY_MEDIA_PREV = preterunicode(166)

const NCKEY_MEDIA_RECORD = preterunicode(167)

const NCKEY_MEDIA_LVOL = preterunicode(168)

const NCKEY_MEDIA_RVOL = preterunicode(169)

const NCKEY_MEDIA_MUTE = preterunicode(170)

const NCKEY_LSHIFT = preterunicode(171)

const NCKEY_LCTRL = preterunicode(172)

const NCKEY_LALT = preterunicode(173)

const NCKEY_LSUPER = preterunicode(174)

const NCKEY_LHYPER = preterunicode(175)

const NCKEY_LMETA = preterunicode(176)

const NCKEY_RSHIFT = preterunicode(177)

const NCKEY_RCTRL = preterunicode(178)

const NCKEY_RALT = preterunicode(179)

const NCKEY_RSUPER = preterunicode(180)

const NCKEY_RHYPER = preterunicode(181)

const NCKEY_RMETA = preterunicode(182)

const NCKEY_L3SHIFT = preterunicode(183)

const NCKEY_L5SHIFT = preterunicode(184)

const NCKEY_MOTION = preterunicode(200)

const NCKEY_BUTTON1 = preterunicode(201)

const NCKEY_BUTTON2 = preterunicode(202)

const NCKEY_BUTTON3 = preterunicode(203)

const NCKEY_BUTTON4 = preterunicode(204)

const NCKEY_BUTTON5 = preterunicode(205)

const NCKEY_BUTTON6 = preterunicode(206)

const NCKEY_BUTTON7 = preterunicode(207)

const NCKEY_BUTTON8 = preterunicode(208)

const NCKEY_BUTTON9 = preterunicode(209)

const NCKEY_BUTTON10 = preterunicode(210)

const NCKEY_BUTTON11 = preterunicode(211)

const NCKEY_SIGNAL = preterunicode(400)

const NCKEY_EOF = preterunicode(500)

const NCKEY_SCROLL_UP = NCKEY_BUTTON4

const NCKEY_SCROLL_DOWN = NCKEY_BUTTON5

const NCKEY_RETURN = NCKEY_ENTER

const NCKEY_TAB = 0x09

const NCKEY_ESC = 0x1b

const NCKEY_SPACE = 0x20

const NCKEY_MOD_SHIFT = 1

const NCKEY_MOD_ALT = 2

const NCKEY_MOD_CTRL = 4

const NCKEY_MOD_SUPER = 8

const NCKEY_MOD_HYPER = 16

const NCKEY_MOD_META = 32

const NCKEY_MOD_CAPSLOCK = 64

const NCKEY_MOD_NUMLOCK = 128

htole(x) = OSSwapInt32(htonl(x))

const NCBOXLIGHTW = "┌┐└┘─│"

const NCBOXHEAVYW = "┏┓┗┛━┃"

const NCBOXROUNDW = "╭╮╰╯─│"

const NCBOXDOUBLEW = "╔╗╚╝═║"

const NCBOXASCIIW = "/\\\\/-|"

const NCBOXOUTERW = "🭽🭾🭼🭿▁🭵🭶🭰"

const NCWHITESQUARESW = "◲◱◳◰"

const NCWHITECIRCLESW = "◶◵◷◴"

const NCCIRCULARARCSW = "◜◝◟◞"

const NCWHITETRIANGLESW = "◿◺◹◸"

const NCBLACKTRIANGLESW = "◢◣◥◤"

const NCSHADETRIANGLESW = "🮞🮟🮝🮜"

const NCBLACKARROWHEADSW = "⮝⮟⮜⮞"

const NCLIGHTARROWHEADSW = "⮙⮛⮘⮚"

const NCARROWDOUBLEW = "⮅⮇⮄⮆"

const NCARROWDASHEDW = "⭫⭭⭪⭬"

const NCARROWCIRCLEDW = "⮉⮋⮈⮊"

const NCARROWANTICLOCKW = "⮏⮍⮎⮌"

const NCBOXDRAWW = "╵╷╴╶"

const NCBOXDRAWHEAVYW = "╹╻╸╺"

const NCARROWW = "⭡⭣⭠⭢⭧⭩⭦⭨"

const NCDIAGONALSW = "🮣🮠🮡🮢🮤🮥🮦🮧"

const NCDIGITSSUPERW = "⁰¹²³⁴⁵⁶⁷⁸⁹"

const NCDIGITSSUBW = "₀₁₂₃₄₅₆₇₈₉"

const NCASTERISKS5 = "🞯🞰🞱🞲🞳🞴"

const NCASTERISKS6 = "🞵🞶🞷🞸🞹🞺"

const NCASTERISKS8 = "🞻🞼✳🞽🞾🞿"

const NCANGLESBR = "🭁🭂🭃🭄🭅🭆🭇🭈🭉🭊🭋"

const NCANGLESTR = "🭒🭓🭔🭕🭖🭧🭢🭣🭤🭥🭦"

const NCANGLESBL = "🭌🭍🭎🭏🭐🭑🬼🬽🬾🬿🭀"

const NCANGLESTL = "🭝🭞🭟🭠🭡🭜🭗🭘🭙🭚🭛"

const NCEIGHTHSB = " ▁▂▃▄▅▆▇█"

const NCEIGHTHST = " ▔🮂🮃▀🮄🮅🮆█"

const NCEIGHTHSL = "▏▎▍▌▋▊▉█"

const NCEIGHTHSR = "▕🮇🮈▐🮉🮊🮋█"

const NCHALFBLOCKS = " ▀▄█"

const NCQUADBLOCKS = " ▘▝▀▖▌▞▛▗▚▐▜▄▙▟█"

const NCSEXBLOCKS = " 🬀🬁🬂🬃🬄🬅🬆🬇🬈🬊🬋🬌🬍🬎🬏🬐🬑🬒🬓▌🬔🬕🬖🬗🬘🬙🬚🬛🬜🬝🬞🬟🬠🬡🬢🬣🬤🬥🬦🬧▐🬨🬩🬪🬫🬬🬭🬮🬯🬰🬱🬲🬳🬴🬵🬶🬷🬸🬹🬺🬻█"

const NCOCTBLOCKS = ((((((((((((((((" \U1cea8\U1ceab🮂\U1cd00▘\U1cd01\U1cd02")("\U1cd03\U1cd04▝\U1cd05\U1cd06\U1cd07\U1cd08▀\U1cd09\U1cd0a\U1cd0b\U1cd0c\U1fbe6\U1cd0d\U1cd0e\U1cd0f"))("\U1cd10\U1cd11\U1cd12\U1cd13\U1cd14\U1cd15\U1cd16\U1cd17\U1cd18\U1cd19\U1cd1a\U1cd1b\U1cd1c\U1cd1d\U1cd1e\U1cd1f"))("\U1fbe7\U1cd20\U1cd21\U1cd22\U1cd23\U1cd24\U1cd25\U1cd26\U1cd27\U1cd28\U1cd29\U1cd2a\U1cd2b\U1cd2c\U1cd2d\U1cd2e"))("\U1cd2f\U1cd30\U1cd31\U1cd32\U1cd33\U1cd34\U1cd35🮅\U1cea3\U1cd36\U1cd37\U1cd38\U1cd39\U1cd3a\U1cd3b\U1cd3c"))("\U1cd3d\U1cd3e\U1cd3f\U1cd40\U1cd41\U1cd42\U1cd43\U1cd44▖\U1cd45\U1cd46\U1cd47\U1cd48▌\U1cd49\U1cd4a"))("\U1cd4b\U1cd4c▞\U1cd4d\U1cd4e\U1cd4f\U1cd50▛\U1cd51\U1cd52\U1cd53\U1cd54\U1cd55\U1cd56\U1cd57\U1cd58"))("\U1cd59\U1cd5a\U1cd5b\U1cd5c\U1cd5d\U1cd5e\U1cd5f\U1cd60\U1cd61\U1cd62\U1cd63\U1cd64\U1cd65\U1cd66\U1cd67\U1cd68"))("\U1cd69\U1cd6a\U1cd6b\U1cd6c\U1cd6d\U1cd6e\U1cd6f\U1cd70\U1cea0\U1cd71\U1cd72\U1cd73\U1cd74\U1cd75\U1cd76\U1cd77"))("\U1cd78\U1cd79\U1cd7a\U1cd7b\U1cd7c\U1cd7d\U1cd7e\U1cd7f\U1cd80\U1cd81\U1cd82\U1cd83\U1cd84\U1cd85\U1cd86\U1cd87"))("\U1cd88\U1cd89\U1cd8a\U1cd8b\U1cd8c\U1cd8d\U1cd8e\U1cd8f▗\U1cd90\U1cd91\U1cd92\U1cd93▚\U1cd94\U1cd95"))("\U1cd96\U1cd97▐\U1cd98\U1cd99\U1cd9a\U1cd9b▜\U1cd9c\U1cd9d\U1cd9e\U1cd9f\U1cda0\U1cda1\U1cda2\U1cda3"))("\U1cda4\U1cda5\U1cda6\U1cda7\U1cda8\U1cda9\U1cdaa\U1cdab▂\U1cdac\U1cdad\U1cdae\U1cdaf\U1cdb0\U1cdb1\U1cdb2"))("\U1cdb3\U1cdb4\U1cdb5\U1cdb6\U1cdb7\U1cdb8\U1cdb9\U1cdba\U1cdbb\U1cdbc\U1cdbd\U1cdbe\U1cdbf\U1cdc0\U1cdc1\U1cdc2"))("\U1cdc3\U1cdc4\U1cdc5\U1cdc6\U1cdc7\U1cdc8\U1cdc9\U1cdca\U1cdcb\U1cdcc\U1cdcd\U1cdce\U1cdcf\U1cdd0\U1cdd1\U1cdd2"))("\U1cdd3\U1cdd4\U1cdd5\U1cdd6\U1cdd7\U1cdd8\U1cdd9\U1cdda▄\U1cddb\U1cddc\U1cddd\U1cdde▙\U1cddf\U1cde0"))("\U1cde1\U1cde2▟\U1cde3▆\U1cde4\U1cde5█")

const NCSUITSBLACK = "♠♣♥♦"

const NCSUITSWHITE = "♡♢♤♧"

const NCCHESSBLACK = "♟♜♞♝♛♚"

const NCCHESSWHITE = "♙♖♘♗♕♔"

const NCDICE = "⚀⚁⚂⚃⚄⚅"

const NCMUSICSYM = "♩♪♫♬♭♮♯"

const NCBOXLIGHT = "┌┐└┘─│"

const NCBOXHEAVY = "┏┓┗┛━┃"

const NCBOXROUND = "╭╮╰╯─│"

const NCBOXDOUBLE = "╔╗╚╝═║"

const NCBOXASCII = "/\\\\/-|"

const NCBOXOUTER = "🭽🭾🭼🭿▁🭵🭶🭰"

const NCALIGN_TOP = NCALIGN_LEFT

const NCALIGN_BOTTOM = NCALIGN_RIGHT

const NCALPHA_HIGHCONTRAST = Culonglong(0x30000000)

const NCALPHA_TRANSPARENT = Culonglong(0x20000000)

const NCALPHA_BLEND = Culonglong(0x10000000)

const NCALPHA_OPAQUE = Culonglong(0x00000000)

const NCPALETTESIZE = 256

const NC_NOBACKGROUND_MASK = Culonglong(0x8700000000000000)

const NC_BGDEFAULT_MASK = Culonglong(0x0000000040000000)

const NC_BG_RGB_MASK = Culonglong(0x0000000000ffffff)

const NC_BG_PALETTE = Culonglong(0x0000000008000000)

const NC_BG_ALPHA_MASK = Culonglong(0x30000000)

NCCHANNEL_INITIALIZER(r, g, b) = uint32_t(r) << Cuint(16) + uint32_t(g) << Cuint(8) + b + NC_BGDEFAULT_MASK

NCCHANNELS_INITIALIZER(fr, fg, fb, br, bg, bb) = NCCHANNEL_INITIALIZER(fr, fg, fb) << Culonglong(32) + NCCHANNEL_INITIALIZER(br, bg, bb)

const WCHAR_MAX_UTF8BYTES = 4

# Skipping MacroDefinition: NCCELL_INITIALIZER ( c , s , chan ) { . gcluster = ( htole ( c ) ) , . gcluster_backstop = 0 , . width = ( uint8_t ) ( ( wcwidth ( c ) < 0 || ! c ) ? 1 : wcwidth ( c ) ) , . stylemask = ( s ) , . channels = ( chan ) , }

# Skipping MacroDefinition: NCCELL_CHAR_INITIALIZER ( c ) { . gcluster = ( htole ( c ) ) , . gcluster_backstop = 0 , . width = ( uint8_t ) ( ( wcwidth ( c ) < 0 || ! c ) ? 1 : wcwidth ( c ) ) , . stylemask = 0 , . channels = 0 , }

# Skipping MacroDefinition: NCCELL_TRIVIAL_INITIALIZER { . gcluster = 0 , . gcluster_backstop = 0 , . width = 1 , . stylemask = 0 , . channels = 0 , }

const NCSTYLE_MASK = Cuint(0xffff)

const NCSTYLE_ITALIC = Cuint(0x0010)

const NCSTYLE_UNDERLINE = Cuint(0x0008)

const NCSTYLE_UNDERCURL = Cuint(0x0004)

const NCSTYLE_BOLD = Cuint(0x0002)

const NCSTYLE_STRUCK = Cuint(0x0001)

const NCSTYLE_NONE = 0

const NCOPTION_INHIBIT_SETLOCALE = Culonglong(0x0001)

const NCOPTION_NO_CLEAR_BITMAPS = Culonglong(0x0002)

const NCOPTION_NO_WINCH_SIGHANDLER = Culonglong(0x0004)

const NCOPTION_NO_QUIT_SIGHANDLERS = Culonglong(0x0008)

const NCOPTION_PRESERVE_CURSOR = Culonglong(0x0010)

const NCOPTION_SUPPRESS_BANNERS = Culonglong(0x0020)

const NCOPTION_NO_ALTERNATE_SCREEN = Culonglong(0x0040)

const NCOPTION_NO_FONT_CHANGES = Culonglong(0x0080)

const NCOPTION_DRAIN_INPUT = Culonglong(0x0100)

const NCOPTION_SCROLLING = Culonglong(0x0200)

const NCOPTION_CLI_MODE = ((NCOPTION_NO_ALTERNATE_SCREEN | NCOPTION_NO_CLEAR_BITMAPS) | NCOPTION_PRESERVE_CURSOR) | NCOPTION_SCROLLING

const NCINPUT_MAX_EFF_TEXT_CODEPOINTS = 4

const NCMICE_NO_EVENTS = 0

const NCMICE_MOVE_EVENT = 0x01

const NCMICE_BUTTON_EVENT = 0x02

const NCMICE_DRAG_EVENT = 0x04

const NCMICE_ALL_EVENTS = 0x07

const NCPLANE_OPTION_HORALIGNED = Culonglong(0x0001)

const NCPLANE_OPTION_VERALIGNED = Culonglong(0x0002)

const NCPLANE_OPTION_MARGINALIZED = Culonglong(0x0004)

const NCPLANE_OPTION_FIXED = Culonglong(0x0008)

const NCPLANE_OPTION_AUTOGROW = Culonglong(0x0010)

const NCPLANE_OPTION_VSCROLL = Culonglong(0x0020)

const NCBOXMASK_TOP = 0x0001

const NCBOXMASK_RIGHT = 0x0002

const NCBOXMASK_BOTTOM = 0x0004

const NCBOXMASK_LEFT = 0x0008

const NCBOXGRAD_TOP = 0x0010

const NCBOXGRAD_RIGHT = 0x0020

const NCBOXGRAD_BOTTOM = 0x0040

const NCBOXGRAD_LEFT = 0x0080

const NCBOXCORNER_MASK = 0x0300

const NCBOXCORNER_SHIFT = Cuint(8)

const NCVISUAL_OPTION_NODEGRADE = Culonglong(0x0001)

const NCVISUAL_OPTION_BLEND = Culonglong(0x0002)

const NCVISUAL_OPTION_HORALIGNED = Culonglong(0x0004)

const NCVISUAL_OPTION_VERALIGNED = Culonglong(0x0008)

const NCVISUAL_OPTION_ADDALPHA = Culonglong(0x0010)

const NCVISUAL_OPTION_CHILDPLANE = Culonglong(0x0020)

const NCVISUAL_OPTION_NOINTERPOLATE = Culonglong(0x0040)

const NCREEL_OPTION_INFINITESCROLL = Culonglong(0x0001)

const NCREEL_OPTION_CIRCULAR = Culonglong(0x0002)

const NCPREFIXCOLUMNS = 7

const NCIPREFIXCOLUMNS = 8

const NCBPREFIXCOLUMNS = 9

const NCPREFIXSTRLEN = NCPREFIXCOLUMNS + 1

const NCIPREFIXSTRLEN = NCIPREFIXCOLUMNS + 1

const NCBPREFIXSTRLEN = NCBPREFIXCOLUMNS + 1

NCMETRICFWIDTH(x, cols) = Cint((strlen(x) - ncstrwidth(x, NULL, NULL)) + cols)

NCPREFIXFMT(x) = (NCMETRICFWIDTH(x, NCPREFIXCOLUMNS), x)

NCIPREFIXFMT(x) = (NCMETRICFWIDTH(x, NCIPREFIXCOLUMNS), x)

NCBPREFIXFMT(x) = (NCMETRICFWIDTH(x, NCBPREFIXCOLUMNS), x)

const NCMENU_OPTION_BOTTOM = Culonglong(0x0001)

const NCMENU_OPTION_HIDING = Culonglong(0x0002)

const NCPROGBAR_OPTION_RETROGRADE = Cuint(0x0001)

const NCTABBED_OPTION_BOTTOM = Culonglong(0x0001)

const NCPLOT_OPTION_LABELTICKSD = Cuint(0x0001)

const NCPLOT_OPTION_EXPONENTIALD = Cuint(0x0002)

const NCPLOT_OPTION_VERTICALI = Cuint(0x0004)

const NCPLOT_OPTION_NODEGRADE = Cuint(0x0008)

const NCPLOT_OPTION_DETECTMAXONLY = Cuint(0x0010)

const NCPLOT_OPTION_PRINTSAMPLE = Cuint(0x0020)

const NCREADER_OPTION_HORSCROLL = Culonglong(0x0001)

const NCREADER_OPTION_VERSCROLL = Culonglong(0x0002)

const NCREADER_OPTION_NOCMDKEYS = Culonglong(0x0004)

const NCREADER_OPTION_CURSOR = Culonglong(0x0008)

