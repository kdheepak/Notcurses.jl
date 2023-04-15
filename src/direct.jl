Base.cconvert(::Type{L.ncdirect}, n::Direct) = n.ptr

"""
The same as ncdirect_init(), but without any multimedia functionality,
allowing for a svelter binary. Link with notcurses-core if this is used.
"""
function core_init(::Type{Direct}, opts::Options, file::Union{Nothing,IOStream})
  ptr = withenv("TERMINFO" => joinpath(Ncurses_jll.artifact_dir, "share", "terminfo")) do
    L.ncdirect_core_init(isempty(opts.termtype) ? C_NULL : pointer(opts.termtype), isnothing(file) ? C_NULL : Base.Libc.FILE(file), opts.flags)
  end
  ptr == C_NULL && throw(NotcursesException("failed to initialize notcurses_direct"))
  nc = Direct(ptr)
  finalizer(nc) do nc
    !isnothing(file) && close(file)
    stop(nc)
  end
  nc
end

"""
Initialize a direct-mode Notcurses context on the connected terminal at 'fp'.
'fp' must be a tty. You'll usually want stdout. Direct mode supports a
limited subset of Notcurses routines which directly affect 'fp', and neither
supports nor requires notcurses_render(). This can be used to add color and
styling to text in the standard output paradigm. 'flags' is a bitmask over
NCDIRECT_OPTION_*.
Returns NULL on error, including any failure initializing terminfo.
"""
function init(::Type{Direct}, opts::Options, file::Union{Nothing,IOStream})
  ptr = withenv("TERMINFO" => joinpath(Ncurses_jll.artifact_dir, "share", "terminfo")) do
    L.ncdirect_core_init(isempty(opts.termtype) ? C_NULL : pointer(opts.termtype), isnothing(file) ? C_NULL : Base.Libc.FILE(file), opts.flags)
  end
  ptr == C_NULL && throw(NotcursesException("failed to initialize notcurses_direct"))
  nc = Direct(ptr)
  finalizer(nc) do nc
    !isnothing(file) && close(file)
    stop(nc)
  end
  nc
end

"""
Read a (heap-allocated) newline-delimited chunk of text, after printing the
prompt. The newline itself, if present, is included. Returns NULL on error.
"""
function readline(nc::Direct, prompt)
  L.ncdirect_readline(nc, prompt)
end

"""
Direct mode. This API can be used to colorize and stylize output generated
outside of notcurses, without ever calling notcurses_render(). These should
not be intermixed with standard Notcurses rendering.
"""
function set_fg_rgb(nc::Direct, rgb)
  L.ncdirect_set_fg_rgb(nc, rgb)
end

function set_bg_rgb(nc::Direct, rgb)
  L.ncdirect_set_bg_rgb(nc, rgb)
end

function set_fg_palindex(nc::Direct, pidx)
  L.ncdirect_set_fg_palindex(nc, pidx)
end

function set_bg_palindex(nc::Direct, pidx)
  L.ncdirect_set_bg_palindex(nc, pidx)
end

"""
Returns the number of simultaneous colors claimed to be supported, or 1 if
there is no color support. Note that several terminal emulators advertise
more colors than they actually support, downsampling internally.
"""
function palette_size(nc::Direct)
  L.ncdirect_palette_size(nc)
end

"""
Output the string |utf8| according to the channels |channels|. Note that
ncdirect_putstr() does not explicitly flush output buffers, so it will not
necessarily be immediately visible. Returns EOF on error.
"""
function putstr(nc::Direct, channels, utf8)
  L.ncdirect_putstr(nc, channels, utf8)
end

"""
Output a single EGC (this might be several characters) from |utf8|,
according to the channels |channels|. On success, the number of columns
thought to have been used is returned, and if |sbytes| is not NULL,
the number of bytes consumed will be written there.
"""
function putegc(nc::Direct, channels, utf8, sbytes)
  L.ncdirect_putegc(nc, channels, utf8, sbytes::Ptr{Cint})
end

"""
Force a flush. Returns 0 on success, -1 on failure.
"""
function flush(nc::Direct)
  L.ncdirect_flush(nc)
end

function set_fg_default(nc::Direct)
  L.ncdirect_set_fg_default(nc)
end

function set_bg_default(nc::Direct)
  L.ncdirect_set_bg_default(nc)
end

"""
Get the current number of columns/rows.
"""
function dim_x(nc::Direct)
  L.ncdirect_dim_x(nc)
end

function dim_y(nc::Direct)
  L.ncdirect_dim_y(nc)
end

