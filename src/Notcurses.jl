module Notcurses

import Ncurses_jll
using EnumX
using Crayons
using Logging

include("./lib/LibNotcurses.jl")
import .LibNotcurses as L
using .LibNotcurses

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
include("visual.jl")

include("helper.jl")

end # module Notcurses
