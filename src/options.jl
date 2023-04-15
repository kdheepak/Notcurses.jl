
Base.@kwdef struct Options
  """
  The name of the terminfo database entry describing this terminal. If NULL,
  the environment variable TERM is used. Failure to open the terminal
  definition will result in failure to initialize notcurses.
  """
  termtype::String = ""
  """
  Progressively higher log levels result in more logging to stderr. By
  default, nothing is printed to stderr once fullscreen service begins.
  """
  loglevel::LogLevel.T = LogLevel.PANIC
  """
  Desirable margins. If all are 0 (default), we will render to the entirety
  of the screen. If the screen is too small, we do what we can--this is
  strictly best-effort. Absolute coordinates are relative to the rendering
  area ((0, 0) is always the origin of the rendering area).
  """
  margin_t::Int = 0
  """
  Desirable margins. If all are 0 (default), we will render to the entirety
  of the screen. If the screen is too small, we do what we can--this is
  strictly best-effort. Absolute coordinates are relative to the rendering
  area ((0, 0) is always the origin of the rendering area).
  """
  margin_r::Int = 0
  """
  Desirable margins. If all are 0 (default), we will render to the entirety
  of the screen. If the screen is too small, we do what we can--this is
  strictly best-effort. Absolute coordinates are relative to the rendering
  area ((0, 0) is always the origin of the rendering area).
  """
  margin_b::Int = 0
  """
  Desirable margins. If all are 0 (default), we will render to the entirety
  of the screen. If the screen is too small, we do what we can--this is
  strictly best-effort. Absolute coordinates are relative to the rendering
  area ((0, 0) is always the origin of the rendering area).
  """
  margin_l::Int = 0
  """
  General flags; see NCOPTION_*. This is expressed as a bitfield so that
  future options can be added without reshaping the struct. Undefined bits
  must be set to 0.
  """
  flags::UInt = UInt(L.NCOPTION_SUPPRESS_BANNERS)
end
Base.cconvert(::Type{Ptr{L.notcurses_options}}, opts::Options) = Ref(
  L.notcurses_options(
    isempty(opts.termtype) ? C_NULL : pointer(opts.termtype),
    L.ncloglevel_e(Int(opts.loglevel)),
    Cint(opts.margin_t),
    Cint(opts.margin_r),
    Cint(opts.margin_b),
    Cint(opts.margin_l),
    opts.flags,
  ),
)
"""
Lex a margin argument according to the standard Notcurses definition. There
can be either a single number, which will define all margins equally, or
there can be four numbers separated by commas.
"""
lex_margins(op::String, opts::Options) = L.notcurses_lex_margins(isempty(op) ? C_NULL : pointer(op), opts)

Base.@kwdef struct PlaneOptions
  y::Int = 0
  x::Int = 0
  rows::Int = 0
  cols::Int = 0
  userptr::Ptr{Cvoid} = C_NULL
  name::Ptr{Cchar} = C_NULL # ?
  resizecb::Ptr{Cvoid} = C_NULL
  flags::UInt64 = 0
  margin_b::Cuint = 0
  margin_r::Cuint = 0
end
Base.cconvert(::Type{Ptr{L.ncplane_options}}, opts::PlaneOptions) =
  Ref(L.ncplane_options(opts.y, opts.x, opts.rows, opts.cols, opts.userptr, opts.name, opts.resizecb, opts.flags, opts.margin_b, opts.margin_r))
