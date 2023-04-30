
"""
    from_file(file)

Open a visual at 'file', extract a codec and parameters, decode the first
image to memory.
"""
function from_file(file::String)
  Visual(L.ncvisual_from_file(Cstring(pointer(file))))
end

"""
    from_plane(n, blit, begy, begx, leny, lenx)

Promote an ncplane 'n' to an ncvisual. The plane may contain only spaces,
half blocks, and full blocks. The latter will be checked, and any other
glyph will result in a NULL being returned. This function exists so that
planes can be subjected to ncvisual transformations. If possible, it's
better to create the ncvisual from memory using from_rgba().
Lengths of 0 are interpreted to mean "all available remaining area".
"""
function from_plane(n::Plane, blit, begy, begx, leny, lenx)
  Visual(L.ncvisual_from_plane(n, blit, begy, begx, leny, lenx))
end

"""
    from_sixel(s, leny, lenx)

Construct an ncvisual from a nul-terminated Sixel control sequence.
"""
function from_sixel(s::String, leny, lenx)
  Visual(L.ncvisual_from_sixel(Cstring(pointer(s)), leny, lenx))
end

"""
    geom(nc, n, vopts, geom)

all-purpose ncvisual geometry solver. one or both of 'nc' and 'n' must be
non-NULL.ncvisual_ if 'nc' is NULL, only pixy/pixx will be filled in, with the true
pixel geometry of 'n'. if 'n' is NULL, only cdimy/cdimx, blitter,
scaley/scalex, and maxpixely/maxpixelx are filled in. cdimy/cdimx and
maxpixely/maxpixelx are only ever filled in if we know them.
"""
function geom(nc::NotcursesObject, n::Visual, vopts::Options, geom)
  L.ncvisual_geom(nc, n, vopts, geom)
end

"""
    destroy(ncv)

Destroy an ncvisual. Rendered elements will not be disrupted, but the visual
can be neither decoded nor rendered any further.
"""
function destroy(ncv::Visual)
  L.ncvisual_destroy(ncv)
end

"""
    decode(nc)

extract the next frame from an ncvisual. returns 1 on end of file, 0 on
success, and -1 on failure.
"""
function decode(nc)
  L.ncvisual_decode(nc)
end

"""
    decode_loop(nc)

decode the next frame ala decode(), but if we have reached the end,
rewind to the first frame of the ncvisual. a subsequent 'blit()'
will render the first frame, as if the ncvisual had been closed and reopened.
the return values remain the same as those of decode().
"""
function decode_loop(nc)
  L.ncvisual_decode_loop(nc)
end

"""
    rotate(n, rads)

Rotate the visual 'rads' radians. Only M_PI/2 and -M_PI/2 are supported at
the moment, but this might change in the future.
"""
function rotate(n, rads::Float64)
  L.ncvisual_rotate(n, rads)
end

"""
    resize(n, rows, cols)

Scale the visual to 'rows' X 'columns' pixels, using the best scheme
available. This is a lossy transformation, unless the size is unchanged.
"""
function resize(n::Visual, rows, cols)
  L.ncvisual_resize(n, rows, cols)
end

"""
    resize_noninterpolative(n, rows, cols)

Scale the visual to 'rows' X 'columns' pixels, using non-interpolative
(naive) scaling. No new colors will be introduced as a result.
"""
function resize_noninterpolative(n::Visual, rows, cols)
  L.ncvisual_resize_noninterpolative(n, rows, cols)
end

"""
    polyfill_yx(n, y, x, rgba)

Polyfill at the specified location within the ncvisual 'n', using 'rgba'.
"""
function polyfill_yx(n::Visual, y, x, rgba)
  L.ncvisual_polyfill_yx(n, y, x, rgba)
end

"""
    at_yx(n, y, x, pixel)

Get the specified pixel from the specified ncvisual.
"""
function at_yx(n::Visual, y, x)
  pixel = Ref{UInt32}(0)
  L.ncvisual_at_yx(n, y, x, pixel)
  pixel[]
end

"""
    set_yx(n, y, x, pixel)

Set the specified pixel in the specified ncvisual.
"""
function set_yx(n::Visual, y, x, pixel)
  L.ncvisual_set_yx(n, y, x, pixel)
end

"""
    blit(nc, ncv, vopts)

Render the decoded frame according to the provided options (which may be
NULL). The plane used for rendering depends on vopts->n and vopts->flags.
If NCVISUAL_OPTION_CHILDPLANE is set, vopts->n must not be NULL, and the
plane will always be created as a child of vopts->n. If this flag is not
set, and vopts->n is NULL, a new plane is created as root of a new pile.
If the flag is not set and vopts->n is not NULL, we render to vopts->n.
A subregion of the visual can be rendered using 'begx', 'begy', 'lenx', and
'leny'. Negative values for any of these are an error. It is an error to
specify any region beyond the boundaries of the frame. Returns the (possibly
newly-created) plane to which we drew. Pixels may not be blitted to the
standard plane.
"""
function blit(nc::NotcursesObject, ncv::Visual, vopts::Options)
  Plane(L.ncvisual_blit(nc, ncv, vopts))
end

"""
    subtitle_plane(parent, ncv)

If a subtitle ought be displayed at this time, return a new plane (bound
to 'parent' containing the subtitle, which might be text or graphics
(depending on the input format).
"""
function subtitle_plane(parent::Plane, ncv::Visual)
  Plane(L.ncvisual_subtitle_plane(parent, ncv))
end

"""
    media_defblitter(nc, scale)

Get the default *media* (not plot) blitter for this environment when using
the specified scaling method. Currently, this means:

  - if lacking UTF-8, NCBLIT_1x1
  - otherwise, if not NCSCALE_STRETCH, NCBLIT_2x1
  - otherwise, if sextants are not known to be good, NCBLIT_2x2
  - otherwise NCBLIT_3x2
    NCBLIT_2x2 and NCBLIT_3x2 both distort the original aspect ratio, thus
    NCBLIT_2x1 is used outside of NCSCALE_STRETCH.
"""
function media_defblitter(nc::NotcursesObject, scale)
  L.ncvisual_media_defblitter(nc, scale::ncscale_e)::ncblitter_e
end

"""
    simple_streamer(ncv, vopts, tspec, curry)

Shut up and display my frames! Provide as an argument to stream().
If you'd like subtitles to be decoded, provide an ncplane as the curry. If the
curry is NULL, subtitles will not be displayed.
"""
function simple_streamer(ncv::Visual, vopts::Options, tspec, curry)
  L.ncvisual_simple_streamer(ncv, vopts, tspec::Ptr{Cvoid}, curry::Ptr{Cvoid})
end

"""
    stream(nc, ncv, timescale, streamer, vopts, curry)

Stream the entirety of the media, according to its own timing. Blocking,
obviously. streamer may be NULL; it is otherwise called for each frame, and
its return value handled as outlined for streamcb. If streamer() returns
non-zero, the stream is aborted, and that value is returned. By convention,
return a positive number to indicate intentional abort from within
streamer(). 'timescale' allows the frame duration time to be scaled. For a
visual naturally running at 30FPS, a 'timescale' of 0.1 will result in
300FPS, and a 'timescale' of 10 will result in 3FPS. It is an error to
supply 'timescale' less than or equal to 0.
"""
function stream(nc::NotcursesObject, ncv::Visual, timescale, streamer, vopts, curry)
  L.ncvisual_stream(nc, ncv, timescale::Cfloat, streamer::ncstreamcb, vopts::Ptr{options}, curry::Ptr{Cvoid})
end
