-- Assumption: Providers are subsets of Organizations.
-- Assumption: The Phq9 table only has 1 entry per patient_id. Otherwise, I would use a window function for a patient's most recent entry.
SELECT
    Providers.organization_name,
    AVG(Phq9.score) AS org_avg_phq9_score
FROM Providers
LEFT JOIN Phq9 ON Providers.provider_id = Phq9.provider_id
ORDER BY AVG(Phq9.score) DESC
LIMIT 5;