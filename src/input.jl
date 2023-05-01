
function get_nblock(n::Union{Direct,NotcursesObject})
  ni = Ref{L.ncinput}()
  v = if n isa Direct
    L.ncdirect_get_nblock(n, ni)
  else
    L.notcurses_get_nblock(n, ni)
  end
  v == 0 && return nothing
  if v == -1
    throw(NotcursesException("error in `get_nblock`"))
  end
  k = L.nckey_synthesized_p(v) ? Key.T(v) : Char(v)
  return k, ni[]
end

function get_blocking(n::Union{Direct,NotcursesObject})
  ni = Ref{L.ncinput}()
  v = if n isa Direct
    L.ncdirect_get_blocking(n, ni)
  else
    L.notcurses_get_blocking(n, ni)
  end
  v == 0 && return nothing
  if v == -1
    throw(NotcursesException("error in `get_blocking`"))
  end
  v = L.nckey_synthesized_p(v) ? Key.T(v) : Char(v)
  return v, ni[]
end
