"""
These log levels consciously map cleanly to those of libav; Notcurses itself
does not use this full granularity. The log level does not affect the opening
and closing banners, which can be disabled via the notcurses_option struct's
'suppress_banner'. Note that if stderr is connected to the same terminal on
which we're rendering, any kind of logging will disrupt the output (which is
undesirable). The "default" zero value is NCLOGLEVEL_PANIC.
"""
@enumx LogLevel begin
  """
  default. print nothing once fullscreen service begins
  """
  SILENT = Int(L.NCLOGLEVEL_SILENT)
  """
  print diagnostics related to catastrophic failure
  """
  PANIC = Int(L.NCLOGLEVEL_PANIC)
  """
  we're hanging around, but we've had a horrible fault
  """
  FATAL = Int(L.NCLOGLEVEL_FATAL)
  """
  we can't keep doing this, but we can do other things
  """
  ERROR = Int(L.NCLOGLEVEL_ERROR)
  """
  you probably don't want what's happening to happen
  """
  WARNING = Int(L.NCLOGLEVEL_WARNING)
  """
  "standard information"
  """
  INFO = Int(L.NCLOGLEVEL_INFO)
  """
  "detailed information"
  """
  VERBOSE = Int(L.NCLOGLEVEL_VERBOSE)
  """
  this is honestly a bit much
  """
  DEBUG = Int(L.NCLOGLEVEL_DEBUG)
  """
  there's probably a better way to do what you want
  """
  TRACE = Int(L.NCLOGLEVEL_TRACE)
end
Base.cconvert(::Type{L.ncloglevel_e}, v::LogLevel.T) = L.ncloglevel_e(Int(v))

"""
Bits for notcurses_options->flags.
"""
@enumx OptionsFlags::UInt64 begin
  """
  Do not call setlocale().

  notcurses_init() will call setlocale() to inspect the current locale. If
  that locale is "C" or "POSIX", it will call setlocale(LC_ALL, "") to set
  the locale according to the LANG environment variable. Ideally, this will
  result in UTF8 being enabled, even if the client app didn't call
  setlocale() itself. Unless you're certain that you're invoking setlocale()
  prior to notcurses_init(), you should not set this bit. Even if you are
  invoking setlocale(), this behavior shouldn't be an issue unless you're
  doing something weird (setting a locale not based on LANG).
  """
  INHIBIT_SETLOCALE = L.NCOPTION_INHIBIT_SETLOCALE

  """
  Do not try to clear any preexisting bitmaps.

  Note that they might still get cleared even if this is set, and they might
  not get cleared even if this is not set.
  """
  NO_CLEAR_BITMAPS = L.NCOPTION_NO_CLEAR_BITMAPS

  """
  Do not handle `SIGWINCH`.

  A signal handler will usually be installed for `SIGWINCH`, resulting in
  `resize` events being generated on input. With this flag,
  the handler will not be installed.
  """
  NO_WINCH_SIGHANDLER = L.NCOPTION_NO_WINCH_SIGHANDLER

  """
  Do not handle `SIGINT`, `SIGSEGV`, `SIGABRT`, `SIGQUIT`.

  A signal handler will usually be installed for `SIGABRT`, `SIGBUS`,
  `SIGFPE`, `SIGILL`, `SIGINT`, `SIGQUIT`, `SIGSEGV` and `SIGTERM`,
  cleaning up the terminal on such exceptions.

  With this flag, the handler will not be installed.
  """
  NO_QUIT_SIGHANDLERS = L.NCOPTION_NO_QUIT_SIGHANDLERS

  """
  Initializes the standard plane's virtual cursor to match the physical
  cursor at context creation time.

  Together with `NO_ALTERNATE_SCREEN` and a scrolling standard plane,
  this facilitates easy scrolling-style programs in rendered mode.
  """
  PRESERVE_CURSOR = L.NCOPTION_PRESERVE_CURSOR
  """
  Do not print banners.

  Notcurses typically prints version info in `notcurses_init` and
  performance info in `notcurses_stop`. This inhibits that output.
  """
  SUPPRESS_BANNERS = L.NCOPTION_SUPPRESS_BANNERS
  """
  Do not enter alternate mode.

  If smcup/rmcup capabilities are indicated, notcurses defaults to making use
  of the "alternate screen". This flag inhibits use of smcup/rmcup.
  """
  NO_ALTERNATE_SCREEN = L.NCOPTION_NO_ALTERNATE_SCREEN

  """
  Do not modify the font.

  Notcurses might attempt to change the font slightly, to support certain
  glyphs (especially on the Linux console). If this is set, no such
  modifications will be made. Note that font changes will not affect anything
  but the virtual console/terminal in which notcurses is running.
  """
  NO_FONT_CHANGES = L.NCOPTION_NO_FONT_CHANGES
  """
  Input may be freely dropped.

  This ought be provided when the program does not intend to handle input.
  Otherwise, input can accumulate in internal buffers, eventually preventing
  Notcurses from processing terminal messages.
  """
  DRAIN_INPUT = L.NCOPTION_DRAIN_INPUT
  """
  Prepare the standard plane in scrolling mode, useful for CLIs. This is
  equivalent to calling ncplane_set_scrolling(notcurses_stdplane(nc), true).
  """
  SCROLLING = L.NCOPTION_SCROLLING
  """
  "CLI mode" is just setting these four options.

  `NO_ALTERNATE_SCREEN | NCOPTION_NO_CLEAR_BITMAPS | NCOPTION_PRESERVE_CURSOR | NCOPTION_SCROLLING`
  """
  CLI_MODE = L.NCOPTION_CLI_MODE
