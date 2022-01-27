SELECT id AS crimeId, name, surname, age, description
FROM crimes JOIN crimes_offenders ON crimes.id=crimes_offenders.crimeId
JOIN offenders ON offenders.idCardNumber=crimes_offenders.offenderId
WHERE offenders.age<18
