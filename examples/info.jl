import Notcurses as N

function main()
  nc = N.NotcursesObject(; opts = N.Options(; flags = UInt64(N.OptionsFlags.CLI_MODE | N.OptionsFlags.SUPPRESS_BANNERS)))
  plane = N.stdplane(nc)
  caps = N.capabilities(nc)
  styles = N.supported_styles(nc)
  N.putstrln(plane, "")
  N.putstrln(plane, "capabilities = $caps")
  N.putstrln(plane, "styles = $styles")
  N.render(nc)
  N.stop(nc)
end

main()
