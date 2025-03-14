# PostgreSQL 15 with pg_cron Example

This project provides a ready-to-use example of PostgreSQL 15 with the pg_cron extension, which allows you to schedule PostgreSQL commands directly within your database.

## Overview

This setup includes:
- PostgreSQL 15 (Bookworm-based image)
- pg_cron extension for scheduling database jobs
- A sample scheduled task that runs hourly

## Prerequisites

- Docker
- Docker Compose

## Quick Start

1. Clone this repository
2. Run the following command:

```bash
docker compose up -d
```

3. Connect to the PostgreSQL database:

```bash
psql -h localhost -p 5434 -U postgres -d postgres
```

Password: `qwer1234`

## Project Structure

- `Dockerfile`: Custom PostgreSQL image with pg_cron installed
- `docker-compose.yaml`: Configuration for the PostgreSQL service
- `initdb/init.sql`: Initializes the pg_cron extension
- `initdb/cron_func.sql`: Sets up a sample scheduled task

## Scheduled Tasks

The project includes a sample scheduled task:

- **Task Name**: hourly-bond-trading
- **Schedule**: Runs at the first minute of every hour (`1 * * * *`)
- **Action**: Calls the `schedule_trading_view_task()` function

You can view scheduled tasks with:

```sql
SELECT * FROM cron.job;
```

## Adding Custom Tasks

To add your own scheduled tasks, you can use the `cron.schedule` function:

```sql
SELECT cron.schedule(
    'job_name',
    'cron_schedule',
    $$SQL_COMMAND_TO_EXECUTE$$
);
```

Example scheduling formats:
- `* * * * *` = run every minute
- `*/5 * * * *` = run every 5 minutes
- `0 * * * *` = run every hour
- `0 0 * * *` = run every day at midnight

## Configuration

The pg_cron extension is configured with the following options:

- `shared_preload_libraries=pg_cron`: Loads the pg_cron extension
- `cron.database_name=postgres`: Specifies which database to use for the pg_cron metadata tables
- `cron.log_run=on`: Enables logging of job execution

## Port Mapping

The PostgreSQL server is exposed on port `5434` on the host, which maps to the standard port `5432` inside the container.

## Connection Information

- **Host**: localhost
- **Port**: 5434
- **Username**: postgres
- **Password**: qwer1234
- **Database**: postgres

---

# PostgreSQL 15 搭配 pg_cron 範例

這個專案提供了一個可直接使用的 PostgreSQL 15 搭配 pg_cron 擴展的範例，讓您能夠直接在資料庫中排程 PostgreSQL 命令。

## 概述

此設置包含：
- PostgreSQL 15 (基於 Bookworm 映像)
- pg_cron 擴展，用於排程資料庫任務
- 一個每小時執行的範例排程任務

## 前置條件

- Docker
- Docker Compose

## 快速開始

1. 複製此存儲庫
2. 執行以下命令：

```bash
docker compose up -d
```

3. 連接到 PostgreSQL 資料庫：

```bash
psql -h localhost -p 5434 -U postgres -d postgres
```

密碼：`qwer1234`

## 專案結構

- `Dockerfile`：安裝了 pg_cron 的自訂 PostgreSQL 映像
- `docker-compose.yaml`：PostgreSQL 服務的配置
- `initdb/init.sql`：初始化 pg_cron 擴展
- `initdb/cron_func.sql`：設置範例排程任務

## 排程任務

此專案包含一個範例排程任務：

- **任務名稱**：hourly-bond-trading
- **排程**：每小時的第 1 分鐘執行 (`1 * * * *`)
- **動作**：呼叫 `schedule_trading_view_task()` 函數

您可以使用以下指令查看排程任務：

```sql
SELECT * FROM cron.job;
```

## 新增自訂任務

要新增自己的排程任務，可以使用 `cron.schedule` 函數：

```sql
SELECT cron.schedule(
    '任務名稱',
    'cron排程格式',
    $$要執行的SQL命令$$
);
```

排程格式範例：
- `* * * * *` = 每分鐘執行
- `*/5 * * * *` = 每 5 分鐘執行
- `0 * * * *` = 每小時執行
- `0 0 * * *` = 每天午夜執行

## 配置

pg_cron 擴展配置了以下選項：

- `shared_preload_libraries=pg_cron`：載入 pg_cron 擴展
- `cron.database_name=postgres`：指定用於 pg_cron 元數據表的資料庫
- `cron.log_run=on`：啟用任務執行日誌

## 連接埠映射

PostgreSQL 伺服器在主機上的 `5434` 連接埠公開，該連接埠映射到容器內的標準連接埠 `5432`。

## 連接資訊

- **主機**：localhost
- **連接埠**：5434
- **使用者名稱**：postgres
- **密碼**：qwer1234
- **資料庫**：postgres