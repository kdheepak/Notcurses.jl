module LibNotcurses

using Notcurses_jll

macro L_str(x)
  esc(x)
end

const libnotcurses = Notcurses_jll.get_libnotcurses_path()
const libnotcurses_ffi = Notcurses_jll.get_libnotcurses_ffi_path()
const libnotcurses_core = Notcurses_jll.get_libnotcurses_core_path()

include("LibNotcurses_core.jl")
include("LibNotcurses_ffi.jl")
include("LibNotcurses_init.jl")

# exports
const PREFIXES = ["nc", "notcurses"]
for name in names(@__MODULE__; all = true), prefix in PREFIXES
  if startswith(lowercase(string(name)), prefix)
    @eval export $name
  end
end

end
