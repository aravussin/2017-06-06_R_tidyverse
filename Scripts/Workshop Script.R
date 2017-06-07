# Not considered as imput, simly anotations. Below is to load the tidyverse package

library("tidyverse")

gapminder <- read_csv(file = "Data/gapminder-FiveYearData.csv")

gapminder

ggplot(data = gapminder) +
  geom_point(mapping = aes(x = gdpPercap, y = lifeExp))

ggplot(data = gapminder) +
  geom_jitter(mapping = aes(x = gdpPercap, y = lifeExp, color= continent))

ggplot(data = gapminder) +
  geom_point(mapping = aes(x = log(gdpPercap), y = lifeExp,
                           color= continent, size= pop))


ggplot(data = gapminder) +
  geom_point(mapping = aes(x = log(gdpPercap), y = lifeExp),
             alpha=0.1, size=2, color= "blue")

ggplot(data = gapminder) +
  geom_line(mapping = aes(x = year, y = lifeExp, 
                          group=country, color= continent))

ggplot(data = gapminder) +
  geom_boxplot(mapping = aes(x = continent, y = lifeExp))

ggplot(data = gapminder) +
  geom_jitter(mapping=aes(x = continent, y = lifeExp, color=continent))+
  geom_boxplot(mapping = aes(x = continent, y = lifeExp, color=continent))

ggplot(data = gapminder, mapping=aes(x = continent, y = lifeExp, color=continent))+
  geom_jitter()+
  geom_boxplot()


ggplot(data = gapminder, 
       mapping=aes(x = log(gdpPercap), y = lifeExp, color=continent)) +
  geom_jitter(alpha=0.2)+
  geom_smooth(method="lm")

ggplot(data = gapminder, 
       mapping=aes(x = log(gdpPercap), y = lifeExp)) +
  geom_jitter(mapping=aes(color=continent), alpha=0.2)+
  geom_smooth(method="lm")

ggplot(data = gapminder) +
  geom_boxplot(mapping = aes(x = continent, as.character(year), y = lifeExp))

ggplot(data = gapminder) +
  geom_boxplot(mapping = aes(x =  as.character(year), y = lifeExp))

ggplot(data = gapminder) +
  geom_boxplot(mapping = aes(x = as.character(year), y = log(gdpPercap)))

ggplot(data = gapminder) +
  geom_density_2d(mapping = aes(x = lifeExp, y = log(gdpPercap), color=continent, alpha=0.5))

ggplot(data = gapminder, mapping = aes(x=gdpPercap, y = lifeExp)) +
  geom_point()+
  geom_smooth(color="yellow", method= "lm")+
  scale_x_log10()+
  facet_wrap(~ continent)

#FACET_WRAP splits the data into seperate graphs Geom_smooth creates mean line.... method "lm" makes linear line of best fit

ggplot(data = gapminder, mapping = aes(x=gdpPercap, y = lifeExp)) +
  geom_point()+
  geom_smooth(color="Red", method= "lm")+
  scale_x_log10()+
  facet_wrap(~ year)

filter(gapminder, year==2007, continent=="Oceania")

ggplot(data=filter(gapminder, year==2007, continent=="Oceania"))+
  geom_bar(mapping=aes(x=country, y=pop), stat="identity")

ggplot(data=filter(gapminder, year==2007, continent=="Asia"))+
  geom_bar(mapping=aes(x=country, y=pop), stat="identity")

ggplot(data=filter(gapminder, year==2007, continent=="Asia"))+
  geom_bar(mapping=aes(x=country, y=pop), stat="identity")+
  coord_flip()
# COORD_FLIP flips the X and Y axes


ggplot(data = gapminder, mapping = aes(x=gdpPercap, y = lifeExp, color=continent, size=pop/10^6, alpha=0.1)) +
  geom_point()+
  scale_x_log10()+
  facet_wrap(~ year)+
  labs(title="How old you will be when you die vs How much money you have", 
       subtitle="In the last 50 years,life expectancy has improved most countries",x="GDP per capita (USD)",
       y="Life Expectancy", color="Continent", size="Population in Millions")

#labs====labels on the graphs


ggsave("my_fancy_plot.png")

















