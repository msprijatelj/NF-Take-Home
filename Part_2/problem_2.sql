-- Create a column for each desired "bin" in the frequency distribution.
-- Ranges & columns can be adjusted as necessary.
SELECT
    COUNT(IF(num_complete = 0, 1, NULL)) AS min_0_max_0,
    COUNT(IF(num_complete >= 1 AND num_complete < 10, 1, NULL)) AS min_1_max_9,
    COUNT(IF(num_complete >= 10 AND num_complete < 100, 1, NULL)) AS min_10_max_99,
    COUNT(IF(num_complete >= 100 AND num_complete < 1000, 1, NULL)) AS min_100_max_999,
    COUNT(IF(num_complete >= 1000 AND num_complete < 10000, 1, NULL)) AS min_1000_max_9999
FROM (
    -- Assemble table of users & number of completed exercises
    SELECT
        user_id,
        COUNT(exercise_id) AS num_complete
    FROM exercises
    GROUP BY user_id
) exercise_count;
