UPDATE movies
SET rank = ts_rank(lexemesSummary,plainto_tsquery(
(
SELECT Summary FROM movies WHERE url='star-wars-episode-v---the-empire-strikes-back'
)
));
CREATE TABLE recommendationsBasedOnEmpire AS SELECT url, rank FROM movies WHERE rank > 0.99 ORDER BY rank DESC LIMIT 50;
\copy (SELECT * FROM recommendationsBasedOnEmpire) to '/home/pi/RSL/top50recommendationsEmpire.csv' WITH csv;