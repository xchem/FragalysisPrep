FROM rocker/shiny-verse:latest

# System Libs
RUN apt-get update && apt-get install -y \
	sudo \
	pandoc \
	pandoc-citeproc \
	libcurl4-gnutls-dev \
	libcairo2-dev \
	libxt-dev \
	libssl-dev \
	libssh2-1-dev \
	libpq-dev

# Install R packages
RUN R -e "install.packages(c('devtools', 'caTools','shiny','shinydashboard','shinyjqui','shinyWidgets','htmlwidgets', 'DT', 'remotes', 'shinyjs'), repos='http://cran.rstudio.com/')"
RUN R -e "library(devtools); devtools::install_github('tjgorrie/nglShiny'); devtools::install_github('tjgorrie/localXCR')" 

# Port
EXPOSE 5000

# Run App?
CMD ["R", "-e", "library(localXCR); launch_XCR(port=5000, launch.browser=FALSE)"]