"""
Returns a 16-bit bitmask of supported curses-style attributes
(NCSTYLE_UNDERLINE, NCSTYLE_BOLD, etc.) The attribute is only
indicated as supported if the terminal can support it together with color.
For more information, see the "ncv" capability in terminfo(5).
"""
function supported_styles(nc::Direct)
  L.ncdirect_supported_styles(nc)
end

"""
ncplane_styles_*() analogues
"""
function set_styles(nc::Direct, stylebits)
  L.ncdirect_set_styles(nc, stylebits)
end

function on_styles(nc::Direct, stylebits)
  L.ncdirect_on_styles(nc, stylebits)
end

function off_styles(nc::Direct, stylebits)
  L.ncdirect_off_styles(nc, stylebits)
end

function styles(nc::Direct)
  L.ncdirect_styles(nc)
end

"""
Move the cursor in direct mode. -1 to retain current location on that axis.
"""
function cursor_move_yx(nc::Direct, y, x)
  L.ncdirect_cursor_move_yx(nc, y, x)
end

function cursor_enable(nc::Direct)
  L.ncdirect_cursor_enable(nc)
end

function cursor_disable(nc::Direct)
  L.ncdirect_cursor_disable(nc)
end

function cursor_up(nc::Direct, num)
  L.ncdirect_cursor_up(nc, num)
end

function cursor_left(nc::Direct, num)
  L.ncdirect_cursor_left(nc, num)
end

function cursor_right(nc::Direct, num)
  L.ncdirect_cursor_right(nc, num)
end

function cursor_down(nc::Direct, num)
  L.ncdirect_cursor_down(nc, num)
end

"""
Get the cursor position, when supported. This requires writing to the
terminal, and then reading from it. If the terminal doesn't reply, or
doesn't reply in a way we understand, the results might be deleterious.
"""
function cursor_yx(nc::Direct, y, x)
  L.ncdirect_cursor_yx(nc, y::Ptr{Cuint}, x::Ptr{Cuint})
end

"""
Push or pop the cursor location to the terminal's stack. The depth of this
stack, and indeed its existence, is terminal-dependent.
"""
function cursor_push(nc::Direct)
  L.ncdirect_cursor_push(nc)
end

function cursor_pop(nc::Direct)
  L.ncdirect_cursor_pop(nc)
end

"""
Clear the screen.
"""
function clear(nc::Direct)
  L.ncdirect_clear(nc)
end

function capabilities(nc::Direct)
  c = unsafe_load(L.ncdirect_capabilities(nc))
  Capabilities(Int(c.colors), c.utf8, c.rgb, c.can_change_colors, c.halfblocks, c.quadrants, c.sextants, c.braille)
end

"""
Draw horizontal/vertical lines using the specified channels, interpolating
between them as we go. The EGC may not use more than one column. For a
horizontal line, |len| cannot exceed the screen width minus the cursor's
offset. For a vertical line, it may be as long as you'd like; the screen
will scroll as necessary. All lines start at the current cursor position.
"""
function hline_interp(nc::Direct, egc, len, h1, h2)
  L.ncdirect_hline_interp(nc, egc, len, h1, h2)
end

"""
Draw horizontal/vertical lines using the specified channels, interpolating
between them as we go. The EGC may not use more than one column. For a
horizontal line, |len| cannot exceed the screen width minus the cursor's
offset. For a vertical line, it may be as long as you'd like; the screen
will scroll as necessary. All lines start at the current cursor position.
"""
function vline_interp(nc::Direct, egc, len, h1, h2)
  L.ncdirect_vline_interp(nc, egc, len, h1, h2)
end

"""
Draw a box with its upper-left corner at the current cursor position, having
dimensions |ylen|x|xlen|. See ncplane_box() for more information. The
minimum box size is 2x2, and it cannot be drawn off-screen. |wchars| is an
array of 6 wide characters: UL, UR, LL, LR, HL, VL.
"""
function box(nc::Direct, ul, ur, ll, lr, wchars, ylen, xlen, ctlword)
  L.ncdirect_box(nc, ul, ur, ll, lr, wchars, ylen, xlen, ctlword)
end

"""
ncdirect_box() with the rounded box-drawing characters
"""
function rounded_box(nc::Direct, ul, ur, ll, lr, ylen, xlen, ctlword)
  L.ncdirect_rounded_box(nc, ul, ur, ll, lr, ylen, xlen, ctlword)
end

"""
ncdirect_box() with the double box-drawing characters
"""
function double_box(nc::Direct, ul, ur, ll, lr, ylen, xlen, ctlword)
  L.ncdirect_double_box(nc, ul, ur, ll, lr, ylen, xlen, ctlword)
end
