SELECT DISTINCT evidence.type, name, surname, idCardNumber AS offenderId, id AS crimeId
FROM investigators JOIN crimes_investigators ON investigators.idCardNumber=crimes_investigators.investigatorId
JOIN crimes ON crimes.id=crimes_investigators.crimeId
JOIN evidence ON evidence.crimeId=crimes.id
WHERE evidence.classification!='Testimonial'