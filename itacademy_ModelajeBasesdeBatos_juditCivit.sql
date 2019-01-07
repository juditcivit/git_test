/*USFLIGHTS EXERCICE*/

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

/* 4.Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). 
Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat. */
USE usairlineflights;
SELECT b.City, Year, Month, AVG(ArrDelay)
FROM flight a
INNER JOIN airport b
ON b.iata=a.origin
GROUP BY City, Year, Month
ORDER BY City ASC;

/* 5.Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa consulta que abans i amb el mateix ordre). 
Però a més, ara volen que en comptes del codi de l’aeroport es mostri el nom de la ciutat. */
USE usairlineflights;
SELECT b.City, Year, Month, AVG(ArrDelay)
FROM flight a
INNER JOIN airport b
ON b.iata=a.origin
GROUP BY City, Year, Month
ORDER BY City ASC;

/* 6.Les companyies amb més vols cancelats. 
A més, han d’estar ordenades de forma que les companyies amb més cancelacions apareguin les primeres.*/
USE usairlineflights;
SELECT UniqueCarrier, COUNT(Cancelled)
FROM flight a
WHERE Cancelled=1
GROUP BY UniqueCarrier
ORDER BY COUNT(Cancelled) DESC;

/* 7.L’identificador dels 10 avions que més distància han recorregut fent vols.*/
USE usairlineflights;
SELECT TailNum, SUM(Distance)
FROM flight
WHERE TailNum!="NA"
GROUP BY TailNum
ORDER BY SUM(Distance)
DESC LIMIT 10;

/* 8.Companyies amb el seu retard promig només d’aquelles les quals els seus vols arriben 
al seu destí amb un retràs promig major de 10 minuts.*/
USE usairlineflights;
SELECT UniqueCarrier, AVG(ArrDelay)
FROM flight
where ArrDelay > 10
GROUP BY UniqueCarrier, ArrDelay
ORDER BY AVG(ArrDelay);