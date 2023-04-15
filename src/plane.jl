
"""
Return the topmost plane of the pile containing 'n'.
"""
top(n::Plane) = L.ncpile_top(n)

"""
Return the bottommost plane of the pile containing 'n'.
"""
bottom(n::Plane) = L.ncpile_bottom(n)

putstr(n::Plane, str::Union{AbstractChar,AbstractString}) = L.ncplane_putstr(n.ptr, string(str))

putstrln(n::Plane, str::AbstractString) = putstr(n::Plane, str * "\n")

putstr_yx(n::Plane, y::Integer, x::Integer, str::Union{AbstractChar,AbstractString}) = L.ncplane_putstr_yx(n.ptr, y, x, string(str))

set_scrolling(n::Plane, v::Bool) = L.ncplane_set_scrolling(n::Plane, v)

putstr_aligned(n::Plane, y::Integer, align::Align.T, str::AbstractString) = L.ncplane_putstr_aligned(n::Plane, y, align, str)

"""
Write the specified text to the plane, breaking lines sensibly, beginning at
the specified line. Returns the number of columns written. When breaking a
line, the line will be cleared to the end of the plane (the last line will
*not* be so cleared). The number of bytes written from the input is written
to '*bytes' if it is not NULL. Cleared columns are included in the return
value, but *not* included in the number of bytes written. Leaves the cursor
at the end of output. A partial write will be accomplished as far as it can;
determine whether the write completed by inspecting '*bytes'. Can output to
multiple rows even in the absence of scrolling, but not more rows than are
available. With scrolling enabled, arbitrary amounts of data can be emitted.
All provided whitespace is preserved -- ncplane_puttext() followed by an
appropriate ncplane_contents() will read back the original output.

If 'y' is -1, the first row of output is taken relative to the current
cursor: it will be left-, right-, or center-aligned in whatever remains
of the row. On subsequent rows -- or if 'y' is not -1 -- the entire row can
be used, and alignment works normally.

A newline at any point will move the cursor to the next row.
"""
function puttext(n::Plane, y::Integer, align::Align.T, text::AbstractString)
  bytes = Ref{Csize_t}()
  i = L.ncplane_puttext(n::Plane, y, align, text, bytes)
  return bytes[]
end

"""
Return the dimensions of this ncplane
"""
function dim_yx(n::Plane)
  y, x = Ref{Cuint}(), Ref{Cuint}()
  L.ncplane_dim_yx(n::Plane, y, x)
  return (y, x)
end

"""
Return the dimensions of this ncplane
"""
function dim(n::Plane)
  y, x = dim_yx(n)
  return (; y, x)
end

erase(n::Plane) = L.ncplane_erase(n)

"""
Renders the pile of which 'n' is a part. Rendering this pile again will blow
away the render. To actually write out the render, call ncpile_rasterize().
"""
render(n::Plane) = L.ncpile_render(n)

"""
Make the physical screen match the last rendered frame from the pile of
which 'n' is a part. This is a blocking call. Don't call this before the
pile has been rendered (doing so will likely result in a blank screen).
"""
rasterize(n::Plane) = L.ncpile_rasterize(n)

"""
Perform the rendering and rasterization portion of ncpile_render() and
ncpile_rasterize(), but do not write the resulting buffer out to the
terminal. Using this function, the user can control the writeout process.
The returned buffer must be freed by the caller.
"""
function render_to_buffer(n::Plane)
  (; y, x) = dim(n)
  buf = Ref(Vector{UInt8}(undef, y * x))
  L.ncpile_render_to_buffer(n, buf, y * x)
  buf[]
end

render_to_file(n::Plane, io::IOStream) = L.ncpile_render_to_file(n, Base.Libc.FILE(io))

at_yx(nc::NotcursesObject, yoff, xoff, styles, channels) = unsafe_string(L.notcurses_at_yx(nc, yoff, xoff, styles, channels))

align(availu::Int, align::Align.T, u::Int) = L.notcurses_align(availu, align, u)
align(n::Plane, align::Align.T, c::Int) = L.ncplane_align(n, align, c)

