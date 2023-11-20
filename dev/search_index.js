var documenterSearchIndex = {"docs":
[{"location":"compressed-sensing/#Compress-Sensing","page":"Compress Sensing","title":"Compress Sensing","text":"","category":"section"},{"location":"compressed-sensing/","page":"Compress Sensing","title":"Compress Sensing","text":"note: Note\nThis page is under construction.","category":"page"},{"location":"fundamentals-of-the-mri-signal/#Fundamentals-of-the-MRI-Signal","page":"Fundamentals of the MRI Signal","title":"Fundamentals of the MRI Signal","text":"","category":"section"},{"location":"fundamentals-of-the-mri-signal/","page":"Fundamentals of the MRI Signal","title":"Fundamentals of the MRI Signal","text":"Go to the resources of this section in the github repository to download:","category":"page"},{"location":"fundamentals-of-the-mri-signal/","page":"Fundamentals of the MRI Signal","title":"Fundamentals of the MRI Signal","text":"the theoretical presentation and\nthis Pluto notebook.","category":"page"},{"location":"fundamentals-of-the-mri-signal/","page":"Fundamentals of the MRI Signal","title":"Fundamentals of the MRI Signal","text":"Refer to this section to learn how to run the Pluto notebook.","category":"page"},{"location":"fundamentals-of-the-mri-signal/","page":"Fundamentals of the MRI Signal","title":"Fundamentals of the MRI Signal","text":"<iframe type=\"text/html\" src=\"../assets/MRIfundamentals.html\" style=\"height:4700px;width:100%;\">","category":"page"},{"location":"getting-started/#Course-Preparation","page":"Course Preparation","title":"Course Preparation","text":"","category":"section"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Throughout this workshop, we will use the Julia Programming Language and the Pluto module as our programming environment. Let's install these tools on our computers.","category":"page"},{"location":"getting-started/#Installing-Julia","page":"Course Preparation","title":"Installing Julia","text":"","category":"section"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Install the latest version of Julia which can be downloaded at the Julia Downloads page. It is advisable you add julia to the PATH, which can be done during the installation process.","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Once Julia is installed, open the Julia REPL (this process differs depending on your operative system). For instance, in Windows you can found and run the Julia executable and then the Julia REPL will show up:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<img src=\"../assets/julia-repl-windows.png\" alt=\"\" style=\"width:35%;\"><img src=\"../assets/julia-repl.png\" alt=\"\" style=\"width:65%;\">","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"There are many tutorials on the internet for programming in the Julia language. We recommend you refer to the official tutorials or this simple beginner tutorial.\"","category":"page"},{"location":"getting-started/#Installing-Pluto","page":"Course Preparation","title":"Installing Pluto","text":"","category":"section"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"When working with Julia, you will need to install some modules. In Julia it's necessary to open a Package Manager Session for doing so. During this workshop, we will use the Pluto module as the development environment. Let's add this module.   ","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"In the Julia Session (characterized by the julia> prompt), type the ] character to bring up the Package Manager Session (characterized by the pkg> prompt):","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/pkg-session.png\" alt=\"\" style=\"width:75%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":", then add the Pluto package by typing add Pluto and press enter:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<img src=\"../assets/pkg-add-pluto.png\" alt=\"\" style=\"width:50%;\"><img src=\"../assets/pkg-add-pluto-finish.png\" alt=\"\" style=\"width:50%;\">","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"To go back to the Julia Sesssion, simply press the backspace button:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/pkg-back-to-julia.png\" alt=\"\" style=\"width:75%;\"></center>","category":"page"},{"location":"getting-started/#Programming-in-Julia-with-Pluto","page":"Course Preparation","title":"Programming in Julia with Pluto","text":"","category":"section"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Just for testing purposes, let's create a simple Julia script in the Pluto environment. First, in a Julia Session import the Pluto module with the using Pluto command, and then launch it with the Pluto.run() function:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"julia> using Pluto\n\njulia> Pluto.run()","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/pluto-open.png\" alt=\"\" style=\"width:75%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"A window of your default browser will show up:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/pluto-dashboard.png\" alt=\"\" style=\"width:80%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"You can scroll down this page to see some Pluto Notebook examples. However, let's continue by clicking on + Create a new notebook and an empty Pluto Notebook, an environment for programming in Julia, will be displayed:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/pluto-empty-notebook.png\" alt=\"\" style=\"width:80%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Feel free to messing around with options and buttons in the Pluto Notebook. There are lots of tutorials and resources on the Internet for using Pluto, we recommend you to read at least this tutorial.","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Write the following in your Pluto Notebook and run it (this example is taken from here):","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<embed type=\"text/html\" src=\"../assets/pluto-test-example.html\" style=\"height:880px;width:100%;\">","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"All done! You have successfully written a Julia program in the Pluto environment.","category":"page"},{"location":"getting-started/#Using-notebooks-from-this-workshop","page":"Course Preparation","title":"Using notebooks from this workshop","text":"","category":"section"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"In this workshop, you will be working with notebooks available in the GitHub repository, each aligned with the topic of a specific session.","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"To run these notebooks on your local computer, navigate to the session of your interest:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/github-open-session.png\" alt=\"\" style=\"width:100%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Next, open the Pluto notebook file with the .jl extension:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/github-open-notebook.png\" alt=\"\" style=\"width:100%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Next, download the notebook:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/github-download-notebook.png\" alt=\"\" style=\"width:100%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"A Pluto notebook file should be stored in your computer's Downloads folder.","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Next, run Pluto:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"julia> using Pluto\n\njulia> Pluto.run()","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"In the Pluto dashboard, drag and drop the Pluto notebook file:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/github-pluto-drag-and-drop.gif\" alt=\"\" style=\"width:100%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"Finally, click on the button labeled Run notebook code to execute the Julia code:","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"<center><img src=\"../assets/github-pluto-run.png\" alt=\"\" style=\"width:100%;\"></center>","category":"page"},{"location":"getting-started/","page":"Course Preparation","title":"Course Preparation","text":"All done! Feel free to play around with these notebooks during the workshop.","category":"page"},{"location":"simulation/#MRI-simulation","page":"Simulation","title":"MRI simulation","text":"","category":"section"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"Go to the resources of this section in the GitHub repository to download:","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"The presentation about open-source software,\nThe presentation about MRI simulation,\nThis Pluto notebook.","category":"page"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"Refer to this section to learn how to run the Pluto notebook.","category":"page"},{"location":"simulation/#Hands-on-Pluto-notebook","page":"Simulation","title":"Hands-on Pluto notebook","text":"","category":"section"},{"location":"simulation/","page":"Simulation","title":"Simulation","text":"<iframe type=\"text/html\" src=\"../assets/hands-on-simulation.html\" style=\"height:800px;width:100%;\">","category":"page"},{"location":"parallel-imaging/#Parallel-Imaging","page":"Parallel Imaging","title":"Parallel Imaging","text":"","category":"section"},{"location":"parallel-imaging/","page":"Parallel Imaging","title":"Parallel Imaging","text":"note: Note\nThis page is under construction.","category":"page"},{"location":"quantitative-mapping/#Quantitative-Mapping","page":"Quantitative Mapping","title":"Quantitative Mapping","text":"","category":"section"},{"location":"quantitative-mapping/","page":"Quantitative Mapping","title":"Quantitative Mapping","text":"note: Note\nThis page is under construction.","category":"page"},{"location":"off-resonance-correction/#Off-Resonance-Correction","page":"Off-Resonance Correction","title":"Off-Resonance Correction","text":"","category":"section"},{"location":"off-resonance-correction/","page":"Off-Resonance Correction","title":"Off-Resonance Correction","text":"note: Note\nThis page is under construction.","category":"page"},{"location":"#MRI:-Processing-your-Data","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"(Image: CC BY 4.0) (Image: Open Source Love)","category":"page"},{"location":"#Introduction","page":"MRI: Processing your Data","title":"Introduction","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"Welcome to the documentation of the hands-on workshop \"MRI: Processing Your Data\", taking place on November 20 and 21, 2023, at the San Joaquin Campus of the Pontificia Universidad Católica de Chile.","category":"page"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"In this documentation, you will find information, data, and examples related to the hands-on workshop.","category":"page"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"It specifically aims for scientists and students working with MRI related topics. We presume the attendees have some basic programming and signal processing skills. To get everyone on the same level, we start with Julia programming basics.","category":"page"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"note: Note\nBefore the course starts, all participants are required to have Julia and Pluto installed, please see the course preparation page.","category":"page"},{"location":"#Time-Table-and-Map","page":"MRI: Processing your Data","title":"Time Table and Map","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"All following times are in Chilean (Santiago) time (currently GMT-4). Look up your related time here, so you don't miss anything. To find the rooms of the workshop, you can download a PDF version of the San Joaquin campus or visit our virtual map.","category":"page"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"note: Note\nWe recommend arriving on the campus at least 15 minutes before the beginning of the sessions because some buildings are far from the main entrance.","category":"page"},{"location":"#Day-1-Monday-the-20th-of-November-2023-/-Place:-Sala-de-clase-AP102,-Edificio-de-Aulas-Las-Pataguas","page":"MRI: Processing your Data","title":"Day 1 - Monday the 20th of November 2023 / Place: Sala de clase AP102, Edificio de Aulas Las Pataguas","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"Time Activities/Topics Presenters\n10:30 Reception Pablo Irarrázaval\n10:55 Introduction to the Workshop Pablo Irarrázaval\n11:00 Theory: Fundamentals of the MRI Signal Pablo Irarrázaval\n11:45 Hands-on: Fundamentals of the MRI Signal Pablo Irarrázaval\n12:30 Launch -\n13:30 Open Software Carlos Castillo\n14:15 Theory: Simulation Carlos Castillo\n15:00 Hands-on: Simulation Carlos Castillo\n16:00 Break -\n16:15 Theory: Basic Signal Processing Pablo Irarrázaval / Belén Bravo\n17:00 Hands-on: Basic Signal Processing Belén Bravo\n18:00 Adjourn -","category":"page"},{"location":"#Day-2-Tuesday-the-21th-of-November-2023-/-Place:-Sala-de-estudios,-Edificio-Raul-Deves","page":"MRI: Processing your Data","title":"Day 2 - Tuesday the 21th of November 2023 / Place: Sala de estudios, Edificio Raul Deves","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"Time Activities/Topics Presenters\n09:15 Theory: Undersampled Reconstruction with Parallel Imaging Pablo Irarrázaval / Ronal Coronado\n10:00 Hands-on: Undersampled Reconstruction with Parallel Imaging Ronal Coronado\n10:45 Break -\n11:00 Theory: Undersampled Reconstruction with Compressed Sensing Pablo Irarrázaval / Belén Bravo\n11:45 Hands-on: Undersampled Reconstruction with Compressed Sensing Belén Bravo\n12:30 Launch -\n13:30 Theory: Quantitative Mapping Pablo Irarrázaval / Guillermo Sahonero\n14:15 Hands-on: Quantitative Mapping Guillermo Sahonero\n15:00 Break -\n15:15 Theory: Off-Resonance Correction Pablo Irarrázaval / Ronal Coronado\n16:00 Hands-on: Off-Resonance Correction Ronal Coronado\n18:00 Adjourn -","category":"page"},{"location":"#Feedback-and-support","page":"MRI: Processing your Data","title":"Feedback and support","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"If you have any questions, please create a github issue.","category":"page"},{"location":"#Acknowledgments","page":"MRI: Processing your Data","title":"Acknowledgments","text":"","category":"section"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"We would like to thank the Chan Zuckerberg Initiative through the LIBRE hub project for the financial support and the Pontificia Universidad Católica de Chile through the Institute of Biological and Medical Engineering for providing facilities for the course.","category":"page"},{"location":"","page":"MRI: Processing your Data","title":"MRI: Processing your Data","text":"(Image: img.png)","category":"page"},{"location":"basic-signal-processing/#Basic-Signal-Processing","page":"Basic Signal Processing","title":"Basic Signal Processing","text":"","category":"section"},{"location":"basic-signal-processing/","page":"Basic Signal Processing","title":"Basic Signal Processing","text":"Go to the resources of this section in the github repository to download:","category":"page"},{"location":"basic-signal-processing/","page":"Basic Signal Processing","title":"Basic Signal Processing","text":"the theoretical presentation and\nthis Pluto notebook.","category":"page"},{"location":"basic-signal-processing/","page":"Basic Signal Processing","title":"Basic Signal Processing","text":"Refer to this section to learn how to run the Pluto notebook.","category":"page"},{"location":"basic-signal-processing/","page":"Basic Signal Processing","title":"Basic Signal Processing","text":"<iframe type=\"text/html\" src=\"../assets/Singal_Procesing_Enuncado.html\" style=\"height:4000px;width:100%;\">","category":"page"}]
}
