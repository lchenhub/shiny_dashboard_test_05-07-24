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
library(plotly)


# make sure the full cdscode can be seen
options(scipen = 999)

# ----------------------- CA school points -------------------------------
#Load in data
school_points <-  st_read("/capstone/casaschools/schools_data/California_Schools_2022-23/California_Schools_2022-23.shp") %>% 
  # filter to active schools
  filter(Status == "Active")

# Transform CRS
school_points <- st_transform(school_points, crs = "EPSG:4326" )
# Drop geometry
school_points_rm <- school_points %>% st_drop_geometry()

# Calmatters Load In
calmatters <- read_csv("/capstone/casaschools/shiny_dashboard/data/calmatters/disasterDays.csv")

# Extreme Heat Import
extreme_heat <- read_csv("/capstone/casaschools/shiny_dashboard/data/extreme_heat/extreme_heat.csv") %>% 
  select(c(CDSCode, year, total, scenario))

extreme_heat1 <- extreme_heat %>%
  filter(CDSCode == 42767864231726)
