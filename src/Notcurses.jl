module Notcurses

import Ncurses_jll
using EnumX
using Crayons
using Logging

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

include("context.jl")

end # module Notcurses
