using Documenter

makedocs(
    sitename = "MRI processing 2023",
    format = Documenter.HTML(
        prettyurls = true,
        sidebar_sitename = false,
    ),
    pages = [
        "Home" => "index.md";
        "Getting Started" => "getting-started.md";
        "Fundamentals of the MRI Signal" => "fundamentals-of-the-mri-signal.md";
        "Simulation" => "simulation.md";
        "Parallel Imaging" => "parallel-imaging.md";
        "Compress Sensing" => "compress-sensing.md";
        "Quantitative Mapping" => "quantitative-mapping.md";
        "Off-Resonance Correction" => "off-resonance-correction.md";
    ],
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/LIBREhub/MRI-processing-2023.git"
)
