# Julia workshop

## Manuals and guides

* [Julia language](https://docs.julialang.org/en/v1/)
* [Unicode characters](https://docs.julialang.org/en/v1/manual/unicode-input/)
* [Julia-Matlab-Python cheatsheet](https://cheatsheets.quantecon.org)
* [Differences from other major languages](https://docs.julialang.org/en/v1/manual/noteworthy-differences/)
* [Book on numerical methods](https://tobydriscoll.net/fnc-julia)

## Packages

* [Package listings on Julia Hub](https://juliahub.com/ui/Packages)
* [IJulia](https://julialang.github.io/IJulia.jl/stable/)
* [Plots](http://docs.juliaplots.org/latest/)
* [DifferentialEquations](https://diffeq.sciml.ai/stable/)
* [NLsolve](https://github.com/JuliaNLSolvers/NLsolve.jl)
* [DataFrames](https://dataframes.juliadata.org/stable/)
* [Images](https://juliaimages.org/stable/)

Also see the Project.toml file in this repository.

## Community

* [Discourse](https://discourse.julialang.org/): Good mix of power users and n00bs
* [Zulip](https://julialang.zulipchat.com): Slack-like platform, mostly advanced users and developers
* [Forem](https://forem.julialang.org): Blog posts and demo codes, brand-new
* [Reddit](https://reddit.com/r/julia): Pretty quiet

## Installing Julia

Start by getting an [official download](https://julialang.org/downloads/) of the latest stable release. (Mac M1 users might want to choose 1.8.0-rc1 for ARM, which will be a but faster.) Install it in the usual way.

Depending on how you want to use Julia...

### VS Code

1. [Download](https://code.visualstudio.com/download) and install VS Code. 
2. Follow [these directions](https://github.com/julia-vscode/julia-vscode#installing-juliavs-codevs-code-julia-extension) to install the Julia language extension.

### Jupyter

Start Julia and then install `IJulia` from inside Julia by following [these directions](https://github.com/JuliaLang/IJulia.jl).

### Pluto

Follow these [instructions](https://github.com/fonsp/Pluto.jl#installation), or watch [this video](https://www.youtube.com/watch?v=OOjKEgbt8AI).

### Other

You could just run Julia in a terminal window and edit files any way you like. It's not a premium experience, though.

There is Julia [support for vim](https://github.com/JuliaEditorSupport/julia-vim) and an [Emacs mode](https://github.com/JuliaEditorSupport/julia-emacs), and a [few others](https://github.com/JuliaEditorSupport).

## Syllabus

* [Notebook demonstration](notebook_demo.ipynb)
* [Pluto demonstration](pluto/Pluto_demo.jl)
* [Basic types and assignments](basic_types.jl)
* [Conditionals and loops](conditionals_loops.jl)
* [Random numbers](random_numbers.ipynb)
* [Arrays and matrices](pluto/arrays_matrices.jl), [HTML version](pluto/arrays_matrices.jl.html)
* [Functions](functions.jl)
* [Methods and dispatch](methods.ipynb)
* [Graphics](pluto/graphics.jl)
* [Linear algebra](pluto/linear-algebra.jl)
* [Modules and packages](modules_packages.ipynb)
* [Optimization](pluto/optimization.jl)
* [Differential equations](pluto/diffeqs.jl)
* Performance
* Custom types
* Unit testing
* Interpolation and approximation
* Images and video
* Machine learning
* Dr Watson

## Exercises

Try [these](exercises.md), or think up your own!

This [website](https://exercism.org/tracks/julia/exercises), contains exercises with some basic tests built in to verify correctness. Solutions from other users can be 
viewed so you can see other (perhaps shorter and better) ways of doing things. Aidan found it useful when learning the syntax for Julia.