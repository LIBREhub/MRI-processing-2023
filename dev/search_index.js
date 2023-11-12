var documenterSearchIndex = {"docs":
[{"location":"getting-started/#Getting-Started","page":"Course Preparation","title":"Getting Started","text":"","category":"section"},{"location":"getting-started/#Installing-Julia","page":"Course Preparation","title":"Installing Julia","text":"","category":"section"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Install the latest version of Julia which can be downloaded at the Julia Downloads page. It is advisable you add julia to the PATH, which can be done during the installation process.","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Once Julia is installed, open the Julia REPL (this process differs depending on your operative system). For instance, in Windows you can found and run the Julia executable and then the Julia REPL will show up:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<img src=\"../assets/julia-repl-windows.png\" alt=\"\" style=\"width:35%;\"><img src=\"../assets/julia-repl.png\" alt=\"\" style=\"width:65%;\">","category":"page"},{"location":"getting-started/#Installing-Pluto","page":"Course Preparation","title":"Installing Pluto","text":"","category":"section"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"When working with Julia, you will need to install some modules. In Julia it's necessary to open a Package Manager Session for doing so. During this workshop, we will use the Pluto module as the development environment. Let's add this module.   ","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"In the Julia Session (characterized by the julia> prompt), type the ] character to bring up the Package Manager Session (characterized by the pkg> prompt):","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/pkg-session.png\" alt=\"\" style=\"width:75%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":", then add the Pluto package by typing add Pluto and press enter:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<img src=\"../assets/pkg-add-pluto.png\" alt=\"\" style=\"width:50%;\"><img src=\"../assets/pkg-add-pluto-finish.png\" alt=\"\" style=\"width:50%;\">","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"To go back to the Julia Sesssion, simply press the backspace button:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/pkg-back-to-julia.png\" alt=\"\" style=\"width:75%;\"></center>","category":"page"},{"location":"getting-started/#Programming-in-Julia-with-Pluto","page":"Course Preparation","title":"Programming in Julia with Pluto","text":"","category":"section"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Just for testing purposes, let's create a simple Julia script in the Pluto environment. First, in a Julia Session import the Pluto module with the using Pluto command, and then launch it with the Pluto.run() function:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"julia> using Pluto\n\njulia> Pluto.run()","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/pluto-open.png\" alt=\"\" style=\"width:75%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"A window of your default browser will show up:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/pluto-dashboard.png\" alt=\"\" style=\"width:80%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"You can scroll down this page to see some Pluto Notebook examples. However, let's continue by clicking on + Create a new notebook and an empty Pluto Notebook, an environment for programming in Julia, will be displayed:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/pluto-empty-notebook.png\" alt=\"\" style=\"width:80%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Feel free to messing around with options and buttons in the Pluto Notebook. There are lots of tutorials and resources on the Internet for using Pluto, we recommend you to read at least this tutorial.","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Write the following in your Pluto Notebook and run it (this example is taken from here):","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<embed type=\"text/html\" src=\"../assets/pluto-test-example.html\" style=\"height:880px;width:100%;\">","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"All done! You have successfully written a Julia program in the Pluto environment.","category":"page"},{"location":"fundamentals-of-the-mri-signal/#Fundamentals-of-the-MRI-Signal","page":"Fundamentals of the MRI Signal","title":"Fundamentals of the MRI Signal","text":"","category":"section"},{"location":"fundamentals-of-the-mri-signal/","page":"Fundamentals of the MRI Signal","title":"Fundamentals of the MRI Signal","text":"note: Note\nThis page is under construction.","category":"page"},{"location":"simulation/#Simulation","page":"Simulation","title":"Simulation","text":"","category":"section"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"note: Note\nThis page is under construction.","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"This section delves into some details about how a sequence is constructed. The sequence definition in KomaMRI is strongly related to the Pulseq definition. After reading this section, you should be able to create your own Sequence structs for conducting custom simulations using the KomaMRI package.","category":"page"},{"location":"simulation/#Sequence-Overview","page":"Simulation","title":"Sequence Overview","text":"","category":"section"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"Let's introduce the following simple sequence figure to expand from a visual example to a more general sequence definition:","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"<p align=\"center\"><img width=\"80%\" src=\"../assets/sequence-diagram.svg\"/></p>","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"A sequence can be thought of as an ordered concatenation of blocks over time. Each block is essentially a sequence with a length of 1. Every block consists of an RF pulse, the (xyz) gradients, and the acquisition of samples. Each block also has an associated time duration. To simplify, we will refer to these components as follows:","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"beginmatrix*l\ntextseqi        textblock i of the sequence \ntextseqRFi     textRF pulse at the i block \ntextseqGRxi   textgradient x at the i block \ntextseqGRyi   textgradient y at the i block \ntextseqGRzi   textgradient z at the i block \ntextseqADCi    textacquisition at the i block \ntextseqDURi    textduration at the i block\nendmatrix*","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"The best way to understand the Sequence struct in KomaMRI is by examining the source code where this struct is defined:","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"mutable struct Sequence\n    GR::Array{Grad,2}\n    RF::Array{RF,2}\n    ADC::Array{ADC,1}\n    DUR::Array{Any,1}\n    DEF::Dict{String,Any}\nend","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"As you can see, a Sequence struct contains 5 field names: ''DEF'' contains information for reconstruction steps (so it is not mandatory to fill it), ''DUR'' is a vector that contains the time durations of each block, ''ADC'' is also a vector with the acquisition samples for every block (an vector of ADC structs), ''GR'' is a 2D matrix which 3 rows representing the x-y-z gradients and columns having the samples of each block (a matrix of Grad structs) and ''RF'' is also a 2D matrix where each row represents a different coil and the columns are for different block samples too (a matrix of RF structs). The RF, Grad and ADC are MRI events that will be explained in the section Events Definitions.","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"warning: Warning\nSo far, KomaMRI can only manage one coil for RF excitations. However, in future versions, multiple coils will be managed by adding more ``rows'' to the RF matrix of the Sequence field name.","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"In order to understand how a Sequence struct can be manipulated in Julia, let's use the EPI sequence example. You can display basic information of the Sequence variable in the Julia REPL:","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"julia> seq = PulseDesigner.EPI_example()\nSequence[ τ = 62.846 ms | blocks: 204 | ADC: 101 | GR: 205 | RF: 1 | DEF: 5 ]","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"As you can see, this Sequence has 204 blocks, 1 of these blocks has an RF struct with values different from zero, there are 205 number of Grad structs considering the x-y-z components, 101 ADC structs acquire samples of some blocks and 62.846 ms is the total time duration of the complete Sequence.","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"To display the sequence in an graph, we can use the plot_seq() function:","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"julia> plot_seq(seq)","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"<object type=\"text/html\" data=\"../assets/seq-epi-example-full.html\" style=\"width:100%; height:420px;\"></object>","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"This way, you can see exactly where the RF, Grad and ADC structs are located in time.","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"You can access and filter information for the RF, Grad, ADC, and DUR field names of a Sequence using the dot notation. This allows you to display helpful information about the organization of the Sequence struct:","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"julia> seq.RF\n1×204 Matrix{RF}:\n ⊓(0.5872 ms)  ⇿(0.0 ms)  ⇿(0.0 ms)  …  ⇿(0.0 ms)  ⇿(0.0 ms)   \n\njulia> seq.GR\n3×204 Matrix{Grad}:\n ⇿(0.5872 ms)  ⊓(0.4042 ms)  ⊓(0.4042 ms)  …  ⇿(0.2062 ms)  ⊓(0.4042 ms)  ⊓(0.4042 ms)\n ⇿(0.5872 ms)  ⊓(0.4042 ms)  ⇿(0.4042 ms)     ⊓(0.2062 ms)  ⇿(0.4042 ms)  ⊓(0.4042 ms)\n ⇿(0.5872 ms)  ⇿(0.0 ms)     ⇿(0.0 ms)        ⇿(0.0 ms)     ⇿(0.0 ms)     ⇿(0.0 ms)\n\njulia> seq.ADC\n204-element Vector{ADC}:\n ADC(0, 0.0, 0.0, 0.0, 0.0)\n ADC(0, 0.0, 0.0, 0.0, 0.0)\n ADC(101, 0.00019999999999999998, 0.00010211565434713023, 0.0, 0.0)\n ⋮\n ADC(101, 0.00019999999999999998, 0.00010211565434713023, 0.0, 0.0)\n ADC(0, 0.0, 0.0, 0.0, 0.0)\n\njulia> seq.DUR\n204-element Vector{Float64}:\n 0.0005871650124959989\n 0.0004042313086942605\n 0.0004042313086942605\n ⋮\n 0.0004042313086942605\n 0.0004042313086942605","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"Additionally, you can access a subset of blocks in a Sequence by slicing or indexing. The result will also be a Sequence struct, allowing you to perform the same operations as you would with a full Sequence. For example, if you want to analyze the first 11 blocks, you can do the following:","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"julia> seq[1:11]\nSequence[ τ = 3.837 ms | blocks: 11 | ADC: 5 | GR: 11 | RF: 1 | DEF: 5 ]\n\njulia> seq[1:11].GR\n3×11 Matrix{Grad}:\n ⇿(0.5872 ms)  ⊓(0.4042 ms)  ⊓(0.4042 ms)   …  ⊓(0.4042 ms)  ⇿(0.2062 ms)  ⊓(0.4042 ms)\n ⇿(0.5872 ms)  ⊓(0.4042 ms)  ⇿(0.4042 ms)      ⇿(0.4042 ms)  ⊓(0.2062 ms)  ⇿(0.4042 ms)\n ⇿(0.5872 ms)  ⇿(0.0 ms)     ⇿(0.0 ms)        ⇿(0.0 ms)     ⇿(0.0 ms)     ⇿(0.0 ms)\n\njulia> plot_seq(seq[1:11])","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"<object type=\"text/html\" data=\"../assets/seq-epi-example-some-blocks.html\" style=\"width:100%; height:420px;\"></object>","category":"page"},{"location":"simulation/#Concatenation-of-Sequences","page":"Simulation","title":"Concatenation of Sequences","text":"","category":"section"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"Sequences can be concatenated side by side. The example below demonstrates how to concatenate sequences:","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"julia> s = PulseDesigner.EPI_example()[1:11]\nSequence[ τ = 3.837 ms | blocks: 11 | ADC: 5 | GR: 11 | RF: 1 | DEF: 5 ]\n\njulia> seq = s + s + s\nSequence[ τ = 11.512 ms | blocks: 33 | ADC: 15 | GR: 33 | RF: 3 | DEF: 5 ]\n\njulia> plot_seq(seq)","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"<object type=\"text/html\" data=\"../assets/seq-concatenation.html\" style=\"width:100%; height:420px;\"></object>","category":"page"},{"location":"parallel-imaging/#Parallel-Imaging","page":"Parallel Imaging","title":"Parallel Imaging","text":"","category":"section"},{"location":"parallel-imaging/","page":"Parallel Imaging","title":"Parallel Imaging","text":"note: Note\nThis page is under construction.","category":"page"},{"location":"quantitative-mapping/#Quantitative-Mapping","page":"Quantitative Mapping","title":"Quantitative Mapping","text":"","category":"section"},{"location":"quantitative-mapping/","page":"Quantitative Mapping","title":"Quantitative Mapping","text":"note: Note\nThis page is under construction.","category":"page"},{"location":"compress-sensing/#Compress-Sensing","page":"Compress Sensing","title":"Compress Sensing","text":"","category":"section"},{"location":"compress-sensing/","page":"Compress Sensing","title":"Compress Sensing","text":"note: Note\nThis page is under construction.","category":"page"},{"location":"#MRI:-Processing-your-Data","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"(Image: CC BY 4.0) (Image: Open Source Love)","category":"page"},{"location":"#Introduction","page":"MRI: Processing your Data","title":"Introduction","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"Welcome to the documentation of the hands-on workshop \"MRI: Processing Your Data\", taking place on November 20 and 21, 2023, at the San Joaquin Campus of the Pontificia Universidad Católica de Chile.","category":"page"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"In this documentation, you will find information, data, and examples related to the hands-on workshop. You can also go to the github repository to find source code and additional resources.","category":"page"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"It specifically aims for scientists and students working with MRI related topics. We presume the attendees have some basic programming and signal processing skills. To get everyone on the same level, we start with Julia programming basics.","category":"page"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"note: Note\nBefore the course starts, all participants are required to have Julia and Pluto installed, please see the course preparation page.","category":"page"},{"location":"#Time-Table","page":"MRI: Processing your Data","title":"Time Table","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"All following times are in Chilean (Santiago) time (currently GMT-4). Look up your related time here, so you don't miss anything.","category":"page"},{"location":"#Day-1-Monday-the-20th-of-November-2023","page":"MRI: Processing your Data","title":"Day 1 - Monday the 20th of November 2023","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"Time Activities/Topics Presenters\n10:30 Reception Pablo Irarrázaval\n10:55 Introduction to the Workshop Pablo Irarrázaval\n11:00 Theory: Fundamentals of the MRI Signal Pablo Irarrázaval\n11:45 Hands-on: Fundamentals of the MRI Signal Pablo Irarrázaval\n12:30 Launch -\n13:30 Open Software Carlos Castillo\n14:15 Theory: Simulation Carlos Castillo\n15:00 Hands-on: Simulation Carlos Castillo\n16:00 Break -\n16:15 Theory: Basic Signal Processing Pablo Irarrázaval / Belén Bravo\n17:00 Hands-on: Basic Signal Processing Belén Bravo\n18:00 Adjourn -","category":"page"},{"location":"#Day-2-Tuesday-the-21th-of-November-2023","page":"MRI: Processing your Data","title":"Day 2 - Tuesday the 21th of November 2023","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"Time Activities/Topics Presenters\n09:15 Theory: Undersampled Reconstruction with Parallel Imaging Pablo Irarrázaval / Ronal Coronado\n10:00 Hands-on: Undersampled Reconstruction with Parallel Imaging Ronal Coronado\n10:45 Break -\n11:00 Theory: Undersampled Reconstruction with Compress Sensing Pablo Irarrázaval / Belén Bravo\n11:45 Hands-on: Undersampled Reconstruction with Compress Sensing Belén Bravo\n12:30 Launch -\n13:30 Theory: Quantitative Mapping Pablo Irarrázaval / Guillermo Sahonero\n14:15 Hands-on: Quantitative Mapping Guillermo Sahonero\n15:00 Break -\n15:15 Theory: Off-Resonance Correction Pablo Irarrázaval / Ronal Coronado\n16:00 Hands-on: Off-Resonance Correction Ronal Coronado\n18:00 Adjourn -","category":"page"},{"location":"#Feedback-and-support","page":"MRI: Processing your Data","title":"Feedback and support","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"If you have any questions, please create a github issue.","category":"page"},{"location":"#Acknowledgments","page":"MRI: Processing your Data","title":"Acknowledgments","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"We would like to thank the Chan Zuckerberg Initiative through the LIBRE hub project for the financial support and the Pontificia Universidad Católica de Chile through the Institute of Biological and Medical Engineering for providing facilities for the course.","category":"page"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"(Image: img.png)","category":"page"},{"location":"off-resonance-correction/#Off-Resonance-Correction","page":"Off-Resonance Correction","title":"Off-Resonance Correction","text":"","category":"section"},{"location":"off-resonance-correction/","page":"Off-Resonance Correction","title":"Off-Resonance Correction","text":"note: Note\nThis page is under construction.","category":"page"},{"location":"basic-signal-processing/#Basic-Signal-Processing","page":"Basic Signal Processing","title":"Basic Signal Processing","text":"","category":"section"},{"location":"basic-signal-processing/","page":"Basic Signal Processing","title":"Basic Signal Processing","text":"note: Note\nThis page is under construction.","category":"page"}]
}
