-- MotoGP : tous les GP ont un sprint le samedi
UPDATE races SET type = 'sprint_weekend' WHERE series_id = 'MotoGP';

-- F1 : marquer les 6 week-ends sprint
UPDATE races SET type = 'sprint_weekend' WHERE series_id = 'F1' AND round IN (2, 4, 5, 9, 12, 16);
