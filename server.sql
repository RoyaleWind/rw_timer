CREATE TABLE IF NOT EXISTS `rw_timer` (
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