"""
Resize the specified ncplane. The four parameters 'keepy', 'keepx',
'keepleny', and 'keeplenx' define a subset of the ncplane to keep,
unchanged. This may be a region of size 0, though none of these four
parameters may be negative. 'keepx' and 'keepy' are relative to the ncplane.
They must specify a coordinate within the ncplane's totality. 'yoff' and
'xoff' are relative to 'keepy' and 'keepx', and place the upper-left corner
of the resized ncplane. Finally, 'ylen' and 'xlen' are the dimensions of the
ncplane after resizing. 'ylen' must be greater than or equal to 'keepleny',
and 'xlen' must be greater than or equal to 'keeplenx'. It is an error to
attempt to resize the standard plane. If either of 'keepleny' or 'keeplenx'
is non-zero, both must be non-zero.

Essentially, the kept material does not move. It serves to anchor the
resized plane. If there is no kept material, the plane can move freely.
"""
function resize(n::Plane, keepy, keepx, keepleny, keeplenx, yoff, xoff, ylen, xlen)
  L.ncplane_resize(n, keepy, keepx, keepleny, keeplenx, yoff, xoff, ylen, xlen)
end

"""
Destroy the specified ncplane. None of its contents will be visible after
the next call to notcurses_render(). It is an error to attempt to destroy
the standard plane.
"""
function destroy(n)
  L.ncplane_destroy(n)
end

"""
Set the ncplane's base nccell to 'c'. The base cell is used for purposes of
rendering anywhere that the ncplane's gcluster is 0. Note that the base cell
is not affected by ncplane_erase(). 'c' must not be a secondary cell from a
multicolumn EGC.
"""
function set_base_cell(n::Plane, c::Cell)
  L.ncplane_set_base_cell(n, c)
end

"""
Set the ncplane's base nccell. It will be used for purposes of rendering
anywhere that the ncplane's gcluster is 0. Note that the base cell is not
affected by ncplane_erase(). 'egc' must be an extended grapheme cluster.
Returns the number of bytes copied out of 'gcluster', or -1 on failure.
"""
function set_base(n::Plane, egc::String, stylemask, channels)
  L.ncplane_set_base(n, egc, stylemask::UInt16, channels)
end

"""
Extract the ncplane's base nccell into 'c'. The reference is invalidated if
'ncp' is destroyed.
"""
function base(n::Plane, c::Cell)
  L.ncplane_base(n, c)
end

"""
Get the origin of plane 'n' relative to its bound plane, or pile (if 'n' is
a root plane). To get absolute coordinates, use ncplane_abs_yx().
"""
function yx(n::Plane)
  y, x = Ref{Cint}(0), Ref{Cint}(0)
  L.ncplane_yx(n, y, x)
  (; y = y[], x = x[])
end

function y(n)
  L.ncplane_y(n)
end

function x(n)
  L.ncplane_x(n)
end

"""
Move this plane relative to the standard plane, or the plane to which it is
bound (if it is bound to a plane). It is an error to attempt to move the
standard plane.
"""
function move_yx(n::Plane, y, x)
  L.ncplane_move_yx(n, y, x)
end

"""
Get the origin of plane 'n' relative to its pile. Either or both of 'x' and
'y' may be NULL.
"""
function abs_yx(n::Plane, y, x)
  y, x = Ref{Cint}(0), Ref{Cint}(0)
  L.ncplane_abs_yx(n, y, x)
  (; y = y[], x = x[])
end

function abs_y(n::Plane)
  L.ncplane_abs_y(n)
end

function abs_x(n::Plane)
  L.ncplane_abs_x(n)
end

"""
Get the plane to which the plane 'n' is bound, if any.
"""
function parent(n::Plane)
  L.ncplane_parent(n)
end

function parent_const(n::Plane)
  L.ncplane_parent_const(n)
end

"""
Splice ncplane 'n' out of the z-buffer, and reinsert it above 'above'.
Returns non-zero if 'n' is already in the desired location. 'n' and
'above' must not be the same plane. If 'above' is NULL, 'n' is moved
to the bottom of its pile.
"""
function move_above(n::Plane, above)
  L.ncplane_move_above(n, above)
end

"""
Splice ncplane 'n' out of the z-buffer, and reinsert it below 'below'.
Returns non-zero if 'n' is already in the desired location. 'n' and
'below' must not be the same plane. If 'below' is NULL, 'n' is moved to
the top of its pile.
"""
function move_below(n::Plane, below)
  L.ncplane_move_below(n, below)
end

