# morphology_clustering
Unsupervised classification of seafloor morphology using principle component analysis (PCA) and K-means clustering.


## PURPOSE
This code performs an unsupervised classification of seafloor morphology using principle component analysis (PCA) and a K-means clustering algorithm.


## WORKFLOW
The required inputs for this exercise are a regularly gridded bathymetry raster (or DEM in terrestrial applications) and various terrain attributes/derivatives, including but not limited to:
- Slope
- Bathymetric position index (BPI or TopographicPI for terrestrial)
- Bathymetric average
- Curvature
- Rugosity/ruggedness
Attributes can also be calculated with varying neighbourhood/window sizes to capture features at different scales (Misiuk et al., 2021).

There are many ways in which the terrain attribute rasters can be derived; such as:
- Benthic Terrain Modeler (Walbridge et al., 2018)
- esri ArcGIS Pro Spatial Analyst toolbox
- WhiteboxTools Open Core (https://www.whiteboxgeo.com/geospatial-software/)
- MultiscaleDTM (Ilich et al., 2021; https://github.com/ailich/MultiscaleDTM)

PCA is performed on the rasters and a K-meansclustering algorithm is then applied to a user defined number of principle components (PC) based on the % variance explained. 
The number of classes for the clustering are defined arbitrarily but should be greater than what the user may expects in the area to allow for reclassification down the line.

The output layer will be a numerically classified raster. 
Feature names can then be assigned to each class by the user based on a classification scheme of choice, and/or with reference to pre-existing maps of the study area.
Examples in the marine environment include:
- Geomorphology of the oceans (Harris et al., 2014)
- A two-part seabed geomorphology classification scheme (Dove et al., 2020)


## REFERENCES

Dove, D., Nanson, R., Bjarnadóttir, L.R., Guinan, J., Gafeira, J., Post, A., Dolan, M.F.J., Stewart, H., Arosio, R., Scott, G. (2020). A two-part seabed geomorphology classification scheme: (v.2); Part 1: morphology features glossary, https://doi.org/10.5281/ZENODO.4075248

Harris, P. T., Macmillan-Lawler, M., Rupp, J., & Baker, E. K. (2014). Geomorphology of the oceans. Marine Geology, 352, 4–24, https://doi.org/10.1016/j.margeo.2014.01.011

Ilich, A. R., Misiuk, B., Lecours, V.,; Murawski, S. A. (2021). “MultiscaleDTM”, https://doi.org/10.5281/zenodo.5548338. https://github.com/ailich/MultiscaleDTM.

Misiuk, B., Lecours, V., Dolan, M. F. J., & Robert K., (2021) Evaluating the Suitability of Multi-Scale Terrain Attribute Calculation Approaches for Seabed Mapping Applications, Marine Geodesy, 44:4, 327-385, https://doi.org/10.1080/01490419.2021.1925789

Walbridge, S., Slocum, N., Pobuda, M., Wright, D.J. (2018). Unified Geomorphological Analysis Workflows with Benthic Terrain Modeler. Geosciences, 8, 94, https://doi.org/10.3390/geosciences8030094


## AUTHOR INFORMATION
**Esther Bushuev** (B.Sc., MSc Candidate)

*Seascape Ecology & Mapping Lab, Department of Oceanography, Dalhousie University*

https://www.seafloormapping.ca/


