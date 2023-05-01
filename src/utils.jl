
struct NotcursesException
  str::String
end
Base.showerror(io::IO, nce::NotcursesException) = print(io, nce.str)

version() = VersionNumber(unsafe_string(L.notcurses_version()))

function version_components()
  major, minor, patch, tweak = Ref{Cint}(0), Ref{Cint}(0), Ref{Cint}(0), Ref{Cint}(0)
  L.notcurses_version_components(major, minor, patch, tweak)
  VersionNumber(Int(major[]), Int(minor[]), Int(patch[]), (tweak[],))
end

strwidth(s) = L.ncstrwidth(s, C_NULL, C_NULL)

accountname() = unsafe_string(L.notcurses_accountname())
hostname() = unsafe_string(L.notcurses_hostname())
osversion() = unsafe_string(L.notcurses_osversion())

function rgba_to_uint32(r::UInt8, g::UInt8, b::UInt8, a::UInt8)::UInt32
  return (UInt32(a) << 24) | (UInt32(b) << 16) | (UInt32(g) << 8) | UInt32(r)
end
