-- Database: `web`
--
-- --------------------------------------------------------

--
-- Table structure for table `ipuserdata`
--

CREATE TABLE `ipuserdata` (
  `id` int(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `ISP` varchar(64) NOT NULL,
  `serverIpUser` varchar(64) NOT NULL,
  `lat` varchar(64) NOT NULL,
  `lon` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip_visited_test`
--

CREATE TABLE `ip_visited_test` (
  `id` int(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `server_Ip` varchar(64) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `requestdata`
--

CREATE TABLE `requestdata` (
  `REQ_username` varchar(64) CHARACTER SET utf8 NOT NULL,
  `REQ_id` int(32) NOT NULL,
  `REQ_method` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `REQ_url` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `REQ_timings` int(32) DEFAULT NULL,
  `REQ_startedDateTime` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `REQ_serverIpAddress` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `REQ_isp` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `REQ_expires` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `REQ_age` int(32) DEFAULT NULL,
  `REQ_host` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `REQ_lastModified` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `REQ_pragma` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `REQ_cacheControl` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `REQ_contentType` varchar(64) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
--
-- Table structure for table `responsedata`
--

CREATE TABLE `responsedata` (
  `RES_username` varchar(64) CHARACTER SET utf8 NOT NULL,
  `RES_id` int(32) NOT NULL,
  `RES_status` int(32) DEFAULT NULL,
  `RES_statusText` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `RES_isp` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `RES_expires` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `RES_age` int(32) DEFAULT NULL,
  `RES_host` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `RES_lastModified` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `RES_pragma` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `RES_cacheControl` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `RES_contentType` varchar(64) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `recordSum` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `lastUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(64) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `type` enum('admin','client') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

----------------------------------------------------------
--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `stats` AFTER INSERT ON `users` FOR EACH ROW BEGIN
		IF (NEW.type = 'client') THEN
        INSERT INTO statistics (recordSum, name, lastUpload) VALUES (0, NEW.username, CURRENT_DATE) ;
		END IF;
    END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ipuserdata`
--
ALTER TABLE `ipuserdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_xrhsths` (`username`);

--
-- Indexes for table `ip_visited_test`
--
ALTER TABLE `ip_visited_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipv_xrhsths` (`username`);

--
-- Indexes for table `requestdata`
--
ALTER TABLE `requestdata`
  ADD PRIMARY KEY (`REQ_id`),
  ADD KEY `req_xrhsths` (`REQ_username`);

--
-- Indexes for table `responsedata`
--
ALTER TABLE `responsedata`
  ADD PRIMARY KEY (`RES_id`),
  ADD KEY `res_xrhsths` (`RES_username`) USING BTREE;

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`recordSum`,`name`),
  ADD KEY `user` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ipuserdata`
--
ALTER TABLE `ipuserdata`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `ip_visited_test`
--
ALTER TABLE `ip_visited_test`
  MODIFY `id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4593;

--
-- AUTO_INCREMENT for table `requestdata`
--
ALTER TABLE `requestdata`
  MODIFY `REQ_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18449;

--
-- AUTO_INCREMENT for table `responsedata`
--
ALTER TABLE `responsedata`
  MODIFY `RES_id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18074;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ipuserdata`
--
ALTER TABLE `ipuserdata`
  ADD CONSTRAINT `ip_xrhsths` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ip_visited_test`
--
ALTER TABLE `ip_visited_test`
  ADD CONSTRAINT `ipv_xrhsths` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `requestdata`
--
ALTER TABLE `requestdata`
  ADD CONSTRAINT `req_xrhsths` FOREIGN KEY (`REQ_username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `responsedata`
--
ALTER TABLE `responsedata`
  ADD CONSTRAINT `xrhsths` FOREIGN KEY (`RES_username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `user` FOREIGN KEY (`name`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;