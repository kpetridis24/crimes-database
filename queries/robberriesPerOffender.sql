SELECT idCardNumber AS offenderId, name, surname, count(type) AS robberies
FROM offenders JOIN sentences ON sentences.type='robbery' AND offenders.idCardNumber=sentences.offenderId
GROUP BY idCardNumber