end
Base.:|(opt1::OptionsFlags.T, opt2::OptionsFlags.T) = (UInt64(opt1) | UInt64(opt2))
Base.:&(opt1::OptionsFlags.T, opt2::OptionsFlags.T) = (UInt64(opt1) & UInt64(opt2))
Base.:⊻(opt1::OptionsFlags.T, opt2::OptionsFlags.T) = (UInt64(opt1) ⊻ UInt64(opt2))
Base.:⊼(opt1::OptionsFlags.T, opt2::OptionsFlags.T) = (UInt64(opt1) ⊼ UInt64(opt2))
Base.:⊽(opt1::OptionsFlags.T, opt2::OptionsFlags.T) = (UInt64(opt1) ⊽ UInt64(opt2))

@enumx PixelImpl begin
  NONE = Int(L.NCPIXEL_NONE)
  SIXEL = Int(L.NCPIXEL_SIXEL)
  LINUXFB = Int(L.NCPIXEL_LINUXFB)
  ITERM2 = Int(L.NCPIXEL_ITERM2)
  KITTY_STATIC = Int(L.NCPIXEL_KITTY_STATIC)
  KITTY_ANIMATED = Int(L.NCPIXEL_KITTY_ANIMATED)
  KITTY_SELFREF = Int(L.NCPIXEL_KITTY_SELFREF)
end

"""
Alignment within a plane or terminal. Left/right-justified, or centered.
"""
@enumx Align::UInt32 begin
  UNALIGNED = Int(L.NCALIGN_UNALIGNED)
  LEFT = Int(L.NCALIGN_LEFT)
  CENTER = Int(L.NCALIGN_CENTER)
  RIGHT = Int(L.NCALIGN_RIGHT)
  TOP = Int(L.NCALIGN_LEFT)
  BOTTOM = Int(L.NCALIGN_RIGHT)
end
Base.cconvert(::Type{L.ncalign_e}, v::Align.T) = L.ncalign_e(Int(v))
Base.convert(::Type{L.ncalign_e}, v::Align.T) = L.ncalign_e(Int(v))

