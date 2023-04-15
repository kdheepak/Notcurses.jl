module Notcurses

import Ncurses_jll
using EnumX
using Crayons

include("./lib/LibNotcurses.jl")
import .LibNotcurses as L

include("utils.jl")
include("enums.jl")
include("options.jl")
include("structs.jl")
include("api.jl")
include("plane.jl")
include("channel.jl")
include("cell.jl")
include("direct.jl")
include("input.jl")

end # module Notcurses
