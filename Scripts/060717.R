download.file(url = "https://raw.githubusercontent.com/dmi3kno/SWC-tidyverse/master/data/gapminder_plus.csv", 
              destfile = "Data/gapminder_plus.csv")
library("tidyverse")

gapminder_plus <- read_csv(file = "Data/gapminder_plus.csv")

gapminder_plus

#  = is an assignment operator and == is equals to <=less than and equal and >= more than and equal

gapminder_plus %>%
  filter(continent=="Africa", year==2007) %>% 
  mutate(babiesdead= infantMort * pop / 1000) %>%
  filter(babiesdead > 2000000) %>% 
  select(country) %>% 
  
  left_join(gapminder_plus) %>% 
  mutate(babiesdead= infantMort * pop / 1000) %>% 
  mutate(gdp_billion=gdpPercap*pop/10^9) %>%
  mutate(Popmillion=pop/10^6) %>% 
  select(-c(continent, pop, babiesdead) ) %>% 
  gather(key= variables ,value= values, -c(country, year)) %>% 
 
  ggplot() +
  geom_text(data=. %>% filter(year==2007) %>% group_by(variables) %>% 
            mutate(max_value=max(values)) %>% 
            filter(values ==max_value), 
            aes(x=year, y=values, label=country, color=country))+
  geom_line(mapping = aes(x=year, y=values, color=country))+
  facet_wrap(~variables, scales="free_y")+
  labs(x="YEAR", title= "COUNTRIES WHO'S BABIES DIE A LOT",  y=NULL)+
  theme_dark()+
  theme(legend.position ="none")

# everything that is piped goes next or into . 
  