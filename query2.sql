SELECT al.Title AS AlbumTitle, ar.Name AS ArtistName
FROM albums al
JOIN artists ar ON al.ArtistId = ar.ArtistId
WHERE al.Title IS NOT NULL AND ar.Name IS NOT NULL;
