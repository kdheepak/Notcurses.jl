
"""
Initialize a Notcurses context on the connected terminal at 'fp'. 'fp' must
be a tty. You'll usually want stdout. NULL can be supplied for 'fp', in
which case /dev/tty will be opened. Returns NULL on error, including any
failure initializing terminfo.
"""
function init(::Type{NotcursesObject}, opts::Options, file::Union{IOStream,Nothing})
  ptr = withenv("TERMINFO" => joinpath(Ncurses_jll.artifact_dir, "share", "terminfo")) do
    L.notcurses_init(opts, isnothing(file) ? C_NULL : Base.Libc.FILE(file)) # TODO: allow passing a FD
  end
  ptr == C_NULL && throw(NotcursesException("failed to initialize notcurses"))
  nc = NotcursesObject(opts, ptr)
  finalizer(nc) do nc
    !isnothing(file) && close(file)
    stop(nc)
  end
  nc
end

function core_init(::Type{NotcursesObject}, opts::Options, file::Union{IOStream,Nothing})
  ptr = withenv("TERMINFO" => joinpath(Ncurses_jll.artifact_dir, "share", "terminfo")) do
    L.notcurses_core_init(opts, isnothing(file) ? C_NULL : Base.Libc.FILE(file)) # TODO: allow passing a FD
  end
  ptr == C_NULL && throw(NotcursesException("failed to initialize notcurses"))
  nc = NotcursesObject(opts, ptr)
  finalizer(nc) do nc
    !isnothing(file) && close(file)
    stop(nc)
  end
  nc
end

"""
Destroy a Notcurses context. A NULL 'nc' is a no-op.
"""
function stop(nc::NotcursesObject)
  L.notcurses_stop(nc)
  nc.ptr = C_NULL
  nothing
end

"""
Shift to the alternate screen, if available. If already using the alternate
screen, this returns 0 immediately. If the alternate screen is not
available, this returns -1 immediately. Entering the alternate screen turns
off scrolling for the standard plane.
"""
enter_alternate_screen(nc::NotcursesObject) = L.notcurses_enter_alternate_screen(nc)

"""
Exit the alternate screen. Immediately returns 0 if not currently using the
alternate screen.
"""
leave_alternate_screen(nc::NotcursesObject) = L.notcurses_leave_alternate_screen(nc)

"""
Renders and rasterizes the standard pile in one shot. Blocking call.
"""
render(nc::NotcursesObject) = L.notcurses_render(nc)

"""
Get a reference to the standard plane (one matching our current idea of the
terminal size) for this terminal. The standard plane always exists, and its
origin is always at the uppermost, leftmost cell of the terminal.
"""
stdplane(nc::NotcursesObject) = Plane(L.notcurses_stdplane(nc.ptr))

stdplane_const(nc::NotcursesObject) = Plane(L.notcurses_stdplane_const(nc.ptr))

stddim_yx(nc::NotcursesObject, y = C_NULL, x = C_NULL) = Plane(L.notcurses_stddim_yx(nc, y, x))

stddim_yx_const(nc::NotcursesObject, y = C_NULL, x = C_NULL) = Plane(L.notcurses_stddim_yx_const(nc, y, x))

"""
Return the topmost plane of the standard pile.
"""
top(nc::NotcursesObject) = Plane(L.notcurses_top(nc))

"""
Return the bottommost plane of the standard pile.
"""
bottom(nc::NotcursesObject) = Plane(L.notcurses_bottom(nc))

function term_dim_yx(nc::NotcursesObject)
  rows, cols = Ref{Cuint}(0), Ref{Cuint}(0)
  L.notcurses_term_dim_yx(nc, rows, cols)
  (; rows = rows[], cols = cols[])
end

function refresh(nc::NotcursesObject)
  rows, cols = Ref{Cuint}(0), Ref{Cuint}(0)
  L.notcurses_refresh(nc, rows, cols)
  (; rows = rows[], cols = cols[])
end

function default_foreground(nc::NotcursesObject)
  fg = Ref{Cuint}(0)
  L.notcurses_default_foreground(nc, fg) != 0 && error("Unable to get default foreground")
  Crayon(; foreground = fg)
end

function default_background(nc::NotcursesObject)
  bg = Ref{Cuint}(0)
  L.notcurses_default_background(nc, bg) && error("Unable to get default background")
  Crayon(; background = bg)
end

cursor_enable(nc::NotcursesObject, y::Integer, x::Integer) = L.notcurses_cursor_enable(nc, y, x)

cursor_disable(nc::NotcursesObject) = L.notcurses_cursor_disable(nc)

function cursor_yx(nc::NotcursesObject)
  y, x = Ref{Cint}(0), Ref{Cint}(0)
  L.notcurses_cursor_yx(nc, y, x)
  (; y = y[], x = x[])
end

function supported_styles(nc::NotcursesObject)
  supported = Dict()
  value = L.notcurses_supported_styles(nc)
  supported[:bold] = (value & L.NCSTYLE_BOLD) != 0
  supported[:italics] = (value & L.NCSTYLE_ITALIC) != 0
  supported[:underline] = (value & L.NCSTYLE_UNDERLINE) != 0
  supported[:undercurl] = (value & L.NCSTYLE_UNDERCURL) != 0
  supported[:strikethrough] = (value & L.NCSTYLE_STRUCK) != 0
  supported
end

palette_size(nc::NotcursesObject) = L.notcurses_palette_size(nc)

canfade(nc::NotcursesObject) = L.notcurses_canfade(nc)

cantruecolor(nc::NotcursesObject) = L.notcurses_cantruecolor(nc)

canopen_images(nc::NotcursesObject) = L.notcurses_canopen_images(nc)

canopen_videos(nc::NotcursesObject) = L.notcurses_canopen_videos(nc)

canchangecolor(nc::NotcursesObject) = L.notcurses_canchangecolor(nc)

canutf8(nc::NotcursesObject) = L.notcurses_canutf8(nc)

canhalfblock(nc::NotcursesObject) = L.notcurses_canhalfblock(nc)

canquadrant(nc::NotcursesObject) = L.notcurses_canquadrant(nc)

cansextants(nc::NotcursesObject) = L.notcurses_cansextants(nc)

canbraille(nc::NotcursesObject) = L.notcurses_braille(nc)

canpixel(nc::NotcursesObject) = L.notcurses_pixel(nc)

check_pixel_support(nc::NotcursesObject) = NcPixelImpl.T(L.notcurses_check_pixel_support(nc))

mice_enable(nc::NotcursesObject) = L.notcurses_mice_enable(nc, 0x7)
mice_disable(nc::NotcursesObject) = L.notcurses_mice_enable(nc, 0)

function capabilities(nc::NotcursesObject)
  c = unsafe_load(L.notcurses_capabilities(nc))
  Capabilities(Int(c.colors), c.utf8, c.rgb, c.can_change_colors, c.halfblocks, c.quadrants, c.sextants, c.braille)
end