"""
Splice ncplane 'n' and its bound planes out of the z-buffer, and reinsert
them above or below 'targ'. Relative order will be maintained between the
reinserted planes. For a plane E bound to C, with z-ordering A B C D E,
moving the C family to the top results in C E A B D, while moving it to
the bottom results in A B D C E.
"""
function move_family_above(n::Plane, targ)
  L.ncplane_move_family_above(n, targ)
end

function move_family_below(n::Plane, targ)
  L.ncplane_move_family_below(n, targ)
end

"""
Return the plane below this one, or NULL if this is at the bottom.
"""
function below(n::Plane)
  L.ncplane_below(n)
end

"""
Return the plane above this one, or NULL if this is at the top.
"""
function above(n::Plane)
  L.ncplane_above(n)
end

"""
Effect |r| scroll events on the plane |n|. Returns an error if |n| is not
a scrolling plane, and otherwise returns the number of lines scrolled.
"""
function scrollup(n::Plane, r)
  L.ncplane_scrollup(n, r)
end

"""
Scroll |n| up until |child| is no longer hidden beneath it. Returns an
error if |child| is not a child of |n|, or |n| is not scrolling, or |child|
is fixed. Returns the number of scrolling events otherwise (might be 0).
If the child plane is not fixed, it will likely scroll as well.
"""
function scrollup_child(n::Plane, child)
  L.ncplane_scrollup_child(n, child)
end

"""
Rotate the plane π/2 radians clockwise or counterclockwise. This cannot
be performed on arbitrary planes, because glyphs cannot be arbitrarily
rotated. The glyphs which can be rotated are limited: line-drawing
characters, spaces, half blocks, and full blocks. The plane must have
an even number of columns. Use the ncvisual rotation for a more
flexible approach.
"""
function rotate_cw(n::Plane)
  L.ncplane_rotate_cw(n)
end

function rotate_ccw(n::Plane)
  L.ncplane_rotate_ccw(n)
end

"""
Retrieve the current contents of the cell under the cursor. The EGC is
returned, or NULL on error. This EGC must be free()d by the caller. The
stylemask and channels are written to 'stylemask' and 'channels', respectively.
"""
function at_cursor(n::Plane)
  stylemask, channels = Ref{UInt16}(0), Ref{UInt64}(0)
  egc = unsafe_string(L.ncplane_at_cursor(n, stylemask, channels))
  (; egc, stylemask = stylemask[], channels = channels[])
end

"""
Retrieve the current contents of the cell under the cursor into 'c'. This
cell is invalidated if the associated plane is destroyed. Returns the number
of bytes in the EGC, or -1 on error.
"""
function at_cursor_cell(n::Plane, c)
  c = Ref{L.nccell}(C_NULL)
  nbytes = L.ncplane_at_cursor_cell(n, c)
  nbytes, c[]
end

"""
Retrieve the current contents of the specified cell. The EGC is returned, or
NULL on error. This EGC must be free()d by the caller. The stylemask and
channels are written to 'stylemask' and 'channels', respectively. The return
represents how the cell will be used during rendering, and thus integrates
any base cell where appropriate. If called upon the secondary columns of a
wide glyph, the EGC will be returned (i.e. this function does not distinguish
between the primary and secondary columns of a wide glyph). If called on a
sprixel plane, its control sequence is returned for all valid locations.
"""
function at_yx(n::Plane, y, x, stylemask, channels)
  stylemask, channels = Ref{UInt16}(0), Ref{UInt64}(0)
  egc = unsafe_string(L.ncplane_at_yx(n, y, x, stylemask, channels))
  (; egc, stylemask = stylemask[], channels = channels[])
end

"""
Retrieve the current contents of the specified cell into 'c'. This cell is
invalidated if the associated plane is destroyed. Returns the number of
bytes in the EGC, or -1 on error. Unlike ncplane_at_yx(), when called upon
the secondary columns of a wide glyph, the return can be distinguished from
the primary column (nccell_wide_right_p(c) will return true). It is an
error to call this on a sprixel plane (unlike ncplane_at_yx()).
"""
function at_yx_cell(n::Plane, y, x, c)
  c = Ref{L.nccell}(C_NULL)
  nbytes = L.ncplane_at_yx_cell(n, y, x, c)
  nbytes, c[]
end

