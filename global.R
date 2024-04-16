# Load libraries
library(shiny)
library(shinydashboard)
library(shinycssloaders)
library(palmerpenguins)
library(tidyverse)
library(dplyr)
library(leaflet)
library(leaflet.extras)
library(leaflet.minicharts)
library(sf)
library(countrycode)


ca_boundary <- st_read("/capstone/casaschools/schools_data/CA_boundary/CA_boundary.shp")

ca_boundary <- st_make_valid(ca_boundary)
ca_boundary <- st_transform(ca_boundary, crs = "EPSG:4326" )

school_points <-  st_read("/capstone/casaschools/schools_data/California_Schools_2022-23/California_Schools_2022-23.shp")
school_points <- st_transform(school_points, crs = "EPSG:4326" )
school_points_rm <- school_points %>% st_drop_geometry()
