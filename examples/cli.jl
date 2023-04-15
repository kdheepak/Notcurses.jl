import Notcurses as N

function main()
  nc = N.NotcursesObject(; opts = N.Options(; flags = UInt64(N.OptionsFlags.CLI_MODE | N.OptionsFlags.SUPPRESS_BANNERS)))
  plane = N.stdplane(nc)
  N.render(nc)
  N.stop(nc)
end

main()
