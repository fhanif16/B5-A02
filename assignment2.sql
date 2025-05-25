
SELECT current_database();
create table rangers (
    ranger_id serial PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL
)

create table species (
    species_id serial PRIMARY KEY,
    common_name VARCHAR (50) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date TIMESTAMP NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);

create table sightings(
    sighting_id serial PRIMARY KEY,
    ranger_id INT  REFERENCES rangers (ranger_id),
    species_id INT REFERENCES species (species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(50) NOT NULL,
    notes Text
);

insert into  rangers (name, region) values 
('Alice Green' , 'Northern Hills'),
('Bob White' , 'River Delta'),
('Carol King' , 'Mountain Range')

select * from rangers;
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status)
VALUES 
    ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
    ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
    ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
    ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

select * from species;
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes)
VALUES
    (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
    (2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
    (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
    (1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

select * from sightings;

-- Question 1
insert into rangers (name , region ) values ('Derek Fox' , 'Coastal Plains')

-- question 2
select count (DISTINCT species_id) as unique_species_count from sightings;



-- question 3
select * from sightings where location Like '%Pass%';

-- question 4
select name, count(*) as total_sightings from sightings
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
group BY name;

-- questino 5
select common_name from species
where NOT EXISTS (
    select * from sightings where sightings.species_id = species.species_id
);

-- question 6
select sp.common_name, sighting_time ,r.name
from sightings as s
JOIN species as sp ON sp.species_id = s.species_id
JOIN rangers as r ON r.ranger_id = s.ranger_id
ORDER BY sighting_time desc
LIMIT 2;

-- question 7
Update species
set conservation_status = 'Historic' 
WHERE discovery_date < '1800-01-01'

-- question 8
select  sighting_id, 
CASE 
when EXTRACT(HOUR FROM sighting_time ) < 12 Then 'Morning'
when EXTRACT(HOUR FROM sighting_time ) BETWEEN 12 and 17 Then 'Afternoon'
ELSE 'Evening'
END as time_of_day
from sightings



-- question 9
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT ranger_id FROM sightings);