"""
Create a flat string from the EGCs of the selected region of the ncplane
'n'. Start at the plane's 'begy'x'begx' coordinate (which must lie on the
plane), continuing for 'leny'x'lenx' cells. Either or both of 'leny' and
'lenx' can be specified as 0 to go through the boundary of the plane.
-1 can be specified for 'begx'/'begy' to use the current cursor location.
"""
function contents(n::Plane, begy, begx, leny, lenx)
  unsafe_string(L.ncplane_contents(n, begy, begx, leny, lenx))
end

"""
Manipulate the opaque user pointer associated with this plane.
ncplane_set_userptr() returns the previous userptr after replacing
it with 'opaque'. the others simply return the userptr.
"""
function set_userptr(n::Plane, opaque)
  L.ncplane_set_userptr(n, opaque::Ptr{Cvoid})::Ptr{Cvoid}
end

function userptr(n::Plane)
  L.ncplane_userptr(n)
end

"""
Find the center coordinate of a plane, preferring the top/left in the
case of an even number of rows/columns (in such a case, there will be one
more cell to the bottom/right of the center than the top/left). The
center is then modified relative to the plane's origin.
"""
function center_abs(n::Plane, y, x)
  y, x = Ref{Cint}(0), Ref{Cint}(0)
  L.ncplane_center_abs(n, y, x)
  (; y = y[], x = x[])
end

"""
Create an RGBA flat array from the selected region of the ncplane 'nc'.
Start at the plane's 'begy'x'begx' coordinate (which must lie on the
plane), continuing for 'leny'x'lenx' cells. Either or both of 'leny' and
'lenx' can be specified as 0 to go through the boundary of the plane.
Only glyphs from the specified ncblitset may be present. If 'pxdimy' and/or
'pxdimx' are non-NULL, they will be filled in with the total pixel geometry.
"""
function as_rgba(n::Plane, blit, begy, begx, leny, lenx)
  pxdimy, pxdimx = Ref{Cuint}(0), Ref{Cuint}(0)
  L.ncplane_as_rgba(n, blit, begy, begx, leny, lenx, pxdimy, pxdimx) # TODO deal with return value of Ptr{UInt32}
end

"""
Move the cursor to the specified position (the cursor needn't be visible).
Pass -1 as either coordinate to hold that axis constant. Returns -1 if the
move would place the cursor outside the plane.
"""
function cursor_move_yx(n::Plane, y, x)
  L.ncplane_cursor_move_yx(n, y, x)
end

"""
Move the cursor relative to the current cursor position (the cursor needn't
be visible). Returns -1 on error, including target position exceeding the
plane's dimensions.
"""
function cursor_move_rel(n::Plane, y, x)
  L.ncplane_cursor_move_rel(n, y, x)
end

"""
Move the cursor to 0, 0. Can't fail.
"""
function home(n::Plane)
  L.ncplane_home(n)
end

"""
Get the current position of the cursor within n. y and/or x may be NULL.
"""
function cursor_yx(n::Plane, y, x)
  y, x = Ref{Cint}(0), Ref{Cint}(0)
  L.ncplane_cursor_yx(n, y, x)
  (; y = y[], x = x[])
end

"""
Get the current colors and alpha values for ncplane 'n'.
"""
function channels(n::Plane)
  L.ncplane_channels(n)
end

"""
Get the current styling for the ncplane 'n'.
"""
function styles(n::Plane)
  L.ncplane_styles(n)
end

"""
Replace the cell at the specified coordinates with the provided cell 'c',
and advance the cursor by the width of the cell (but not past the end of the
plane). On success, returns the number of columns the cursor was advanced.
'c' must already be associated with 'n'. On failure, -1 is returned.
"""
function putc_yx(n::Plane, y, x, c)
  L.ncplane_putc_yx(n, y, x, c)
end

"""
Replace the EGC underneath us, but retain the styling. The current styling
of the plane will not be changed.
"""
function putchar_stained(n::Plane, c)
  L.ncplane_putchar_stained(n, c)
end

"""
Replace the cell at the specified coordinates with the provided EGC, and
advance the cursor by the width of the cluster (but not past the end of the
plane). On success, returns the number of columns the cursor was advanced.
On failure, -1 is returned. The number of bytes converted from gclust is
written to 'sbytes' if non-NULL.
"""
function putegc_yx(n::Plane, y, x, gclust, sbytes)
  error(NotcursesException("Not implemented yet."))
  # L.ncplane_putegc_yx(n, y, x, gclust, sbytes::Ptr{Csize_t})
