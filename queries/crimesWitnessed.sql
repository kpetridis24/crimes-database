SELECT id AS crimeId, crimes.description, evidence.description
FROM crimes JOIN evidence ON crimes.id=evidence.crimeId
WHERE evidence.classification='Testimonial'