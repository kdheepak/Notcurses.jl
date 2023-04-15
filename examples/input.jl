import Notcurses as N

function main()
  nc = N.NotcursesObject(; opts = N.Options(; flags = UInt64(N.OptionsFlags.CLI_MODE | N.OptionsFlags.SUPPRESS_BANNERS)))
  N.mice_disable(nc)
  plane = N.stdplane(nc)
  N.putstrln(plane, "Waiting for input")
  N.putstrln(plane, "$(N.get_blocking(nc))")
  N.putstrln(plane, "$(N.get_blocking(nc))")
  N.putstrln(plane, "$(N.get_blocking(nc))")
  N.render(nc)
  N.stop(nc)
end

main()
