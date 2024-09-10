SELECT type_desc, COUNT(*) AS cnt
FROM sys.objects
GROUP BY type_desc
ORDER BY cnt DESC;
