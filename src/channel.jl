"""
initialize a 32-bit channel pair with specified RGB
"""
channel_initializer(r::UInt32, g::UInt32, b::UInt32) = L.NCCHANNEL_INITIALIZER(r, g, b)
channels_initializer(fr::UInt32, fg::UInt32, fb::UInt32, br::UInt32, bg::UInt32, bb::UInt32) = L.NCCHANNEL_INITIALIZER(fr, fg, fb, br, bg, bb)

"""
Extract the 2-bit alpha component from a 32-bit channel. It is not
shifted down, and can be directly compared to NCALPHA_* values.
"""
alpha(channel::UInt32) = L.ncchannel_alpha(channel)

"""
Set the 2-bit alpha component of the 32-bit channel. Background channels
must not be set to NCALPHA_HIGHCONTRAST. It is an error if alpha contains
any bits other than NCALPHA_*.
"""
alpha(channel::UInt32, alpha::UInt32) = L.ncchannel_set_alpha(channel, alpha)

"""
Is this channel using the "default color" rather than RGB/palette-indexed?
"""
default_p(channel::UInt32) = L.ncchannel_default_p(channel)

"""
Mark the channel as using its default color. Alpha is set opaque.
"""
default(channel::UInt32) = L.ncchannel_set_default(channel)

"""
Extract the palette index from a channel. Only valid if
ncchannel_palindex_p() would return true for the channel.
"""
function palindex(channel)
  L.ncchannel_palindex(channel)
end

"""
Mark the channel as using the specified palette color. It is an error if
the index is greater than NCPALETTESIZE. Alpha is set opaque.
"""
function set_palindex(channel, idx)
  L.ncchannel_set_palindex(channel, idx)
end

"""
Is this channel using RGB color?
"""
function rgb_p(channel)
  L.ncchannel_rgb_p(channel)
end

"""
Extract the 8-bit red component from a 32-bit channel. Only valid if
ncchannel_rgb_p() would return true for the channel.
"""
function r(channel)
  L.ncchannel_r(channel)
end

"""
Extract the 8-bit green component from a 32-bit channel. Only valid if
ncchannel_rgb_p() would return true for the channel.
"""
function g(channel)
  L.ncchannel_g(channel)
end

"""
Extract the 8-bit blue component from a 32-bit channel. Only valid if
ncchannel_rgb_p() would return true for the channel.
"""
function b(channel)
  L.ncchannel_b(channel)
end

"""
Extract the 24-bit RGB value from a 32-bit channel.
Only valid if ncchannel_rgb_p() would return true for the channel.
"""
function rgb(channel)
  L.ncchannel_rgb(channel)
end

"""
Extract the three 8-bit R/G/B components from a 32-bit channel.
Only valid if ncchannel_rgb_p() would return true for the channel.
"""
function rgb8(channel)
  r, g, b = Ref{Cuint}(0), Ref{Cuint}(0), Ref{Cuint}(0)
  L.ncchannel_rgb8(channel, r, g, b)
  (; r=r[], g=g[], b=b[])
end

"""
Set the three 8-bit components of a 32-bit channel, and mark it as not using
the default color. Retain the other bits unchanged. Any value greater than
255 will result in a return of -1 and no change to the channel.
"""
function rgb8(channel, r, g, b)
  L.ncchannel_set_rgb8(channel, r, g, b)
end

"""
Same, but provide an assembled, packed 24 bits of rgb.
"""
function set(channel, rgb)
  L.ncchannel_set(channel, rgb)
end

"""
Set the three 8-bit components of a 32-bit channel, and mark it as not using
the default color. Retain the other bits unchanged. r, g, and b will be
clipped to the range [0..255].
"""
function rgb8_clipped(channel, r, g, b)
  L.ncchannel_set_rgb8_clipped(channel, r, g, b)
end

"""
Extract the background alpha and coloring bits from a 64-bit channel
pair as a single 32-bit value.
"""
function bchannel(channels)
  L.ncchannels_bchannel(channels)
end

"""
Extract the foreground alpha and coloring bits from a 64-bit channel
pair as a single 32-bit value.
"""
function fchannel(channels)
  L.ncchannels_fchannel(channels)
end

"""
Extract the background alpha and coloring bits from a 64-bit channel pair.
"""
function channels(channels)
  L.ncchannels_channels(channels)
end

""""""
function bg_rgb_p(channels)
  L.ncchannels_bg_rgb_p(channels)
end

""""""
function fg_rgb_p(channels)
  L.ncchannels_fg_rgb_p(channels)
end

"""
Set the background alpha and coloring bits of the 64-bit channel pair
from a single 32-bit value.
"""
function bchannel(channels, channel)
  L.ncchannels_set_bchannel(channels, channel)
end

"""
Set the foreground alpha and coloring bits of the 64-bit channel pair
from a single 32-bit value.
"""
function fchannel(channels, channel)
  L.ncchannels_set_fchannel(channels, channel)
end

"""
Set the alpha and coloring bits of a channel pair from another channel pair.
"""
function channels(dst, channels)
  L.ncchannels_set_channels(dst, channels)
end

