function NotcursesContext(func::Function)
  t = tempname()
  f = open(t, "w")
  logger = global_logger(SimpleLogger(f))
  nc = nothing
  try
    nc = NotcursesObject()
    func(nc)
  catch err
    iob = IOBuffer()
    showerror(iob, err, catch_backtrace())
    @error "Something went wrong" exception = String(take!(iob))
  finally
    Base.flush(f)
    Base.close(f)
    try
      !isnothing(nc) && Base.close(nc)
    catch err
      iob = IOBuffer()
      showerror(iob, err, catch_backtrace())
      @error "Something went wrong finally" exception = String(take!(iob))
    end
  end
  global_logger(logger)
  read(t, String)
end
