-- Plane RL training database schema (MySQL 8.0).
-- Applied automatically on first container start via compose volume mount, or manually (see README).

CREATE DATABASE IF NOT EXISTS plane
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE plane;

CREATE TABLE learning_data (
  event_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  run_id INT UNSIGNED NOT NULL,
  episode_id INT UNSIGNED NOT NULL,
  step INT UNSIGNED NOT NULL,
  state JSON NULL,
  action TINYINT UNSIGNED NOT NULL,
  reward DOUBLE NOT NULL,
  recorded_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (event_id),
  KEY idx_learning_data_run_episode_step (run_id, episode_id, step),
  KEY idx_learning_data_run_recorded (run_id, recorded_at),
  CONSTRAINT chk_learning_data_state_json CHECK (state IS NULL OR JSON_VALID(state))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE hyperparameters (
  hp_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  run_id INT UNSIGNED NOT NULL,
  algorithm VARCHAR(128) NOT NULL,
  learning_rate DOUBLE NOT NULL,
  gamma DOUBLE NOT NULL,
  epsilon DOUBLE NOT NULL,
  seed BIGINT UNSIGNED NOT NULL,
  recorded_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (hp_id),
  UNIQUE KEY uq_hyperparameters_run_recorded (run_id, recorded_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
