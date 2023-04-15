
function get_nblocking(n::Union{Direct,NotcursesObject})
  ni = Ref{L.ncinput}()
  v = if n isa Direct
    L.ncdirect_get_nblocking(n, ni)
  else
    L.notcurses_get_nblocking(n, ni)
  end
  v == 0 && return nothing
  if v == -1
    throw(NotcursesException("error in `ncdirect_get_blocking`"))
  end
  k = L.nckey_synthesized_p(v) ? Key.T(v) : Char(v)
  return k, ni[]
end

function get_blocking(n::Union{Direct,NotcursesObject})
  ni_ref = Ref{L.ncinput}()
  v = if n isa Direct
    L.ncdirect_get_blocking(n, ni_ref)
  else
    L.notcurses_get_blocking(n, ni_ref)
  end
  v == 0 && return nothing
  if v == -1
    throw(NotcursesException("error in `ncdirect_get_blocking`"))
  end
  ni = ni_ref[]
  v = L.nckey_synthesized_p(v) ? Key.T(v) : Char(v)
  return v, ni
end
