generate:
  julia --project=scripts scripts/generator.jl
  julia -e 'using JuliaFormatter; format("./src/lib")'

test:
  julia --project test/runtests.jl
