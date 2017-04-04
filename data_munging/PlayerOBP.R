# 1. Calculate Player's OBP
# OBP = (H + BB + HBP) / (AB + BB + HBP + SF)
# H = Hits, BB = Bases on Balls (Walks) , HBP = Times Hit by Pitch, AB = At Bats, SF = Sacrifice Flies
require(plyr)
data("baseball")
head(baseball)

baseball$sf[baseball$year < 1954] <- 0
any(is.na(baseball$sf))

baseball$hbp[is.na(baseball$hbp)] <- 0
any(is.na(baseball$hbp))

baseball <- baseball[baseball$ab >= 50, ]

baseball$OBP <- with(baseball, (h + bb + hbp) / (ab + bb + hbp + sf))
tail(baseball)

obp <- function(data)
{
  c(OBP = with(data, sum(h + bb + hbp) / sum(ab + bb + hbp + sf)))
}

careerOBP <- ddply(baseball, .variables = "id", obp)
head(careerOBP)

careerOBP <- careerOBP[order(careerOBP$OBP, decreasing=TRUE), ]
head(careerOBP)