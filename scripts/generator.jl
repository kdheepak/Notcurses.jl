using Clang.Generators
using Notcurses_jll  # replace this with your jll package

cd(@__DIR__)

include_dir = normpath(joinpath(@__DIR__, "include"))

options = load_options(joinpath(@__DIR__, "generator.toml"))

headers = [joinpath(include_dir, header) for header in readdir(include_dir) if endswith(header, ".h")]
# there is also an experimental `detect_headers` function for auto-detecting top-level headers in the directory
# headers = detect_headers(include_dir, args)

static_inlines = Vector{String}()
for header in headers
  lines = readlines(header)
  static_inline_lines = findall(x -> occursin("static inline", x), lines)
  vars = static_inline_lines .+ 1
  for v in lines[vars]
    m = match(r"(.*?)\(", v)
    push!(static_inlines, m[1])
  end
end

noncore = ["ncdirect_init", "notcurses_init"]

args = get_default_args()
push!(args, "-I$include_dir")
push!(args, "-fparse-all-comments")

orig_ignore = copy(options["general"]["output_ignorelist"])

# Core:
append!(options["general"]["output_ignorelist"], [static_inlines; noncore])
options["general"]["library_name"] = "libnotcurses_core"
options["general"]["output_file_path"] = joinpath(@__DIR__, "../src/lib/LibNotcurses_core.jl")
ctx = create_context(headers, args, options)
build!(ctx)
options["general"]["output_ignorelist"] = copy(orig_ignore)

# FFI
options["general"]["output_exclusivelist"] = static_inlines
options["general"]["library_name"] = "libnotcurses_ffi"
options["general"]["output_file_path"] = joinpath(@__DIR__, "../src/lib/LibNotcurses_ffi.jl")
ctx = create_context(headers, args, options)
build!(ctx)

# FFI
options["general"]["output_exclusivelist"] = noncore
options["general"]["library_name"] = "libnotcurses"
options["general"]["output_file_path"] = joinpath(@__DIR__, "../src/lib/LibNotcurses_init.jl")
ctx = create_context(headers, args, options)
build!(ctx)
