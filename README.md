# Fragalysis-Preparation

This repository contains two containers that can be run in conjunction to prepare data for uploading to fragalysis.

The first container `fragalysis-api` requires running interactively and mounting a part of the file system to convert a set of .pdb files and smiles strings (as plain text files) into the fragalysis friendly format.

Following this - the `xchemreview` container will need to be run (also with mounting a part of the file system when running the container) - to then annotate the outputs of the fragalysis api and prepare them for fragalysis upload (or for visualisation).

We recommend that you read the documentation for both (fragalysis-api)[https://github.com/xchem/fragalysis-api] and (xchemreview)[https://github.com/xchem/localXCR] for both tips on how to use each of the tools.

## Installing/Building the containers from docker-compose

Firstly you will need to install (Docker)[https://docs.docker.com/get-docker/] or (Podman)[https://podman.io/getting-started/installation] (if you are using RedHat/CentOS - the commands may vary slightly if using podman but we will assume you are using Docker)

Then build the containers using the following commands:

```
git clone https://github.com/xchem/fragalysisprep.git
cd fragalysisprep
docker compose build
```

Hopefully after a bit of waiting the containers will have been built without error!

## Running Fragalysis API from container

The first step in preparing data for fragalysis is to convert a set of pdb files into ligand + unliganded structures.

We recommend that you put these inside a folder that contains a `input` and `output` directories and place the structures + accompanying files inside a
another folder in the input directory. For example, if your crystal system was called `JARID2` you would put your pdb files inside the `./input/JARID2/` folder.

Below is a more detailed example of the preferred file structure:

```
inputfolder
├── input
│   ├── Example
│   │   ├── Example-x0001.pdb
│   │   ├── Example-x0001_smiles.txt
│   │   ├── Example-x0001_event_0.cpp4
│   │   ├── Example-x0001_2fofc.map
│   │   ├── Example-x0001_fofc.map
│   │   ├── Example-x0002.pdb
│   │   └── ...
│   └── Another Protein (maybe)
└── output
```

For each pdb file inside the `./inputfolder/input/Example/` subfolder there should be an accompanying `_smiles.txt` and optionally some .map/.cpp4 files if you have them available. We recommend that you cut the maps to be the size of the pdb files to speed up the process!

To initialise the fragalysis-api container, run the command:
**n.b. change `[inputfolder]` to be the correct filepath on you system (use pwd if unsure)**

```
docker run --mount type=bind,source=[inputfolder],target=/data -it fragalysisprep_fragalysisapi
```

This will create an interactive session inside of the container with the folder specified with at `[inputfolder]` mounted inside the container at the location of `/data/`
In our example `/data/input/Example` would be a valid filepath

To run the fragalysis-api (see documentation for more information)

```
python ./fragalysis-api/fragalysis_api/xcimporter/xcimporter.py --in_dir=/data/[Example] --out_dir=/data/output/ --target [Example] -rrf -c -md
```

## Running XCR

After using fragalysis-api to create the fragalysis inputs you can then run XCR to review and annotate the data for your fragalysis upload.

Simply run the xchemreview container and mount the fragalysis api output folder as the source:

```
docker run --mount type=bind,source=[input folder],target=/data/ -t fragalysisprep_xchemreview
```

Then simply open your favourite browser and navigate to the localhost:5000 URL and you will be using XCR!