"""
Extract 2 bits of background alpha from 'channels', shifted to LSBs.
"""
function bg_alpha(channels)
  L.ncchannels_bg_alpha(channels)
end

"""
Set the 2-bit alpha component of the background channel.
"""
function bg_alpha(channels, alpha)
  L.ncchannels_set_bg_alpha(channels, alpha)
end

"""
Extract 2 bits of foreground alpha from 'channels', shifted to LSBs.
"""
function fg_alpha(channels)
  L.ncchannels_fg_alpha(channels)
end

"""
Set the 2-bit alpha component of the foreground channel.
"""
function fg_alpha(channels, alpha)
  L.ncchannels_set_fg_alpha(channels, alpha)
end

"""
Returns the channels with the fore- and background's color information
swapped, but without touching housekeeping bits. Alpha is retained unless
it would lead to an illegal state: HIGHCONTRAST, TRANSPARENT, and BLEND
are taken to OPAQUE unless the new value is RGB.
"""
function reverse(channels)
  L.ncchannels_reverse(channels)
end

"""
Creates a new channel pair using 'fchan' as the foreground channel
and 'bchan' as the background channel.
"""
function combine(fchan, bchan)
  L.ncchannels_combine(fchan, bchan)
end

""""""
function fg_palindex(channels)
  L.ncchannels_fg_palindex(channels)
end

""""""
function bg_palindex(channels)
  L.ncchannels_bg_palindex(channels)
end

"""
Extract 24 bits of foreground RGB from 'channels', shifted to LSBs.
"""
function fg_rgb(channels)
  L.ncchannels_fg_rgb(channels)
end

"""
Extract 24 bits of background RGB from 'channels', shifted to LSBs.
"""
function bg_rgb(channels)
  L.ncchannels_bg_rgb(channels)
end

"""
Extract 24 bits of foreground RGB from 'channels', split into subchannels.
"""
function fg_rgb8(channels)
  r, g, b = Ref{Cuint}(0), Ref{Cuint}(0), Ref{Cuint}(0)
  L.ncchannels_fg_rgb8(channels, r, g, b)
  (; r=r[], g=g[], b=b[])
end

"""
Extract 24 bits of background RGB from 'channels', split into subchannels.
"""
function bg_rgb8(channels)
  r, g, b = Ref{Cuint}(0), Ref{Cuint}(0), Ref{Cuint}(0)
  L.ncchannels_bg_rgb8(channels, r::Ptr{Cuint}, g::Ptr{Cuint}, b::Ptr{Cuint})
  (; r=r[], g=g[], b=b[])
end

"""
Set the r, g, and b channels for the foreground component of this 64-bit
'channels' variable, and mark it as not using the default color.
"""
function fg_rgb8(channels, r, g, b)
  L.ncchannels_set_fg_rgb8(channels, r, g, b)
end

"""
Same, but clips to [0..255].
"""
function fg_rgb8_clipped(channels, r, g, b)
  L.ncchannels_set_fg_rgb8_clipped(channels, r::Cint, g::Cint, b::Cint)::Cvoid
end

""""""
function fg_palindex(channels, idx)
  L.ncchannels_set_fg_palindex(channels, idx)
end

"""
Same, but set an assembled 24 bit channel at once.
"""
function fg_rgb(channels, rgb)
  L.ncchannels_set_fg_rgb(channels, rgb)
end

"""
Set the r, g, and b channels for the background component of this 64-bit
'channels' variable, and mark it as not using the default color.
"""
function bg_rgb8(channels, r, g, b)
  L.ncchannels_set_bg_rgb8(channels, r, g, b)
end

"""
Same, but clips to [0..255].
"""
function bg_rgb8_clipped(channels, r, g, b)
  L.ncchannels_set_bg_rgb8_clipped(channels, r::Cint, g::Cint, b::Cint)::Cvoid
end

"""
Set the cell's background palette index, set the background palette index
bit, set it background-opaque, and clear the background default color bit.
"""
function bg_palindex(channels, idx)
  L.ncchannels_set_bg_palindex(channels, idx)
end

"""
Same, but set an assembled 24 bit channel at once.
"""
function bg_rgb(channels, rgb)
  L.ncchannels_set_bg_rgb(channels, rgb)
end

"""
Is the foreground using the "default foreground color"?
"""
function fg_default_p(channels)
  L.ncchannels_fg_default_p(channels)
end

"""
Is the foreground using indexed palette color?
"""
function fg_palindex_p(channels)
  L.ncchannels_fg_palindex_p(channels)
end

"""
Is the background using the "default background color"? The "default
background color" must generally be used to take advantage of
terminal-effected transparency.
"""
function bg_default_p(channels)
  L.ncchannels_bg_default_p(channels)
end

"""
Is the background using indexed palette color?
"""
function bg_palindex_p(channels)
  L.ncchannels_bg_palindex_p(channels)
end

"""
Mark the foreground channel as using its default color.
"""
function fg_default(channels)
  L.ncchannels_set_fg_default(channels)
end

"""
Mark the background channel as using its default color.
"""
function bg_default(channels)
  L.ncchannels_set_bg_default(channels)
end
