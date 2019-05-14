
moviedata <- read.csv("Section6-Homework-Data.csv")
moviedata <- read.csv(file.choose())
head(moviedata)

colnames(moviedata) <- c("Day.of.Week", "Director", "Genre", "Movie.Title", "Release.Date", "Studio", "AdjustedGrossMill", "BudgetMill", "GrossMill", "IMDB.Rating", "MovieLens.Rating", "OverseasMill", "Overseas", "ProfitMill", "Profit", "RuntimeMin", "USMill", "GrossUS")
head(moviedata)
str(moviedata)

#The data has over 600 entries and numerous factors of Genre and Studio. I wanted to check specific top well liked genres and some top studios, so I used filters to extract them and visualized them later.

filt <- (moviedata$Genre == "action") | (moviedata$Genre == "adventure") | (moviedata$Genre == "animation") | (moviedata$Genre == "comedy") | (moviedata$Genre == "drama")

filt2 <- (moviedata$Studio == "Buena Vista Studios") | (moviedata$Studio == "Fox") | (moviedata$Studio == "Paramount Pictures") | (moviedata$Studio == "Sony") | (moviedata$Studio == "Universal") | (moviedata$Studio == "WB")

# filt2 <- moviedata$Studio %in% C("Buena Vista Studios", "Fox",...)

moviedata2 <- moviedata[filt & filt2,] #new data I will be working on now.
head(moviedata2)

#VISUALIZATION

baseplot <- ggplot(data = moviedata2, aes(x = Genre, y = GrossUS))
baseplot

addplot <- baseplot + geom_jitter(aes(color = Studio, size = BudgetMill)) + geom_boxplot(alpha = 0.8, outlier.color = NA) 
addplot

finalplot <- addplot + ggtitle("Domestic Gross % by Genre") + xlab("Genre") + ylab("Gross % US") + theme(text = element_text(family = "Arial"), 
        axis.title.x = element_text(color = "blue", size = 20),
        axis.title.y = element_text(color = "blue", size = 20), 
        axis.text.x = element_text(size = 15), 
        axis.text.y = element_text(size = 15),
        
        plot.title = element_text(size = 30),
        
        legend.text = element_text(size = 15), 
        legend.title = element_text(size = 15))
finalplot

addplot$labels$size <- "Budget $M"
addplot
