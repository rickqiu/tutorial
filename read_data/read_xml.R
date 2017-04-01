#download.file("http://www.jaredlander.com/data/SocialComments.xml", destfile ="data/SocialComments.xml")

teaFile <- "http://www.jaredlander.com/data/SocialComments.xml"
require(XML)
teaParsed  <- xmlToList(teaFile)
length(teaParsed)
str(teaParsed)
teaParsed[[1]][[1]]$id
teaParsed[[1]][[1]]$author$name
teaParsed[[1]][[1]]$published
teaParsed[[1]][[1]]$content$.attrs
teaParsed[[1]][[1]]$content$.attrs[["sentimentScore"]]