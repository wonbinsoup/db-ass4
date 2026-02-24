SELECT DISTINCT ar.Name AS ArtistName
FROM artists ar
JOIN albums al ON ar.ArtistId = al.ArtistId
JOIN tracks t ON al.AlbumId = t.AlbumId
JOIN media_types mt ON t.MediaTypeId = mt.MediaTypeId
JOIN playlist_track pt ON t.TrackId = pt.TrackId
JOIN playlists p ON pt.PlaylistId = p.PlaylistId
WHERE LOWER(mt.Name) LIKE '%mpeg%'
  AND p.Name IN ('Brazilian Music', 'Grunge')
  AND ar.Name IS NOT NULL;