end

"""
Replace the EGC underneath us, but retain the styling. The current styling
of the plane will not be changed.
"""
function putegc_stained(n::Plane, gclust, sbytes)
  error(NotcursesException("Not implemented yet."))
  # L.ncplane_putegc_stained(n, gclust, sbytes::Ptr{Csize_t})
end

"""
Replace the EGC underneath us, but retain the styling. The current styling
of the plane will not be changed.
"""
function putwegc_stained(n::Plane, gclust, sbytes)
  error(NotcursesException("Not implemented yet."))
  # L.ncplane_putwegc_stained(n, gclust::Ptr{Cwchar_t}, sbytes::Ptr{Csize_t})
end

function putnstr_aligned(n::Plane, y, align::Align.T, s, str)
  error(NotcursesException("Not implemented yet."))
  # L.ncplane_putnstr_aligned(n, y, align, s::Csize_t, str)
end

function putwstr_stained(n::Plane, gclustarr)
  error(NotcursesException("Not implemented yet."))
  # L.ncplane_putwstr_stained(n, gclustarr::Ptr{Cwchar_t})
end

"""
Draw horizontal or vertical lines using the specified cell, starting at the
current cursor position. The cursor will end at the cell following the last
cell output (even, perhaps counter-intuitively, when drawing vertical
lines), just as if ncplane_putc() was called at that spot. Return the
number of cells drawn on success. On error, return the negative number of
cells drawn. A length of 0 is an error, resulting in a return of -1.
"""
function hline_interp(n::Plane, c, len, c1, c2)
  L.ncplane_hline_interp(n, c, len, c1, c2)
end

function vline_interp(n::Plane, c, len, c1, c2)
  L.ncplane_vline_interp(n, c, len, c1, c2)
end

"""
Draw a box with its upper-left corner at the current cursor position, and its
lower-right corner at 'ystop'x'xstop'. The 6 cells provided are used to draw the
upper-left, ur, ll, and lr corners, then the horizontal and vertical lines.
'ctlword' is defined in the least significant byte, where bits [7, 4] are a
gradient mask, and [3, 0] are a border mask:

  - 7, 3: top
  - 6, 2: right
  - 5, 1: bottom
  - 4, 0: left
    If the gradient bit is not set, the styling from the hl/vl cells is used for
    the horizontal and vertical lines, respectively. If the gradient bit is set,
    the color is linearly interpolated between the two relevant corner cells.

By default, vertexes are drawn whether their connecting edges are drawn or
not. The value of the bits corresponding to NCBOXCORNER_MASK control this,
and are interpreted as the number of connecting edges necessary to draw a
given corner. At 0 (the default), corners are always drawn. At 3, corners
are never drawn (since at most 2 edges can touch a box's corner).
"""
function box(n::Plane, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)
  L.ncplane_box(n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)
end

"""
Starting at the specified coordinate, if its glyph is different from that of
'c', 'c' is copied into it, and the original glyph is considered the fill
target. We do the same to all cardinally-connected cells having this same
fill target. Returns the number of cells polyfilled. An invalid initial y, x
is an error. Returns the number of cells filled, or -1 on error.
"""
function polyfill_yx(n::Plane, y, x, c)
  L.ncplane_polyfill_yx(n, y, x, c)
end

"""
Draw a gradient with its upper-left corner at the position specified by 'y'/'x',
where -1 means the current cursor position in that dimension. The area is
specified by 'ylen'/'xlen', where 0 means "everything remaining below or
to the right, respectively." The glyph composed of 'egc' and 'styles' is
used for all cells. The channels specified by 'ul', 'ur', 'll', and 'lr'
are composed into foreground and background gradients. To do a vertical
gradient, 'ul' ought equal 'ur' and 'll' ought equal 'lr'. To do a
horizontal gradient, 'ul' ought equal 'll' and 'ur' ought equal 'ul'. To
color everything the same, all four channels should be equivalent. The
resulting alpha values are equal to incoming alpha values. Returns the
number of cells filled on success, or -1 on failure.
Palette-indexed color is not supported.

Preconditions for gradient operations (error otherwise):

all: only RGB colors, unless all four channels match as default
all: all alpha values must be the same
1x1: all four colors must be the same
1xN: both top and both bottom colors must be the same (vertical gradient)
Nx1: both left and both right colors must be the same (horizontal gradient)
"""
function gradient(n::Plane, y, x, ylen, xlen, egc, styles, ul, ur, ll, lr)
  L.ncplane_gradient(n, y, x, ylen, xlen, egc, styles::UInt16, ul, ur, ll, lr)
