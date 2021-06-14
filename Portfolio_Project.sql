SELECT * FROM portfolio1.covid_deaths_modified;
select location2,date,total_cases,new_cases,total_deaths,population 
from covid_deaths_modified
order by 1,2;

-- Total Cases VS Total Deaths
-- depicts the likelihood of dying if you are affected by covid in your country

select location2,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as percent_deaths
from covid_deaths_modified
order by 1,2;

-- comparing total cases for different countries until 25_05_2021
select location2,sum(new_cases) as total_cases,sum(new_deaths) as total_deaths,
round(sum(new_deaths)/sum(new_cases)*100,2) as death_percent
from covid_deaths_modified 
where location2 not in('World','Europe','North America','South America','Asia','European Union')
group by 1
order by 3 desc;

-- Finding out countries with highest affection rate as on 25_05_2021

select location2,sum(new_cases) as total_cases,population,
round(sum(new_cases)/population*100,2) as affected_population_percent
from covid_deaths_modified 
where dea.location2 not in('World','Europe','North America','South America','Asia','European Union')
group by 1
order by 4 desc;

-- Finding out countries with maximum deaths as on 25_05_2021

select location2,population,sum(new_deaths) as total_deaths
from covid_deaths_modified 
where location2 not in('World','Europe','North America','South America','Asia','European Union')
group by 1
order by 3 desc;

-- finding Death cases Continent wise

select location2,population,sum(new_deaths) as total_deaths
from covid_deaths_modified 
where location2  in ('Europe','North America','South America','Asia','European Union')
group by 1
order by 3 desc;

-- Global numbers

select date,sum(total_cases) as total_cases,sum(total_deaths) as total_deaths
from covid_deaths_modified 
where location2 not  in ('Europe','North America','South America','Asia','European Union')
group by 1;

-- covid Vaccinations
-- Finding out number of people tested country_wise as on 25_05_2021

select dea.location2,max(vac.total_tests),dea.population,
max(vac.total_tests)/dea.population as percent_population_tested
from covid_deaths_modified dea inner join covid_vaccinations vac
on vac.location=dea.location2
where dea.location2 not in ('Europe','North America','South America','Asia','European Union')
group by 1,3;


-- Creating Views Examples
create view  global_numbers as
select date,sum(total_cases) as total_cases,sum(total_deaths) as total_deaths
from covid_deaths_modified 
where location2 not  in ('Europe','North America','South America','Asia','European Union')
group by 1;











