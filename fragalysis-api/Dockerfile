FROM conda/miniconda3
RUN apt-get update -y
RUN apt-get install -y build-essential python-dev python-pmw libglew-dev freeglut3-dev libpng-dev libfreetype6-dev libxml2-dev libmsgpack-dev python-pyqt5.qtopengl libglm-dev libnetcdf-dev
RUN apt-get install -y git-all
RUN apt-get -qq -y install unzip vim tar sudo gcc g++ gfortran m4 git wget bzip2 tar expect
RUN wget http://devtools.fg.oisin.rc-harwell.ac.uk/nightly/7.0/ccp4-7.0-linux64-latest.tar.bz2
RUN bunzip2 ccp4-7.0-linux64-latest.tar.bz2
RUN mkdir ./ccp4
RUN tar -xf ccp4-7.0-linux64-latest.tar -C ./ccp4 --strip-components=1
ADD ccp4.setup-sh ./ccp4/bin
ADD cut_maps.sh /cut_maps.sh
RUN chmod 775 /cut_maps.sh
RUN conda install -c rdkit rdkit -y
RUN git clone https://github.com/xchem/gemmi_pandda.git; cd ./gemmi_pandda; pip install --force-reinstall .; cd ..
#RUN pip install gemmi
RUN git clone https://github.com/xchem/pandda_gemmi.git; cd ./pandda_gemmi; pip install -e .; cd ..
RUN git clone https://github.com/xchem/fragalysis-api.git; cd ./fragalysis-api; git checkout ReduceReferenceFrame; git pull; pip install -e .; cd ..
ENTRYPOINT ["/bin/bash"]