"""
How to scale an ncvisual during rendering. NCSCALE_NONE will apply no
scaling. NCSCALE_SCALE scales a visual to the plane's size, maintaining
aspect ratio. NCSCALE_STRETCH stretches and scales the image in an attempt
to fill the entirety of the plane. NCSCALE_NONE_HIRES and
NCSCALE_SCALE_HIRES behave like their counterparts, but admit blitters
which don't preserve aspect ratio.
"""
@enumx Scale::UInt32 begin
  NONE = Int(L.NCSCALE_NONE)
  SCALE = Int(L.NCSCALE_SCALE)
  STRETCH = Int(L.NCSCALE_STRETCH)
  NONE_HIRES = Int(L.NCSCALE_NONE_HIRES)
  SCALE_HIRES = Int(L.NCSCALE_SCALE_HIRES)
end
Base.cconvert(::Type{L.ncscale_e}, v::Scale.T) = L.ncscale_e(UInt32(v))
Base.convert(::Type{L.ncscale_e}, v::Scale.T) = L.ncscale_e(UInt32(v))

"""
we never blit full blocks, but instead spaces (more efficient) with the
background set to the desired foreground. these need be kept in the same
order as the blitters[] definition in lib/blit.c.
"""
@enumx Blit::UInt32 begin
  """
  let the ncvisual pick
  """
  DEFAULT = Int(L.NCBLIT_DEFAULT)
  """
  space, compatible with ASCII
  """
  ONE_BY_ONE = Int(L.NCBLIT_1x1)
  """
  halves + 1x1 (space)     ▄▀
  """
  TWO_BY_ONE = Int(L.NCBLIT_2x1)
  """
  quadrants + 2x1          ▗▐ ▖▀▟▌▙
  """
  TWO_BY_TWO = Int(L.NCBLIT_2x2)
  """
  sextants (*NOT* 2x2)     🬀🬁🬂🬃🬄🬅🬆🬇🬈🬉🬊🬋🬌🬍🬎🬏🬐🬑🬒🬓🬔🬕🬖🬗🬘🬙🬚🬛🬜🬝🬞
  """
  THREE_BY_TWO = Int(L.NCBLIT_3x2)
  """
  4 rows 2 cols (braille) ⡀⡄⡆⡇⢀⣀⣄⣆⣇⢠⣠⣤⣦⣧⢰⣰⣴⣶⣷⢸⣸⣼⣾⣿
  """
  BRAILLE = Int(L.NCBLIT_BRAILLE)
  """
  pixel graphics
  """
  PIXEL = Int(L.NCBLIT_PIXEL)

  # these blitters are suitable only for plots, not general media
  """
  four vertical levels     █▆▄▂
  """
  FOUR_BY_ONE = Int(L.NCBLIT_4x1)
  """
  eight vertical levels    █▇▆▅▄▃▂▁
  """
  EIGHT_BY_ONE = Int(L.NCBLIT_8x1)
end
Base.cconvert(::Type{L.ncblitter_e}, v::Blit.T) = L.ncblitter_e(UInt32(v))
Base.convert(::Type{L.ncblitter_e}, v::Blit.T) = L.ncblitter_e(UInt32(v))

"""background cannot be highcontrast, only foreground"""
@enumx Alpha begin
  HIGHCONTRAST = Int(L.NCALPHA_HIGHCONTRAST)
  TRANSPARENT = Int(L.NCALPHA_TRANSPARENT)
  BLEND = Int(L.NCALPHA_BLEND)
  OPAQUE = Int(L.NCALPHA_OPAQUE)
end


@enumx InputType::UInt32 begin
  UNKNOWN = Int(L.NCTYPE_UNKNOWN)
  PRESS = Int(L.NCTYPE_PRESS)
  REPEAT = Int(L.NCTYPE_REPEAT)
  RELEASE = Int(L.NCTYPE_RELEASE)
end

@enumx Style::Cuint begin
MASK = L.NCSTYLE_MASK
ITALIC = L.NCSTYLE_ITALIC
UNDERLINE = L.NCSTYLE_UNDERLINE
UNDERCURL = L.NCSTYLE_UNDERCURL
BOLD = L.NCSTYLE_BOLD
STRUCK = L.NCSTYLE_STRUCK
NONE = L.NCSTYLE_NONE
end

