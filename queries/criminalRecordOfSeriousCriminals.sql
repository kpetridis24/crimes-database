SELECT idCardNumber AS offenderId, name, surname, sentences.type AS conviction, sentences.date, sentences.penalty
FROM offenders JOIN crimes_offenders ON offenders.idCardNumber=crimes_offenders.offenderId
JOIN crimes ON crimes.id=crimes_offenders.crimeId
JOIN sentences ON sentences.offenderId=offenders.idCardNumber
WHERE crimes.type='Felony' OR crimes.type='Misdemeanor'