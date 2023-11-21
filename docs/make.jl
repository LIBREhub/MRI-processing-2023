using Documenter

makedocs(
    sitename = "MRI processing 2023",
    format = Documenter.HTML(
        prettyurls = true,
        sidebar_sitename = false,
        assets = ["assets/custom-styles.css"]
    ),
    pages = [
        "MRI: Processing your Data" => "index.md";
        "Course Preparation" => "getting-started.md";
        "1 - Fundamentals of the MRI Signal" => "fundamentals-of-the-mri-signal.md";
        "2 - Simulation" => "simulation.md";
        "3 - Basic Signal Processing" => "basic-signal-processing.md";
        "4 - Parallel Imaging" => "parallel-imaging.md";
        "5 - Compressed Sensing" => "compressed-sensing.md";
        #"6 - Quantitative Mapping" => "quantitative-mapping.md";
        "7 - Off-Resonance Correction" => "off-resonance-correction.md";
    ],
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/LIBREhub/MRI-processing-2023.git"
)
