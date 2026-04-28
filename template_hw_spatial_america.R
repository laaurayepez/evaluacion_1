rm(list = ls())
#setwd("")

gpklink="america_3857.gpkg"

library(sf)
map1=read_sf(gpklink, layer = "population_ddm")

library(ggplot2)
map1gg=ggplot() + theme_bw() + geom_sf(data = map1,color='pink')

map1gg

saveRDS(map1gg,file='map1.rds')

map2a = read_sf(gpklink, layer = "population_psm")
map2b = read_sf(gpklink, layer = "outlier_population_psm")
map2c = read_sf(gpklink, layer = "no_outlier_population_psm")

map2gg = ggplot() +
  theme_void() +
  geom_sf(data = map2c, aes(size = size), color = "green") +   # base
  geom_sf(data = map2a, aes(size = size), color = "blue") +     # población
  geom_sf(data = map2b, aes(size = size), color = "yellow")        # outliers

map2gg

saveRDS(map2gg,file='map2.rds')

map3=read_sf(gpklink, layer = "continent")

map3gg=ggplot() + theme_void() + geom_sf(data = map3,
                                         aes(fill=as.ordered(mobiles_density_FJ5_cat)))
map3gg

saveRDS(map3gg,file='map3.rds')
