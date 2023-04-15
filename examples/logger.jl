using Notcurses
using Logging

const N = Notcurses

function main()
  t = tempname()
  f = open(t, "w")
  global_logger(SimpleLogger(f))
  @info "Inside main() function"
  nc = nothing
  try
    nc = N.NotcursesObject()
    @info "Notcurses" version = N.version()
    N.leave_alternate_screen(nc)
    @info "Left alternate screen"
    sleep(1)
    @show N.supported_styles(nc)
    # @show "Waiting for input"
    # @show N.get_blocking(nc)
    sleep(1)
    N.enter_alternate_screen(nc)
    @info "Enter alternate screen"
    sleep(1)
  catch err
    iob = IOBuffer()
    showerror(iob, err, catch_backtrace())
    @error "Something went wrong" exception = String(take!(iob))
  finally
    flush(f)
    close(f)
    try
      !isnothing(nc) && close(nc)
    catch err
      iob = IOBuffer()
      showerror(iob, err, catch_backtrace())
      @error "Something went wrong finally" exception = String(take!(iob))
    end
    println("\nlog: \n", read(t, String))
  end
end

main()
