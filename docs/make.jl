using Documenter

makedocs(
    sitename = "MRI processing 2023",
    format = Documenter.HTML()
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/LIBREhub/MRI-processing-2023.git"
)
