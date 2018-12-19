/* 1.Quantitat de registres de la taula de vols: */
SELECT count(*) FROM usairlineflights.flight;

/* 2.Retard promig de sortida i arribada segons l’aeroport origen. */
SELECT Origin, AVG(ArrDelay), AVG(DepDelay)
FROM usairlineflights.flight
GROUP BY Origin;

/* 3.Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen. */
SELECT Origin, Year, Month, AVG(ArrDelay)
FROM usairlineflights.flight
GROUP BY Origin, Year, Month
ORDER BY Origin ASC;

/* 3.Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). 
Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat. */


