module LibNotcurses

using Notcurses_jll
export Notcurses_jll

using CEnum

const uintmax_t = Culong

mutable struct ncdirect end

function ncdirect_init(termtype, fp, flags)
    ccall((:ncdirect_init, notcurses), Ptr{ncdirect}, (Ptr{Cchar}, Ptr{Cint}, Cint), termtype, fp, flags)
end

function ncdirect_core_init(termtype, fp, flags)
    ccall((:ncdirect_core_init, notcurses), Ptr{ncdirect}, (Ptr{Cchar}, Ptr{Cint}, Cint), termtype, fp, flags)
end

function ncdirect_readline(nc, prompt)
    ccall((:ncdirect_readline, notcurses), Ptr{Cchar}, (Ptr{ncdirect}, Ptr{Cchar}), nc, prompt)
end

function ncdirect_set_fg_rgb(nc, rgb)
    ccall((:ncdirect_set_fg_rgb, notcurses), Cint, (Ptr{ncdirect}, Cuint), nc, rgb)
end

function ncdirect_set_bg_rgb(nc, rgb)
    ccall((:ncdirect_set_bg_rgb, notcurses), Cint, (Ptr{ncdirect}, Cuint), nc, rgb)
end

function ncdirect_set_fg_palindex(nc, pidx)
    ccall((:ncdirect_set_fg_palindex, notcurses), Cint, (Ptr{ncdirect}, Cint), nc, pidx)
end

function ncdirect_set_bg_palindex(nc, pidx)
    ccall((:ncdirect_set_bg_palindex, notcurses), Cint, (Ptr{ncdirect}, Cint), nc, pidx)
end

function ncdirect_palette_size(nc)
    ccall((:ncdirect_palette_size, notcurses), Cuint, (Ptr{ncdirect},), nc)
end

function ncdirect_putstr(nc, channels, utf8)
    ccall((:ncdirect_putstr, notcurses), Cint, (Ptr{ncdirect}, Cint, Ptr{Cchar}), nc, channels, utf8)
end

function ncdirect_putegc(nc, channels, utf8, sbytes)
    ccall((:ncdirect_putegc, notcurses), Cint, (Ptr{ncdirect}, Cint, Ptr{Cchar}, Ptr{Cint}), nc, channels, utf8, sbytes)
end

