
init(c::Cell) = L.nccell_init(c)

"""
Breaks the UTF-8 string in 'gcluster' down, setting up the nccell 'c'.
Returns the number of bytes copied out of 'gcluster', or -1 on failure. The
styling of the cell is left untouched, but any resources are released.
"""
load(n::Plane, c::Cell, gcluster::String) = L.nccell_load(n, c, gcluster)

"""
Duplicate 'c' into 'targ'; both must be/will be bound to 'n'. Returns -1 on
failure, and 0 on success.
"""
function duplicate(n, targ, c)
  L.nccell_duplicate(n, targ, c)
end

"""
Release resources held by the nccell 'c'.
"""
function release(n, c)
  L.nccell_release(n, c)
end

"""
return a pointer to the NUL-terminated EGC referenced by 'c'. this pointer
can be invalidated by any further operation on the plane 'n', so...watch out!
"""
function extended_gcluster(n::Plane, c::Cell)
  unsafe_string(L.nccell_extended_gcluster(n, c))
end
