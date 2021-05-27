# Blue Manual

This is the source code for the Blue Manual site. The project uses [MkDocs](https://mkdocs.org) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material) for building the manual.  To work with the manual
source, follow the instructions on the mkdocs site. The simplest way is to use
Python's package manager to install mkdocs using:

    pip install mkdocs mkdocs-material

Once installed, you can use:

    mkdocs serve

To serve the site locally. Updates to manual pages will be reflected in the local site while mkdocs is running.

The site can be generated using:

    mkdocs build

and deployed to Github Pages using:
 
    mkdocs gh-deploy 