function ncdirect_flush(nc)
    ccall((:ncdirect_flush, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_set_bg_rgb8(nc, r, g, b)
    ccall((:ncdirect_set_bg_rgb8, notcurses), Cint, (Ptr{ncdirect}, Cuint, Cuint, Cuint), nc, r, g, b)
end

function ncdirect_set_fg_rgb8(nc, r, g, b)
    ccall((:ncdirect_set_fg_rgb8, notcurses), Cint, (Ptr{ncdirect}, Cuint, Cuint, Cuint), nc, r, g, b)
end

function ncdirect_set_fg_default(nc)
    ccall((:ncdirect_set_fg_default, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_set_bg_default(nc)
    ccall((:ncdirect_set_bg_default, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_dim_x(nc)
    ccall((:ncdirect_dim_x, notcurses), Cuint, (Ptr{ncdirect},), nc)
end

function ncdirect_dim_y(nc)
    ccall((:ncdirect_dim_y, notcurses), Cuint, (Ptr{ncdirect},), nc)
end

function ncdirect_supported_styles(nc)
    ccall((:ncdirect_supported_styles, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_set_styles(n, stylebits)
    ccall((:ncdirect_set_styles, notcurses), Cint, (Ptr{ncdirect}, Cuint), n, stylebits)
end

function ncdirect_on_styles(n, stylebits)
    ccall((:ncdirect_on_styles, notcurses), Cint, (Ptr{ncdirect}, Cuint), n, stylebits)
end

function ncdirect_off_styles(n, stylebits)
    ccall((:ncdirect_off_styles, notcurses), Cint, (Ptr{ncdirect}, Cuint), n, stylebits)
end

function ncdirect_styles(n)
    ccall((:ncdirect_styles, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_cursor_move_yx(n, y, x)
    ccall((:ncdirect_cursor_move_yx, notcurses), Cint, (Ptr{ncdirect}, Cint, Cint), n, y, x)
end

function ncdirect_cursor_enable(nc)
    ccall((:ncdirect_cursor_enable, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_cursor_disable(nc)
    ccall((:ncdirect_cursor_disable, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_cursor_up(nc, num)
    ccall((:ncdirect_cursor_up, notcurses), Cint, (Ptr{ncdirect}, Cint), nc, num)
end

function ncdirect_cursor_left(nc, num)
    ccall((:ncdirect_cursor_left, notcurses), Cint, (Ptr{ncdirect}, Cint), nc, num)
end

function ncdirect_cursor_right(nc, num)
    ccall((:ncdirect_cursor_right, notcurses), Cint, (Ptr{ncdirect}, Cint), nc, num)
end

function ncdirect_cursor_down(nc, num)
    ccall((:ncdirect_cursor_down, notcurses), Cint, (Ptr{ncdirect}, Cint), nc, num)
end

function ncdirect_cursor_yx(n, y, x)
    ccall((:ncdirect_cursor_yx, notcurses), Cint, (Ptr{ncdirect}, Ptr{Cuint}, Ptr{Cuint}), n, y, x)
end

function ncdirect_cursor_push(n)
    ccall((:ncdirect_cursor_push, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_cursor_pop(n)
    ccall((:ncdirect_cursor_pop, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_clear(nc)
    ccall((:ncdirect_clear, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_capabilities(n)
    ccall((:ncdirect_capabilities, notcurses), Ptr{Cint}, (Ptr{ncdirect},), n)
end

function ncdirect_hline_interp(n, egc, len, h1, h2)
    ccall((:ncdirect_hline_interp, notcurses), Cint, (Ptr{ncdirect}, Ptr{Cchar}, Cuint, Cint, Cint), n, egc, len, h1, h2)
end

function ncdirect_vline_interp(n, egc, len, h1, h2)
    ccall((:ncdirect_vline_interp, notcurses), Cint, (Ptr{ncdirect}, Ptr{Cchar}, Cuint, Cint, Cint), n, egc, len, h1, h2)
end

function ncdirect_box(n, ul, ur, ll, lr, wchars, ylen, xlen, ctlword)
    ccall((:ncdirect_box, notcurses), Cint, (Ptr{ncdirect}, Cint, Cint, Cint, Cint, Ptr{Cint}, Cuint, Cuint, Cuint), n, ul, ur, ll, lr, wchars, ylen, xlen, ctlword)
end

function ncdirect_light_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    ccall((:ncdirect_light_box, notcurses), Cint, (Ptr{ncdirect}, Cint, Cint, Cint, Cint, Cuint, Cuint, Cuint), n, ul, ur, ll, lr, ylen, xlen, ctlword)
end

function ncdirect_heavy_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    ccall((:ncdirect_heavy_box, notcurses), Cint, (Ptr{ncdirect}, Cint, Cint, Cint, Cint, Cuint, Cuint, Cuint), n, ul, ur, ll, lr, ylen, xlen, ctlword)
end

function ncdirect_ascii_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    ccall((:ncdirect_ascii_box, notcurses), Cint, (Ptr{ncdirect}, Cint, Cint, Cint, Cint, Cuint, Cuint, Cuint), n, ul, ur, ll, lr, ylen, xlen, ctlword)
end

function ncdirect_rounded_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    ccall((:ncdirect_rounded_box, notcurses), Cint, (Ptr{ncdirect}, Cint, Cint, Cint, Cint, Cuint, Cuint, Cuint), n, ul, ur, ll, lr, ylen, xlen, ctlword)
end

function ncdirect_double_box(n, ul, ur, ll, lr, ylen, xlen, ctlword)
    ccall((:ncdirect_double_box, notcurses), Cint, (Ptr{ncdirect}, Cint, Cint, Cint, Cint, Cuint, Cuint, Cuint), n, ul, ur, ll, lr, ylen, xlen, ctlword)
end

function ncdirect_get(n, absdl, ni)
    ccall((:ncdirect_get, notcurses), Cint, (Ptr{ncdirect}, Ptr{Cvoid}, Ptr{Cint}), n, absdl, ni)
end

function ncdirect_inputready_fd(n)
    ccall((:ncdirect_inputready_fd, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_get_nblock(n, ni)
    ccall((:ncdirect_get_nblock, notcurses), Cint, (Ptr{ncdirect}, Ptr{Cint}), n, ni)
end

function ncdirect_get_blocking(n, ni)
    ccall((:ncdirect_get_blocking, notcurses), Cint, (Ptr{ncdirect}, Ptr{Cint}), n, ni)
end

function ncdirect_stop(nc)
    ccall((:ncdirect_stop, notcurses), Cint, (Ptr{ncdirect},), nc)
end

mutable struct ncplane end

const ncdirectv = ncplane

mutable struct ncvisual end

const ncdirectf = ncvisual

function ncdirect_render_image(n, filename, align, blitter, scale)
    ccall((:ncdirect_render_image, notcurses), Cint, (Ptr{ncdirect}, Ptr{Cchar}, Cint, Cint, Cint), n, filename, align, blitter, scale)
end

function ncdirect_render_frame(n, filename, blitter, scale, maxy, maxx)
    ccall((:ncdirect_render_frame, notcurses), Ptr{ncdirectv}, (Ptr{ncdirect}, Ptr{Cchar}, Cint, Cint, Cint, Cint), n, filename, blitter, scale, maxy, maxx)
end

function ncdirect_raster_frame(n, ncdv, align)
    ccall((:ncdirect_raster_frame, notcurses), Cint, (Ptr{ncdirect}, Ptr{ncdirectv}, Cint), n, ncdv, align)
end

function ncdirectf_from_file(n, filename)
    ccall((:ncdirectf_from_file, notcurses), Ptr{ncdirectf}, (Ptr{ncdirect}, Ptr{Cchar}), n, filename)
end

function ncdirectf_free(frame)
    ccall((:ncdirectf_free, notcurses), Cvoid, (Ptr{ncdirectf},), frame)
end

@cenum ncscale_e::UInt32 begin
    NCSCALE_NONE = 0
    NCSCALE_SCALE = 1
    NCSCALE_STRETCH = 2
    NCSCALE_NONE_HIRES = 3
    NCSCALE_SCALE_HIRES = 4
end

@cenum ncblitter_e::UInt32 begin
    NCBLIT_DEFAULT = 0
    NCBLIT_1x1 = 1
    NCBLIT_2x1 = 2
    NCBLIT_2x2 = 3
    NCBLIT_3x2 = 4
    NCBLIT_BRAILLE = 5
    NCBLIT_PIXEL = 6
    NCBLIT_4x1 = 7
    NCBLIT_8x1 = 8
end

struct ncvisual_options
    n::Ptr{ncplane}
    scaling::ncscale_e
    y::Cint
    x::Cint
    begy::Cuint
    begx::Cuint
    leny::Cuint
    lenx::Cuint
    blitter::ncblitter_e
    flags::UInt64
    transcolor::UInt32
    pxoffy::Cuint
    pxoffx::Cuint
end

function ncdirectf_render(n, frame, vopts)
    ccall((:ncdirectf_render, notcurses), Ptr{ncdirectv}, (Ptr{ncdirect}, Ptr{ncdirectf}, Ptr{ncvisual_options}), n, frame, vopts)
end

function ncdirectf_geom(n, frame, vopts, geom)
    ccall((:ncdirectf_geom, notcurses), Cint, (Ptr{ncdirect}, Ptr{ncdirectf}, Ptr{ncvisual_options}, Ptr{Cint}), n, frame, vopts, geom)
end

function ncdirect_stream(n, filename, streamer, vopts, curry)
    ccall((:ncdirect_stream, notcurses), Cint, (Ptr{ncdirect}, Ptr{Cchar}, Cint, Ptr{ncvisual_options}, Ptr{Cvoid}), n, filename, streamer, vopts, curry)
end

function ncdirect_detected_terminal(n)
    ccall((:ncdirect_detected_terminal, notcurses), Ptr{Cchar}, (Ptr{ncdirect},), n)
end

function ncdirect_cantruecolor(n)
    ccall((:ncdirect_cantruecolor, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_canchangecolor(n)
    ccall((:ncdirect_canchangecolor, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_canfade(n)
    ccall((:ncdirect_canfade, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_canopen_images(n)
    ccall((:ncdirect_canopen_images, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_canopen_videos(n)
    ccall((:ncdirect_canopen_videos, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_canutf8(n)
    ccall((:ncdirect_canutf8, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_check_pixel_support(n)
    ccall((:ncdirect_check_pixel_support, notcurses), Cint, (Ptr{ncdirect},), n)
end

function ncdirect_canhalfblock(nc)
    ccall((:ncdirect_canhalfblock, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_canquadrant(nc)
    ccall((:ncdirect_canquadrant, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_cansextant(nc)
    ccall((:ncdirect_cansextant, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_canbraille(nc)
    ccall((:ncdirect_canbraille, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function ncdirect_canget_cursor(nc)
    ccall((:ncdirect_canget_cursor, notcurses), Cint, (Ptr{ncdirect},), nc)
end

function nckey_synthesized_p(w)
    ccall((:nckey_synthesized_p, notcurses), Bool, (UInt32,), w)
end

function nckey_pua_p(w)
    ccall((:nckey_pua_p, notcurses), Bool, (UInt32,), w)
end

function nckey_supppuaa_p(w)
    ccall((:nckey_supppuaa_p, notcurses), Bool, (UInt32,), w)
end

function nckey_supppuab_p(w)
    ccall((:nckey_supppuab_p, notcurses), Bool, (UInt32,), w)
end

function ncstrwidth(egcs, validbytes, validwidth)
    ccall((:ncstrwidth, notcurses), Cint, (Ptr{Cchar}, Ptr{Cint}, Ptr{Cint}), egcs, validbytes, validwidth)
end

function notcurses_version()
    ccall((:notcurses_version, notcurses), Ptr{Cchar}, ())
end

function notcurses_version_components(major, minor, patch, tweak)
    ccall((:notcurses_version_components, notcurses), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), major, minor, patch, tweak)
end

mutable struct notcurses end

mutable struct ncuplot end

mutable struct ncdplot end

mutable struct ncprogbar end

mutable struct ncfdplane end

mutable struct ncsubproc end

mutable struct ncselector end

mutable struct ncmultiselector end

mutable struct ncreader end

mutable struct ncfadectx end

mutable struct nctablet end

mutable struct ncreel end

mutable struct nctab end

mutable struct nctabbed end

@cenum ncalign_e::UInt32 begin
    NCALIGN_UNALIGNED = 0
    NCALIGN_LEFT = 1
    NCALIGN_CENTER = 2
    NCALIGN_RIGHT = 3
end

function ncchannel_alpha(channel)
    ccall((:ncchannel_alpha, notcurses), Cuint, (UInt32,), channel)
end

function ncchannel_set_alpha(channel, alpha)
    ccall((:ncchannel_set_alpha, notcurses), Cint, (Ptr{UInt32}, Cuint), channel, alpha)
end

function ncchannel_default_p(channel)
    ccall((:ncchannel_default_p, notcurses), Bool, (UInt32,), channel)
end

function ncchannel_set_default(channel)
    ccall((:ncchannel_set_default, notcurses), UInt32, (Ptr{UInt32},), channel)
end

function ncchannel_palindex_p(channel)
    ccall((:ncchannel_palindex_p, notcurses), Bool, (UInt32,), channel)
end

function ncchannel_palindex(channel)
    ccall((:ncchannel_palindex, notcurses), Cuint, (UInt32,), channel)
end

function ncchannel_set_palindex(channel, idx)
    ccall((:ncchannel_set_palindex, notcurses), Cint, (Ptr{UInt32}, Cuint), channel, idx)
end

function ncchannel_rgb_p(channel)
    ccall((:ncchannel_rgb_p, notcurses), Bool, (UInt32,), channel)
end

function ncchannel_r(channel)
    ccall((:ncchannel_r, notcurses), Cuint, (UInt32,), channel)
end

function ncchannel_g(channel)
    ccall((:ncchannel_g, notcurses), Cuint, (UInt32,), channel)
end

function ncchannel_b(channel)
    ccall((:ncchannel_b, notcurses), Cuint, (UInt32,), channel)
end

function ncchannel_rgb(channel)
    ccall((:ncchannel_rgb, notcurses), UInt32, (UInt32,), channel)
end

function ncchannel_rgb8(channel, r, g, b)
    ccall((:ncchannel_rgb8, notcurses), UInt32, (UInt32, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), channel, r, g, b)
end

function ncchannel_set_rgb8(channel, r, g, b)
    ccall((:ncchannel_set_rgb8, notcurses), Cint, (Ptr{UInt32}, Cuint, Cuint, Cuint), channel, r, g, b)
end

function ncchannel_set(channel, rgb)
    ccall((:ncchannel_set, notcurses), Cint, (Ptr{UInt32}, UInt32), channel, rgb)
end

function ncchannel_set_rgb8_clipped(channel, r, g, b)
    ccall((:ncchannel_set_rgb8_clipped, notcurses), Cvoid, (Ptr{UInt32}, Cint, Cint, Cint), channel, r, g, b)
end

function ncchannels_bchannel(channels)
    ccall((:ncchannels_bchannel, notcurses), UInt32, (UInt64,), channels)
end

function ncchannels_fchannel(channels)
    ccall((:ncchannels_fchannel, notcurses), UInt32, (UInt64,), channels)
end

function ncchannels_channels(channels)
    ccall((:ncchannels_channels, notcurses), UInt64, (UInt64,), channels)
end

function ncchannels_bg_rgb_p(channels)
    ccall((:ncchannels_bg_rgb_p, notcurses), Bool, (UInt64,), channels)
end

function ncchannels_fg_rgb_p(channels)
    ccall((:ncchannels_fg_rgb_p, notcurses), Bool, (UInt64,), channels)
end

function ncchannels_bg_alpha(channels)
    ccall((:ncchannels_bg_alpha, notcurses), Cuint, (UInt64,), channels)
end

function ncchannels_set_bchannel(channels, channel)
    ccall((:ncchannels_set_bchannel, notcurses), UInt64, (Ptr{UInt64}, UInt32), channels, channel)
end

function ncchannels_set_fchannel(channels, channel)
    ccall((:ncchannels_set_fchannel, notcurses), UInt64, (Ptr{UInt64}, UInt32), channels, channel)
end

function ncchannels_set_channels(dst, channels)
    ccall((:ncchannels_set_channels, notcurses), UInt64, (Ptr{UInt64}, UInt64), dst, channels)
end

function ncchannels_set_bg_alpha(channels, alpha)
    ccall((:ncchannels_set_bg_alpha, notcurses), Cint, (Ptr{UInt64}, Cuint), channels, alpha)
end

function ncchannels_fg_alpha(channels)
    ccall((:ncchannels_fg_alpha, notcurses), Cuint, (UInt64,), channels)
end

function ncchannels_set_fg_alpha(channels, alpha)
    ccall((:ncchannels_set_fg_alpha, notcurses), Cint, (Ptr{UInt64}, Cuint), channels, alpha)
end

function ncchannels_reverse(channels)
    ccall((:ncchannels_reverse, notcurses), UInt64, (UInt64,), channels)
end

function ncchannels_combine(fchan, bchan)
    ccall((:ncchannels_combine, notcurses), UInt64, (UInt32, UInt32), fchan, bchan)
end

function ncchannels_fg_palindex(channels)
    ccall((:ncchannels_fg_palindex, notcurses), Cuint, (UInt64,), channels)
end

function ncchannels_bg_palindex(channels)
    ccall((:ncchannels_bg_palindex, notcurses), Cuint, (UInt64,), channels)
end

function ncchannels_fg_rgb(channels)
    ccall((:ncchannels_fg_rgb, notcurses), UInt32, (UInt64,), channels)
end

function ncchannels_bg_rgb(channels)
    ccall((:ncchannels_bg_rgb, notcurses), UInt32, (UInt64,), channels)
end

function ncchannels_fg_rgb8(channels, r, g, b)
    ccall((:ncchannels_fg_rgb8, notcurses), UInt32, (UInt64, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), channels, r, g, b)
end

function ncchannels_bg_rgb8(channels, r, g, b)
    ccall((:ncchannels_bg_rgb8, notcurses), UInt32, (UInt64, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), channels, r, g, b)
end

function ncchannels_set_fg_rgb8(channels, r, g, b)
    ccall((:ncchannels_set_fg_rgb8, notcurses), Cint, (Ptr{UInt64}, Cuint, Cuint, Cuint), channels, r, g, b)
end

function ncchannels_set_fg_rgb8_clipped(channels, r, g, b)
    ccall((:ncchannels_set_fg_rgb8_clipped, notcurses), Cvoid, (Ptr{UInt64}, Cint, Cint, Cint), channels, r, g, b)
end

function ncchannels_set_fg_palindex(channels, idx)
    ccall((:ncchannels_set_fg_palindex, notcurses), Cint, (Ptr{UInt64}, Cuint), channels, idx)
end

function ncchannels_set_fg_rgb(channels, rgb)
    ccall((:ncchannels_set_fg_rgb, notcurses), Cint, (Ptr{UInt64}, Cuint), channels, rgb)
end

function ncchannels_set_bg_rgb8(channels, r, g, b)
    ccall((:ncchannels_set_bg_rgb8, notcurses), Cint, (Ptr{UInt64}, Cuint, Cuint, Cuint), channels, r, g, b)
end

function ncchannels_set_bg_rgb8_clipped(channels, r, g, b)
    ccall((:ncchannels_set_bg_rgb8_clipped, notcurses), Cvoid, (Ptr{UInt64}, Cint, Cint, Cint), channels, r, g, b)
end

function ncchannels_set_bg_palindex(channels, idx)
    ccall((:ncchannels_set_bg_palindex, notcurses), Cint, (Ptr{UInt64}, Cuint), channels, idx)
end

function ncchannels_set_bg_rgb(channels, rgb)
    ccall((:ncchannels_set_bg_rgb, notcurses), Cint, (Ptr{UInt64}, Cuint), channels, rgb)
end

function ncchannels_fg_default_p(channels)
    ccall((:ncchannels_fg_default_p, notcurses), Bool, (UInt64,), channels)
end

function ncchannels_fg_palindex_p(channels)
    ccall((:ncchannels_fg_palindex_p, notcurses), Bool, (UInt64,), channels)
end

function ncchannels_bg_default_p(channels)
    ccall((:ncchannels_bg_default_p, notcurses), Bool, (UInt64,), channels)
end

function ncchannels_bg_palindex_p(channels)
    ccall((:ncchannels_bg_palindex_p, notcurses), Bool, (UInt64,), channels)
end

function ncchannels_set_fg_default(channels)
    ccall((:ncchannels_set_fg_default, notcurses), UInt64, (Ptr{UInt64},), channels)
end

function ncchannels_set_bg_default(channels)
    ccall((:ncchannels_set_bg_default, notcurses), UInt64, (Ptr{UInt64},), channels)
end

function notcurses_ucs32_to_utf8(ucs32, ucs32count, resultbuf, buflen)
    ccall((:notcurses_ucs32_to_utf8, notcurses), Cint, (Ptr{UInt32}, Cuint, Ptr{Cuchar}, Csize_t), ucs32, ucs32count, resultbuf, buflen)
end

struct nccell
    gcluster::UInt32
    gcluster_backstop::UInt8
    width::UInt8
    stylemask::UInt16
    channels::UInt64
end

function nccell_init(c)
    ccall((:nccell_init, notcurses), Cvoid, (Ptr{nccell},), c)
end

function nccell_load(n, c, gcluster)
    ccall((:nccell_load, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Ptr{Cchar}), n, c, gcluster)
end

function nccell_prime(n, c, gcluster, stylemask, channels)
    ccall((:nccell_prime, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Ptr{Cchar}, UInt16, UInt64), n, c, gcluster, stylemask, channels)
end

function nccell_duplicate(n, targ, c)
    ccall((:nccell_duplicate, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Ptr{nccell}), n, targ, c)
end

function nccell_release(n, c)
    ccall((:nccell_release, notcurses), Cvoid, (Ptr{ncplane}, Ptr{nccell}), n, c)
end

function nccell_set_styles(c, stylebits)
    ccall((:nccell_set_styles, notcurses), Cvoid, (Ptr{nccell}, Cuint), c, stylebits)
end

function nccell_styles(c)
    ccall((:nccell_styles, notcurses), UInt16, (Ptr{nccell},), c)
end

function nccell_on_styles(c, stylebits)
    ccall((:nccell_on_styles, notcurses), Cvoid, (Ptr{nccell}, Cuint), c, stylebits)
end

function nccell_off_styles(c, stylebits)
    ccall((:nccell_off_styles, notcurses), Cvoid, (Ptr{nccell}, Cuint), c, stylebits)
end

function nccell_set_fg_default(c)
    ccall((:nccell_set_fg_default, notcurses), Cvoid, (Ptr{nccell},), c)
end

function nccell_set_bg_default(c)
    ccall((:nccell_set_bg_default, notcurses), Cvoid, (Ptr{nccell},), c)
end

function nccell_set_fg_alpha(c, alpha)
    ccall((:nccell_set_fg_alpha, notcurses), Cint, (Ptr{nccell}, Cuint), c, alpha)
end

function nccell_set_bg_alpha(c, alpha)
    ccall((:nccell_set_bg_alpha, notcurses), Cint, (Ptr{nccell}, Cuint), c, alpha)
end

function nccell_set_bchannel(c, channel)
    ccall((:nccell_set_bchannel, notcurses), UInt64, (Ptr{nccell}, UInt32), c, channel)
end

function nccell_set_fchannel(c, channel)
    ccall((:nccell_set_fchannel, notcurses), UInt64, (Ptr{nccell}, UInt32), c, channel)
end

function nccell_set_channels(c, channels)
    ccall((:nccell_set_channels, notcurses), UInt64, (Ptr{nccell}, UInt64), c, channels)
end

function nccell_double_wide_p(c)
    ccall((:nccell_double_wide_p, notcurses), Bool, (Ptr{nccell},), c)
end

function nccell_wide_right_p(c)
    ccall((:nccell_wide_right_p, notcurses), Bool, (Ptr{nccell},), c)
end

function nccell_wide_left_p(c)
    ccall((:nccell_wide_left_p, notcurses), Bool, (Ptr{nccell},), c)
end

function nccell_extended_gcluster(n, c)
    ccall((:nccell_extended_gcluster, notcurses), Ptr{Cchar}, (Ptr{ncplane}, Ptr{nccell}), n, c)
end

function nccell_channels(c)
    ccall((:nccell_channels, notcurses), UInt64, (Ptr{nccell},), c)
end

function nccell_bchannel(cl)
    ccall((:nccell_bchannel, notcurses), UInt32, (Ptr{nccell},), cl)
end

function nccell_fchannel(cl)
    ccall((:nccell_fchannel, notcurses), UInt32, (Ptr{nccell},), cl)
end

function nccell_cols(c)
    ccall((:nccell_cols, notcurses), Cuint, (Ptr{nccell},), c)
end

function nccell_strdup(n, c)
    ccall((:nccell_strdup, notcurses), Ptr{Cchar}, (Ptr{ncplane}, Ptr{nccell}), n, c)
end

function nccell_extract(n, c, stylemask, channels)
    ccall((:nccell_extract, notcurses), Ptr{Cchar}, (Ptr{ncplane}, Ptr{nccell}, Ptr{UInt16}, Ptr{UInt64}), n, c, stylemask, channels)
end

function nccellcmp(n1, c1, n2, c2)
    ccall((:nccellcmp, notcurses), Bool, (Ptr{ncplane}, Ptr{nccell}, Ptr{ncplane}, Ptr{nccell}), n1, c1, n2, c2)
end

function nccell_load_char(n, c, ch)
    ccall((:nccell_load_char, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Cchar), n, c, ch)
end

function nccell_load_egc32(n, c, egc)
    ccall((:nccell_load_egc32, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, UInt32), n, c, egc)
end

function nccell_load_ucs32(n, c, u)
    ccall((:nccell_load_ucs32, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, UInt32), n, c, u)
end

@cenum ncloglevel_e::Int32 begin
    NCLOGLEVEL_SILENT = -1
    NCLOGLEVEL_PANIC = 0
    NCLOGLEVEL_FATAL = 1
    NCLOGLEVEL_ERROR = 2
    NCLOGLEVEL_WARNING = 3
    NCLOGLEVEL_INFO = 4
    NCLOGLEVEL_VERBOSE = 5
    NCLOGLEVEL_DEBUG = 6
    NCLOGLEVEL_TRACE = 7
end

struct notcurses_options
    termtype::Ptr{Cchar}
    loglevel::ncloglevel_e
    margin_t::Cuint
    margin_r::Cuint
    margin_b::Cuint
    margin_l::Cuint
    flags::UInt64
end

function notcurses_lex_margins(op, opts)
    ccall((:notcurses_lex_margins, notcurses), Cint, (Ptr{Cchar}, Ptr{notcurses_options}), op, opts)
end

function notcurses_lex_blitter(op, blitter)
    ccall((:notcurses_lex_blitter, notcurses), Cint, (Ptr{Cchar}, Ptr{ncblitter_e}), op, blitter)
end

function notcurses_str_blitter(blitter)
    ccall((:notcurses_str_blitter, notcurses), Ptr{Cchar}, (ncblitter_e,), blitter)
end

function notcurses_lex_scalemode(op, scalemode)
    ccall((:notcurses_lex_scalemode, notcurses), Cint, (Ptr{Cchar}, Ptr{ncscale_e}), op, scalemode)
end

function notcurses_str_scalemode(scalemode)
    ccall((:notcurses_str_scalemode, notcurses), Ptr{Cchar}, (ncscale_e,), scalemode)
end

function notcurses_init(opts, fp)
    ccall((:notcurses_init, notcurses), Ptr{notcurses}, (Ptr{notcurses_options}, Ptr{Libc.FILE}), opts, fp)
end

function notcurses_core_init(opts, fp)
    ccall((:notcurses_core_init, notcurses), Ptr{notcurses}, (Ptr{notcurses_options}, Ptr{Libc.FILE}), opts, fp)
end

function notcurses_stop(nc)
    ccall((:notcurses_stop, notcurses), Cint, (Ptr{notcurses},), nc)
end

function notcurses_enter_alternate_screen(nc)
    ccall((:notcurses_enter_alternate_screen, notcurses), Cint, (Ptr{notcurses},), nc)
end

function notcurses_leave_alternate_screen(nc)
    ccall((:notcurses_leave_alternate_screen, notcurses), Cint, (Ptr{notcurses},), nc)
end

function notcurses_stdplane(nc)
    ccall((:notcurses_stdplane, notcurses), Ptr{ncplane}, (Ptr{notcurses},), nc)
end

function notcurses_stdplane_const(nc)
    ccall((:notcurses_stdplane_const, notcurses), Ptr{ncplane}, (Ptr{notcurses},), nc)
end

function ncpile_top(n)
    ccall((:ncpile_top, notcurses), Ptr{ncplane}, (Ptr{ncplane},), n)
end

function ncpile_bottom(n)
    ccall((:ncpile_bottom, notcurses), Ptr{ncplane}, (Ptr{ncplane},), n)
end

function notcurses_top(n)
    ccall((:notcurses_top, notcurses), Ptr{ncplane}, (Ptr{notcurses},), n)
end

function notcurses_bottom(n)
    ccall((:notcurses_bottom, notcurses), Ptr{ncplane}, (Ptr{notcurses},), n)
end

function ncpile_render(n)
    ccall((:ncpile_render, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncpile_rasterize(n)
    ccall((:ncpile_rasterize, notcurses), Cint, (Ptr{ncplane},), n)
end

function notcurses_render(nc)
    ccall((:notcurses_render, notcurses), Cint, (Ptr{notcurses},), nc)
end

function ncpile_render_to_buffer(p, buf, buflen)
    ccall((:ncpile_render_to_buffer, notcurses), Cint, (Ptr{ncplane}, Ptr{Ptr{Cchar}}, Ptr{Csize_t}), p, buf, buflen)
end

function ncpile_render_to_file(p, fp)
    ccall((:ncpile_render_to_file, notcurses), Cint, (Ptr{ncplane}, Ptr{Libc.FILE}), p, fp)
end

function notcurses_drop_planes(nc)
    ccall((:notcurses_drop_planes, notcurses), Cvoid, (Ptr{notcurses},), nc)
end

function nckey_mouse_p(r)
    ccall((:nckey_mouse_p, notcurses), Bool, (UInt32,), r)
end

@cenum ncintype_e::UInt32 begin
    NCTYPE_UNKNOWN = 0
    NCTYPE_PRESS = 1
    NCTYPE_REPEAT = 2
    NCTYPE_RELEASE = 3
end

struct ncinput
    id::UInt32
    y::Cint
    x::Cint
    utf8::NTuple{5,Cchar}
    alt::Bool
    shift::Bool
    ctrl::Bool
    evtype::ncintype_e
    modifiers::Cuint
    ypx::Cint
    xpx::Cint
end

function ncinput_shift_p(n)
    ccall((:ncinput_shift_p, notcurses), Bool, (Ptr{ncinput},), n)
end

function ncinput_ctrl_p(n)
    ccall((:ncinput_ctrl_p, notcurses), Bool, (Ptr{ncinput},), n)
end

function ncinput_alt_p(n)
    ccall((:ncinput_alt_p, notcurses), Bool, (Ptr{ncinput},), n)
end

function ncinput_meta_p(n)
    ccall((:ncinput_meta_p, notcurses), Bool, (Ptr{ncinput},), n)
end

function ncinput_super_p(n)
    ccall((:ncinput_super_p, notcurses), Bool, (Ptr{ncinput},), n)
end

function ncinput_hyper_p(n)
    ccall((:ncinput_hyper_p, notcurses), Bool, (Ptr{ncinput},), n)
end

function ncinput_capslock_p(n)
    ccall((:ncinput_capslock_p, notcurses), Bool, (Ptr{ncinput},), n)
end

function ncinput_numlock_p(n)
    ccall((:ncinput_numlock_p, notcurses), Bool, (Ptr{ncinput},), n)
end

function ncinput_equal_p(n1, n2)
    ccall((:ncinput_equal_p, notcurses), Bool, (Ptr{ncinput}, Ptr{ncinput}), n1, n2)
end

function notcurses_get(n, ts, ni)
    ccall((:notcurses_get, notcurses), UInt32, (Ptr{notcurses}, Ptr{Cvoid}, Ptr{ncinput}), n, ts, ni)
end

function notcurses_getvec(n, ts, ni, vcount)
    ccall((:notcurses_getvec, notcurses), Cint, (Ptr{notcurses}, Ptr{Cvoid}, Ptr{ncinput}, Cint), n, ts, ni, vcount)
end

function notcurses_inputready_fd(n)
    ccall((:notcurses_inputready_fd, notcurses), Cint, (Ptr{notcurses},), n)
end

function notcurses_get_nblock(n, ni)
    ccall((:notcurses_get_nblock, notcurses), UInt32, (Ptr{notcurses}, Ptr{ncinput}), n, ni)
end

function notcurses_get_blocking(n, ni)
    ccall((:notcurses_get_blocking, notcurses), UInt32, (Ptr{notcurses}, Ptr{ncinput}), n, ni)
end

function ncinput_nomod_p(ni)
    ccall((:ncinput_nomod_p, notcurses), Bool, (Ptr{ncinput},), ni)
end

function notcurses_mice_enable(n, eventmask)
    ccall((:notcurses_mice_enable, notcurses), Cint, (Ptr{notcurses}, Cuint), n, eventmask)
end

function notcurses_mice_disable(n)
    ccall((:notcurses_mice_disable, notcurses), Cint, (Ptr{notcurses},), n)
end

function notcurses_linesigs_disable(n)
    ccall((:notcurses_linesigs_disable, notcurses), Cint, (Ptr{notcurses},), n)
end

function notcurses_linesigs_enable(n)
    ccall((:notcurses_linesigs_enable, notcurses), Cint, (Ptr{notcurses},), n)
end

function notcurses_refresh(n, y, x)
    ccall((:notcurses_refresh, notcurses), Cint, (Ptr{notcurses}, Ptr{Cuint}, Ptr{Cuint}), n, y, x)
end

function ncplane_notcurses(n)
    ccall((:ncplane_notcurses, notcurses), Ptr{notcurses}, (Ptr{ncplane},), n)
end

function ncplane_notcurses_const(n)
    ccall((:ncplane_notcurses_const, notcurses), Ptr{notcurses}, (Ptr{ncplane},), n)
end

function ncplane_dim_yx(n, y, x)
    ccall((:ncplane_dim_yx, notcurses), Cvoid, (Ptr{ncplane}, Ptr{Cuint}, Ptr{Cuint}), n, y, x)
end

function notcurses_stddim_yx(nc, y, x)
    ccall((:notcurses_stddim_yx, notcurses), Ptr{ncplane}, (Ptr{notcurses}, Ptr{Cuint}, Ptr{Cuint}), nc, y, x)
end

function notcurses_stddim_yx_const(nc, y, x)
    ccall((:notcurses_stddim_yx_const, notcurses), Ptr{ncplane}, (Ptr{notcurses}, Ptr{Cuint}, Ptr{Cuint}), nc, y, x)
end

function ncplane_dim_y(n)
    ccall((:ncplane_dim_y, notcurses), Cuint, (Ptr{ncplane},), n)
end

function ncplane_dim_x(n)
    ccall((:ncplane_dim_x, notcurses), Cuint, (Ptr{ncplane},), n)
end

function ncplane_pixel_geom(n, pxy, pxx, celldimy, celldimx, maxbmapy, maxbmapx)
    ccall((:ncplane_pixel_geom, notcurses), Cvoid, (Ptr{ncplane}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), n, pxy, pxx, celldimy, celldimx, maxbmapy, maxbmapx)
end

function notcurses_term_dim_yx(n, rows, cols)
    ccall((:notcurses_term_dim_yx, notcurses), Cvoid, (Ptr{notcurses}, Ptr{Cuint}, Ptr{Cuint}), n, rows, cols)
end

function notcurses_at_yx(nc, yoff, xoff, stylemask, channels)
    ccall((:notcurses_at_yx, notcurses), Ptr{Cchar}, (Ptr{notcurses}, Cuint, Cuint, Ptr{UInt16}, Ptr{UInt64}), nc, yoff, xoff, stylemask, channels)
end

struct ncplane_options
    y::Cint
    x::Cint
    rows::Cuint
    cols::Cuint
    userptr::Ptr{Cvoid}
    name::Ptr{Cchar}
    resizecb::Ptr{Cvoid}
    flags::UInt64
    margin_b::Cuint
    margin_r::Cuint
end

function ncplane_create(n, nopts)
    ccall((:ncplane_create, notcurses), Ptr{ncplane}, (Ptr{ncplane}, Ptr{ncplane_options}), n, nopts)
end

function ncpile_create(nc, nopts)
    ccall((:ncpile_create, notcurses), Ptr{ncplane}, (Ptr{notcurses}, Ptr{ncplane_options}), nc, nopts)
end

function ncplane_resize_maximize(n)
    ccall((:ncplane_resize_maximize, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_resize_marginalized(n)
    ccall((:ncplane_resize_marginalized, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_resize_realign(n)
    ccall((:ncplane_resize_realign, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_resize_placewithin(n)
    ccall((:ncplane_resize_placewithin, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_set_resizecb(n, resizecb)
    ccall((:ncplane_set_resizecb, notcurses), Cvoid, (Ptr{ncplane}, Ptr{Cvoid}), n, resizecb)
end

function ncplane_resizecb(n)
    ccall((:ncplane_resizecb, notcurses), Ptr{Cvoid}, (Ptr{ncplane},), n)
end

function ncplane_set_name(n, name)
    ccall((:ncplane_set_name, notcurses), Cint, (Ptr{ncplane}, Ptr{Cchar}), n, name)
end

function ncplane_name(n)
    ccall((:ncplane_name, notcurses), Ptr{Cchar}, (Ptr{ncplane},), n)
end

function ncplane_reparent(n, newparent)
    ccall((:ncplane_reparent, notcurses), Ptr{ncplane}, (Ptr{ncplane}, Ptr{ncplane}), n, newparent)
end

function ncplane_reparent_family(n, newparent)
    ccall((:ncplane_reparent_family, notcurses), Ptr{ncplane}, (Ptr{ncplane}, Ptr{ncplane}), n, newparent)
end

function ncplane_dup(n, opaque)
    ccall((:ncplane_dup, notcurses), Ptr{ncplane}, (Ptr{ncplane}, Ptr{Cvoid}), n, opaque)
end

function ncplane_translate(src, dst, y, x)
    ccall((:ncplane_translate, notcurses), Cvoid, (Ptr{ncplane}, Ptr{ncplane}, Ptr{Cint}, Ptr{Cint}), src, dst, y, x)
end

function ncplane_translate_abs(n, y, x)
    ccall((:ncplane_translate_abs, notcurses), Bool, (Ptr{ncplane}, Ptr{Cint}, Ptr{Cint}), n, y, x)
end

function ncplane_set_scrolling(n, scrollp)
    ccall((:ncplane_set_scrolling, notcurses), Bool, (Ptr{ncplane}, Cuint), n, scrollp)
end

function ncplane_scrolling_p(n)
    ccall((:ncplane_scrolling_p, notcurses), Bool, (Ptr{ncplane},), n)
end

function ncplane_set_autogrow(n, growp)
    ccall((:ncplane_set_autogrow, notcurses), Bool, (Ptr{ncplane}, Cuint), n, growp)
end

function ncplane_autogrow_p(n)
    ccall((:ncplane_autogrow_p, notcurses), Bool, (Ptr{ncplane},), n)
end

struct ncpalette
    chans::NTuple{256,UInt32}
end

function ncpalette_new(nc)
    ccall((:ncpalette_new, notcurses), Ptr{ncpalette}, (Ptr{notcurses},), nc)
end

function ncpalette_use(nc, p)
    ccall((:ncpalette_use, notcurses), Cint, (Ptr{notcurses}, Ptr{ncpalette}), nc, p)
end

function ncpalette_set_rgb8(p, idx, r, g, b)
    ccall((:ncpalette_set_rgb8, notcurses), Cint, (Ptr{ncpalette}, Cint, Cuint, Cuint, Cuint), p, idx, r, g, b)
end

function ncpalette_set(p, idx, rgb)
    ccall((:ncpalette_set, notcurses), Cint, (Ptr{ncpalette}, Cint, Cuint), p, idx, rgb)
end

function ncpalette_get(p, idx, palent)
    ccall((:ncpalette_get, notcurses), Cint, (Ptr{ncpalette}, Cint, Ptr{UInt32}), p, idx, palent)
end

function ncpalette_get_rgb8(p, idx, r, g, b)
    ccall((:ncpalette_get_rgb8, notcurses), Cint, (Ptr{ncpalette}, Cint, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), p, idx, r, g, b)
end

function ncpalette_free(p)
    ccall((:ncpalette_free, notcurses), Cvoid, (Ptr{ncpalette},), p)
end

struct nccapabilities
    colors::Cuint
    utf8::Bool
    rgb::Bool
    can_change_colors::Bool
    halfblocks::Bool
    quadrants::Bool
    sextants::Bool
    braille::Bool
end

function notcurses_supported_styles(nc)
    ccall((:notcurses_supported_styles, notcurses), UInt16, (Ptr{notcurses},), nc)
end

function notcurses_palette_size(nc)
    ccall((:notcurses_palette_size, notcurses), Cuint, (Ptr{notcurses},), nc)
end

function notcurses_detected_terminal(nc)
    ccall((:notcurses_detected_terminal, notcurses), Ptr{Cchar}, (Ptr{notcurses},), nc)
end

function notcurses_capabilities(n)
    ccall((:notcurses_capabilities, notcurses), Ptr{nccapabilities}, (Ptr{notcurses},), n)
end

@cenum ncpixelimpl_e::UInt32 begin
    NCPIXEL_NONE = 0
    NCPIXEL_SIXEL = 1
    NCPIXEL_LINUXFB = 2
    NCPIXEL_ITERM2 = 3
    NCPIXEL_KITTY_STATIC = 4
    NCPIXEL_KITTY_ANIMATED = 5
    NCPIXEL_KITTY_SELFREF = 6
end

function notcurses_check_pixel_support(nc)
    ccall((:notcurses_check_pixel_support, notcurses), ncpixelimpl_e, (Ptr{notcurses},), nc)
end

function nccapability_canchangecolor(caps)
    ccall((:nccapability_canchangecolor, notcurses), Bool, (Ptr{nccapabilities},), caps)
end

function notcurses_cantruecolor(nc)
    ccall((:notcurses_cantruecolor, notcurses), Bool, (Ptr{notcurses},), nc)
end

function notcurses_canchangecolor(nc)
    ccall((:notcurses_canchangecolor, notcurses), Bool, (Ptr{notcurses},), nc)
end

function notcurses_canfade(n)
    ccall((:notcurses_canfade, notcurses), Bool, (Ptr{notcurses},), n)
end

function notcurses_canopen_images(nc)
    ccall((:notcurses_canopen_images, notcurses), Bool, (Ptr{notcurses},), nc)
end

function notcurses_canopen_videos(nc)
    ccall((:notcurses_canopen_videos, notcurses), Bool, (Ptr{notcurses},), nc)
end

function notcurses_canutf8(nc)
    ccall((:notcurses_canutf8, notcurses), Bool, (Ptr{notcurses},), nc)
end

function notcurses_canhalfblock(nc)
    ccall((:notcurses_canhalfblock, notcurses), Bool, (Ptr{notcurses},), nc)
end

function notcurses_canquadrant(nc)
    ccall((:notcurses_canquadrant, notcurses), Bool, (Ptr{notcurses},), nc)
end

function notcurses_cansextant(nc)
    ccall((:notcurses_cansextant, notcurses), Bool, (Ptr{notcurses},), nc)
end

function notcurses_canbraille(nc)
    ccall((:notcurses_canbraille, notcurses), Bool, (Ptr{notcurses},), nc)
end

function notcurses_canpixel(nc)
    ccall((:notcurses_canpixel, notcurses), Bool, (Ptr{notcurses},), nc)
end

struct ncstats
    renders::UInt64
    writeouts::UInt64
    failed_renders::UInt64
    failed_writeouts::UInt64
    raster_bytes::UInt64
    raster_max_bytes::Int64
    raster_min_bytes::Int64
    render_ns::UInt64
    render_max_ns::Int64
    render_min_ns::Int64
    raster_ns::UInt64
    raster_max_ns::Int64
    raster_min_ns::Int64
    writeout_ns::UInt64
    writeout_max_ns::Int64
    writeout_min_ns::Int64
    cellelisions::UInt64
    cellemissions::UInt64
    fgelisions::UInt64
    fgemissions::UInt64
    bgelisions::UInt64
    bgemissions::UInt64
    defaultelisions::UInt64
    defaultemissions::UInt64
    refreshes::UInt64
    sprixelemissions::UInt64
    sprixelelisions::UInt64
    sprixelbytes::UInt64
    appsync_updates::UInt64
    input_errors::UInt64
    input_events::UInt64
    hpa_gratuitous::UInt64
    cell_geo_changes::UInt64
    pixel_geo_changes::UInt64
    fbbytes::UInt64
    planes::Cuint
end

function notcurses_stats_alloc(nc)
    ccall((:notcurses_stats_alloc, notcurses), Ptr{ncstats}, (Ptr{notcurses},), nc)
end

function notcurses_stats(nc, stats)
    ccall((:notcurses_stats, notcurses), Cvoid, (Ptr{notcurses}, Ptr{ncstats}), nc, stats)
end

function notcurses_stats_reset(nc, stats)
    ccall((:notcurses_stats_reset, notcurses), Cvoid, (Ptr{notcurses}, Ptr{ncstats}), nc, stats)
end

function ncplane_resize(n, keepy, keepx, keepleny, keeplenx, yoff, xoff, ylen, xlen)
    ccall((:ncplane_resize, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Cuint, Cuint, Cint, Cint, Cuint, Cuint), n, keepy, keepx, keepleny, keeplenx, yoff, xoff, ylen, xlen)
end

function ncplane_resize_simple(n, ylen, xlen)
    ccall((:ncplane_resize_simple, notcurses), Cint, (Ptr{ncplane}, Cuint, Cuint), n, ylen, xlen)
end

function ncplane_destroy(n)
    ccall((:ncplane_destroy, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_set_base_cell(n, c)
    ccall((:ncplane_set_base_cell, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}), n, c)
end

function ncplane_set_base(n, egc, stylemask, channels)
    ccall((:ncplane_set_base, notcurses), Cint, (Ptr{ncplane}, Ptr{Cchar}, UInt16, UInt64), n, egc, stylemask, channels)
end

function ncplane_base(n, c)
    ccall((:ncplane_base, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}), n, c)
end

function ncplane_yx(n, y, x)
    ccall((:ncplane_yx, notcurses), Cvoid, (Ptr{ncplane}, Ptr{Cint}, Ptr{Cint}), n, y, x)
end

function ncplane_y(n)
    ccall((:ncplane_y, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_x(n)
    ccall((:ncplane_x, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_move_yx(n, y, x)
    ccall((:ncplane_move_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint), n, y, x)
end

function ncplane_move_rel(n, y, x)
    ccall((:ncplane_move_rel, notcurses), Cint, (Ptr{ncplane}, Cint, Cint), n, y, x)
end

function ncplane_abs_yx(n, y, x)
    ccall((:ncplane_abs_yx, notcurses), Cvoid, (Ptr{ncplane}, Ptr{Cint}, Ptr{Cint}), n, y, x)
end

function ncplane_abs_y(n)
    ccall((:ncplane_abs_y, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_abs_x(n)
    ccall((:ncplane_abs_x, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_parent(n)
    ccall((:ncplane_parent, notcurses), Ptr{ncplane}, (Ptr{ncplane},), n)
end

function ncplane_parent_const(n)
    ccall((:ncplane_parent_const, notcurses), Ptr{ncplane}, (Ptr{ncplane},), n)
end

function ncplane_descendant_p(n, ancestor)
    ccall((:ncplane_descendant_p, notcurses), Cint, (Ptr{ncplane}, Ptr{ncplane}), n, ancestor)
end

function ncplane_move_above(n, above)
    ccall((:ncplane_move_above, notcurses), Cint, (Ptr{ncplane}, Ptr{ncplane}), n, above)
end

function ncplane_move_below(n, below)
    ccall((:ncplane_move_below, notcurses), Cint, (Ptr{ncplane}, Ptr{ncplane}), n, below)
end

function ncplane_move_top(n)
    ccall((:ncplane_move_top, notcurses), Cvoid, (Ptr{ncplane},), n)
end

function ncplane_move_bottom(n)
    ccall((:ncplane_move_bottom, notcurses), Cvoid, (Ptr{ncplane},), n)
end

function ncplane_move_family_above(n, targ)
    ccall((:ncplane_move_family_above, notcurses), Cint, (Ptr{ncplane}, Ptr{ncplane}), n, targ)
end

function ncplane_move_family_below(n, targ)
    ccall((:ncplane_move_family_below, notcurses), Cint, (Ptr{ncplane}, Ptr{ncplane}), n, targ)
end

function ncplane_move_family_top(n)
    ccall((:ncplane_move_family_top, notcurses), Cvoid, (Ptr{ncplane},), n)
end

function ncplane_move_family_bottom(n)
    ccall((:ncplane_move_family_bottom, notcurses), Cvoid, (Ptr{ncplane},), n)
end

function ncplane_below(n)
    ccall((:ncplane_below, notcurses), Ptr{ncplane}, (Ptr{ncplane},), n)
end

function ncplane_above(n)
    ccall((:ncplane_above, notcurses), Ptr{ncplane}, (Ptr{ncplane},), n)
end

function ncplane_scrollup(n, r)
    ccall((:ncplane_scrollup, notcurses), Cint, (Ptr{ncplane}, Cint), n, r)
end

function ncplane_scrollup_child(n, child)
    ccall((:ncplane_scrollup_child, notcurses), Cint, (Ptr{ncplane}, Ptr{ncplane}), n, child)
end

function ncplane_rotate_cw(n)
    ccall((:ncplane_rotate_cw, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_rotate_ccw(n)
    ccall((:ncplane_rotate_ccw, notcurses), Cint, (Ptr{ncplane},), n)
end

function ncplane_at_cursor(n, stylemask, channels)
    ccall((:ncplane_at_cursor, notcurses), Ptr{Cchar}, (Ptr{ncplane}, Ptr{UInt16}, Ptr{UInt64}), n, stylemask, channels)
end

function ncplane_at_cursor_cell(n, c)
    ccall((:ncplane_at_cursor_cell, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}), n, c)
end

function ncplane_at_yx(n, y, x, stylemask, channels)
    ccall((:ncplane_at_yx, notcurses), Ptr{Cchar}, (Ptr{ncplane}, Cint, Cint, Ptr{UInt16}, Ptr{UInt64}), n, y, x, stylemask, channels)
end

function ncplane_at_yx_cell(n, y, x, c)
    ccall((:ncplane_at_yx_cell, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Ptr{nccell}), n, y, x, c)
end

function ncplane_contents(n, begy, begx, leny, lenx)
    ccall((:ncplane_contents, notcurses), Ptr{Cchar}, (Ptr{ncplane}, Cint, Cint, Cuint, Cuint), n, begy, begx, leny, lenx)
end

function ncplane_set_userptr(n, opaque)
    ccall((:ncplane_set_userptr, notcurses), Ptr{Cvoid}, (Ptr{ncplane}, Ptr{Cvoid}), n, opaque)
end

function ncplane_userptr(n)
    ccall((:ncplane_userptr, notcurses), Ptr{Cvoid}, (Ptr{ncplane},), n)
end

function ncplane_center_abs(n, y, x)
    ccall((:ncplane_center_abs, notcurses), Cvoid, (Ptr{ncplane}, Ptr{Cint}, Ptr{Cint}), n, y, x)
end

function ncplane_as_rgba(n, blit, begy, begx, leny, lenx, pxdimy, pxdimx)
    ccall((:ncplane_as_rgba, notcurses), Ptr{UInt32}, (Ptr{ncplane}, ncblitter_e, Cint, Cint, Cuint, Cuint, Ptr{Cuint}, Ptr{Cuint}), n, blit, begy, begx, leny, lenx, pxdimy, pxdimx)
end

function notcurses_align(availu, align, u)
    ccall((:notcurses_align, notcurses), Cint, (Cint, ncalign_e, Cint), availu, align, u)
end

function ncplane_halign(n, align, c)
    ccall((:ncplane_halign, notcurses), Cint, (Ptr{ncplane}, ncalign_e, Cint), n, align, c)
end

function ncplane_valign(n, align, r)
    ccall((:ncplane_valign, notcurses), Cint, (Ptr{ncplane}, ncalign_e, Cint), n, align, r)
end

function ncplane_cursor_move_yx(n, y, x)
    ccall((:ncplane_cursor_move_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint), n, y, x)
end

function ncplane_cursor_move_rel(n, y, x)
    ccall((:ncplane_cursor_move_rel, notcurses), Cint, (Ptr{ncplane}, Cint, Cint), n, y, x)
end

function ncplane_home(n)
    ccall((:ncplane_home, notcurses), Cvoid, (Ptr{ncplane},), n)
end

function ncplane_cursor_yx(n, y, x)
    ccall((:ncplane_cursor_yx, notcurses), Cvoid, (Ptr{ncplane}, Ptr{Cuint}, Ptr{Cuint}), n, y, x)
end

function ncplane_cursor_y(n)
    ccall((:ncplane_cursor_y, notcurses), Cuint, (Ptr{ncplane},), n)
end

function ncplane_cursor_x(n)
    ccall((:ncplane_cursor_x, notcurses), Cuint, (Ptr{ncplane},), n)
end

function ncplane_channels(n)
    ccall((:ncplane_channels, notcurses), UInt64, (Ptr{ncplane},), n)
end

function ncplane_styles(n)
    ccall((:ncplane_styles, notcurses), UInt16, (Ptr{ncplane},), n)
end

function ncplane_putc_yx(n, y, x, c)
    ccall((:ncplane_putc_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Ptr{nccell}), n, y, x, c)
end

function ncplane_putc(n, c)
    ccall((:ncplane_putc, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}), n, c)
end

function ncplane_putchar_yx(n, y, x, c)
    ccall((:ncplane_putchar_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Cchar), n, y, x, c)
end

function ncplane_putchar(n, c)
    ccall((:ncplane_putchar, notcurses), Cint, (Ptr{ncplane}, Cchar), n, c)
end

function ncplane_putchar_stained(n, c)
    ccall((:ncplane_putchar_stained, notcurses), Cint, (Ptr{ncplane}, Cchar), n, c)
end

function ncplane_putegc_yx(n, y, x, gclust, sbytes)
    ccall((:ncplane_putegc_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Ptr{Cchar}, Ptr{Csize_t}), n, y, x, gclust, sbytes)
end

function ncplane_putegc(n, gclust, sbytes)
    ccall((:ncplane_putegc, notcurses), Cint, (Ptr{ncplane}, Ptr{Cchar}, Ptr{Csize_t}), n, gclust, sbytes)
end

function ncplane_putegc_stained(n, gclust, sbytes)
    ccall((:ncplane_putegc_stained, notcurses), Cint, (Ptr{ncplane}, Ptr{Cchar}, Ptr{Csize_t}), n, gclust, sbytes)
end

function ncwcsrtombs(src)
    ccall((:ncwcsrtombs, notcurses), Ptr{Cchar}, (Ptr{Cwchar_t},), src)
end

function ncplane_putwegc(n, gclust, sbytes)
    ccall((:ncplane_putwegc, notcurses), Cint, (Ptr{ncplane}, Ptr{Cwchar_t}, Ptr{Csize_t}), n, gclust, sbytes)
end

function ncplane_putwegc_yx(n, y, x, gclust, sbytes)
    ccall((:ncplane_putwegc_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Ptr{Cwchar_t}, Ptr{Csize_t}), n, y, x, gclust, sbytes)
end

function ncplane_putwegc_stained(n, gclust, sbytes)
    ccall((:ncplane_putwegc_stained, notcurses), Cint, (Ptr{ncplane}, Ptr{Cwchar_t}, Ptr{Csize_t}), n, gclust, sbytes)
end

function ncplane_putstr_yx(n, y, x, gclusters)
    ccall((:ncplane_putstr_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Ptr{Cchar}), n, y, x, gclusters)
end

function ncplane_putstr(n, gclustarr)
    ccall((:ncplane_putstr, notcurses), Cint, (Ptr{ncplane}, Ptr{Cchar}), n, gclustarr)
end

function ncplane_putstr_aligned(n, y, align, s)
    ccall((:ncplane_putstr_aligned, notcurses), Cint, (Ptr{ncplane}, Cint, ncalign_e, Ptr{Cchar}), n, y, align, s)
end

function ncplane_putstr_stained(n, gclusters)
    ccall((:ncplane_putstr_stained, notcurses), Cint, (Ptr{ncplane}, Ptr{Cchar}), n, gclusters)
end

function ncplane_putnstr_aligned(n, y, align, s, str)
    ccall((:ncplane_putnstr_aligned, notcurses), Cint, (Ptr{ncplane}, Cint, ncalign_e, Csize_t, Ptr{Cchar}), n, y, align, s, str)
end

function ncplane_putnstr_yx(n, y, x, s, gclusters)
    ccall((:ncplane_putnstr_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Csize_t, Ptr{Cchar}), n, y, x, s, gclusters)
end

function ncplane_putnstr(n, s, gclustarr)
    ccall((:ncplane_putnstr, notcurses), Cint, (Ptr{ncplane}, Csize_t, Ptr{Cchar}), n, s, gclustarr)
end

function ncplane_putwstr_yx(n, y, x, gclustarr)
    ccall((:ncplane_putwstr_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Ptr{Cwchar_t}), n, y, x, gclustarr)
end

function ncplane_putwstr_aligned(n, y, align, gclustarr)
    ccall((:ncplane_putwstr_aligned, notcurses), Cint, (Ptr{ncplane}, Cint, ncalign_e, Ptr{Cwchar_t}), n, y, align, gclustarr)
end

function ncplane_putwstr_stained(n, gclustarr)
    ccall((:ncplane_putwstr_stained, notcurses), Cint, (Ptr{ncplane}, Ptr{Cwchar_t}), n, gclustarr)
end

function ncplane_putwstr(n, gclustarr)
    ccall((:ncplane_putwstr, notcurses), Cint, (Ptr{ncplane}, Ptr{Cwchar_t}), n, gclustarr)
end

function ncplane_pututf32_yx(n, y, x, u)
    ccall((:ncplane_pututf32_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, UInt32), n, y, x, u)
end

function ncplane_putwc_yx(n, y, x, w)
    ccall((:ncplane_putwc_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Cwchar_t), n, y, x, w)
end

function ncplane_putwc(n, w)
    ccall((:ncplane_putwc, notcurses), Cint, (Ptr{ncplane}, Cwchar_t), n, w)
end

function ncplane_putwc_utf32(n, w, wchars)
    ccall((:ncplane_putwc_utf32, notcurses), Cint, (Ptr{ncplane}, Ptr{Cwchar_t}, Ptr{Cuint}), n, w, wchars)
end

function ncplane_putwc_stained(n, w)
    ccall((:ncplane_putwc_stained, notcurses), Cint, (Ptr{ncplane}, Cwchar_t), n, w)
end

function ncplane_puttext(n, y, align, text, bytes)
    ccall((:ncplane_puttext, notcurses), Cint, (Ptr{ncplane}, Cint, ncalign_e, Ptr{Cchar}, Ptr{Csize_t}), n, y, align, text, bytes)
end

function ncplane_hline_interp(n, c, len, c1, c2)
    ccall((:ncplane_hline_interp, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Cuint, UInt64, UInt64), n, c, len, c1, c2)
end

function ncplane_hline(n, c, len)
    ccall((:ncplane_hline, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Cuint), n, c, len)
end

function ncplane_vline_interp(n, c, len, c1, c2)
    ccall((:ncplane_vline_interp, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Cuint, UInt64, UInt64), n, c, len, c1, c2)
end

function ncplane_vline(n, c, len)
    ccall((:ncplane_vline, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Cuint), n, c, len)
end

function ncplane_box(n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)
    ccall((:ncplane_box, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Cuint, Cuint, Cuint), n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)
end

function ncplane_box_sized(n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)
    ccall((:ncplane_box_sized, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Cuint, Cuint, Cuint), n, ul, ur, ll, lr, hline, vline, ystop, xstop, ctlword)
end

function ncplane_perimeter(n, ul, ur, ll, lr, hline, vline, ctlword)
    ccall((:ncplane_perimeter, notcurses), Cint, (Ptr{ncplane}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Cuint), n, ul, ur, ll, lr, hline, vline, ctlword)
end

function ncplane_polyfill_yx(n, y, x, c)
    ccall((:ncplane_polyfill_yx, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Ptr{nccell}), n, y, x, c)
end

function ncplane_gradient(n, y, x, ylen, xlen, egc, styles, ul, ur, ll, lr)
    ccall((:ncplane_gradient, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Cuint, Cuint, Ptr{Cchar}, UInt16, UInt64, UInt64, UInt64, UInt64), n, y, x, ylen, xlen, egc, styles, ul, ur, ll, lr)
end

function ncplane_gradient2x1(n, y, x, ylen, xlen, ul, ur, ll, lr)
    ccall((:ncplane_gradient2x1, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Cuint, Cuint, UInt32, UInt32, UInt32, UInt32), n, y, x, ylen, xlen, ul, ur, ll, lr)
end

function ncplane_format(n, y, x, ylen, xlen, stylemask)
    ccall((:ncplane_format, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Cuint, Cuint, UInt16), n, y, x, ylen, xlen, stylemask)
end

function ncplane_stain(n, y, x, ylen, xlen, ul, ur, ll, lr)
    ccall((:ncplane_stain, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Cuint, Cuint, UInt64, UInt64, UInt64, UInt64), n, y, x, ylen, xlen, ul, ur, ll, lr)
end

function ncplane_mergedown_simple(src, dst)
    ccall((:ncplane_mergedown_simple, notcurses), Cint, (Ptr{ncplane}, Ptr{ncplane}), src, dst)
end

function ncplane_mergedown(src, dst, begsrcy, begsrcx, leny, lenx, dsty, dstx)
    ccall((:ncplane_mergedown, notcurses), Cint, (Ptr{ncplane}, Ptr{ncplane}, Cint, Cint, Cuint, Cuint, Cint, Cint), src, dst, begsrcy, begsrcx, leny, lenx, dsty, dstx)
end

function ncplane_erase(n)
    ccall((:ncplane_erase, notcurses), Cvoid, (Ptr{ncplane},), n)
end

function ncplane_erase_region(n, ystart, xstart, ylen, xlen)
    ccall((:ncplane_erase_region, notcurses), Cint, (Ptr{ncplane}, Cint, Cint, Cint, Cint), n, ystart, xstart, ylen, xlen)
end

function nccell_fg_rgb(cl)
    ccall((:nccell_fg_rgb, notcurses), UInt32, (Ptr{nccell},), cl)
end

function nccell_bg_rgb(cl)
    ccall((:nccell_bg_rgb, notcurses), UInt32, (Ptr{nccell},), cl)
end

function nccell_fg_alpha(cl)
    ccall((:nccell_fg_alpha, notcurses), UInt32, (Ptr{nccell},), cl)
end

function nccell_bg_alpha(cl)
    ccall((:nccell_bg_alpha, notcurses), UInt32, (Ptr{nccell},), cl)
end

function nccell_fg_rgb8(cl, r, g, b)
    ccall((:nccell_fg_rgb8, notcurses), UInt32, (Ptr{nccell}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), cl, r, g, b)
end

function nccell_bg_rgb8(cl, r, g, b)
    ccall((:nccell_bg_rgb8, notcurses), UInt32, (Ptr{nccell}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), cl, r, g, b)
end

function nccell_set_fg_rgb8(cl, r, g, b)
    ccall((:nccell_set_fg_rgb8, notcurses), Cint, (Ptr{nccell}, Cuint, Cuint, Cuint), cl, r, g, b)
end

function nccell_set_fg_rgb8_clipped(cl, r, g, b)
    ccall((:nccell_set_fg_rgb8_clipped, notcurses), Cvoid, (Ptr{nccell}, Cint, Cint, Cint), cl, r, g, b)
end

function nccell_set_fg_rgb(c, channel)
    ccall((:nccell_set_fg_rgb, notcurses), Cint, (Ptr{nccell}, UInt32), c, channel)
end

function nccell_set_fg_palindex(cl, idx)
    ccall((:nccell_set_fg_palindex, notcurses), Cint, (Ptr{nccell}, Cuint), cl, idx)
end

function nccell_fg_palindex(cl)
    ccall((:nccell_fg_palindex, notcurses), UInt32, (Ptr{nccell},), cl)
end

function nccell_set_bg_rgb8(cl, r, g, b)
    ccall((:nccell_set_bg_rgb8, notcurses), Cint, (Ptr{nccell}, Cuint, Cuint, Cuint), cl, r, g, b)
end

function nccell_set_bg_rgb8_clipped(cl, r, g, b)
    ccall((:nccell_set_bg_rgb8_clipped, notcurses), Cvoid, (Ptr{nccell}, Cint, Cint, Cint), cl, r, g, b)
end

function nccell_set_bg_rgb(c, channel)
    ccall((:nccell_set_bg_rgb, notcurses), Cint, (Ptr{nccell}, UInt32), c, channel)
end

function nccell_set_bg_palindex(cl, idx)
    ccall((:nccell_set_bg_palindex, notcurses), Cint, (Ptr{nccell}, Cuint), cl, idx)
end

function nccell_bg_palindex(cl)
    ccall((:nccell_bg_palindex, notcurses), UInt32, (Ptr{nccell},), cl)
end

function nccell_fg_default_p(cl)
    ccall((:nccell_fg_default_p, notcurses), Bool, (Ptr{nccell},), cl)
end

function nccell_fg_palindex_p(cl)
    ccall((:nccell_fg_palindex_p, notcurses), Bool, (Ptr{nccell},), cl)
end

function nccell_bg_default_p(cl)
    ccall((:nccell_bg_default_p, notcurses), Bool, (Ptr{nccell},), cl)
end

function nccell_bg_palindex_p(cl)
    ccall((:nccell_bg_palindex_p, notcurses), Bool, (Ptr{nccell},), cl)
end

function ncplane_bchannel(n)
    ccall((:ncplane_bchannel, notcurses), UInt32, (Ptr{ncplane},), n)
end

function ncplane_fchannel(n)
    ccall((:ncplane_fchannel, notcurses), UInt32, (Ptr{ncplane},), n)
end

function ncplane_set_channels(n, channels)
    ccall((:ncplane_set_channels, notcurses), Cvoid, (Ptr{ncplane}, UInt64), n, channels)
end

function ncplane_set_bchannel(n, channel)
    ccall((:ncplane_set_bchannel, notcurses), UInt64, (Ptr{ncplane}, UInt32), n, channel)
end

function ncplane_set_fchannel(n, channel)
    ccall((:ncplane_set_fchannel, notcurses), UInt64, (Ptr{ncplane}, UInt32), n, channel)
end

function ncplane_set_styles(n, stylebits)
    ccall((:ncplane_set_styles, notcurses), Cvoid, (Ptr{ncplane}, Cuint), n, stylebits)
end

function ncplane_on_styles(n, stylebits)
    ccall((:ncplane_on_styles, notcurses), Cvoid, (Ptr{ncplane}, Cuint), n, stylebits)
end

function ncplane_off_styles(n, stylebits)
    ccall((:ncplane_off_styles, notcurses), Cvoid, (Ptr{ncplane}, Cuint), n, stylebits)
end

function ncplane_fg_rgb(n)
    ccall((:ncplane_fg_rgb, notcurses), UInt32, (Ptr{ncplane},), n)
end

function ncplane_bg_rgb(n)
    ccall((:ncplane_bg_rgb, notcurses), UInt32, (Ptr{ncplane},), n)
end

function ncplane_fg_alpha(n)
    ccall((:ncplane_fg_alpha, notcurses), UInt32, (Ptr{ncplane},), n)
end

function ncplane_fg_default_p(n)
    ccall((:ncplane_fg_default_p, notcurses), Bool, (Ptr{ncplane},), n)
end

function ncplane_bg_alpha(n)
    ccall((:ncplane_bg_alpha, notcurses), UInt32, (Ptr{ncplane},), n)
end

function ncplane_bg_default_p(n)
    ccall((:ncplane_bg_default_p, notcurses), Bool, (Ptr{ncplane},), n)
end

function ncplane_fg_rgb8(n, r, g, b)
    ccall((:ncplane_fg_rgb8, notcurses), UInt32, (Ptr{ncplane}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), n, r, g, b)
end

function ncplane_bg_rgb8(n, r, g, b)
    ccall((:ncplane_bg_rgb8, notcurses), UInt32, (Ptr{ncplane}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cuint}), n, r, g, b)
end

function ncplane_set_fg_rgb8(n, r, g, b)
    ccall((:ncplane_set_fg_rgb8, notcurses), Cint, (Ptr{ncplane}, Cuint, Cuint, Cuint), n, r, g, b)
end

function ncplane_set_bg_rgb8(n, r, g, b)
    ccall((:ncplane_set_bg_rgb8, notcurses), Cint, (Ptr{ncplane}, Cuint, Cuint, Cuint), n, r, g, b)
end

function ncplane_set_bg_rgb8_clipped(n, r, g, b)
    ccall((:ncplane_set_bg_rgb8_clipped, notcurses), Cvoid, (Ptr{ncplane}, Cint, Cint, Cint), n, r, g, b)
end

function ncplane_set_fg_rgb8_clipped(n, r, g, b)
    ccall((:ncplane_set_fg_rgb8_clipped, notcurses), Cvoid, (Ptr{ncplane}, Cint, Cint, Cint), n, r, g, b)
end

function ncplane_set_fg_rgb(n, channel)
    ccall((:ncplane_set_fg_rgb, notcurses), Cint, (Ptr{ncplane}, UInt32), n, channel)
end

function ncplane_set_bg_rgb(n, channel)
    ccall((:ncplane_set_bg_rgb, notcurses), Cint, (Ptr{ncplane}, UInt32), n, channel)
end

function ncplane_set_fg_default(n)
    ccall((:ncplane_set_fg_default, notcurses), Cvoid, (Ptr{ncplane},), n)
end

function ncplane_set_bg_default(n)
    ccall((:ncplane_set_bg_default, notcurses), Cvoid, (Ptr{ncplane},), n)
end

function ncplane_set_fg_palindex(n, idx)
    ccall((:ncplane_set_fg_palindex, notcurses), Cint, (Ptr{ncplane}, Cuint), n, idx)
end

function ncplane_set_bg_palindex(n, idx)
    ccall((:ncplane_set_bg_palindex, notcurses), Cint, (Ptr{ncplane}, Cuint), n, idx)
end

function ncplane_set_fg_alpha(n, alpha)
    ccall((:ncplane_set_fg_alpha, notcurses), Cint, (Ptr{ncplane}, Cint), n, alpha)
end

function ncplane_set_bg_alpha(n, alpha)
    ccall((:ncplane_set_bg_alpha, notcurses), Cint, (Ptr{ncplane}, Cint), n, alpha)
end

# typedef int ( * fadecb ) ( struct notcurses * nc , struct ncplane * n , const struct timespec * , void * curry )
const fadecb = Ptr{Cvoid}

function ncplane_fadeout(n, ts, fader, curry)
    ccall((:ncplane_fadeout, notcurses), Cint, (Ptr{ncplane}, Ptr{Cvoid}, fadecb, Ptr{Cvoid}), n, ts, fader, curry)
end

function ncplane_fadein(n, ts, fader, curry)
    ccall((:ncplane_fadein, notcurses), Cint, (Ptr{ncplane}, Ptr{Cvoid}, fadecb, Ptr{Cvoid}), n, ts, fader, curry)
end

function ncfadectx_setup(n)
    ccall((:ncfadectx_setup, notcurses), Ptr{ncfadectx}, (Ptr{ncplane},), n)
end

function ncfadectx_iterations(nctx)
    ccall((:ncfadectx_iterations, notcurses), Cint, (Ptr{ncfadectx},), nctx)
end

function ncplane_fadeout_iteration(n, nctx, iter, fader, curry)
    ccall((:ncplane_fadeout_iteration, notcurses), Cint, (Ptr{ncplane}, Ptr{ncfadectx}, Cint, fadecb, Ptr{Cvoid}), n, nctx, iter, fader, curry)
end

function ncplane_fadein_iteration(n, nctx, iter, fader, curry)
    ccall((:ncplane_fadein_iteration, notcurses), Cint, (Ptr{ncplane}, Ptr{ncfadectx}, Cint, fadecb, Ptr{Cvoid}), n, nctx, iter, fader, curry)
end

function ncplane_pulse(n, ts, fader, curry)
    ccall((:ncplane_pulse, notcurses), Cint, (Ptr{ncplane}, Ptr{Cvoid}, fadecb, Ptr{Cvoid}), n, ts, fader, curry)
end

function ncfadectx_free(nctx)
    ccall((:ncfadectx_free, notcurses), Cvoid, (Ptr{ncfadectx},), nctx)
end

function nccells_load_box(n, styles, channels, ul, ur, ll, lr, hl, vl, gclusters)
    ccall((:nccells_load_box, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{Cchar}), n, styles, channels, ul, ur, ll, lr, hl, vl, gclusters)
end

function nccells_ascii_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    ccall((:nccells_ascii_box, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}), n, attr, channels, ul, ur, ll, lr, hl, vl)
end

function nccells_double_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    ccall((:nccells_double_box, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}), n, attr, channels, ul, ur, ll, lr, hl, vl)
end

function nccells_rounded_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    ccall((:nccells_rounded_box, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}), n, attr, channels, ul, ur, ll, lr, hl, vl)
end

function nccells_light_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    ccall((:nccells_light_box, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}), n, attr, channels, ul, ur, ll, lr, hl, vl)
end

function nccells_heavy_box(n, attr, channels, ul, ur, ll, lr, hl, vl)
    ccall((:nccells_heavy_box, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}, Ptr{nccell}), n, attr, channels, ul, ur, ll, lr, hl, vl)
end

function ncplane_rounded_box(n, styles, channels, ystop, xstop, ctlword)
    ccall((:ncplane_rounded_box, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Cuint, Cuint, Cuint), n, styles, channels, ystop, xstop, ctlword)
end

function ncplane_perimeter_rounded(n, stylemask, channels, ctlword)
    ccall((:ncplane_perimeter_rounded, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Cuint), n, stylemask, channels, ctlword)
end

function ncplane_rounded_box_sized(n, styles, channels, ylen, xlen, ctlword)
    ccall((:ncplane_rounded_box_sized, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Cuint, Cuint, Cuint), n, styles, channels, ylen, xlen, ctlword)
end

function ncplane_double_box(n, styles, channels, ylen, xlen, ctlword)
    ccall((:ncplane_double_box, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Cuint, Cuint, Cuint), n, styles, channels, ylen, xlen, ctlword)
end

function ncplane_ascii_box(n, styles, channels, ylen, xlen, ctlword)
    ccall((:ncplane_ascii_box, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Cuint, Cuint, Cuint), n, styles, channels, ylen, xlen, ctlword)
end

function ncplane_perimeter_double(n, stylemask, channels, ctlword)
    ccall((:ncplane_perimeter_double, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Cuint), n, stylemask, channels, ctlword)
end

function ncplane_double_box_sized(n, styles, channels, ylen, xlen, ctlword)
    ccall((:ncplane_double_box_sized, notcurses), Cint, (Ptr{ncplane}, UInt16, UInt64, Cuint, Cuint, Cuint), n, styles, channels, ylen, xlen, ctlword)
end

function ncvisual_from_file(file)
    ccall((:ncvisual_from_file, notcurses), Ptr{ncvisual}, (Ptr{Cchar},), file)
end

function ncvisual_from_rgba(rgba, rows, rowstride, cols)
    ccall((:ncvisual_from_rgba, notcurses), Ptr{ncvisual}, (Ptr{Cvoid}, Cint, Cint, Cint), rgba, rows, rowstride, cols)
end

function ncvisual_from_rgb_packed(rgba, rows, rowstride, cols, alpha)
    ccall((:ncvisual_from_rgb_packed, notcurses), Ptr{ncvisual}, (Ptr{Cvoid}, Cint, Cint, Cint, Cint), rgba, rows, rowstride, cols, alpha)
end

function ncvisual_from_rgb_loose(rgba, rows, rowstride, cols, alpha)
    ccall((:ncvisual_from_rgb_loose, notcurses), Ptr{ncvisual}, (Ptr{Cvoid}, Cint, Cint, Cint, Cint), rgba, rows, rowstride, cols, alpha)
end

function ncvisual_from_bgra(bgra, rows, rowstride, cols)
    ccall((:ncvisual_from_bgra, notcurses), Ptr{ncvisual}, (Ptr{Cvoid}, Cint, Cint, Cint), bgra, rows, rowstride, cols)
end

function ncvisual_from_palidx(data, rows, rowstride, cols, palsize, pstride, palette)
    ccall((:ncvisual_from_palidx, notcurses), Ptr{ncvisual}, (Ptr{Cvoid}, Cint, Cint, Cint, Cint, Cint, Ptr{UInt32}), data, rows, rowstride, cols, palsize, pstride, palette)
end

function ncvisual_from_plane(n, blit, begy, begx, leny, lenx)
    ccall((:ncvisual_from_plane, notcurses), Ptr{ncvisual}, (Ptr{ncplane}, ncblitter_e, Cint, Cint, Cuint, Cuint), n, blit, begy, begx, leny, lenx)
end

function ncvisual_from_sixel(s, leny, lenx)
    ccall((:ncvisual_from_sixel, notcurses), Ptr{ncvisual}, (Ptr{Cchar}, Cuint, Cuint), s, leny, lenx)
end

struct ncvgeom
    pixy::Cuint
    pixx::Cuint
    cdimy::Cuint
    cdimx::Cuint
    rpixy::Cuint
    rpixx::Cuint
    rcelly::Cuint
    rcellx::Cuint
    scaley::Cuint
    scalex::Cuint
    begy::Cuint
    begx::Cuint
    leny::Cuint
    lenx::Cuint
    maxpixely::Cuint
    maxpixelx::Cuint
    blitter::ncblitter_e
end

function ncvisual_geom(nc, n, vopts, geom)
    ccall((:ncvisual_geom, notcurses), Cint, (Ptr{notcurses}, Ptr{ncvisual}, Ptr{ncvisual_options}, Ptr{ncvgeom}), nc, n, vopts, geom)
end

function ncvisual_destroy(ncv)
    ccall((:ncvisual_destroy, notcurses), Cvoid, (Ptr{ncvisual},), ncv)
end

function ncvisual_decode(nc)
    ccall((:ncvisual_decode, notcurses), Cint, (Ptr{ncvisual},), nc)
end

function ncvisual_decode_loop(nc)
    ccall((:ncvisual_decode_loop, notcurses), Cint, (Ptr{ncvisual},), nc)
end

function ncvisual_rotate(n, rads)
    ccall((:ncvisual_rotate, notcurses), Cint, (Ptr{ncvisual}, Cdouble), n, rads)
end

function ncvisual_resize(n, rows, cols)
    ccall((:ncvisual_resize, notcurses), Cint, (Ptr{ncvisual}, Cint, Cint), n, rows, cols)
end

function ncvisual_resize_noninterpolative(n, rows, cols)
    ccall((:ncvisual_resize_noninterpolative, notcurses), Cint, (Ptr{ncvisual}, Cint, Cint), n, rows, cols)
end

function ncvisual_polyfill_yx(n, y, x, rgba)
    ccall((:ncvisual_polyfill_yx, notcurses), Cint, (Ptr{ncvisual}, Cuint, Cuint, UInt32), n, y, x, rgba)
end

function ncvisual_at_yx(n, y, x, pixel)
    ccall((:ncvisual_at_yx, notcurses), Cint, (Ptr{ncvisual}, Cuint, Cuint, Ptr{UInt32}), n, y, x, pixel)
end

function ncvisual_set_yx(n, y, x, pixel)
    ccall((:ncvisual_set_yx, notcurses), Cint, (Ptr{ncvisual}, Cuint, Cuint, UInt32), n, y, x, pixel)
end

function ncvisual_blit(nc, ncv, vopts)
    ccall((:ncvisual_blit, notcurses), Ptr{ncplane}, (Ptr{notcurses}, Ptr{ncvisual}, Ptr{ncvisual_options}), nc, ncv, vopts)
end

function ncvisualplane_create(nc, opts, ncv, vopts)
    ccall((:ncvisualplane_create, notcurses), Ptr{ncplane}, (Ptr{notcurses}, Ptr{ncplane_options}, Ptr{ncvisual}, Ptr{ncvisual_options}), nc, opts, ncv, vopts)
end

function ncvisual_subtitle_plane(parent, ncv)
    ccall((:ncvisual_subtitle_plane, notcurses), Ptr{ncplane}, (Ptr{ncplane}, Ptr{ncvisual}), parent, ncv)
end

function ncvisual_media_defblitter(nc, scale)
    ccall((:ncvisual_media_defblitter, notcurses), ncblitter_e, (Ptr{notcurses}, ncscale_e), nc, scale)
end

# typedef int ( * ncstreamcb ) ( struct ncvisual * , struct ncvisual_options * , const struct timespec * , void * )
const ncstreamcb = Ptr{Cvoid}

function ncvisual_simple_streamer(ncv, vopts, tspec, curry)
    ccall((:ncvisual_simple_streamer, notcurses), Cint, (Ptr{ncvisual}, Ptr{ncvisual_options}, Ptr{Cvoid}, Ptr{Cvoid}), ncv, vopts, tspec, curry)
end

function ncvisual_stream(nc, ncv, timescale, streamer, vopts, curry)
    ccall((:ncvisual_stream, notcurses), Cint, (Ptr{notcurses}, Ptr{ncvisual}, Cfloat, ncstreamcb, Ptr{ncvisual_options}, Ptr{Cvoid}), nc, ncv, timescale, streamer, vopts, curry)
end

function ncblit_rgba(data, linesize, vopts)
    ccall((:ncblit_rgba, notcurses), Cint, (Ptr{Cvoid}, Cint, Ptr{ncvisual_options}), data, linesize, vopts)
end

function ncblit_bgrx(data, linesize, vopts)
    ccall((:ncblit_bgrx, notcurses), Cint, (Ptr{Cvoid}, Cint, Ptr{ncvisual_options}), data, linesize, vopts)
end

function ncblit_rgb_packed(data, linesize, vopts, alpha)
    ccall((:ncblit_rgb_packed, notcurses), Cint, (Ptr{Cvoid}, Cint, Ptr{ncvisual_options}, Cint), data, linesize, vopts, alpha)
end

function ncblit_rgb_loose(data, linesize, vopts, alpha)
    ccall((:ncblit_rgb_loose, notcurses), Cint, (Ptr{Cvoid}, Cint, Ptr{ncvisual_options}, Cint), data, linesize, vopts, alpha)
end

function ncpixel_a(pixel)
    ccall((:ncpixel_a, notcurses), Cuint, (UInt32,), pixel)
end

function ncpixel_r(pixel)
    ccall((:ncpixel_r, notcurses), Cuint, (UInt32,), pixel)
end

function ncpixel_g(pixel)
    ccall((:ncpixel_g, notcurses), Cuint, (UInt32,), pixel)
end

function ncpixel_b(pixel)
    ccall((:ncpixel_b, notcurses), Cuint, (UInt32,), pixel)
end

function ncpixel_set_a(pixel, a)
    ccall((:ncpixel_set_a, notcurses), Cint, (Ptr{UInt32}, Cuint), pixel, a)
end

function ncpixel_set_r(pixel, r)
    ccall((:ncpixel_set_r, notcurses), Cint, (Ptr{UInt32}, Cuint), pixel, r)
end

function ncpixel_set_g(pixel, g)
    ccall((:ncpixel_set_g, notcurses), Cint, (Ptr{UInt32}, Cuint), pixel, g)
end

function ncpixel_set_b(pixel, b)
    ccall((:ncpixel_set_b, notcurses), Cint, (Ptr{UInt32}, Cuint), pixel, b)
end

function ncpixel(r, g, b)
    ccall((:ncpixel, notcurses), UInt32, (Cuint, Cuint, Cuint), r, g, b)
end

function ncpixel_set_rgb8(pixel, r, g, b)
    ccall((:ncpixel_set_rgb8, notcurses), Cint, (Ptr{UInt32}, Cuint, Cuint, Cuint), pixel, r, g, b)
end

struct ncreel_options
    bordermask::Cuint
    borderchan::UInt64
    tabletmask::Cuint
    tabletchan::UInt64
    focusedchan::UInt64
    flags::UInt64
end

function ncreel_create(n, popts)
    ccall((:ncreel_create, notcurses), Ptr{ncreel}, (Ptr{ncplane}, Ptr{ncreel_options}), n, popts)
end

function ncreel_plane(nr)
    ccall((:ncreel_plane, notcurses), Ptr{ncplane}, (Ptr{ncreel},), nr)
end

# typedef int ( * tabletcb ) ( struct nctablet * t , bool drawfromtop )
const tabletcb = Ptr{Cvoid}

function ncreel_add(nr, after, before, cb, opaque)
    ccall((:ncreel_add, notcurses), Ptr{nctablet}, (Ptr{ncreel}, Ptr{nctablet}, Ptr{nctablet}, tabletcb, Ptr{Cvoid}), nr, after, before, cb, opaque)
end

function ncreel_tabletcount(nr)
    ccall((:ncreel_tabletcount, notcurses), Cint, (Ptr{ncreel},), nr)
end

function ncreel_del(nr, t)
    ccall((:ncreel_del, notcurses), Cint, (Ptr{ncreel}, Ptr{nctablet}), nr, t)
end

function ncreel_redraw(nr)
    ccall((:ncreel_redraw, notcurses), Cint, (Ptr{ncreel},), nr)
end

function ncreel_offer_input(nr, ni)
    ccall((:ncreel_offer_input, notcurses), Bool, (Ptr{ncreel}, Ptr{ncinput}), nr, ni)
end

function ncreel_focused(nr)
    ccall((:ncreel_focused, notcurses), Ptr{nctablet}, (Ptr{ncreel},), nr)
end

function ncreel_next(nr)
    ccall((:ncreel_next, notcurses), Ptr{nctablet}, (Ptr{ncreel},), nr)
end

function ncreel_prev(nr)
    ccall((:ncreel_prev, notcurses), Ptr{nctablet}, (Ptr{ncreel},), nr)
end

function ncreel_destroy(nr)
    ccall((:ncreel_destroy, notcurses), Cvoid, (Ptr{ncreel},), nr)
end

function nctablet_userptr(t)
    ccall((:nctablet_userptr, notcurses), Ptr{Cvoid}, (Ptr{nctablet},), t)
end

function nctablet_plane(t)
    ccall((:nctablet_plane, notcurses), Ptr{ncplane}, (Ptr{nctablet},), t)
end

function ncnmetric(val, s, decimal, buf, omitdec, mult, uprefix)
    ccall((:ncnmetric, notcurses), Ptr{Cchar}, (uintmax_t, Csize_t, uintmax_t, Ptr{Cchar}, Cint, uintmax_t, Cint), val, s, decimal, buf, omitdec, mult, uprefix)
end

function ncqprefix(val, decimal, buf, omitdec)
    ccall((:ncqprefix, notcurses), Ptr{Cchar}, (uintmax_t, uintmax_t, Ptr{Cchar}, Cint), val, decimal, buf, omitdec)
end

function nciprefix(val, decimal, buf, omitdec)
    ccall((:nciprefix, notcurses), Ptr{Cchar}, (uintmax_t, uintmax_t, Ptr{Cchar}, Cint), val, decimal, buf, omitdec)
end

function ncbprefix(val, decimal, buf, omitdec)
    ccall((:ncbprefix, notcurses), Ptr{Cchar}, (uintmax_t, uintmax_t, Ptr{Cchar}, Cint), val, decimal, buf, omitdec)
end

function notcurses_default_foreground(nc, fg)
    ccall((:notcurses_default_foreground, notcurses), Cint, (Ptr{notcurses}, Ptr{UInt32}), nc, fg)
end

function notcurses_default_background(nc, bg)
    ccall((:notcurses_default_background, notcurses), Cint, (Ptr{notcurses}, Ptr{UInt32}), nc, bg)
end

function notcurses_cursor_enable(nc, y, x)
    ccall((:notcurses_cursor_enable, notcurses), Cint, (Ptr{notcurses}, Cint, Cint), nc, y, x)
end

function notcurses_cursor_disable(nc)
    ccall((:notcurses_cursor_disable, notcurses), Cint, (Ptr{notcurses},), nc)
end

function notcurses_cursor_yx(nc, y, x)
    ccall((:notcurses_cursor_yx, notcurses), Cint, (Ptr{notcurses}, Ptr{Cint}, Ptr{Cint}), nc, y, x)
end

function ncplane_greyscale(n)
    ccall((:ncplane_greyscale, notcurses), Cvoid, (Ptr{ncplane},), n)
end

struct ncselector_item
    option::Ptr{Cchar}
    desc::Ptr{Cchar}
end

struct ncselector_options
    title::Ptr{Cchar}
    secondary::Ptr{Cchar}
    footer::Ptr{Cchar}
    items::Ptr{ncselector_item}
    defidx::Cuint
    maxdisplay::Cuint
    opchannels::UInt64
    descchannels::UInt64
    titlechannels::UInt64
    footchannels::UInt64
    boxchannels::UInt64
    flags::UInt64
end

function ncselector_create(n, opts)
    ccall((:ncselector_create, notcurses), Ptr{ncselector}, (Ptr{ncplane}, Ptr{ncselector_options}), n, opts)
end

function ncselector_additem(n, item)
    ccall((:ncselector_additem, notcurses), Cint, (Ptr{ncselector}, Ptr{ncselector_item}), n, item)
end

function ncselector_delitem(n, item)
    ccall((:ncselector_delitem, notcurses), Cint, (Ptr{ncselector}, Ptr{Cchar}), n, item)
end

function ncselector_selected(n)
    ccall((:ncselector_selected, notcurses), Ptr{Cchar}, (Ptr{ncselector},), n)
end

function ncselector_plane(n)
    ccall((:ncselector_plane, notcurses), Ptr{ncplane}, (Ptr{ncselector},), n)
end

function ncselector_previtem(n)
    ccall((:ncselector_previtem, notcurses), Ptr{Cchar}, (Ptr{ncselector},), n)
end

function ncselector_nextitem(n)
    ccall((:ncselector_nextitem, notcurses), Ptr{Cchar}, (Ptr{ncselector},), n)
end

function ncselector_offer_input(n, nc)
    ccall((:ncselector_offer_input, notcurses), Bool, (Ptr{ncselector}, Ptr{ncinput}), n, nc)
end

function ncselector_destroy(n, item)
    ccall((:ncselector_destroy, notcurses), Cvoid, (Ptr{ncselector}, Ptr{Ptr{Cchar}}), n, item)
end

struct ncmselector_item
    option::Ptr{Cchar}
    desc::Ptr{Cchar}
    selected::Bool
end

struct ncmultiselector_options
    title::Ptr{Cchar}
    secondary::Ptr{Cchar}
    footer::Ptr{Cchar}
    items::Ptr{ncmselector_item}
    maxdisplay::Cuint
    opchannels::UInt64
    descchannels::UInt64
    titlechannels::UInt64
    footchannels::UInt64
    boxchannels::UInt64
    flags::UInt64
end

function ncmultiselector_create(n, opts)
    ccall((:ncmultiselector_create, notcurses), Ptr{ncmultiselector}, (Ptr{ncplane}, Ptr{ncmultiselector_options}), n, opts)
end

function ncmultiselector_selected(n, selected, count)
    ccall((:ncmultiselector_selected, notcurses), Cint, (Ptr{ncmultiselector}, Ptr{Bool}, Cuint), n, selected, count)
end

function ncmultiselector_plane(n)
    ccall((:ncmultiselector_plane, notcurses), Ptr{ncplane}, (Ptr{ncmultiselector},), n)
end

function ncmultiselector_offer_input(n, nc)
    ccall((:ncmultiselector_offer_input, notcurses), Bool, (Ptr{ncmultiselector}, Ptr{ncinput}), n, nc)
end

function ncmultiselector_destroy(n)
    ccall((:ncmultiselector_destroy, notcurses), Cvoid, (Ptr{ncmultiselector},), n)
end

struct nctree_item
    curry::Ptr{Cvoid}
    subs::Ptr{nctree_item}
    subcount::Cuint
end

struct nctree_options
    items::Ptr{nctree_item}
    count::Cuint
    nctreecb::Ptr{Cvoid}
    indentcols::Cint
    flags::UInt64
end

mutable struct nctree end

function nctree_create(n, opts)
    ccall((:nctree_create, notcurses), Ptr{nctree}, (Ptr{ncplane}, Ptr{nctree_options}), n, opts)
end

function nctree_plane(n)
    ccall((:nctree_plane, notcurses), Ptr{ncplane}, (Ptr{nctree},), n)
end

function nctree_redraw(n)
    ccall((:nctree_redraw, notcurses), Cint, (Ptr{nctree},), n)
end

function nctree_offer_input(n, ni)
    ccall((:nctree_offer_input, notcurses), Bool, (Ptr{nctree}, Ptr{ncinput}), n, ni)
end

function nctree_focused(n)
    ccall((:nctree_focused, notcurses), Ptr{Cvoid}, (Ptr{nctree},), n)
end

function nctree_next(n)
    ccall((:nctree_next, notcurses), Ptr{Cvoid}, (Ptr{nctree},), n)
end

function nctree_prev(n)
    ccall((:nctree_prev, notcurses), Ptr{Cvoid}, (Ptr{nctree},), n)
end

function nctree_goto(n, spec, failspec)
    ccall((:nctree_goto, notcurses), Ptr{Cvoid}, (Ptr{nctree}, Ptr{Cuint}, Ptr{Cint}), n, spec, failspec)
end

function nctree_add(n, spec, add)
    ccall((:nctree_add, notcurses), Cint, (Ptr{nctree}, Ptr{Cuint}, Ptr{nctree_item}), n, spec, add)
end

function nctree_del(n, spec)
    ccall((:nctree_del, notcurses), Cint, (Ptr{nctree}, Ptr{Cuint}), n, spec)
end

function nctree_destroy(n)
    ccall((:nctree_destroy, notcurses), Cvoid, (Ptr{nctree},), n)
end

struct ncmenu_item
    desc::Ptr{Cchar}
    shortcut::ncinput
end

struct ncmenu_section
    name::Ptr{Cchar}
    itemcount::Cint
    items::Ptr{ncmenu_item}
    shortcut::ncinput
end

struct ncmenu_options
    sections::Ptr{ncmenu_section}
    sectioncount::Cint
    headerchannels::UInt64
    sectionchannels::UInt64
    flags::UInt64
end

mutable struct ncmenu end

function ncmenu_create(n, opts)
    ccall((:ncmenu_create, notcurses), Ptr{ncmenu}, (Ptr{ncplane}, Ptr{ncmenu_options}), n, opts)
end

function ncmenu_unroll(n, sectionidx)
    ccall((:ncmenu_unroll, notcurses), Cint, (Ptr{ncmenu}, Cint), n, sectionidx)
end

function ncmenu_rollup(n)
    ccall((:ncmenu_rollup, notcurses), Cint, (Ptr{ncmenu},), n)
end

function ncmenu_nextsection(n)
    ccall((:ncmenu_nextsection, notcurses), Cint, (Ptr{ncmenu},), n)
end

function ncmenu_prevsection(n)
    ccall((:ncmenu_prevsection, notcurses), Cint, (Ptr{ncmenu},), n)
end

function ncmenu_nextitem(n)
    ccall((:ncmenu_nextitem, notcurses), Cint, (Ptr{ncmenu},), n)
end

function ncmenu_previtem(n)
    ccall((:ncmenu_previtem, notcurses), Cint, (Ptr{ncmenu},), n)
end

function ncmenu_item_set_status(n, section, item, enabled)
    ccall((:ncmenu_item_set_status, notcurses), Cint, (Ptr{ncmenu}, Ptr{Cchar}, Ptr{Cchar}, Bool), n, section, item, enabled)
end

function ncmenu_selected(n, ni)
    ccall((:ncmenu_selected, notcurses), Ptr{Cchar}, (Ptr{ncmenu}, Ptr{ncinput}), n, ni)
end

function ncmenu_mouse_selected(n, click, ni)
    ccall((:ncmenu_mouse_selected, notcurses), Ptr{Cchar}, (Ptr{ncmenu}, Ptr{ncinput}, Ptr{ncinput}), n, click, ni)
end

function ncmenu_plane(n)
    ccall((:ncmenu_plane, notcurses), Ptr{ncplane}, (Ptr{ncmenu},), n)
end

function ncmenu_offer_input(n, nc)
    ccall((:ncmenu_offer_input, notcurses), Bool, (Ptr{ncmenu}, Ptr{ncinput}), n, nc)
end

function ncmenu_destroy(n)
    ccall((:ncmenu_destroy, notcurses), Cvoid, (Ptr{ncmenu},), n)
end

struct ncprogbar_options
    ulchannel::UInt32
    urchannel::UInt32
    blchannel::UInt32
    brchannel::UInt32
    flags::UInt64
end

function ncprogbar_create(n, opts)
    ccall((:ncprogbar_create, notcurses), Ptr{ncprogbar}, (Ptr{ncplane}, Ptr{ncprogbar_options}), n, opts)
end

function ncprogbar_plane(n)
    ccall((:ncprogbar_plane, notcurses), Ptr{ncplane}, (Ptr{ncprogbar},), n)
end

function ncprogbar_set_progress(n, p)
    ccall((:ncprogbar_set_progress, notcurses), Cint, (Ptr{ncprogbar}, Cdouble), n, p)
end

function ncprogbar_progress(n)
    ccall((:ncprogbar_progress, notcurses), Cdouble, (Ptr{ncprogbar},), n)
end

function ncprogbar_destroy(n)
    ccall((:ncprogbar_destroy, notcurses), Cvoid, (Ptr{ncprogbar},), n)
end

struct nctabbed_options
    selchan::UInt64
    hdrchan::UInt64
    sepchan::UInt64
    separator::Ptr{Cchar}
    flags::UInt64
end

# typedef void ( * tabcb ) ( struct nctab * t , struct ncplane * ncp , void * curry )
const tabcb = Ptr{Cvoid}

function nctabbed_create(n, opts)
    ccall((:nctabbed_create, notcurses), Ptr{nctabbed}, (Ptr{ncplane}, Ptr{nctabbed_options}), n, opts)
end

function nctabbed_destroy(nt)
    ccall((:nctabbed_destroy, notcurses), Cvoid, (Ptr{nctabbed},), nt)
end

function nctabbed_redraw(nt)
    ccall((:nctabbed_redraw, notcurses), Cvoid, (Ptr{nctabbed},), nt)
end

function nctabbed_ensure_selected_header_visible(nt)
    ccall((:nctabbed_ensure_selected_header_visible, notcurses), Cvoid, (Ptr{nctabbed},), nt)
end

function nctabbed_selected(nt)
    ccall((:nctabbed_selected, notcurses), Ptr{nctab}, (Ptr{nctabbed},), nt)
end

function nctabbed_leftmost(nt)
    ccall((:nctabbed_leftmost, notcurses), Ptr{nctab}, (Ptr{nctabbed},), nt)
end

function nctabbed_tabcount(nt)
    ccall((:nctabbed_tabcount, notcurses), Cint, (Ptr{nctabbed},), nt)
end

function nctabbed_plane(nt)
    ccall((:nctabbed_plane, notcurses), Ptr{ncplane}, (Ptr{nctabbed},), nt)
end

function nctabbed_content_plane(nt)
    ccall((:nctabbed_content_plane, notcurses), Ptr{ncplane}, (Ptr{nctabbed},), nt)
end

function nctab_cb(t)
    ccall((:nctab_cb, notcurses), tabcb, (Ptr{nctab},), t)
end

function nctab_name(t)
    ccall((:nctab_name, notcurses), Ptr{Cchar}, (Ptr{nctab},), t)
end

function nctab_name_width(t)
    ccall((:nctab_name_width, notcurses), Cint, (Ptr{nctab},), t)
end

function nctab_userptr(t)
    ccall((:nctab_userptr, notcurses), Ptr{Cvoid}, (Ptr{nctab},), t)
end

function nctab_next(t)
    ccall((:nctab_next, notcurses), Ptr{nctab}, (Ptr{nctab},), t)
end

function nctab_prev(t)
    ccall((:nctab_prev, notcurses), Ptr{nctab}, (Ptr{nctab},), t)
end

function nctabbed_add(nt, after, before, tcb, name, opaque)
    ccall((:nctabbed_add, notcurses), Ptr{nctab}, (Ptr{nctabbed}, Ptr{nctab}, Ptr{nctab}, tabcb, Ptr{Cchar}, Ptr{Cvoid}), nt, after, before, tcb, name, opaque)
end

function nctabbed_del(nt, t)
    ccall((:nctabbed_del, notcurses), Cint, (Ptr{nctabbed}, Ptr{nctab}), nt, t)
end

function nctab_move(nt, t, after, before)
    ccall((:nctab_move, notcurses), Cint, (Ptr{nctabbed}, Ptr{nctab}, Ptr{nctab}, Ptr{nctab}), nt, t, after, before)
end

function nctab_move_right(nt, t)
    ccall((:nctab_move_right, notcurses), Cvoid, (Ptr{nctabbed}, Ptr{nctab}), nt, t)
end

function nctab_move_left(nt, t)
    ccall((:nctab_move_left, notcurses), Cvoid, (Ptr{nctabbed}, Ptr{nctab}), nt, t)
end

function nctabbed_rotate(nt, amt)
    ccall((:nctabbed_rotate, notcurses), Cvoid, (Ptr{nctabbed}, Cint), nt, amt)
end

function nctabbed_next(nt)
    ccall((:nctabbed_next, notcurses), Ptr{nctab}, (Ptr{nctabbed},), nt)
end

function nctabbed_prev(nt)
    ccall((:nctabbed_prev, notcurses), Ptr{nctab}, (Ptr{nctabbed},), nt)
end

function nctabbed_select(nt, t)
    ccall((:nctabbed_select, notcurses), Ptr{nctab}, (Ptr{nctabbed}, Ptr{nctab}), nt, t)
end

function nctabbed_channels(nt, hdrchan, selchan, sepchan)
    ccall((:nctabbed_channels, notcurses), Cvoid, (Ptr{nctabbed}, Ptr{UInt64}, Ptr{UInt64}, Ptr{UInt64}), nt, hdrchan, selchan, sepchan)
end

function nctabbed_hdrchan(nt)
    ccall((:nctabbed_hdrchan, notcurses), UInt64, (Ptr{nctabbed},), nt)
end

function nctabbed_selchan(nt)
    ccall((:nctabbed_selchan, notcurses), UInt64, (Ptr{nctabbed},), nt)
end

function nctabbed_sepchan(nt)
    ccall((:nctabbed_sepchan, notcurses), UInt64, (Ptr{nctabbed},), nt)
end

function nctabbed_separator(nt)
    ccall((:nctabbed_separator, notcurses), Ptr{Cchar}, (Ptr{nctabbed},), nt)
end

function nctabbed_separator_width(nt)
    ccall((:nctabbed_separator_width, notcurses), Cint, (Ptr{nctabbed},), nt)
end

function nctabbed_set_hdrchan(nt, chan)
    ccall((:nctabbed_set_hdrchan, notcurses), Cvoid, (Ptr{nctabbed}, UInt64), nt, chan)
end

function nctabbed_set_selchan(nt, chan)
    ccall((:nctabbed_set_selchan, notcurses), Cvoid, (Ptr{nctabbed}, UInt64), nt, chan)
end

function nctabbed_set_sepchan(nt, chan)
    ccall((:nctabbed_set_sepchan, notcurses), Cvoid, (Ptr{nctabbed}, UInt64), nt, chan)
end

function nctab_set_cb(t, newcb)
    ccall((:nctab_set_cb, notcurses), tabcb, (Ptr{nctab}, tabcb), t, newcb)
end

function nctab_set_name(t, newname)
    ccall((:nctab_set_name, notcurses), Cint, (Ptr{nctab}, Ptr{Cchar}), t, newname)
end

function nctab_set_userptr(t, newopaque)
    ccall((:nctab_set_userptr, notcurses), Ptr{Cvoid}, (Ptr{nctab}, Ptr{Cvoid}), t, newopaque)
end

function nctabbed_set_separator(nt, separator)
    ccall((:nctabbed_set_separator, notcurses), Cint, (Ptr{nctabbed}, Ptr{Cchar}), nt, separator)
end

struct ncplot_options
    maxchannels::UInt64
    minchannels::UInt64
    legendstyle::UInt16
    gridtype::ncblitter_e
    rangex::Cint
    title::Ptr{Cchar}
    flags::UInt64
end

function ncuplot_create(n, opts, miny, maxy)
    ccall((:ncuplot_create, notcurses), Ptr{ncuplot}, (Ptr{ncplane}, Ptr{ncplot_options}, UInt64, UInt64), n, opts, miny, maxy)
end

function ncdplot_create(n, opts, miny, maxy)
    ccall((:ncdplot_create, notcurses), Ptr{ncdplot}, (Ptr{ncplane}, Ptr{ncplot_options}, Cdouble, Cdouble), n, opts, miny, maxy)
end

function ncuplot_plane(n)
    ccall((:ncuplot_plane, notcurses), Ptr{ncplane}, (Ptr{ncuplot},), n)
end

function ncdplot_plane(n)
    ccall((:ncdplot_plane, notcurses), Ptr{ncplane}, (Ptr{ncdplot},), n)
end

function ncuplot_add_sample(n, x, y)
    ccall((:ncuplot_add_sample, notcurses), Cint, (Ptr{ncuplot}, UInt64, UInt64), n, x, y)
end

function ncdplot_add_sample(n, x, y)
    ccall((:ncdplot_add_sample, notcurses), Cint, (Ptr{ncdplot}, UInt64, Cdouble), n, x, y)
end

function ncuplot_set_sample(n, x, y)
    ccall((:ncuplot_set_sample, notcurses), Cint, (Ptr{ncuplot}, UInt64, UInt64), n, x, y)
end

function ncdplot_set_sample(n, x, y)
    ccall((:ncdplot_set_sample, notcurses), Cint, (Ptr{ncdplot}, UInt64, Cdouble), n, x, y)
end

function ncuplot_sample(n, x, y)
    ccall((:ncuplot_sample, notcurses), Cint, (Ptr{ncuplot}, UInt64, Ptr{UInt64}), n, x, y)
end

function ncdplot_sample(n, x, y)
    ccall((:ncdplot_sample, notcurses), Cint, (Ptr{ncdplot}, UInt64, Ptr{Cdouble}), n, x, y)
end

function ncuplot_destroy(n)
    ccall((:ncuplot_destroy, notcurses), Cvoid, (Ptr{ncuplot},), n)
end

function ncdplot_destroy(n)
    ccall((:ncdplot_destroy, notcurses), Cvoid, (Ptr{ncdplot},), n)
end

# typedef int ( * ncfdplane_callback ) ( struct ncfdplane * n , const void * buf , size_t s , void * curry )
const ncfdplane_callback = Ptr{Cvoid}

# typedef int ( * ncfdplane_done_cb ) ( struct ncfdplane * n , int fderrno , void * curry )
const ncfdplane_done_cb = Ptr{Cvoid}

struct ncfdplane_options
    curry::Ptr{Cvoid}
    follow::Bool
    flags::UInt64
end

function ncfdplane_create(n, opts, fd, cbfxn, donecbfxn)
    ccall((:ncfdplane_create, notcurses), Ptr{ncfdplane}, (Ptr{ncplane}, Ptr{ncfdplane_options}, Cint, ncfdplane_callback, ncfdplane_done_cb), n, opts, fd, cbfxn, donecbfxn)
end

function ncfdplane_plane(n)
    ccall((:ncfdplane_plane, notcurses), Ptr{ncplane}, (Ptr{ncfdplane},), n)
end

function ncfdplane_destroy(n)
    ccall((:ncfdplane_destroy, notcurses), Cint, (Ptr{ncfdplane},), n)
end

struct ncsubproc_options
    curry::Ptr{Cvoid}
    restart_period::UInt64
    flags::UInt64
end

function ncsubproc_createv(n, opts, bin, arg, cbfxn, donecbfxn)
    ccall((:ncsubproc_createv, notcurses), Ptr{ncsubproc}, (Ptr{ncplane}, Ptr{ncsubproc_options}, Ptr{Cchar}, Ptr{Ptr{Cchar}}, ncfdplane_callback, ncfdplane_done_cb), n, opts, bin, arg, cbfxn, donecbfxn)
end

function ncsubproc_createvp(n, opts, bin, arg, cbfxn, donecbfxn)
    ccall((:ncsubproc_createvp, notcurses), Ptr{ncsubproc}, (Ptr{ncplane}, Ptr{ncsubproc_options}, Ptr{Cchar}, Ptr{Ptr{Cchar}}, ncfdplane_callback, ncfdplane_done_cb), n, opts, bin, arg, cbfxn, donecbfxn)
end

function ncsubproc_createvpe(n, opts, bin, arg, env, cbfxn, donecbfxn)
    ccall((:ncsubproc_createvpe, notcurses), Ptr{ncsubproc}, (Ptr{ncplane}, Ptr{ncsubproc_options}, Ptr{Cchar}, Ptr{Ptr{Cchar}}, Ptr{Ptr{Cchar}}, ncfdplane_callback, ncfdplane_done_cb), n, opts, bin, arg, env, cbfxn, donecbfxn)
end

function ncsubproc_plane(n)
    ccall((:ncsubproc_plane, notcurses), Ptr{ncplane}, (Ptr{ncsubproc},), n)
end

function ncsubproc_destroy(n)
    ccall((:ncsubproc_destroy, notcurses), Cint, (Ptr{ncsubproc},), n)
end

function ncplane_qrcode(n, ymax, xmax, data, len)
    ccall((:ncplane_qrcode, notcurses), Cint, (Ptr{ncplane}, Ptr{Cuint}, Ptr{Cuint}, Ptr{Cvoid}, Csize_t), n, ymax, xmax, data, len)
end

struct ncreader_options
    tchannels::UInt64
    tattrword::UInt32
    flags::UInt64
end

function ncreader_create(n, opts)
    ccall((:ncreader_create, notcurses), Ptr{ncreader}, (Ptr{ncplane}, Ptr{ncreader_options}), n, opts)
end

function ncreader_clear(n)
    ccall((:ncreader_clear, notcurses), Cint, (Ptr{ncreader},), n)
end

function ncreader_plane(n)
    ccall((:ncreader_plane, notcurses), Ptr{ncplane}, (Ptr{ncreader},), n)
end

function ncreader_offer_input(n, ni)
    ccall((:ncreader_offer_input, notcurses), Bool, (Ptr{ncreader}, Ptr{ncinput}), n, ni)
end

function ncreader_move_left(n)
    ccall((:ncreader_move_left, notcurses), Cint, (Ptr{ncreader},), n)
end

function ncreader_move_right(n)
    ccall((:ncreader_move_right, notcurses), Cint, (Ptr{ncreader},), n)
end

function ncreader_move_up(n)
    ccall((:ncreader_move_up, notcurses), Cint, (Ptr{ncreader},), n)
end

function ncreader_move_down(n)
    ccall((:ncreader_move_down, notcurses), Cint, (Ptr{ncreader},), n)
end

function ncreader_write_egc(n, egc)
    ccall((:ncreader_write_egc, notcurses), Cint, (Ptr{ncreader}, Ptr{Cchar}), n, egc)
end

function ncreader_contents(n)
    ccall((:ncreader_contents, notcurses), Ptr{Cchar}, (Ptr{ncreader},), n)
end

function ncreader_destroy(n, contents)
    ccall((:ncreader_destroy, notcurses), Cvoid, (Ptr{ncreader}, Ptr{Ptr{Cchar}}), n, contents)
end

function notcurses_accountname()
    ccall((:notcurses_accountname, notcurses), Ptr{Cchar}, ())
end

function notcurses_hostname()
    ccall((:notcurses_hostname, notcurses), Ptr{Cchar}, ())
end

function notcurses_osversion()
    ccall((:notcurses_osversion, notcurses), Ptr{Cchar}, ())
end

function notcurses_debug(nc, debugfp)
    ccall((:notcurses_debug, notcurses), Cvoid, (Ptr{notcurses}, Ptr{Libc.FILE}), nc, debugfp)
end

# Skipping MacroDefinition: API __attribute__ ( ( visibility ( "default" ) ) )

# Skipping MacroDefinition: ALLOC __attribute__ ( ( malloc ) ) __attribute__ ( ( warn_unused_result ) )

const NCDIRECT_OPTION_INHIBIT_SETLOCALE = Culonglong(0x0001)

const NCDIRECT_OPTION_INHIBIT_CBREAK = Culonglong(0x0002)

const NCDIRECT_OPTION_DRAIN_INPUT = Culonglong(0x0004)

const NCDIRECT_OPTION_NO_QUIT_SIGHANDLERS = Culonglong(0x0008)

const NCDIRECT_OPTION_VERBOSE = Culonglong(0x0010)

const NCDIRECT_OPTION_VERY_VERBOSE = Culonglong(0x0020)

const PRETERUNICODEBASE = 1115000

preterunicode(w) = w + PRETERUNICODEBASE

const NCKEY_INVALID = preterunicode(0)

const NCKEY_RESIZE = preterunicode(1)

const NCKEY_UP = preterunicode(2)

const NCKEY_RIGHT = preterunicode(3)

const NCKEY_DOWN = preterunicode(4)

const NCKEY_LEFT = preterunicode(5)

const NCKEY_INS = preterunicode(6)

const NCKEY_DEL = preterunicode(7)

const NCKEY_BACKSPACE = preterunicode(8)

const NCKEY_PGDOWN = preterunicode(9)

const NCKEY_PGUP = preterunicode(10)

const NCKEY_HOME = preterunicode(11)

const NCKEY_END = preterunicode(12)

const NCKEY_F00 = preterunicode(20)

const NCKEY_F01 = preterunicode(21)

const NCKEY_F02 = preterunicode(22)

const NCKEY_F03 = preterunicode(23)

const NCKEY_F04 = preterunicode(24)

const NCKEY_F05 = preterunicode(25)

const NCKEY_F06 = preterunicode(26)

const NCKEY_F07 = preterunicode(27)

const NCKEY_F08 = preterunicode(28)

const NCKEY_F09 = preterunicode(29)

const NCKEY_F10 = preterunicode(30)

const NCKEY_F11 = preterunicode(31)

const NCKEY_F12 = preterunicode(32)

const NCKEY_F13 = preterunicode(33)

const NCKEY_F14 = preterunicode(34)

const NCKEY_F15 = preterunicode(35)

const NCKEY_F16 = preterunicode(36)

const NCKEY_F17 = preterunicode(37)

const NCKEY_F18 = preterunicode(38)

const NCKEY_F19 = preterunicode(39)

const NCKEY_F20 = preterunicode(40)

const NCKEY_F21 = preterunicode(41)

const NCKEY_F22 = preterunicode(42)

const NCKEY_F23 = preterunicode(43)

const NCKEY_F24 = preterunicode(44)

const NCKEY_F25 = preterunicode(45)

const NCKEY_F26 = preterunicode(46)

const NCKEY_F27 = preterunicode(47)

const NCKEY_F28 = preterunicode(48)

const NCKEY_F29 = preterunicode(49)

const NCKEY_F30 = preterunicode(50)

const NCKEY_F31 = preterunicode(51)

const NCKEY_F32 = preterunicode(52)

const NCKEY_F33 = preterunicode(53)

const NCKEY_F34 = preterunicode(54)

const NCKEY_F35 = preterunicode(55)

const NCKEY_F36 = preterunicode(56)

const NCKEY_F37 = preterunicode(57)

const NCKEY_F38 = preterunicode(58)

const NCKEY_F39 = preterunicode(59)

const NCKEY_F40 = preterunicode(60)

const NCKEY_F41 = preterunicode(61)

const NCKEY_F42 = preterunicode(62)

const NCKEY_F43 = preterunicode(63)

const NCKEY_F44 = preterunicode(64)

const NCKEY_F45 = preterunicode(65)

const NCKEY_F46 = preterunicode(66)

const NCKEY_F47 = preterunicode(67)

const NCKEY_F48 = preterunicode(68)

const NCKEY_F49 = preterunicode(69)

const NCKEY_F50 = preterunicode(70)

const NCKEY_F51 = preterunicode(71)

const NCKEY_F52 = preterunicode(72)

const NCKEY_F53 = preterunicode(73)

const NCKEY_F54 = preterunicode(74)

const NCKEY_F55 = preterunicode(75)

const NCKEY_F56 = preterunicode(76)

const NCKEY_F57 = preterunicode(77)

const NCKEY_F58 = preterunicode(78)

const NCKEY_F59 = preterunicode(79)

const NCKEY_F60 = preterunicode(80)

const NCKEY_ENTER = preterunicode(121)

const NCKEY_CLS = preterunicode(122)

const NCKEY_DLEFT = preterunicode(123)

const NCKEY_DRIGHT = preterunicode(124)

const NCKEY_ULEFT = preterunicode(125)

const NCKEY_URIGHT = preterunicode(126)

const NCKEY_CENTER = preterunicode(127)

const NCKEY_BEGIN = preterunicode(128)

const NCKEY_CANCEL = preterunicode(129)

const NCKEY_CLOSE = preterunicode(130)

const NCKEY_COMMAND = preterunicode(131)

const NCKEY_COPY = preterunicode(132)

const NCKEY_EXIT = preterunicode(133)

const NCKEY_PRINT = preterunicode(134)

const NCKEY_REFRESH = preterunicode(135)

const NCKEY_SEPARATOR = preterunicode(136)

const NCKEY_CAPS_LOCK = preterunicode(150)

const NCKEY_SCROLL_LOCK = preterunicode(151)

const NCKEY_NUM_LOCK = preterunicode(152)

const NCKEY_PRINT_SCREEN = preterunicode(153)

const NCKEY_PAUSE = preterunicode(154)

const NCKEY_MENU = preterunicode(155)

const NCKEY_MEDIA_PLAY = preterunicode(158)

const NCKEY_MEDIA_PAUSE = preterunicode(159)

const NCKEY_MEDIA_PPAUSE = preterunicode(160)

const NCKEY_MEDIA_REV = preterunicode(161)

const NCKEY_MEDIA_STOP = preterunicode(162)

const NCKEY_MEDIA_FF = preterunicode(163)

const NCKEY_MEDIA_REWIND = preterunicode(164)

const NCKEY_MEDIA_NEXT = preterunicode(165)

const NCKEY_MEDIA_PREV = preterunicode(166)

const NCKEY_MEDIA_RECORD = preterunicode(167)

const NCKEY_MEDIA_LVOL = preterunicode(168)

const NCKEY_MEDIA_RVOL = preterunicode(169)

const NCKEY_MEDIA_MUTE = preterunicode(170)

const NCKEY_LSHIFT = preterunicode(171)

const NCKEY_LCTRL = preterunicode(172)

const NCKEY_LALT = preterunicode(173)

const NCKEY_LSUPER = preterunicode(174)

const NCKEY_LHYPER = preterunicode(175)

const NCKEY_LMETA = preterunicode(176)

const NCKEY_RSHIFT = preterunicode(177)

const NCKEY_RCTRL = preterunicode(178)

const NCKEY_RALT = preterunicode(179)

const NCKEY_RSUPER = preterunicode(180)

const NCKEY_RHYPER = preterunicode(181)

const NCKEY_RMETA = preterunicode(182)

const NCKEY_L3SHIFT = preterunicode(183)

const NCKEY_L5SHIFT = preterunicode(184)

const NCKEY_MOTION = preterunicode(200)

const NCKEY_BUTTON1 = preterunicode(201)

const NCKEY_BUTTON2 = preterunicode(202)

const NCKEY_BUTTON3 = preterunicode(203)

const NCKEY_BUTTON4 = preterunicode(204)

const NCKEY_BUTTON5 = preterunicode(205)

const NCKEY_BUTTON6 = preterunicode(206)

const NCKEY_BUTTON7 = preterunicode(207)

const NCKEY_BUTTON8 = preterunicode(208)

const NCKEY_BUTTON9 = preterunicode(209)

const NCKEY_BUTTON10 = preterunicode(210)

const NCKEY_BUTTON11 = preterunicode(211)

const NCKEY_SIGNAL = preterunicode(400)

const NCKEY_EOF = preterunicode(500)

const NCKEY_SCROLL_UP = NCKEY_BUTTON4

const NCKEY_SCROLL_DOWN = NCKEY_BUTTON5

const NCKEY_RETURN = NCKEY_ENTER

const NCKEY_TAB = 0x09

const NCKEY_ESC = 0x1b

const NCKEY_SPACE = 0x20

const NCKEY_MOD_SHIFT = 1

const NCKEY_MOD_ALT = 2

const NCKEY_MOD_CTRL = 4

const NCKEY_MOD_SUPER = 8

const NCKEY_MOD_HYPER = 16

const NCKEY_MOD_META = 32

const NCKEY_MOD_CAPSLOCK = 64

const NCKEY_MOD_NUMLOCK = 128

const NCBOXLIGHTW = "┌┐└┘─│"

const NCBOXHEAVYW = "┏┓┗┛━┃"

const NCBOXROUNDW = "╭╮╰╯─│"

const NCBOXDOUBLEW = "╔╗╚╝═║"

const NCBOXASCIIW = "/\\\\/-|"

const NCBOXOUTERW = "🭽🭾🭼🭿▁🭵🭶🭰"

const NCWHITESQUARESW = "◲◱◳◰"

const NCWHITECIRCLESW = "◶◵◷◴"

const NCCIRCULARARCSW = "◜◝◟◞"

const NCWHITETRIANGLESW = "◿◺◹◸"

const NCBLACKTRIANGLESW = "◢◣◥◤"

const NCSHADETRIANGLESW = "🮞🮟🮝🮜"

const NCBLACKARROWHEADSW = "⮝⮟⮜⮞"

const NCLIGHTARROWHEADSW = "⮙⮛⮘⮚"

const NCARROWDOUBLEW = "⮅⮇⮄⮆"

const NCARROWDASHEDW = "⭫⭭⭪⭬"

const NCARROWCIRCLEDW = "⮉⮋⮈⮊"

const NCARROWANTICLOCKW = "⮏⮍⮎⮌"

const NCBOXDRAWW = "╵╷╴╶"

const NCBOXDRAWHEAVYW = "╹╻╸╺"

const NCARROWW = "⭡⭣⭠⭢⭧⭩⭦⭨"

const NCDIAGONALSW = "🮣🮠🮡🮢🮤🮥🮦🮧"

const NCDIGITSSUPERW = "⁰¹²³⁴⁵⁶⁷⁸⁹"

const NCDIGITSSUBW = "₀₁₂₃₄₅₆₇₈₉"

const NCASTERISKS5 = "🞯🞰🞱🞲🞳🞴"

const NCASTERISKS6 = "🞵🞶🞷🞸🞹🞺"

const NCASTERISKS8 = "🞻🞼✳🞽🞾🞿"

const NCANGLESBR = "🭁🭂🭃🭄🭅🭆🭇🭈🭉🭊🭋"

const NCANGLESTR = "🭒🭓🭔🭕🭖🭧🭢🭣🭤🭥🭦"

const NCANGLESBL = "🭌🭍🭎🭏🭐🭑🬼🬽🬾🬿🭀"

const NCANGLESTL = "🭝🭞🭟🭠🭡🭜🭗🭘🭙🭚🭛"

const NCEIGHTHSB = " ▁▂▃▄▅▆▇█"

const NCEIGHTHST = " ▔🮂🮃▀🮄🮅🮆█"

const NCEIGHTHSL = "▏▎▍▌▋▊▉█"

const NCEIGHTHSR = "▕🮇🮈▐🮉🮊🮋█"

const NCHALFBLOCKS = " ▀▄█"

const NCQUADBLOCKS = " ▘▝▀▖▌▞▛▗▚▐▜▄▙▟█"

const NCSEXBLOCKS = " 🬀🬁🬂🬃🬄🬅🬆🬇🬈🬊🬋🬌🬍🬎🬏🬐🬑🬒🬓▌🬔🬕🬖🬗🬘🬙🬚🬛🬜🬝🬞🬟🬠🬡🬢🬣🬤🬥🬦🬧▐🬨🬩🬪🬫🬬🬭🬮🬯🬰🬱🬲🬳🬴🬵🬶🬷🬸🬹🬺🬻█"

const NCBRAILLEEGCS = "⠀⠁⠈⠉⠂⠃⠊⠋⠐⠑⠘⠙⠒⠓⠚⠛⠄⠅⠌⠍⠆⠇⠎⠏⠔⠕⠜⠝⠖⠗⠞⠟⠠⠡⠨⠩⠢⠣⠪⠫⠰⠱⠸⠹⠲⠳⠺⠻⠤⠥⠬⠭⠦⠧⠮⠯⠴⠵⠼⠽⠶⠷⠾⠿⡀⡁⡈⡉⡂⡃⡊⡋⡐⡑⡘⡙⡒⡓⡚⡛⡄⡅⡌⡍⡆⡇⡎⡏⡔⡕⡜⡝⡖⡗⡞⡟⡠⡡⡨⡩⡢⡣⡪⡫⡰⡱⡸⡹⡲⡳⡺⡻⡤⡥⡬⡭⡦⡧⡮⡯⡴⡵⡼⡽⡶⡷⡾⡿⢀⢁⢈⢉⢂⢃⢊⢋⢐⢑⢘⢙⢒⢓⢚⢛⢄⢅⢌⢍⢆⢇⢎⢏⢔⢕⢜⢝⢖⢗⢞⢟⢠⢡⢨⢩⢢⢣⢪⢫⢰⢱⢸⢹⢲⢳⢺⢻⢤⢥⢬⢭⢦⢧⢮⢯⢴⢵⢼⢽⢶⢷⢾⢿⣀⣁⣈⣉⣂⣃⣊⣋⣐⣑⣘⣙⣒⣓⣚⣛⣄⣅⣌⣍⣆⣇⣎⣏⣔⣕⣜⣝⣖⣗⣞⣟⣠⣡⣨⣩⣢⣣⣪⣫⣰⣱⣸⣹⣲⣳⣺⣻⣤⣥⣬⣭⣦⣧⣮⣯⣴⣵⣼⣽⣶⣷⣾⣿"

const NCSEGDIGITS = "🯰🯱🯲🯳🯴🯵🯶🯷🯸🯹"

const NCSUITSBLACK = "♠♣♥♦"

const NCSUITSWHITE = "♡♢♤♧"

const NCCHESSBLACK = "♟♜♞♝♛♚"

const NCCHESSWHITE = "♟♜♞♝♛♚"

const NCDICE = "⚀⚁⚂⚃⚄⚅"

const NCMUSICSYM = "♩♪♫♬♭♮♯"

const NCBOXLIGHT = "┌┐└┘─│"

const NCBOXHEAVY = "┏┓┗┛━┃"

const NCBOXROUND = "╭╮╰╯─│"

const NCBOXDOUBLE = "╔╗╚╝═║"

const NCBOXASCII = "/\\\\/-|"

const NCBOXOUTER = "🭽🭾🭼🭿▁🭵🭶🭰"

const NCALIGN_TOP = NCALIGN_LEFT

const NCALIGN_BOTTOM = NCALIGN_RIGHT

const NCALPHA_HIGHCONTRAST = Culonglong(0x30000000)

const NCALPHA_TRANSPARENT = Culonglong(0x20000000)

const NCALPHA_BLEND = Culonglong(0x10000000)

const NCALPHA_OPAQUE = Culonglong(0x00000000)

const NCPALETTESIZE = 256

const NC_NOBACKGROUND_MASK = Culonglong(0x8700000000000000)

const NC_BGDEFAULT_MASK = Culonglong(0x0000000040000000)

const NC_BG_RGB_MASK = Culonglong(0x0000000000ffffff)

const NC_BG_PALETTE = Culonglong(0x0000000008000000)

const NC_BG_ALPHA_MASK = Culonglong(0x30000000)

const WCHAR_MAX_UTF8BYTES = 4

# Skipping MacroDefinition: NCCELL_TRIVIAL_INITIALIZER { . gcluster = 0 , . gcluster_backstop = 0 , . width = 1 , . stylemask = 0 , . channels = 0 , }

const NCSTYLE_MASK = Cuint(0xffff)

const NCSTYLE_ITALIC = Cuint(0x0010)

const NCSTYLE_UNDERLINE = Cuint(0x0008)

const NCSTYLE_UNDERCURL = Cuint(0x0004)

const NCSTYLE_BOLD = Cuint(0x0002)

const NCSTYLE_STRUCK = Cuint(0x0001)

const NCSTYLE_NONE = 0

const NCOPTION_INHIBIT_SETLOCALE = Culonglong(0x0001)

const NCOPTION_NO_CLEAR_BITMAPS = Culonglong(0x0002)

const NCOPTION_NO_WINCH_SIGHANDLER = Culonglong(0x0004)

const NCOPTION_NO_QUIT_SIGHANDLERS = Culonglong(0x0008)

const NCOPTION_PRESERVE_CURSOR = Culonglong(0x0010)

const NCOPTION_SUPPRESS_BANNERS = Culonglong(0x0020)

const NCOPTION_NO_ALTERNATE_SCREEN = Culonglong(0x0040)

const NCOPTION_NO_FONT_CHANGES = Culonglong(0x0080)

const NCOPTION_DRAIN_INPUT = Culonglong(0x0100)

const NCOPTION_SCROLLING = Culonglong(0x0200)

const NCOPTION_CLI_MODE = ((NCOPTION_NO_ALTERNATE_SCREEN | NCOPTION_NO_CLEAR_BITMAPS) | NCOPTION_PRESERVE_CURSOR) | NCOPTION_SCROLLING

const NCMICE_NO_EVENTS = 0

const NCMICE_MOVE_EVENT = 0x01

const NCMICE_BUTTON_EVENT = 0x02

const NCMICE_DRAG_EVENT = 0x04

const NCMICE_ALL_EVENTS = 0x07

const NCPLANE_OPTION_HORALIGNED = Culonglong(0x0001)

const NCPLANE_OPTION_VERALIGNED = Culonglong(0x0002)

const NCPLANE_OPTION_MARGINALIZED = Culonglong(0x0004)

const NCPLANE_OPTION_FIXED = Culonglong(0x0008)

const NCPLANE_OPTION_AUTOGROW = Culonglong(0x0010)

const NCPLANE_OPTION_VSCROLL = Culonglong(0x0020)

const NCBOXMASK_TOP = 0x0001

const NCBOXMASK_RIGHT = 0x0002

const NCBOXMASK_BOTTOM = 0x0004

const NCBOXMASK_LEFT = 0x0008

const NCBOXGRAD_TOP = 0x0010

const NCBOXGRAD_RIGHT = 0x0020

const NCBOXGRAD_BOTTOM = 0x0040

const NCBOXGRAD_LEFT = 0x0080

const NCBOXCORNER_MASK = 0x0300

const NCBOXCORNER_SHIFT = Cuint(8)

const NCVISUAL_OPTION_NODEGRADE = Culonglong(0x0001)

const NCVISUAL_OPTION_BLEND = Culonglong(0x0002)

const NCVISUAL_OPTION_HORALIGNED = Culonglong(0x0004)

const NCVISUAL_OPTION_VERALIGNED = Culonglong(0x0008)

const NCVISUAL_OPTION_ADDALPHA = Culonglong(0x0010)

const NCVISUAL_OPTION_CHILDPLANE = Culonglong(0x0020)

const NCVISUAL_OPTION_NOINTERPOLATE = Culonglong(0x0040)

const NCREEL_OPTION_INFINITESCROLL = Culonglong(0x0001)

const NCREEL_OPTION_CIRCULAR = Culonglong(0x0002)

const NCPREFIXCOLUMNS = 7

const NCIPREFIXCOLUMNS = 8

const NCBPREFIXCOLUMNS = 9

const NCPREFIXSTRLEN = NCPREFIXCOLUMNS + 1

const NCIPREFIXSTRLEN = NCIPREFIXCOLUMNS + 1

const NCBPREFIXSTRLEN = NCBPREFIXCOLUMNS + 1

const NCMENU_OPTION_BOTTOM = Culonglong(0x0001)

const NCMENU_OPTION_HIDING = Culonglong(0x0002)

const NCPROGBAR_OPTION_RETROGRADE = Cuint(0x0001)

const NCTABBED_OPTION_BOTTOM = Culonglong(0x0001)

const NCPLOT_OPTION_LABELTICKSD = Cuint(0x0001)

const NCPLOT_OPTION_EXPONENTIALD = Cuint(0x0002)

const NCPLOT_OPTION_VERTICALI = Cuint(0x0004)

const NCPLOT_OPTION_NODEGRADE = Cuint(0x0008)

const NCPLOT_OPTION_DETECTMAXONLY = Cuint(0x0010)

const NCPLOT_OPTION_PRINTSAMPLE = Cuint(0x0020)

const NCREADER_OPTION_HORSCROLL = Culonglong(0x0001)

const NCREADER_OPTION_VERSCROLL = Culonglong(0x0002)

const NCREADER_OPTION_NOCMDKEYS = Culonglong(0x0004)

const NCREADER_OPTION_CURSOR = Culonglong(0x0008)

# exports
const PREFIXES = ["nc"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
