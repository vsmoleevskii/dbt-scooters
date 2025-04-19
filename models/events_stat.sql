SELECT
    ROUND(
        COALESCE(
            SUM(CASE WHEN "type" = 'cancel_search' THEN 1 ELSE 0 END) * 1.0
            / NULLIF(SUM(CASE WHEN "type" = 'start_search' THEN 1 ELSE 0 END), 0),
            0
        ),
        2
    ) AS cancel_pct
FROM
    {{ ref("events_full") }}
