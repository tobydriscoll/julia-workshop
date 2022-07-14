# Julia workshop

## Manuals and guides

* [Julia language](https://docs.julialang.org/en/v1/)
* [Unicode characters](https://docs.julialang.org/en/v1/manual/unicode-input/)
* [Julia-Matlab-Python cheatsheet](https://cheatsheets.quantecon.org)
* [Differences from other major languages](https://docs.julialang.org/en/v1/manual/noteworthy-differences/)
* [Book on numerical methods](https://tobydriscoll.net/fnc-julia)

## Packages

* [Package listings on Julia Hub](https://juliahub.com/ui/Packages)
  
### Input and output

* [Plots](http://docs.juliaplots.org/latest/)
* [Images](https://juliaimages.org/stable/), [VideoIO](https://github.com/JuliaIO/VideoIO.jl)
* [PyFormattedStrings](https://gitlab.com/aplavin/PyFormattedStrings.jl): Format text like f-strings in Python
* [JLD2](https://github.com/JuliaIO/JLD2.jl): Native format for saving and loading data
* CSV, JSON, BSON, HDF5, ExcelFiles, XLSX, MAT: Input/output files in common formats

### Numerical 

* [DifferentialEquations](https://diffeq.sciml.ai/stable/)
* [NLopt](https://github.com/JuliaOpt/NLopt.jl): Smooth and nonsmooth optimization methods
* [LeastSquaresOptim](https://github.com/matthieugomez/LeastSquaresOptim.jl): Solve nonlinear least squares
* [IterativeSolvers](https://github.com/JuliaLinearAlgebra/IterativeSolvers.jl): GMRES, MINRES, CG, and friends
* [Interpolations](http://juliamath.github.io/Interpolations.jl/latest/)
* [ApproxFun](https://github.com/JuliaApproximation/ApproxFun.jl): Manipulate functions as numerical objects

### Performance and convenience

* [BlockArrays](https://juliaarrays.github.io/BlockArrays.jl/stable/): Overlay a block indexing structure
* [StaticArrays](https://juliaarrays.github.io/StaticArrays.jl/stable/): Higher performance with vectors and matrices of small, fixed sizes
* [Unitful](https://painterqubits.github.io/Unitful.jl/stable/): Manipulate quantities that have physical units
* [DrWatson](https://github.com/JuliaDynamics/DrWatson.jl): Manage simulation codes and results automatically

### Data science / ML
* [Queryverse](https://www.queryverse.org): Packages for data science
* [MLJ](https://alan-turing-institute.github.io/MLJ.jl): Machine learning meta-package
* [Flux](https://fluxml.ai/Flux.jl/stable/), [Lux](http://lux.csail.mit.edu): Neural networks

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
* [Graphics](pluto/graphics.jl)
* [Linear algebra](pluto/linear-algebra.jl)
* [Differential equations](pluto/diffeqs.jl)
* [Optimization](pluto/optimization.jl)
* [Methods and dispatch](methods.ipynb)
* [Modules and packages](modules_packages.ipynb)
* Unit testing (see the `cheb_` files)
* [Performance](performance.jl)

<!-- 
* Custom types
* Interpolation and approximation
* Images and video
* Machine learning
* Dr Watson -->

## Exercises

Try [these](exercises.md), or think up your own!

This [website](https://exercism.org/tracks/julia/exercises), contains exercises with some basic tests built in to verify correctness. Solutions from other users can be 
viewed so you can see other (perhaps shorter and better) ways of doing things. Aidan found it useful when learning the syntax for Julia.