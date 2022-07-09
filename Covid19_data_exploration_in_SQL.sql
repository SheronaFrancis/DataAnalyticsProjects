

-- Use the Database portfolioproject1 --
USE portfolioproject1;

-- Select everything from the First table - Coviddeaths--
SELECT * FROM coviddeaths;

-- Select everything from the second table - covidvaccinations--
SELECT * FROM covidvaccinations;


-- Select data that we are using for the Data Analysis from coviddeaths's Table--
SELECT location,date,population,total_cases,new_cases,total_deaths
FROM coviddeaths
ORDER BY 1,2;


-- Shows how Covid19 eveolved by time--
SELECT date,location,new_cases,new_deaths, (new_deaths/new_cases)*100 AS PecentageCasesOverTime
FROM coviddeaths
ORDER BY 1;


-- Total cases Vs Total deaths--
SELECT location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 AS death_percentage
FROM coviddeaths
ORDER BY 1,2;


-- Total cases Vs Population--
-- Shows what percentage of population got Covid--
SELECT location,date,total_cases,population,(total_cases/population)*100 AS PercentagePopulationInfected
FROM coviddeaths
ORDER BY 1,2;


-- Total death Vs Population--
-- Shows what percentage of Population died due to Covid --
SELECT location,date,population,total_deaths, (total_deaths/population)*100 AS Percentagedeathperpopulation
FROM coviddeaths
ORDER BY 1,2;


-- Top 10 Countries with highest Infection rate compared to the population --
SELECT location, population, MAX(total_cases) AS MaxInfectionCount, 
MAX((total_cases/population)*100) AS MaxPercentagePopulationInfected
FROM coviddeaths
GROUP BY location
ORDER BY MaxPercentagePopulationInfected DESC
LIMIT 10;


-- Top 10 Countries with highest death rate compared to the population --
SELECT location, population, MAX(total_deaths) AS MaxDeathCount, 
MAX((total_deaths/population)*100) AS MaxPercentageDeathPerPopulation
FROM coviddeaths
GROUP BY location
ORDER BY MaxPercentageDeathPerPopulation DESC
LIMIT 10;

-- Golbal Count--
-- Continents with the highest death count based on population--
SELECT continent, population, MAX(total_deaths) AS MaxDeathCountincontinent, 
MAX((total_deaths/population)*100) AS MaxDeathPercentagePerPopulationbycontinent
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY MaxDeathPercentagePerPopulationbycontinent DESC;


-- Golabl count of Total cases and Total deaths across the world--
SELECT SUM(new_cases) AS GlobalCovid19cases, SUM(new_deaths) AS GlobalCovid19Deaths, (SUM(new_deaths)/SUM(new_cases))*100 AS GolbalDeathPercentage
FROM coviddeaths
WHERE continent IS NOT NULL;


-- Select data that we are using for the Data Analysis from covidvaccinations' Table--
SELECT location,date,new_tests,total_vaccinations,people_vaccinated,new_vaccinations
FROM covidvaccinations
ORDER BY 1,2;


-- Showing all the details about Covid cases, deaths and Vaccinations---
SELECT * FROM coviddeaths dea
JOIN covidvaccinations vac
WHERE dea.date = vac.date 
AND dea.location = vac.location;


-- Looking at accumulation of vaccination based on date and location--
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM coviddeaths dea
JOIN covidvaccinations vac
ON dea.date = vac.date AND dea.location = vac.location
WHERE dea.continent IS NOT NULL;








































