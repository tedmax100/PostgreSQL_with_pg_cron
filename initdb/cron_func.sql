SELECT cron.schedule(
    'hourly-bond-trading',  -- 任務名稱
    '1 * * * *',            -- 每小時第1分鐘執行
    $$SELECT schedule_trading_view_task()$$
);