if(!file.exists("./data")) {dir.create("./data")} ## OK funciona
## Probar en casa el ownload.file
download.file(file_url, destfile="./data/activity.zip")
pa_data <- read.csv("./activity.csv") OK funciona
