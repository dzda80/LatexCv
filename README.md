# Introduction

This repo contains sources for presentations written in [$\LaTeX$](https://www.latex-project.org/).

The presentations make use of the [beamer](https://ctan.org/pkg/beamer) package to create simple yet elegant presentations.

Available presentations:
- [versioning-strategy](./versioning-strategy/README.md)
- [omb-sync-deloitte](./omb-sync-deloitte/README.md)
- [source-generators](./source-generators/README.md)

## How to build the presentations

To build a single presentation, run the following command from the root of the project:

```shell
./build-folder <folder name>
```

To build all the presentations, just loop over all the folders:

```shell
ls -d */ | xargs -i ./build-folder.sh {}
```

Note that the `xelatex` command is executed twice to make sure the table of contents gets correctly generated.

With this command a new `main.pdf` file is generated in every folder.