@enumx Key::UInt begin
  INVALID = L.NCKEY_INVALID
  RESIZE = L.NCKEY_RESIZE     # we received SIGWINCH
  UP = L.NCKEY_UP
  RIGHT = L.NCKEY_RIGHT
  DOWN = L.NCKEY_DOWN
  LEFT = L.NCKEY_LEFT
  INS = L.NCKEY_INS
  DEL = L.NCKEY_DEL
  BACKSPACE = L.NCKEY_BACKSPACE  # backspace (sometimes)
  PGDOWN = L.NCKEY_PGDOWN
  PGUP = L.NCKEY_PGUP
  HOME = L.NCKEY_HOME
  END = L.NCKEY_END
  F00 = L.NCKEY_F00
  F01 = L.NCKEY_F01
  F02 = L.NCKEY_F02
  F03 = L.NCKEY_F03
  F04 = L.NCKEY_F04
  F05 = L.NCKEY_F05
  F06 = L.NCKEY_F06
  F07 = L.NCKEY_F07
  F08 = L.NCKEY_F08
  F09 = L.NCKEY_F09
  F10 = L.NCKEY_F10
  F11 = L.NCKEY_F11
  F12 = L.NCKEY_F12
  F13 = L.NCKEY_F13
  F14 = L.NCKEY_F14
  F15 = L.NCKEY_F15
  F16 = L.NCKEY_F16
  F17 = L.NCKEY_F17
  F18 = L.NCKEY_F18
  F19 = L.NCKEY_F19
  F20 = L.NCKEY_F20
  F21 = L.NCKEY_F21
  F22 = L.NCKEY_F22
  F23 = L.NCKEY_F23
  F24 = L.NCKEY_F24
  F25 = L.NCKEY_F25
  F26 = L.NCKEY_F26
  F27 = L.NCKEY_F27
  F28 = L.NCKEY_F28
  F29 = L.NCKEY_F29
  F30 = L.NCKEY_F30
  F31 = L.NCKEY_F31
  F32 = L.NCKEY_F32
  F33 = L.NCKEY_F33
  F34 = L.NCKEY_F34
  F35 = L.NCKEY_F35
  F36 = L.NCKEY_F36
  F37 = L.NCKEY_F37
  F38 = L.NCKEY_F38
  F39 = L.NCKEY_F39
  F40 = L.NCKEY_F40
  F41 = L.NCKEY_F41
  F42 = L.NCKEY_F42
  F43 = L.NCKEY_F43
  F44 = L.NCKEY_F44
  F45 = L.NCKEY_F45
  F46 = L.NCKEY_F46
  F47 = L.NCKEY_F47
  F48 = L.NCKEY_F48
  F49 = L.NCKEY_F49
  F50 = L.NCKEY_F50
  F51 = L.NCKEY_F51
  F52 = L.NCKEY_F52
  F53 = L.NCKEY_F53
  F54 = L.NCKEY_F54
  F55 = L.NCKEY_F55
  F56 = L.NCKEY_F56
  F57 = L.NCKEY_F57
  F58 = L.NCKEY_F58
  F59 = L.NCKEY_F59
  F60 = L.NCKEY_F60
  # ... leave room for up to 100 function keys, egads
  ENTER = L.NCKEY_ENTER
  CLS = L.NCKEY_CLS        # "clear-screen or erase"
  DLEFT = L.NCKEY_DLEFT      # down + left on keypad
  DRIGHT = L.NCKEY_DRIGHT
  ULEFT = L.NCKEY_ULEFT      # up + left on keypad
  URIGHT = L.NCKEY_URIGHT
  CENTER = L.NCKEY_CENTER     # the most truly neutral of keypresses
  BEGIN = L.NCKEY_BEGIN
  CANCEL = L.NCKEY_CANCEL
  CLOSE = L.NCKEY_CLOSE
  COMMAND = L.NCKEY_COMMAND
  COPY = L.NCKEY_COPY
  EXIT = L.NCKEY_EXIT
  PRINT = L.NCKEY_PRINT
  REFRESH = L.NCKEY_REFRESH
  SEPARATOR = L.NCKEY_SEPARATOR
  #            = L.NCKEY_# these keys aren't generally available outside of the kitty protocol
  CAPS_LOCK = L.NCKEY_CAPS_LOCK
  SCROLL_LOCK = L.NCKEY_SCROLL_LOCK
  NUM_LOCK = L.NCKEY_NUM_LOCK
  PRINT_SCREEN = L.NCKEY_PRINT_SCREEN
  PAUSE = L.NCKEY_PAUSE
  MENU = L.NCKEY_MENU
  #            = L.NCKEY_# media keys, similarly only available through kitty's protocol
  MEDIA_PLAY = L.NCKEY_MEDIA_PLAY
  MEDIA_PAUSE = L.NCKEY_MEDIA_PAUSE
  MEDIA_PPAUSE = L.NCKEY_MEDIA_PPAUSE
  MEDIA_REV = L.NCKEY_MEDIA_REV
  MEDIA_STOP = L.NCKEY_MEDIA_STOP
  MEDIA_FF = L.NCKEY_MEDIA_FF
  MEDIA_REWIND = L.NCKEY_MEDIA_REWIND
  MEDIA_NEXT = L.NCKEY_MEDIA_NEXT
  MEDIA_PREV = L.NCKEY_MEDIA_PREV
  MEDIA_RECORD = L.NCKEY_MEDIA_RECORD
  MEDIA_LVOL = L.NCKEY_MEDIA_LVOL
  MEDIA_RVOL = L.NCKEY_MEDIA_RVOL
  MEDIA_MUTE = L.NCKEY_MEDIA_MUTE
  # modifiers when pressed by themselves. this ordering comes from the Kitty
  # keyboard protocol, and mustn't be changed without updating handlers.
  LSHIFT = L.NCKEY_LSHIFT
  LCTRL = L.NCKEY_LCTRL
  LALT = L.NCKEY_LALT
  LSUPER = L.NCKEY_LSUPER
  LHYPER = L.NCKEY_LHYPER
  LMETA = L.NCKEY_LMETA
  RSHIFT = L.NCKEY_RSHIFT
  RCTRL = L.NCKEY_RCTRL
  RALT = L.NCKEY_RALT
  RSUPER = L.NCKEY_RSUPER
  RHYPER = L.NCKEY_RHYPER
  RMETA = L.NCKEY_RMETA
  L3SHIFT = L.NCKEY_L3SHIFT
  L5SHIFT = L.NCKEY_L5SHIFT
  # mouse events. We encode which button was pressed into the char32_t,
  # but position information is embedded in the larger ncinput event.
  MOTION = L.NCKEY_MOTION     # no buttons pressed
  BUTTON1 = L.NCKEY_BUTTON1
  BUTTON2 = L.NCKEY_BUTTON2
  BUTTON3 = L.NCKEY_BUTTON3
  BUTTON4 = L.NCKEY_BUTTON4    # scrollwheel up
  BUTTON5 = L.NCKEY_BUTTON5    # scrollwheel down
  BUTTON6 = L.NCKEY_BUTTON6
  BUTTON7 = L.NCKEY_BUTTON7
  BUTTON8 = L.NCKEY_BUTTON8
  BUTTON9 = L.NCKEY_BUTTON9
  BUTTON10 = L.NCKEY_BUTTON10
  BUTTON11 = L.NCKEY_BUTTON11

  # we received SIGCONT
  SIGNAL = L.NCKEY_SIGNAL

  EOF = L.NCKEY_EOF

  SCROLL_UP = L.NCKEY_BUTTON4
  SCROLL_DOWN = L.NCKEY_BUTTON5
  RETURN = L.NCKEY_ENTER

  # Just aliases, ma'am, from the 128 characters common to ASCII+UTF8
  TAB = 0x09
  ESC = 0x1b
  SPACE = 0x2
end