end

"""
Do a high-resolution gradient using upper blocks and synced backgrounds.
This doubles the number of vertical gradations, but restricts you to
half blocks (appearing to be full blocks). Returns the number of cells
filled on success, or -1 on error.
"""
function gradient2x1(n::Plane, y, x, ylen, xlen, ul, ur, ll, lr)
  L.ncplane_gradient2x1(n, y, x, ylen, xlen, ul::UInt32, ur::UInt32, ll::UInt32, lr::UInt32)
end

"""
Set the given style throughout the specified region, keeping content and
channels unchanged. The upper left corner is at 'y', 'x', and -1 may be
specified to indicate the cursor's position in that dimension. The area
is specified by 'ylen', 'xlen', and 0 may be specified to indicate everything
remaining to the right and below, respectively. It is an error for any
coordinate to be outside the plane. Returns the number of cells set,
or -1 on failure.
"""
function format(n::Plane, y, x, ylen, xlen, stylemask)
  L.ncplane_format(n, y, x, ylen, xlen, stylemask::UInt16)
end

"""
Set the given channels throughout the specified region, keeping content and
channels unchanged. The upper left corner is at 'y', 'x', and -1 may be
specified to indicate the cursor's position in that dimension. The area
is specified by 'ylen', 'xlen', and 0 may be specified to indicate everything
remaining to the right and below, respectively. It is an error for any
coordinate to be outside the plane. Returns the number of cells set,
or -1 on failure.
"""
function stain(n::Plane, y, x, ylen, xlen, ul, ur, ll, lr)
  L.ncplane_stain(n, y, x, ylen, xlen, ul, ur, ll, lr)
end

"""
Merge the entirety of 'src' down onto the ncplane 'dst'. If 'src' does not
intersect with 'dst', 'dst' will not be changed, but it is not an error.
"""
function mergedown_simple(src, dst)
  L.ncplane_mergedown_simple(src, dst)
end

"""
Merge the ncplane 'src' down onto the ncplane 'dst'. This is most rigorously
defined as "write to 'dst' the frame that would be rendered were the entire
stack made up only of the specified subregion of 'src' and, below it, the
subregion of 'dst' having the specified origin. Supply -1 to indicate the
current cursor position in the relevant dimension. Merging is independent of
the position of 'src' viz 'dst' on the z-axis. It is an error to define a
subregion that is not entirely contained within 'src'. It is an error to
define a target origin such that the projected subregion is not entirely
contained within 'dst'.  Behavior is undefined if 'src' and 'dst' are
equivalent. 'dst' is modified, but 'src' remains unchanged. Neither 'src'
nor 'dst' may have sprixels. Lengths of 0 mean "everything left".
"""
function mergedown(src, dst, begsrcy, begsrcx, leny, lenx, dsty, dstx)
  L.ncplane_mergedown(src, dst, begsrcy, begsrcx, leny, lenx, dsty, dstx)
end

"""
Erase every cell in the ncplane (each cell is initialized to the null glyph
and the default channels/styles). All cells associated with this ncplane are
invalidated, and must not be used after the call, *excluding* the base cell.
The cursor is homed. The plane's active attributes are unaffected.
"""
function erase(n)
  L.ncplane_erase(n)
end

