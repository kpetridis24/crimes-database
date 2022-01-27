SELECT id AS crimeId, weaponSerialNumber, evidence.type
FROM crimes JOIN evidence ON crimes.id=evidence.crimeId AND evidence.type='DNA'
JOIN 
(SELECT crimeId, weaponSerialNumber, weapons.name
FROM crimes JOIN crimes_weapons ON crimes.id=crimes_weapons.crimeId
JOIN weapons ON crimes_weapons.weaponSerialNumber=weapons.serialNumber
WHERE weapons.ammunition IS NOT NULL) AS T ON crimes.id=T.crimeId