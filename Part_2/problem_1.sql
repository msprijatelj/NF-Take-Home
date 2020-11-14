-- Use count of users & users who completed an exercise to create a completion percentage.
SELECT
    first_month,
    completed_cohort * 100 / num_users AS first_month_complete_percent
FROM (
    -- Count the number of users & number of users who completed an exercise in their cohort month.
    -- Group by month.
    SELECT
        COUNT(IF(MONTH(users.created_at) = MONTH(first_exercises.exercise_completion_date), 1, NULL)) AS completed_cohort,
        COUNT(users.user_id) AS num_users,
        MONTH(users.created_at) AS first_month
    FROM users
    LEFT JOIN (
        -- Find the earliest completed exercise date for each user.
        SELECT
            exercises.user_id,
            MIN(exercises.exercise_completion_date) AS exercise_completion_date
        FROM exercises
        GROUP BY exercises.user_id
    ) first_exercises ON users.user_id = first_exercises.user_id
    GROUP BY MONTH(users.created_at)
) first_month_complete


