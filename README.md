# Fragalysis-Prepation
Here-in lies out docker containers for you to use to prepare data for fragalysis

The first Fragalysis-Api requires running in and mounting a file system to:

Likewise the localXCR one simply requires mounting a file system in yay!

Please see their respective readmes on their usages.

## Installing the containers from docker-compose
To build the containers, run this in the directory containing docker-compose.yml
```
docker compose up 
```

## Running Fragalysis API from container
To run fragalysis-api from the container you need to mount a folder with the following structure:
```
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
.pdb, _smiles.txt and optionally .map and/or .cpp4 files for each pdb file

Then simply run the command:
```
docker run --mount type=bind,source=[input folder],target=/data -it fragalysis-api
# within container simply run:
python ./fragalysis-api/fragalysis_api/xcimporter/xcimporter.py --in_dir=/data/input/[Example] --out_dir=/data/output/ --target [Example]
```

## Running XCR
After using fragalysis-api to create the fragalysis inputs you can then run XCR to do a final pass and prepare the data for fragalysis upload
```
docker run --mount type=bind,source=[input folder],target=/data/ -t xchemreview
```
then open a browser and navigate to the localhost:5000 and voila!