"""
Erase every cell in the region starting at {ystart, xstart} and having size
{|ylen|x|xlen|} for non-zero lengths. If ystart and/or xstart are -1, the current
cursor position along that axis is used; other negative values are an error. A
negative ylen means to move up from the origin, and a negative xlen means to move
left from the origin. A positive ylen moves down, and a positive xlen moves right.
A value of 0 for the length erases everything along that dimension. It is an error
if the starting coordinate is not in the plane, but the ending coordinate may be
outside the plane.

For example, on a plane of 20 rows and 10 columns, with the cursor at row 10 and
column 5, the following would hold:

(-1, -1, 0, 1): clears the column to the right of the cursor (column 6)
(-1, -1, 0, -1): clears the column to the left of the cursor (column 4)
(-1, -1, INT_MAX, 0): clears all rows with or below the cursor (rows 10--19)
(-1, -1, -INT_MAX, 0): clears all rows with or above the cursor (rows 0--10)
(-1, 4, 3, 3): clears from row 5, column 4 through row 7, column 6
(-1, 4, -3, -3): clears from row 5, column 4 through row 3, column 2
(4, -1, 0, 3): clears columns 5, 6, and 7
(-1, -1, 0, 0): clears the plane *if the cursor is in a legal position*
(0, 0, 0, 0): clears the plane in all cases
"""
function erase_region(n::Plane, ystart, xstart, ylen, xlen)
  L.ncplane_erase_region(n, ystart, xstart, ylen, xlen)
end

"""
Set the alpha and coloring bits of the plane's current channels from a
64-bit pair of channels.
"""
function set_channels(n::Plane, channels)
  L.ncplane_set_channels(n, channels)
end

"""
Set the background alpha and coloring bits of the plane's current
channels from a single 32-bit value.
"""
function set_bchannel(n::Plane, channel)
  L.ncplane_set_bchannel(n, channel)
end

"""
Set the foreground alpha and coloring bits of the plane's current
channels from a single 32-bit value.
"""
function set_fchannel(n::Plane, channel)
  L.ncplane_set_fchannel(n, channel)
end

"""
Set the specified style bits for the ncplane 'n', whether they're actively
supported or not.
"""
function set_styles(n::Plane, stylebits)
  L.ncplane_set_styles(n, stylebits)
end

"""
Add the specified styles to the ncplane's existing spec.
"""
function on_styles(n::Plane, stylebits)
  L.ncplane_on_styles(n, stylebits)
end

"""
Remove the specified styles from the ncplane's existing spec.
"""
function off_styles(n::Plane, stylebits)
  L.ncplane_off_styles(n, stylebits)
end

"""
Set the current fore/background color using RGB specifications. If the
terminal does not support directly-specified 3x8b cells (24-bit "TrueColor",
indicated by the "RGB" terminfo capability), the provided values will be
interpreted in some lossy fashion. None of r, g, or b may exceed 255.
"HP-like" terminals require setting foreground and background at the same
time using "color pairs"; Notcurses will manage color pairs transparently.
"""
function set_fg_rgb8(n::Plane, r, g, b)
  L.ncplane_set_fg_rgb8(n, r, g, b)
end

function set_bg_rgb8(n::Plane, r, g, b)
  L.ncplane_set_bg_rgb8(n, r, g, b)
end

"""
Same, but clipped to [0..255].
"""
function set_bg_rgb8_clipped(n::Plane, r, g, b)
  L.ncplane_set_bg_rgb8_clipped(n, r, g, b)
end

function set_fg_rgb8_clipped(n::Plane, r, g, b)
  L.ncplane_set_fg_rgb8_clipped(n, r, g, b)
end

"""
Same, but with rgb assembled into a channel (i.e. lower 24 bits).
"""
function set_fg_rgb(n::Plane, channel)
  L.ncplane_set_fg_rgb(n, channel)
end

function set_bg_rgb(n::Plane, channel)
  L.ncplane_set_bg_rgb(n, channel)
end

"""
Use the default color for the foreground/background.
"""
function set_fg_default(n)
  L.ncplane_set_fg_default(n)
end

function set_bg_default(n)
  L.ncplane_set_bg_default(n)
end

"""
Set the ncplane's foreground palette index, set the foreground palette index
bit, set it foreground-opaque, and clear the foreground default color bit.
"""
function set_fg_palindex(n::Plane, idx)
  L.ncplane_set_fg_palindex(n, idx)
end

function set_bg_palindex(n::Plane, idx)
  L.ncplane_set_bg_palindex(n, idx)
end

"""
Set the alpha parameters for ncplane 'n'.
"""
function set_fg_alpha(n::Plane, alpha)
  L.ncplane_set_fg_alpha(n, alpha)
end

function set_bg_alpha(n::Plane, alpha)
  L.ncplane_set_bg_alpha(n, alpha)
end
