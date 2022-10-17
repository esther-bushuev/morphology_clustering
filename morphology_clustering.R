library(raster)
library(sp)
library(bnspatial)
library(RStoolbox)


setwd(".../") # It is most efficient to have all input layers saved to one location, then set the working directory. The classified output raster will also be saved here.

## bring in the rasters by replacing the ... with the file name (no extension)
bathy <- raster("...")
bathy25 <- raster("...")
B_bpi <- raster("...")
F_bpi <- raster("...")
slope <- raster("...")


## merge terrain derivative layers in raster stack
env_vars <- stack(bathy, bathy25, B_bpi, F_bpi, slope)
names(env_vars) <- c('bathy', 'bathy25', 'B_bpi', 'F_bpi', 'slope')


## Running Principle Component Analysis (PCA) on the stack of terrain derivatives
set.seed(123)
rast.pca <- rasterPCA(env_vars, nSamples = 10000, spca = TRUE) # define nSamples if you are dealing with a large area to reduce computing time
plot(rast.pca$map) # visualize all of the principle component maps
summary(rast.pca$model) # assess variance explained

## Combine the desired number of PC's
pca.env_vars <- stack(rast.pca$map$PC1, rast.pca$map$PC2) # Using the first 2 principle components, add more if desired
names(pca.env_vars) <- c('pc1', 'pc2')
pca.env_vars_df <- as.data.frame(pca.env_vars) # convert to dataframe for clustering

## K-means clustering for the first 2 PC's. The algorithm is applied to the dataframe, not the raster stack.
kclust_pca.env <- kmeans(na.omit(pca.env_vars_df), 10, iter.max = 1000, nstart = 5, algorithm = "Lloyd") # 10 classes, using the Llyod algorithm
str(kclust_pca.env) # assess clustering

## Convert the resulting classification back into Raster format
pca.env_df_factor <- rep(NA, length(pca.env_vars_df[,1]))
pca.env_df_factor[!is.na(pca.env_vars_df[,1])] <- kclust_pca.env$cluster
pca.clusters <- raster(pca.env_vars)
pca.clusters <- setValues(pca.clusters, pca.env_df_factor)
plot(pca.clusters) # Plot of the final classified raster. Classes will be named numerically.


## Write the output to raster format to further investigate in a mapping software of choice. 
writeRaster(pca.clusters, filename = "...", format = 'raster')


