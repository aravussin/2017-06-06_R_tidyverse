gapminder <- read_csv("Data/gapminder-FiveYearData.csv")

#rep==== repeat

rep("This is an example", times=3)
"This is an exmpl" %>% rep(times=3)

year_country_gdp <- select(gapminder, year, country, gdpPercap)
head(year_country_gdp)

year_country_gdp <- gapminder %>% select(year, country, gdpPercap)
head(year_country_gdp)

gapminder %>% 
  filter(year==2002) %>% 
  ggplot(mapping = aes(x=continent, y=pop))+
  geom_boxplot()+
  labs(y="Population")

year_country_gdp_euro <- gapminder %>% 
  filter(continent=="Europe") %>% 
  select(year, country, gdpPercap)
head(year_country_gdp_euro)

gapminder %>% 
  filter(country=="Norway") %>% 
  ggplot(mapping = aes(x=as.character(year), y=gdpPercap))+
  geom_boxplot()+
  labs(y="GDP per Capita")

country_lifeExp_Norway <- gapminder %>% 
  filter(country=="Norway") %>% 
  select(year, lifeExp, gdpPercap)
country_lifeExp_Norway


gapminder %>% 
  group_by(continent)

gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap))

gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap)) %>% 
  ggplot(mapping = aes(x=continent, y=mean_gdpPercap))+
  geom_point()

gapminder %>%
  filter(continent=="Asia") %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp=mean(lifeExp)) %>% 
  filter(mean_lifeExp==min(mean_lifeExp)|mean_lifeExp==max(mean_lifeExp))

gapminder %>%
  filter(continent=="Asia") %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp=mean(lifeExp)) %>% 
  filter(mean_lifeExp==min(mean_lifeExp)|mean_lifeExp==max(mean_lifeExp)) %>% 
  ggplot(data=gapminder)+
  geom_point(mapping = aes(x=country, y=mean_lifeExp))+
  geom_point(mapping=aes(c)+
  
  coord_flip()

  gapminder %>% 
    mutate(gdp_billion=gdpPercap*pop/10^9) %>% 
    head(
  
  gapminder %>% 
    mutate(gdp_billion=gdpPercap*pop/10^9) %>% 
    group_by(continent, year) %>%
    summarize(mean_gdp_billion=mean(gdp_billion))
  
  gapminder_country_summary <- gapminder %>% 
    group_by(country) %>% 
    summarize(mean_lifeExp = mean(lifeExp))
  
  library(maps)
  map_data("world")  %>% 
  rename(country=region) %>% 
  left_join(gapminder_country_summary, by="country") %>% 
  ggplot()+
  geom_polygon(aes(x=long,y=lat,group=group,fill = mean_lifeExp))+
  scale_fill_gradient(low="Yellow", high="Black")+
    coord_equal()
  
  
  
  
  
  