SELECT investigatorId, name, surname, count(crimeId) AS crimesSolved
FROM crimes JOIN crimes_investigators ON crimes.id=crimes_investigators.crimeId
JOIN investigators ON investigators.idCardNumber=crimes_investigators.investigatorId
WHERE crimes.isSolved=1 
GROUP BY investigatorId