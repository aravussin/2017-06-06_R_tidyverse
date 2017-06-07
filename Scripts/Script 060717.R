x <- 5 * 6
x

is_vector(x)
length(x)

x[2] <- 31
x


x[5]<-44
x

x <- 1:4


y <- x^2

z <- vector(mode= mode (X), length= length(x))
for(i in seq_along(x)) 
  
  
x <- 1:5
y <- 3:7

x+y

z <- y[-5]

x+z

mod <- lm(lifeExp ~ gdpPercap, data= gapminder_plus)
mod
str(mod)

mod$df.residual

str(mod[[8]])

str(mod$qr$qr)



gapminder_plus %>% group_by(continent) %>% 
  summarise(mean_le=mean(lifeExp), 
            min_le = min(lifeExp), 
            max_le = max(lifeExp))
 
gapminder_plus %>% 
  ggplot()+
  geom_line(mapping=aes(x=year, y=lifeExp, color=continent, group=country))+
  geom_smooth(mapping=aes(x=year, y=lifeExp), method= "lm", color="black")+
  facet_wrap(~continent)

by_country <- gapminder_plus %>% group_by(continent, country) %>% 
  nest()

by_country$data[[1]]

library(purrr)
#map(list, function)

map(1:3, sqrt)

by_country %>% 
  mutate(model=map(data,~lm(lifeExp~year, data=.x)))

by_country %>% 
  mutate(model=purrr::map(data, ~lm(lifeExp~year, data=.x))) %>% 
  mutate(summr=map(model, broom::glance)) %>% 
  unnest(summr) %>% arrange(r.squared) %>% 
  ggplot()+
  geom_jitter(mapping=aes(continent, y=r.squared))


by_country %>% 
  mutate(model=purrr::map(data, ~lm(lifeExp~year, data=.x))) %>% 
  mutate(summr=map(model, broom::glance)) %>% 
  unnest(summr) %>% arrange(r.squared) %>% filter(r.squared<0.3)%>%
  select(country) %>% left_join(gapminder_plus) %>% 
ggplot()+
  geom_line(mapping=aes(x=year, y=lifeExp, color=country, group=country))+
  theme_light()

by_country %>% 
  mutate(model=purrr::map(data, ~lm(lifeExp~year, data=.x))) %>% 
  mutate(summr=map(model, broom::glance)) %>% 
  unnest(summr) %>% arrange(r.squared) %>% filter(r.squared<1)%>%
  select(country) %>% left_join(gapminder_plus) %>% 
ggplot() +
  geom_point(mapping = aes(x = log(gdpPercap), y = lifeExp, color= continent))+
  geom_smooth(mapping=aes(x=log(gdpPercap), y=lifeExp), method= "lm", color="black")

###Lifeexp~gdpPercap

by_country %>% 
  mutate(model=purrr::map(data, ~lm(lifeExp~log(gdpPercap), data=.x))) %>% 
  mutate(summr=map(model, broom::glance)) %>% 
  unnest(summr) %>% arrange(r.squared) %>% filter(r.squared<0.05)%>%
  select(country) %>% left_join(gapminder_plus) %>% 
  ggplot() +
  geom_point(mapping = aes(x = log(gdpPercap), y = lifeExp, color= country))+
  geom_smooth(mapping=aes(x=log(gdpPercap), y=lifeExp), method= "lm", color="black")





model_by_country

model_by_country$summr[[1]]


saveRDS(by_country, "by_country_tibble.rds")


my_fresh_by_country <- readRDS("by_country_tibble.rds")

my_fresh_by_country


write_csv(gapminder_plus, "gapminder_plus_for_professor.csv")

