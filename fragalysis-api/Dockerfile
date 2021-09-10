FROM conda/miniconda3
RUN apt-get update -y
RUN apt-get install -y build-essential python-dev python-pmw libglew-dev freeglut3-dev libpng-dev libfreetype6-dev libxml2-dev libmsgpack-dev python-pyqt5.qtopengl libglm-dev libnetcdf-dev
RUN apt-get install -y git-all
RUN conda install -c rdkit rdkit -y
RUN git clone https://github.com/xchem/gemmi_pandda.git; cd ./gemmi_pandda; pip install --force-reinstall .; cd ..
RUN git clone https://github.com/xchem/pandda_gemmi.git; cd ./pandda_gemmi; pip install -e .; cd ..
RUN git clone https://github.com/xchem/fragalysis-api.git; cd ./fragalysis-api; git checkout ReduceReferenceFrame; pip install -e .; cd ..
ENTRYPOINT ["/bin/bash"]
