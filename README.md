# Notcurses.jl

Notcurses.jl is a Julia package that provides a wrapper over [notcurses](https://github.com/dankamongmen/notcurses), the most blingful TUI library.

### Usage

```julia
import Notcurses as N

nc = N.NotcursesObject(; opts = N.Options(; flags = UInt64(N.OptionsFlags.CLI_MODE | N.OptionsFlags.SUPPRESS_BANNERS)))
plane = N.stdplane(nc)
N.putstrln(plane, "\nhello world!")
N.render(nc)
N.stop(nc)
```
