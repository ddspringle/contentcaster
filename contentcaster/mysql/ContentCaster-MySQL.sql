-- phpMyAdmin SQL Dump
-- version 2.9.1.1
-- http://www.phpmyadmin.net
-- 
-- Host: 10.6.166.65
-- Generation Time: Oct 08, 2008 at 09:12 PM
-- Server version: 5.0.67
-- PHP Version: 4.4.4
-- 
-- Database: `ccaster`
-- 
CREATE DATABASE `ccaster` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ccaster`;

-- --------------------------------------------------------

-- 
-- Table structure for table `a_categorybase`
-- 

CREATE TABLE `a_categorybase` (
  `ucid` varchar(36) collate utf8_bin NOT NULL,
  `uuid` varchar(36) collate utf8_bin NOT NULL,
  `categoryName` varchar(255) collate utf8_bin NOT NULL,
  `categoryId` varchar(255) collate utf8_bin NOT NULL,
  `categoryDesc` text collate utf8_bin,
  `addedOn` date NOT NULL,
  `archived` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ucid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Dumping data for table `a_categorybase`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `a_categoryschedule`
-- 

CREATE TABLE `a_categoryschedule` (
  `uschedid` varchar(36) collate utf8_bin NOT NULL,
  `ucid` varchar(36) collate utf8_bin NOT NULL,
  `contentId` int(10) unsigned NOT NULL,
  `runDate` datetime NOT NULL,
  PRIMARY KEY  (`uschedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Dumping data for table `a_categoryschedule`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `a_contentbase`
-- 

CREATE TABLE `a_contentbase` (
  `contentId` int(10) unsigned NOT NULL,  
  `contentName` varchar(255) collate utf8_bin NOT NULL,
  `ucid` varchar(36) collate utf8_bin NOT NULL,
  `filename` varchar(255) collate utf8_bin NOT NULL,
  `addDate` date NOT NULL,
  `totalViews` int(10) unsigned NOT NULL default '0',
  `urecid` varchar(36) collate utf8_bin NOT NULL,
  `mimeType` varchar(255) collate utf8_bin default NULL,
  `isBinaryFile` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  USING BTREE (`urecid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Dumping data for table `a_contentbase`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `a_contentlog`
-- 

CREATE TABLE `a_contentlog` (
  `uslid` varchar(36) collate utf8_bin NOT NULL,
  `ucid` varchar(36) collate utf8_bin NOT NULL,
  `contentId` varchar(36) collate utf8_bin NOT NULL,
  `viewHostIP` varchar(255) collate utf8_bin NOT NULL,
  `viewReferer` varchar(255) collate utf8_bin NOT NULL,
  `viewDate` datetime NOT NULL,
  PRIMARY KEY  (`uslid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Dumping data for table `a_contentlog`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `a_defaultcategoryschedule`
-- 

CREATE TABLE `a_defaultcategoryschedule` (
  `udefid` varchar(36) collate utf8_bin NOT NULL,
  `ucid` varchar(36) collate utf8_bin NOT NULL,
  `runDate` datetime NOT NULL,
  PRIMARY KEY  (`udefid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Dumping data for table `a_defaultcategoryschedule`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `a_mimetypes`
-- 

CREATE TABLE `a_mimetypes` (
  `umimeid` varchar(36) collate utf8_bin NOT NULL,
  `fileExt` varchar(10) collate utf8_bin NOT NULL,
  `extLen` int(10) unsigned NOT NULL,
  `mimeType` varchar(255) collate utf8_bin NOT NULL,
  `contentType` tinyint(4) NOT NULL default '0',
  `iconFile` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`umimeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Dumping data for table `a_mimetypes`
-- 

INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('DA048FCD-EC36-BE32-A4C828A6BA00C999', 'wmv', 3, 'video/x-ms-wmv', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('DA079934-0E88-E9FF-8AC7C85B1AC8F405', 'wvx', 3, 'video/x-ms-wvx', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('DA07D7BD-0EEB-F579-A3D9B22636B5A3A6', 'wm', 2, 'video/x-ms-wm', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('DA08DEFE-CD14-9E26-956E1BE95AFB0A18', 'wmx', 3, 'video/x-ms-wmx', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('DA090C18-E070-F87A-F028F94E0F991F35', 'wma', 3, 'audio/x-ms-wma', 7, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('DA10EC09-E598-A136-DF53BA02342A1305 ', 'flv', 3, 'video/x-flv', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8001-CF17-F492-DCB4A299A59FA73E', '3dm', 3, 'x-world/x-3dmf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8030-CF17-F492-DBFC0B5D70480180', '3dmf', 4, 'x-world/x-3dmf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE805F-CF17-F492-D83DC874F0578E8D', 'a', 1, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE808E-CF17-F492-D903DF676691B349', 'aab', 3, 'application/x-authorware-bin', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE80BD-CF17-F492-DCF7ED9FC44B9C59', 'aam', 3, 'application/x-authorware-map', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE80EC-CF17-F492-D2132BA3A150104F', 'aas', 3, 'application/x-authorware-seg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE811B-CF17-F492-D02400A0660FE014', 'abc', 3, 'text/vnd.abc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8149-CF17-F492-D6DAF511ED30EB17', 'acgi', 4, 'text/html', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8178-CF17-F492-D4BDBCE78B0F490E', 'afl', 3, 'video/animaflex', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8198-CF17-F492-D158EBDB90F1D049', 'ai', 2, 'application/postscript', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE81F5-CF17-F492-DA8B1CFD022FDBB4', 'aif', 3, 'audio/x-aiff', 8, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8253-CF17-F492-DBFDE4785A0E7D1D', 'aifc', 4, 'audio/x-aiff', 8, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE82B1-CF17-F492-DB07B9056E6FEC12', 'aiff', 4, 'audio/x-aiff', 8, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE82E0-CF17-F492-D45E34E89FFEDAF9', 'aim', 3, 'application/x-aim', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE830F-CF17-F492-D28D33E139A50BBC', 'aip', 3, 'text/x-audiosoft-intra', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE833D-CF17-F492-D8EC1308ED4A1F42', 'ani', 3, 'application/x-navi-animation', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE836C-CF17-F492-DF5827CAFFA4B1FB', 'aos', 3, 'application/x-nokia-9000-communicator-add-on-software', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE83AB-CF17-F492-D5E4652B4E1B5C83', 'aps', 3, 'application/mime', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE83DA-CF17-F492-DC23B4780B84BA09', 'arc', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE83F9-CF17-F492-DBF5F583B63CCE17', 'arj', 3, 'application/arj', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8457-CF17-F492-D69EA678CA89260E', 'art', 3, 'image/x-jg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8486-CF17-F492-D0062997E04DD955', 'asf', 3, 'video/x-ms-asf', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE84B4-CF17-F492-DBD7D413839EB54A', 'asm', 3, 'text/x-asm', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE84E3-CF17-F492-D141BF92EFB6B181', 'asp', 3, 'text/asp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8541-CF17-F492-D2D522476E6AFC1E', 'asx', 3, 'video/x-ms-asf', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE859F-CF17-F492-D6669422507AFD92', 'au', 2, 'audio/basic', 9, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE861C-CF17-F492-D98145DD17213599', 'avi', 3, 'video/x-msvideo', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE86A8-CF17-F492-D0534855D71FF9F9', 'avs', 3, 'video/avs-video', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE86D7-CF17-F492-D2BFB2D84EF3E03E', 'bcpio', 5, 'application/x-bcpio', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8774-CF17-F492-DC0556A79F9F93A3', 'bin', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8800-CF17-F492-DBD78EB9BA192A36', 'bm', 2, 'image/bmp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE882F-CF17-F492-DC23086E5DB371CD', 'bmp', 3, 'image/bmp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE887D-CF17-F492-D98DF58EA728B1FF', 'boo', 3, 'application/book', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE889C-CF17-F492-D4C32E3BE77D98FD', 'book', 4, 'application/book', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE88CB-CF17-F492-DD8E48DB0319B528', 'boz', 3, 'application/x-bzip2', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE88FA-CF17-F492-D4965603F5C03AC6', 'bsh', 3, 'application/x-bsh', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8929-CF17-F492-D0DA2C79587DD7C2', 'bz', 2, 'application/x-bzip', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8958-CF17-F492-D47DB4E3B9485A88', 'bz2', 3, 'application/x-bzip2', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8987-CF17-F492-D81C311CD6D8301C', 'c', 1, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE89E5-CF17-F492-DF4E92E5F9018415', 'c++', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8A42-CF17-F492-D126BEA239E5434B', 'cc', 2, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8A90-CF17-F492-DA9384DC638F2395', 'ccad', 4, 'application/clariscad', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8ABF-CF17-F492-D0A83D5FF1EF5B6C', 'cco', 3, 'application/x-cocoa', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8B4C-CF17-F492-DADEFBD643031116', 'cdf', 3, 'application/x-netcdf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8B9A-CF17-F492-D254BFA84B398908', 'cer', 3, 'application/pkix-cert', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8BF8-CF17-F492-D51A9E794A9BE535', 'cha', 3, 'application/x-chat', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8C27-CF17-F492-DA1BC817FA0DAACF', 'chat', 4, 'application/x-chat', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8CD3-CF17-F492-DA0FEA699E136311', 'com', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8D21-CF17-F492-DA92B182AF88EE9B', 'conf', 4, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8D50-CF17-F492-D7582F1ADCEABAE7', 'cpio', 4, 'application/x-cpio', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8D7E-CF17-F492-D7F7014C2EC32414', 'cpp', 3, 'text/x-c', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8DAD-CF17-F492-D72631A687E555B1', 'cpt', 3, 'application/mac-compactpro', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8E78-CF17-F492-DD220AD973547D54', 'crl', 3, 'application/pkix-crl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8EA7-CF17-F492-DCE153943CA34C18', 'crt', 3, 'application/pkix-cert', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8F24-CF17-F492-D8B8848DF9BFC6D2', 'csh', 3, 'application/x-csh', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8FD0-CF17-F492-D00E9A3128DCFBE0', 'css', 3, 'text/css', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE8FFF-CF17-F492-DB73600AFCF27A94', 'cxx', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE902E-CF17-F492-D958F08E3C2FF96A', 'dcr', 3, 'application/x-director', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE905D-CF17-F492-D2BAFA8A681F33D9', 'deepv', 5, 'application/x-deepv', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE908C-CF17-F492-D08E98A4A88B76C4', 'def', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE90BB-CF17-F492-DB88D7A8393774EF', 'der', 3, 'application/x-x509-ca-cert', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE90E9-CF17-F492-D9D65413D1FDAF0E', 'dif', 3, 'video/x-dv', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9109-CF17-F492-DA12E967D7B4D746', 'dir', 3, 'application/x-director', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9138-CF17-F492-DCB867F5D110BEE3', 'dl', 2, 'video/dl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE91A5-CF17-F492-D621C6603395416F', 'doc', 3, 'application/msword', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE91D4-CF17-F492-DE5DC5904747DA7F', 'dot', 3, 'application/msword', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9203-CF17-F492-D7F2F30BA4093B2E', 'dp', 2, 'application/commonground', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9222-CF17-F492-D3445A14060E9380', 'drw', 3, 'application/drafting', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9251-CF17-F492-D77EDDA7F983F83F', 'dump', 4, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9280-CF17-F492-DF24A99AA8EF302B', 'dv', 2, 'video/x-dv', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE92AF-CF17-F492-D2B6659A54DB7DE1', 'dvi', 3, 'application/x-dvi', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE930C-CF17-F492-D9D30135E859F59A', 'dwf', 3, 'model/vnd.dwf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE937A-CF17-F492-D8D0259356FF30B0', 'dwg', 3, 'image/vnd.dwg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9406-CF17-F492-D2B82472A7932E66', 'dxf', 3, 'image/vnd.dwg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9464-CF17-F492-D56023DA3B42A930', 'dxr', 3, 'application/x-director', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9493-CF17-F492-DEC83BFBBBB014B6', 'el', 2, 'text/x-scriptelisp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9500-CF17-F492-D4C2F533A6221381', 'elc', 3, 'application/x-elc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9520-CF17-F492-DFC9754ACB717F29', 'env', 3, 'application/x-envoy', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE955E-CF17-F492-D93B1C2730F66539', 'eps', 3, 'application/postscript', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE958D-CF17-F492-D9512B71D41B23DF', 'es', 2, 'application/x-esrehber', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE95AC-CF17-F492-DDB2E4CF17D5A5D0', 'etx', 3, 'text/x-setext', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE95DB-CF17-F492-DB00469F882A245F', 'evy', 3, 'application/envoy', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9639-CF17-F492-DD7A1212C6C64AC9', 'exe', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9668-CF17-F492-D35B0A3B82E1D5D4', 'f', 1, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE96C5-CF17-F492-D4EC0207B58FEBB3', 'f77', 3, 'text/x-fortran', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE96F4-CF17-F492-D1CB40F4A7E3B075', 'f90', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9781-CF17-F492-D048E5E7773952AC', 'fdf', 3, 'application/vnd.fdf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE97EE-CF17-F492-DCD2263B2837D4DD', 'fif', 3, 'image/fif', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE981D-CF17-F492-D59F50A5D8F7CDBE', 'fli', 3, 'video/fli', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE986B-CF17-F492-D25AD9F92334D5EF', 'flo', 3, 'image/florian', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE989A-CF17-F492-DC4F4DA2924F7A49', 'flx', 3, 'text/vnd.fmiflexstor', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE98C9-CF17-F492-DED514A55A4BCA5E', 'fmf', 3, 'video/x-atomic3d-feature', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE98F8-CF17-F492-D2FFC1F2E2996DDB', 'for', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9956-CF17-F492-DF119CD2EAB214F8', 'fpx', 3, 'image/vnd.fpx', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE99A4-CF17-F492-D681230B9E773649', 'frl', 3, 'application/freeloader', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE99D3-CF17-F492-D21D3B52736C9465', 'funk', 4, 'audio/make', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9A02-CF17-F492-D4BD2858DE122AE4', 'g', 1, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9A21-CF17-F492-DF4D0A0222735F2A', 'g3', 2, 'image/g3fax', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9A50-CF17-F492-DF14B9B1CB2983B9', 'gif', 3, 'image/gif', 1, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9A6F-CF17-F492-D5A9CCB07C8D7B4F', 'gl', 2, 'video/gl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9ADC-CF17-F492-D3D0AEFFF0BFAFFE', 'gsd', 3, 'audio/x-gsm', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9B2A-CF17-F492-DAB0CD3811EBFC6B', 'gsm', 3, 'audio/x-gsm', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9B59-CF17-F492-DC0EACBE1371FA54', 'gsp', 3, 'application/x-gsp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9B88-CF17-F492-D9F82A6536F32F37', 'gss', 3, 'application/x-gss', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9BB7-CF17-F492-D9E22E0EEB5D6D86', 'gtar', 4, 'application/x-gtar', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9C05-CF17-F492-D79B4E8D3FCB9A82', 'gz', 2, 'application/x-gzip', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9C34-CF17-F492-D62F0763991A250A', 'gzip', 4, 'application/x-gzip', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9C82-CF17-F492-D0ECA53F46BD0406', 'h', 1, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9CE0-CF17-F492-D2C1B741EBC0A0D0', 'hdf', 3, 'application/x-hdf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9D1E-CF17-F492-D6B42A422066505A', 'help', 4, 'application/x-helpfile', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9D4D-CF17-F492-DD105E1E13A9598B', 'hgl', 3, 'application/vnd.hp-hpgl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9D7C-CF17-F492-DC5FEF475A878CEF', 'hh', 2, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9DEA-CF17-F492-D41681B09BA4FEF3', 'hlb', 3, 'text/x-script', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9E86-CF17-F492-D9D34F5E6C6CC068', 'hpg', 3, 'application/vnd.hp-hpgl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9EB5-CF17-F492-D658ABE46C3F4C7C', 'hpgl', 4, 'application/vnd.hp-hpgl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBE9F8F-CF17-F492-DE6A0F5519242D6B', 'hqx', 3, 'application/mac-binhex40', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA01C-CF17-F492-DB6E5C6AB3B1EF44', 'hta', 3, 'application/hta', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA04B-CF17-F492-DE7833935B3240CB', 'htc', 3, 'text/x-component', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA06A-CF17-F492-D846BF30ABBC54A2', 'htm', 3, 'text/html', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA099-CF17-F492-DB223425C12379B6', 'html', 4, 'text/html', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA0C8-CF17-F492-DD04350BC7AB462B', 'htmls', 5, 'text/html', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA0F7-CF17-F492-DBF3B4B8BBC88D28', 'htt', 3, 'text/webviewhtml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA116-CF17-F492-DB7A9390BAE86871', 'htx', 3, 'text/html', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA145-CF17-F492-D5C4691851C58CDB', 'ice', 3, 'x-conference/x-cooltalk', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA174-CF17-F492-D80DB5B9A7470375', 'ico', 3, 'image/x-icon', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA1A3-CF17-F492-DC1E70A1C90737C5', 'idc', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA1D2-CF17-F492-DA28FC98216A3992', 'ief', 3, 'image/ief', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA200-CF17-F492-DD698E8443A64873', 'iefs', 4, 'image/ief', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA22F-CF17-F492-DD18DA1918F4A8F9', 'iges', 4, 'application/iges', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA29D-CF17-F492-DAEA1B659C465844', 'igs', 3, 'application/iges', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA31A-CF17-F492-DBC892B2C4B13162', 'ima', 3, 'application/x-ima', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA349-CF17-F492-D1E9E0F32DC7325C', 'imap', 4, 'application/x-httpd-imap', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA377-CF17-F492-DFDF837B1B7D8E1F', 'inf', 3, 'application/inf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA3E5-CF17-F492-DF7C3378455A68AC', 'ip', 2, 'application/x-ip2', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA414-CF17-F492-D86B01EFD15B7AEF', 'isu', 3, 'video/x-isvideo', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA433-CF17-F492-DEB2E20273DCB86F', 'it', 2, 'audio/it', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA462-CF17-F492-D771776206558DD9', 'iv', 2, 'application/x-inventor', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA491-CF17-F492-DD024789CD32CD1E', 'ivr', 3, 'i-world/i-vrml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA4C0-CF17-F492-D2EEA6A247541F7A', 'ivy', 3, 'application/x-livescreen', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA4EE-CF17-F492-D286CD7C42A359B9', 'jam', 3, 'audio/x-jam', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA55C-CF17-F492-DC34F68B5D118204', 'jav', 3, 'text/x-java-source', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA5BA-CF17-F492-DF0BF238AAA59FB8', 'java', 4, 'text/x-java-source', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA5E8-CF17-F492-DD6021B887D7219E', 'jcm', 3, 'application/x-java-commerce', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA617-CF17-F492-D59F1477711CD126', 'jfif', 4, 'image/jpeg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA675-CF17-F492-D365E53600F91B83', 'jfif-tbnl', 9, 'image/jpeg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA6A4-CF17-F492-D413304F20263751', 'jpe', 3, 'image/jpeg', 1, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA702-CF17-F492-DD858112FDC9723B', 'jpeg', 4, 'image/jpeg', 1, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA76F-CF17-F492-D396D4B73E7EE096', 'jpg', 3, 'image/jpeg', 1, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA81B-CF17-F492-D5CC721CB76911E4', 'jps', 3, 'image/x-jps', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA84A-CF17-F492-DFD307092F3FC2BB', 'js', 2, 'application/x-javascript', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA879-CF17-F492-D8C6F985CA73F883', 'jut', 3, 'image/jutvision', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA8A8-CF17-F492-D2532C7C8E3568AB', 'kar', 3, 'audio/midi', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA905-CF17-F492-DA0EC1600A77A975', 'ksh', 3, 'application/x-ksh', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA953-CF17-F492-D5127308BD39E07F', 'la', 2, 'audio/nspaudio', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA9B1-CF17-F492-D57D7B21A738FF9D', 'lam', 3, 'audio/x-liveaudio', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEA9E0-CF17-F492-D4D2EB8585B927CE', 'latex', 5, 'application/x-latex', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAA2E-CF17-F492-DF7968658D189EC8', 'lha', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAAEA-CF17-F492-DFEB241EE5D67334', 'lhx', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAB19-CF17-F492-D60BEBF481881E1F', 'list', 4, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAB76-CF17-F492-DF0F6F712364C477', 'lma', 3, 'audio/x-nspaudio', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEABA5-CF17-F492-D734BCB57EDFFBED', 'log', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEABC4-CF17-F492-DD5B912876D71904', 'lsp', 3, 'application/x-lisp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAC22-CF17-F492-DABA41A29BBC7EF8', 'lst', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAC70-CF17-F492-D41F801C6998DF26', 'ltx', 3, 'application/x-latex', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAC9F-CF17-F492-D7E7D206F09E1D9A', 'lzh', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAD2C-CF17-F492-D2B22F39DDF93E13', 'lzx', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAD99-CF17-F492-DA647C91D2D4F337', 'm', 1, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEADF7-CF17-F492-DFB168408E72663D', 'm1v', 3, 'video/mpeg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAE26-CF17-F492-D04FB2B0CEC90207', 'm2a', 3, 'audio/mpeg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAE55-CF17-F492-D487F056AE372711', 'm2v', 3, 'video/mpeg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAEA3-CF17-F492-D916D8C8ABE32107', 'm3u', 3, 'audio/x-mpequrl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAED2-CF17-F492-DF523715877007AE', 'man', 3, 'application/x-troff-man', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAEF1-CF17-F492-D36D3E2A36808D96', 'map', 3, 'application/x-navimap', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAF20-CF17-F492-DDEBA211221F502E', 'mar', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAF5E-CF17-F492-D22BBD184D6F6392', 'mbd', 3, 'application/mbedlet', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAF8D-CF17-F492-D7BDAE587706824C', 'mc$', 3, 'application/x-magic-cap-package-10', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEAFBC-CF17-F492-DE02AAA95E69ADB6', 'mcd', 3, 'application/mcad', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB049-CF17-F492-DD3782D694CBD587', 'mcf', 3, 'text/mcf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB078-CF17-F492-D2740E6F64C82EF9', 'mcp', 3, 'application/netmc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB0A6-CF17-F492-D8778529607274CB', 'me', 2, 'application/x-troff-me', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB0C6-CF17-F492-DEDB75013F21E801', 'mht', 3, 'message/rfc822', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB0F5-CF17-F492-D7864827D0D70522', 'mhtml', 5, 'message/rfc822', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB162-CF17-F492-D285363BABE8AE88', 'mid', 3, 'audio/midi', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB2AA-CF17-F492-DD35AE957D377C7C', 'midi', 4, 'audio/midi', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB3E3-CF17-F492-D3B6298712A8ED45', 'mime', 4, 'message/rfc822', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB440-CF17-F492-DEC06452D3BC736C', 'mjf', 3, 'audio/x-vnd.audioexplosionmjuicemediafile', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB46F-CF17-F492-D11143DDD54B2BF9', 'mjpg', 4, 'video/x-motion-jpeg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB4AE-CF17-F492-DF93E505426DF142', 'mm', 2, 'application/base64', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB50B-CF17-F492-D5445D8D705E5BAD', 'mme', 3, 'application/base64', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB52B-CF17-F492-D242C2E76477D542', 'mod', 3, 'audio/mod', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB5B7-CF17-F492-D4A06DC435F57FC6', 'mov', 3, 'video/quicktime', 3, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB5E6-CF17-F492-D56A933D7584D7E9', 'movie', 5, 'video/x-sgi-movie', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB615-CF17-F492-DC891C0FCA139489', 'mp2', 3, 'audio/mpeg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB951-CF17-F492-D2A3D325C5AB36A5', 'mpa', 3, 'audio/mpeg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB9AF-CF17-F492-DB173CFC8028F203', 'mpc', 3, 'application/x-project', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEB9DE-CF17-F492-D5AD4B32FA71C37F', 'mpe', 3, 'video/mpeg', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBA0D-CF17-F492-D5606AD5B662244C', 'mpeg', 4, 'video/mpeg', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBAA9-CF17-F492-D3032FF9C20503D1', 'mpg', 3, 'video/mpeg', 2, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBAD8-CF17-F492-D1BD24F5A58D0F90', 'mpga', 4, 'audio/mpeg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBB36-CF17-F492-D5D0DE7CD4A451AC', 'mpt', 3, 'application/x-project', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBB55-CF17-F492-D691B0299439D843', 'mpv', 3, 'application/x-project', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBB84-CF17-F492-D716B46652889A8E', 'mpx', 3, 'application/x-project', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBBB3-CF17-F492-DBE6A0F8CEC138EA', 'mrc', 3, 'application/marc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBBD2-CF17-F492-D6A17A21B68C4142', 'ms', 2, 'application/x-troff-ms', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBC10-CF17-F492-D8006ABCA7B9F420', 'mv', 2, 'video/x-sgi-movie', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBC3F-CF17-F492-DD96F8C9387C46C1', 'my', 2, 'audio/make', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBC6E-CF17-F492-D1956DB90AED65A9', 'mzz', 3, 'application/x-vnd.audioexplosionmzz', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBC9D-CF17-F492-DFF9CE52CD5BD00E', 'nap', 3, 'image/naplps', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBCCC-CF17-F492-DE4FB304F6ED90F4', 'naplps', 6, 'image/naplps', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBCFB-CF17-F492-DF52371332FAB8FD', 'nc', 2, 'application/x-netcdf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBD2A-CF17-F492-D74A93712C8A7303', 'ncm', 3, 'application/vnd.nokiaconfiguration-message', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBD58-CF17-F492-D2B601C4A42B68CF', 'nif', 3, 'image/x-niff', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBD87-CF17-F492-D8542B6C3F74C9BB', 'niff', 4, 'image/x-niff', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBDB6-CF17-F492-D9CD553281884C46', 'nix', 3, 'application/x-mix-transfer', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBDE5-CF17-F492-D65DD03049D3CA7D', 'nsc', 3, 'application/x-conference', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBE04-CF17-F492-DDF99143237BA45C', 'nvd', 3, 'application/x-navidoc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBE52-CF17-F492-DAD3BF21A005CBE9', 'o', 1, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBE81-CF17-F492-D537B81E193F292F', 'oda', 3, 'application/oda', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBEB0-CF17-F492-D6F5020DB7A68DA4', 'omc', 3, 'application/x-omc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBEDF-CF17-F492-DACBDFB2B15FA335', 'omcd', 4, 'application/x-omcdatamaker', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBF0E-CF17-F492-D5BB0CCDF930B00D', 'omcr', 4, 'application/x-omcregerator', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBF3D-CF17-F492-D577D7667BC18A68', 'p', 1, 'text/x-pascal', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBF6C-CF17-F492-D62DF505185BAEBC', 'p10', 3, 'application/pkcs10', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEBFC9-CF17-F492-D64633DEBE303C55', 'p12', 3, 'application/pkcs-12', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC018-CF17-F492-DE7BD75E3BEF94AB', 'p7a', 3, 'application/x-pkcs7-signature', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC046-CF17-F492-D14A7BAB31BD16AB', 'p7c', 3, 'application/pkcs7-mime', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC0A4-CF17-F492-D353FFC23B021AAD', 'p7m', 3, 'application/pkcs7-mime', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC102-CF17-F492-D20932E0BA57963D', 'p7r', 3, 'application/x-pkcs7-certreqresp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC16F-CF17-F492-D210428E736D8869', 'part', 4, 'application/pro_eng', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC19E-CF17-F492-D3DEEAA51118AF7B', 'pas', 3, 'text/pascal', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC1BD-CF17-F492-D36A6B15A1C16D3A', 'pbm', 3, 'image/x-portable-bitmap', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC1EC-CF17-F492-DA77A908FD25314A', 'pcl', 3, 'application/vnd.hp-pcl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC25A-CF17-F492-DCF3E8C0A88288D9', 'pct', 3, 'image/x-pict', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC289-CF17-F492-D23381DCEFCCA029', 'pcx', 3, 'image/x-pcx', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC2B7-CF17-F492-D0ED580C8CDC99AC', 'pdb', 3, 'chemical/x-pdb', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC2E6-CF17-F492-DA5A5C5950373C42', 'pdf', 3, 'application/pdf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC344-CF17-F492-D7A356133845BD4B', 'pfunk', 5, 'audio/makemyfunk', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC373-CF17-F492-D773D799FB79C26A', 'pgm', 3, 'image/x-portable-graymap', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC3D1-CF17-F492-D7FD3B778F3596D4', 'pic', 3, 'image/pict', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC400-CF17-F492-DF85449545B16D21', 'pict', 4, 'image/pict', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC42E-CF17-F492-D81BDB5BA887E9A9', 'pkg', 3, 'application/x-newton-compatible-pkg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC44E-CF17-F492-DA4FB5A0D24534F3', 'pko', 3, 'application/vnd.ms-pkipko', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC47D-CF17-F492-DA8F595EB3B87C9C', 'pl', 2, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC4EA-CF17-F492-D30545FB34F20011', 'plx', 3, 'application/x-pixclscript', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC538-CF17-F492-D660A5AD0059610F', 'pm', 2, 'text/x-scriptperl-module', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC567-CF17-F492-D2B871A394F9D8FE', 'pm4', 3, 'application/x-pagemaker', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC5A5-CF17-F492-DA443F7DC4B183AC', 'pm5', 3, 'application/x-pagemaker', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC5D4-CF17-F492-D90CB9FEDF372550', 'png', 3, 'image/png', 1, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC642-CF17-F492-D7DC238CF82DD168', 'pnm', 3, 'image/x-portable-anymap', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC6BF-CF17-F492-D5F330DB00E846AB', 'pov', 3, 'model/x-pov', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC6EE-CF17-F492-D7B2B3CA7B3AD445', 'ppa', 3, 'application/vnd.ms-powerpoint', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC71C-CF17-F492-DF6AC81F8FE7EEC4', 'ppm', 3, 'image/x-portable-pixmap', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC865-CF17-F492-D199D36A0B350D83', 'ppz', 3, 'application/mspowerpoint', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC893-CF17-F492-D421CCB995A9805F', 'pre', 3, 'application/x-freelance', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC8C2-CF17-F492-D36AB420FCEB321F', 'prt', 3, 'application/pro_eng', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC8E2-CF17-F492-D737DD4558A31A09', 'ps', 2, 'application/postscript', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC910-CF17-F492-DB6E548A30111092', 'psd', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC94F-CF17-F492-DDD8DFC26828795A', 'pvu', 3, 'paleovu/x-pv', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC97E-CF17-F492-DAC62BE0F60ADF3F', 'pwz', 3, 'application/vnd.ms-powerpoint', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEC9AD-CF17-F492-D96220D7868B7C28', 'py', 2, 'text/x-scriptphyton', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECA0A-CF17-F492-D984CE3AF352724B', 'pyc', 3, 'applicaiton/x-bytecodepython', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECA49-CF17-F492-DE2A8A29EFA4E1E6', 'qcp', 3, 'audio/vnd.qcelp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECA78-CF17-F492-DF6716408A06737A', 'qd3', 3, 'x-world/x-3dmf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECAA7-CF17-F492-D3477E89E9454DD5', 'qd3d', 4, 'x-world/x-3dmf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECAC6-CF17-F492-D8E7CBAD35B9D1CD', 'qif', 3, 'image/x-quicktime', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECAF5-CF17-F492-DCD7B2C10317149F', 'qt', 2, 'video/quicktime', 3, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECB24-CF17-F492-DDE7ED242390529F', 'qtc', 3, 'video/x-qtc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECB62-CF17-F492-D3BB1DDA9108A765', 'qti', 3, 'image/x-quicktime', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECBA1-CF17-F492-DA44A26F5A201BD1', 'qtif', 4, 'image/x-quicktime', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECBD0-CF17-F492-DE790AE659780534', 'ra', 2, 'audio/x-pn-realaudio', 6, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECC5C-CF17-F492-DAE962BF1467BCD5', 'ram', 3, 'audio/x-pn-realaudio', 6, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECCE9-CF17-F492-D2FA46004DA67531', 'ras', 3, 'image/x-cmu-raster', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECD18-CF17-F492-D5675554C64400B6', 'rast', 4, 'image/cmu-raster', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECD47-CF17-F492-DA27843D35103BEB', 'rexx', 4, 'text/x-scriptrexx', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECD66-CF17-F492-DFD08C2173EE7BA0', 'rf', 2, 'image/vnd.rn-realflash', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECD95-CF17-F492-D6165D3F69CF43BF', 'rgb', 3, 'image/x-rgb', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECE21-CF17-F492-DAFBE9BD6C13FC3C', 'rm', 2, 'audio/x-pn-realaudio', 6, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECE60-CF17-F492-D5DDB8E9A0B47358', 'rmi', 3, 'audio/mid', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECECD-CF17-F492-DC65EDD8FCDD8241', 'rmm', 3, 'audio/x-pn-realaudio', 6, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECF2B-CF17-F492-D6E2AA973BD3D193', 'rmp', 3, 'audio/x-pn-realaudio', 6, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBECF89-CF17-F492-D0620D9561DC1293', 'rng', 3, 'application/ringing-tones', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED044-CF17-F492-DC46D54A7DB5274B', 'rnx', 3, 'application/vnd.rn-realplayer', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED083-CF17-F492-D6F56B2C64D43B28', 'roff', 4, 'application/x-troff', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED0A2-CF17-F492-DD642B29A405C868', 'rp', 2, 'image/vnd.rn-realpix', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED0D1-CF17-F492-D9A94600BF305E15', 'rpm', 3, 'audio/x-pn-realaudio-plugin', 6, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED100-CF17-F492-D91FCC329C47548E', 'rt', 2, 'text/richtext', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED238-CF17-F492-D517D07DF124F663', 'rtx', 3, 'text/richtext', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED257-CF17-F492-DB25D13B8A27B7A3', 'rv', 2, 'video/vnd.rn-realvideo', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED296-CF17-F492-D3407440244087D4', 's', 1, 'text/x-asm', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED2B5-CF17-F492-D5BF92BF437BF02D', 's3m', 3, 'audio/s3m', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED2E4-CF17-F492-D502C068A0FEE182', 'saveme', 6, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED303-CF17-F492-D4B8ACB938D9A094', 'sbk', 3, 'application/x-tbook', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED342-CF17-F492-D5BA11036B032F4C', 'scm', 3, 'application/x-lotusscreencam', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED3FD-CF17-F492-D0F1762BB3A869F3', 'sdml', 4, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED42C-CF17-F492-D1647BA9BB6800D3', 'sdp', 3, 'application/sdp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED48A-CF17-F492-D8FACBD5D58A1ECD', 'sdr', 3, 'application/sounder', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED4A9-CF17-F492-D944B6828282DFD0', 'sea', 3, 'application/sea', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED507-CF17-F492-D00A097B4E0DEEB5', 'set', 3, 'application/set', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED5B3-CF17-F492-D1F17D581C427A2E', 'sgml', 4, 'text/sgml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED6AD-CF17-F492-DBF4B5A050088FA2', 'sh', 2, 'text/x-scriptsh', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED6DC-CF17-F492-D8CE0FA004B17524', 'shar', 4, 'application/x-bsh', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED72A-CF17-F492-D0CCB3D480E21319', 'shtml', 5, 'text/html', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED797-CF17-F492-DE1B2F1AFC9401BA', 'sid', 3, 'audio/x-psid', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED7F5-CF17-F492-D3F8A885A14A5319', 'sit', 3, 'application/x-stuffit', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED824-CF17-F492-D4F1F0801BD5F6FB', 'skd', 3, 'application/x-koan', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED853-CF17-F492-D1A80FA8B00F87FA', 'skm', 3, 'application/x-koan', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED882-CF17-F492-D335C2A8B5023AB8', 'skp', 3, 'application/x-koan', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED8B0-CF17-F492-D6783829EA0118F9', 'skt', 3, 'application/x-koan', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED8DF-CF17-F492-D5049916ECF1484C', 'sl', 2, 'application/x-seelogo', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED90E-CF17-F492-DD4D5D2888BD861E', 'smi', 3, 'application/smil', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED93D-CF17-F492-D1F525FFF0045DB4', 'smil', 4, 'application/smil', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED96C-CF17-F492-D1B1140E2A820C45', 'snd', 3, 'audio/basic', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBED9E9-CF17-F492-D7AB619CD8F5EC8A', 'sol', 3, 'application/solids', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDA18-CF17-F492-D5D9157A6F2B2B89', 'spc', 3, 'application/x-pkcs7-certificates', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDAA4-CF17-F492-DFA77C1DF5D4BF98', 'spr', 3, 'application/x-sprite', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDAD3-CF17-F492-D1944A225F5BC466', 'sprite', 6, 'application/x-sprite', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDB02-CF17-F492-D88D678955E53A68', 'src', 3, 'application/x-wais-source', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDB31-CF17-F492-D80F474B2B1FDEA7', 'ssi', 3, 'text/x-server-parsed-html', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDB60-CF17-F492-DF473C434467FFC2', 'ssm', 3, 'application/streamingmedia', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDBAE-CF17-F492-D455ED508F8F191D', 'step', 4, 'application/step', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDBED-CF17-F492-D58F5D0270576BA9', 'stl', 3, 'application/sla', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDC79-CF17-F492-D11E4DF26D752130', 'stp', 3, 'application/step', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDCA8-CF17-F492-DE21CE9F9C113DA7', 'sv4cpio', 7, 'application/x-sv4cpio', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDCD7-CF17-F492-D38909E8762B1065', 'sv4crc', 6, 'application/x-sv4crc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDD15-CF17-F492-DF33ADEC717D8494', 'svf', 3, 'image/vnd.dwg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDD92-CF17-F492-D31390C27CA25935', 'svr', 3, 'application/x-world', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDDF0-CF17-F492-D322D28C1F89967A', 'swf', 3, 'application/x-shockwave-flash', 4, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDE1F-CF17-F492-DFA4C2E6EA00EE78', 't', 1, 'application/x-troff', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDE4E-CF17-F492-DD38F4C0BFF00E17', 'talk', 4, 'text/x-speech', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDE8C-CF17-F492-D739450FB992540E', 'tar', 3, 'application/x-tar', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDEEA-CF17-F492-D34629599D98A8EA', 'tbk', 3, 'application/x-tbook', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDF58-CF17-F492-D97819D49D511829', 'tcl', 3, 'text/x-scripttcl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDF77-CF17-F492-DD2A355E7D7CF834', 'tcsh', 4, 'text/x-scripttcsh', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDFA6-CF17-F492-DAAE55504FC0E6D8', 'tex', 3, 'application/x-tex', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEDFD5-CF17-F492-DD17164338898C60', 'texi', 4, 'application/x-texinfo', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE003-CF17-F492-D77D848190C2FECD', 'texinfo', 7, 'application/x-texinfo', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE061-CF17-F492-D1E55EF9EF5D3CF0', 'text', 4, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE0CF-CF17-F492-D1E7722ADF3E0358', 'tgz', 3, 'application/x-compressed', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE0FD-CF17-F492-DB059DA635BFBA50', 'tif', 3, 'image/tiff', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE18A-CF17-F492-D7B19C39E6469B97', 'tiff', 4, 'image/tiff', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE1E8-CF17-F492-DDB053D0BADA04FA', 'tr', 2, 'application/x-troff', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE217-CF17-F492-D00AB6FF33F3CF08', 'tsi', 3, 'audio/tsp-audio', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE265-CF17-F492-DC73EC0C3B386D1C', 'tsp', 3, 'audio/tsplayer', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE294-CF17-F492-DFA072976266A5CD', 'tsv', 3, 'text/tab-separated-values', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE2C3-CF17-F492-DED6F071C426B2F2', 'turbot', 6, 'image/florian', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE2F1-CF17-F492-D1A0AB8D118F6703', 'txt', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE330-CF17-F492-D98303FCDB8D03C6', 'uil', 3, 'text/x-uil', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE35F-CF17-F492-D0DACA5B6B0E0696', 'uni', 3, 'text/uri-list', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE38E-CF17-F492-DF48B896731DB86A', 'unis', 4, 'text/uri-list', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE3BD-CF17-F492-DB38F1A7BBF199CC', 'unv', 3, 'application/i-deas', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE3EB-CF17-F492-D71921323645A2F5', 'uri', 3, 'text/uri-list', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE41A-CF17-F492-D0F78EA91DA6D1A0', 'uris', 4, 'text/uri-list', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE449-CF17-F492-D7CF1D2285DB43DE', 'ustar', 5, 'application/x-ustar', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE4D6-CF17-F492-DDF17460701C07A4', 'uu', 2, 'text/x-uuencode', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE505-CF17-F492-D8C6F12B64204E18', 'uue', 3, 'text/x-uuencode', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE553-CF17-F492-D9399F7CF929E2FD', 'vcd', 3, 'application/x-cdlink', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE591-CF17-F492-DB752DE60AE57AD6', 'vcs', 3, 'text/x-vcalendar', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE5B1-CF17-F492-DC28CC3A0A83B16C', 'vda', 3, 'application/vda', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE5EF-CF17-F492-D29BD75946BA8CF5', 'vdo', 3, 'video/vdo', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE61E-CF17-F492-DE8C2589B13D30C7', 'vew', 3, 'application/groupwise', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE67C-CF17-F492-D44DCEE512760CB1', 'viv', 3, 'video/vnd.vivo', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE6CA-CF17-F492-D564C934629D5E54', 'vivo', 4, 'video/vnd.vivo', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE6F9-CF17-F492-D9B9EA900C765C7D', 'vmd', 3, 'application/vocaltec-media-desc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE728-CF17-F492-DEF89BB4A7E049DE', 'vmf', 3, 'application/vocaltec-media-file', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE747-CF17-F492-D086479177AF1789', 'voc', 3, 'audio/voc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE7B4-CF17-F492-D17201676A99E2E2', 'vos', 3, 'video/vosaic', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE7E3-CF17-F492-D78DB58E6CFD284C', 'vox', 3, 'audio/voxware', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE812-CF17-F492-D9499AD8D2E99ADA', 'vqe', 3, 'audio/x-twinvq-plugin', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE841-CF17-F492-DDC2E1BC740A6834', 'vqf', 3, 'audio/x-twinvq', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE870-CF17-F492-DDB360EA7779F653', 'vql', 3, 'audio/x-twinvq-plugin', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE8CD-CF17-F492-D66F7E1ED6229C26', 'vrml', 4, 'model/vrml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE92B-CF17-F492-D5F9EA5AAA00AC2C', 'vrt', 3, 'x-world/x-vrt', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE95A-CF17-F492-DA56EA89764C5FDD', 'vsd', 3, 'application/x-visio', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE989-CF17-F492-D8002685A963894B', 'vst', 3, 'application/x-visio', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE9A8-CF17-F492-D0C5C8C1A7BDACFA', 'vsw', 3, 'application/x-visio', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEE9D7-CF17-F492-DF4A242C03C506D9', 'w60', 3, 'application/wordperfect60', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEA06-CF17-F492-D46EF2B7732938C7', 'w61', 3, 'application/wordperfect61', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEA35-CF17-F492-DDD63C691E13A97B', 'w6w', 3, 'application/msword', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEA73-CF17-F492-D7FB2406CAEB4E6C', 'wav', 3, 'audio/wav', 7, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEAD1-CF17-F492-DA9259F5787E400C', 'wb1', 3, 'application/x-qpro', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEAF0-CF17-F492-D2858214C9B8A7BD', 'wbmp', 4, 'image/vnd.wapwbmp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEB1F-CF17-F492-D150C468902F5620', 'web', 3, 'application/vnd.xara', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEB4E-CF17-F492-DAFCBB9A00AC370D', 'wiz', 3, 'application/msword', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEB6D-CF17-F492-D4DC6021709247F5', 'wk1', 3, 'application/x-123', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEC87-CF17-F492-D999B7C53225F134', 'word', 4, 'application/msword', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEECB5-CF17-F492-D36379C2F6F10474', 'wp', 2, 'application/wordperfect', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEECE4-CF17-F492-D45F80A12CC5BBBB', 'wp5', 3, 'application/wordperfect', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEED42-CF17-F492-DABE315B09DD9F1D', 'wp6', 3, 'application/wordperfect', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEED71-CF17-F492-D4BC0F30EDA64628', 'wpd', 3, 'application/wordperfect', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEDBF-CF17-F492-D2FBD1F278CF3F0B', 'wq1', 3, 'application/x-lotus', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEE8A-CF17-F492-D13EAAFCFCC902D0', 'wrl', 3, 'model/vrml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEEE8-CF17-F492-DDBD6F22245441C1', 'wrz', 3, 'model/vrml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEF55-CF17-F492-D7A91D48AEB5EBE4', 'wsc', 3, 'text/scriplet', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEF75-CF17-F492-D8020D0668A66107', 'wsrc', 4, 'application/x-wais-source', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEFA3-CF17-F492-D21D74992CF35F16', 'wtk', 3, 'application/x-wintalk', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEEFD2-CF17-F492-DB37AFE3AA613D2D', 'xbm', 3, 'image/x-xbitmap', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF05F-CF17-F492-DD68614E20351A56', 'xdr', 3, 'video/x-amt-demorun', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF08E-CF17-F492-DF8CDD1F9149C35A', 'xgz', 3, 'xgl/drawing', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF0BD-CF17-F492-DC547F9D1B178677', 'xif', 3, 'image/vnd.xiff', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF0FB-CF17-F492-D76695307F6FCBF6', 'xl', 2, 'application/excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF1F5-CF17-F492-D9CCEE539092B798', 'xlb', 3, 'application/vnd.ms-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF30E-CF17-F492-D012B68C04FC91A5', 'xld', 3, 'application/x-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF36C-CF17-F492-D4C008C9A30C080F', 'xlk', 3, 'application/x-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF3DA-CF17-F492-D15DD3F5BD38320A', 'xll', 3, 'application/vnd.ms-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF62B-CF17-F492-D6B8F76C01DE98C3', 'xlv', 3, 'application/x-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF706-CF17-F492-DDF7DFB2F5516036', 'xm', 2, 'audio/xm', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF764-CF17-F492-DB303423B46FB38D', 'xml', 3, 'text/xml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF793-CF17-F492-DF1AF46B09F10652', 'xmz', 3, 'xgl/movie', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF7C2-CF17-F492-D213E69718C54912', 'xpix', 4, 'application/x-vnd.ls-xpix', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF82F-CF17-F492-D618DE74E3807780', 'xpm', 3, 'image/x-xpixmap', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF87D-CF17-F492-D672AE732F7B0FBE', 'x-png', 5, 'image/png', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF8AC-CF17-F492-D3ADCDCC6A4ED8DA', 'xsr', 3, 'video/x-amt-showrun', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF929-CF17-F492-D81B505AF85018F5', 'xwd', 3, 'image/x-xwindowdump', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEF9B6-CF17-F492-D34FC00883EC12DD', 'z', 1, 'application/x-compressed', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFA42-CF17-F492-DED7263223CA263D', 'zip', 3, 'application/zip', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFAA0-CF17-F492-D85AAD0CF58EA0FA', 'zoo', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFACF-CF17-F492-DE31E93A198DFDB5', 'zsh', 3, 'text/x-scriptzsh', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFAFE-CF17-F492-D8C5A3B42C96C61C', 'ez', 2, 'application/andrew-inset', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFB6B-CF17-F492-D60AE693459DF1CC', 'dms', 3, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFBD8-CF17-F492-DED465B82B31ACD8', 'rar', 3, 'application/x-rar-compressed', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFC07-CF17-F492-D3E4CC3CB2B510D9', 'class', 5, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFC36-CF17-F492-DD1CAECB70A6F560', 'so', 2, 'application/octet-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFD01-CF17-F492-D04917D6A6673A6B', 'mif', 3, 'application/vnd.mif', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFD40-CF17-F492-DC96A05E1E5249F2', 'xls', 3, 'application/vnd.ms-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFD6F-CF17-F492-DF6195E4B0829EC2', 'ppt', 3, 'application/vnd.ms-powerpoint', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFD9E-CF17-F492-D104C5872019EC22', 'wbxml', 5, 'application/vnd.wap.wbxml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFDBD-CF17-F492-D0A1513F7A4C9C05', 'wmlc', 4, 'application/vnd.wap.wmlc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFDEC-CF17-F492-D04E66F10CB1FB7D', 'wmlsc', 5, 'application/vnd.wap.wmlscriptc', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFE49-CF17-F492-DB27E5964F7ED8A3', 'pgn', 3, 'application/x-chess-pgn', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBEFEF5-CF17-F492-DD27AE683987EF23', 'spl', 3, 'application/x-futuresplash', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0147-CF17-F492-D649D12ABC0A37DA', 'xhtml', 5, 'application/xhtml+xml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0186-CF17-F492-DC88E90CBB53F280', 'xht', 3, 'application/xhtml+xml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0241-CF17-F492-DEFB7143C0C131B8', 'mp3', 3, 'audio/mpeg', 5, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF035A-CF17-F492-D030FEE96EB3D956', 'xyz', 3, 'chemical/x-xyz', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0445-CF17-F492-DAF6AC67EE6C7432', 'djvu', 4, 'image/vnd.djvu', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF04B2-CF17-F492-D10EBDABD91B48EC', 'djv', 3, 'image/vnd.djvu', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF04F1-CF17-F492-D1F06B3F8FF400A8', 'wbmp', 4, 'image/vnd.wap.wbmp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF05EB-CF17-F492-D2E274D08AEA1D4C', 'msh', 3, 'model/mesh', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0629-CF17-F492-D0DA4C43E29BFCE3', 'mesh', 4, 'model/mesh', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0668-CF17-F492-D841FFB2CF31412C', 'silo', 4, 'model/mesh', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF06F4-CF17-F492-D0144341561CFB02', 'asc', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0752-CF17-F492-D2F8BB83BDE1BA2D', 'rtf', 3, 'text/rtf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF07B0-CF17-F492-D373A622FA492057', 'wml', 3, 'text/vnd.wap.wml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF07DF-CF17-F492-DF5CEAA53D198FD7', 'wmls', 4, 'text/vnd.wap.wmlscript', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF081D-CF17-F492-DC20DED143D00542', 'xsl', 3, 'text/xml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF08C9-CF17-F492-D9DCD9B5BC6CF4FC', 'mxu', 3, 'video/vnd.mpegurl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0936-CF17-F492-D73D5CC5F3EF9878', '323', 3, 'text/h323', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0975-CF17-F492-D7C864EFBCCBD4F1', 'acx', 3, 'application/internet-property-stream', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF09F2-CF17-F492-D96DCF5FCFC811C2', 'asr', 3, 'video/x-ms-asf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0A5F-CF17-F492-D2651C012C168887', 'axs', 3, 'application/olescript', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0A8E-CF17-F492-DF680DEF9227425B', 'bas', 3, 'text/plain', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0AFB-CF17-F492-D2B241DC5DCD47B2', 'cat', 3, 'application/vnd.ms-pkiseccat', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0B69-CF17-F492-DE83F8BB031A316D', 'clp', 3, 'application/x-msclip', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0BA7-CF17-F492-DD6FE790AE2B5613', 'cmx', 3, 'image/x-cmx', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0BE6-CF17-F492-D6C007AA38174C97', 'cod', 3, 'image/cis-cod', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0C24-CF17-F492-DFFA591FD477BACC', 'crd', 3, 'application/x-mscardfile', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0CFF-CF17-F492-D4BBBC6F5505D43D', 'dll', 3, 'application/x-msdownload', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0DE9-CF17-F492-DD5712923B2D7CB0', 'flr', 3, 'x-world/x-vrml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0E86-CF17-F492-DE680067473CB51F', 'hlp', 3, 'application/winhlp', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0F51-CF17-F492-DC08C84C16F5FA5A', 'iii', 3, 'application/x-iphone', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0F8F-CF17-F492-D47B1C326A062976', 'ins', 3, 'application/x-internet-signup', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF0FBE-CF17-F492-DBAAAE8949C51BB1', 'isp', 3, 'application/x-internet-signup', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1089-CF17-F492-D20CF937B3A16C19', 'lsf', 3, 'video/x-la-asf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF10C8-CF17-F492-D178ADE3345FCD2B', 'lsx', 3, 'video/x-la-asf', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1106-CF17-F492-D59033C367401082', 'm13', 3, 'application/x-msmediaview', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1126-CF17-F492-DB78852CBAD15280', 'm14', 3, 'application/x-msmediaview', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1183-CF17-F492-D0FFECDBFC1939CD', 'mdb', 3, 'application/x-msaccess', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1220-CF17-F492-D53861272B4FCBEA', 'mny', 3, 'application/x-msmoney', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF12EB-CF17-F492-DD92AC2830F9FDC6', 'mpp', 3, 'application/vnd.ms-project', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF131A-CF17-F492-D1CB12CE281FF48A', 'mpv2', 4, 'video/mpeg', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1358-CF17-F492-D16EE89A14163E54', 'mvb', 3, 'application/x-msmediaview', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1387-CF17-F492-DD9CFA642EEB2C79', 'nws', 3, 'message/rfc822', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF13E5-CF17-F492-D63620D8139A6168', 'p7b', 3, 'application/x-pkcs7-certificates', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1462-CF17-F492-DF93CF685ED4364C', 'p7s', 3, 'application/x-pkcs7-signature', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF14BF-CF17-F492-DEFEE353FE08ADFB', 'pfx', 3, 'application/x-pkcs12', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF153C-CF17-F492-D6687FD3BA26287D', 'pma', 3, 'application/x-perfmon', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF156B-CF17-F492-DAFA6030B6ED2D9F', 'pmc', 3, 'application/x-perfmon', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF159A-CF17-F492-D71A3F4E61179E49', 'pml', 3, 'application/x-perfmon', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF15C9-CF17-F492-D9C1697D123A4D6E', 'pmr', 3, 'application/x-perfmon', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF15E8-CF17-F492-D67E4F250247CDD0', 'pmw', 3, 'application/x-perfmon', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1627-CF17-F492-D23217B4D147650E', 'pot', 3, 'application/vnd.ms-powerpoint', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1656-CF17-F492-D403CAA06C4AF558', 'pps', 3, 'application/vnd.ms-powerpoint', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF16A4-CF17-F492-D98F59442F935B81', 'prf', 3, 'application/pics-rules', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF16E2-CF17-F492-D941400D9025C2ED', 'pub', 3, 'application/x-mspublisher', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF17BD-CF17-F492-D1DDDBFC62556BF2', 'scd', 3, 'application/x-msschedule', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF180B-CF17-F492-DBB8C76DC4DF7DEE', 'sct', 3, 'text/scriptlet', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1859-CF17-F492-D230C7678B675477', 'setpay', 6, 'application/set-payment-initiation', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1888-CF17-F492-DEE19A0EDA0D4BE9', 'setreg', 6, 'application/set-registration-initiation', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1934-CF17-F492-D120C289CC75F8C4', 'sst', 3, 'application/vnd.ms-pkicertstore', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1973-CF17-F492-D717DD53F35A4656', 'stl', 3, 'application/vnd.ms-pkistl', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF19A1-CF17-F492-D492A0A6DBAE1F19', 'stm', 3, 'text/html', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF19D0-CF17-F492-D29E357DABEB7FA3', 'svg', 3, 'image/svg+xml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1AEA-CF17-F492-D688C997E2242B80', 'trm', 3, 'application/x-msterminal', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1B47-CF17-F492-D5E5F40434BBC5A4', 'uls', 3, 'text/iuls', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1B95-CF17-F492-D584AA2F2B9BF403', 'vcf', 3, 'text/x-vcard', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1BF3-CF17-F492-D7C91756DE14A32A', 'wcm', 3, 'application/vnd.ms-works', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1C32-CF17-F492-D7C8B83EB0C335D8', 'wdb', 3, 'application/vnd.ms-works', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1C51-CF17-F492-D8C7F8639865B261', 'wks', 3, 'application/vnd.ms-works', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1C70-CF17-F492-DF6260644D00CA36', 'wmf', 3, 'application/x-msmetafile', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1C9F-CF17-F492-DB54D5218BEA34B5', 'wps', 3, 'application/vnd.ms-works', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1CCE-CF17-F492-DFDE7703D974A070', 'wri', 3, 'application/x-mswrite', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1D1C-CF17-F492-D42E2DA1E1666DE3', 'xaf', 3, 'x-world/x-vrml', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1D5B-CF17-F492-DC3ADC9B39DE7D57', 'xla', 3, 'application/vnd.ms-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1D99-CF17-F492-D711DBE387CBBAC6', 'xlc', 3, 'application/vnd.ms-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1DC8-CF17-F492-D3C33C4DF48D2E16', 'xlm', 3, 'application/vnd.ms-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1E06-CF17-F492-D432B1601490AA5C', 'xlt', 3, 'application/vnd.ms-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1E35-CF17-F492-D9FD163721D060C6', 'xlw', 3, 'application/vnd.ms-excel', 0, NULL);
INSERT INTO `a_mimetypes` (`umimeid`, `fileExt`, `extLen`, `mimeType`, `contentType`, `iconFile`) VALUES ('FCBF1E55-CF17-F492-D8E2107805E13D75', 'xof', 3, 'x-world/x-vrml', 0, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `a_sessionbase`
-- 

CREATE TABLE `a_sessionbase` (
  `usid` varchar(36) collate utf8_bin NOT NULL,
  `uuid` varchar(255) collate utf8_bin NOT NULL,
  `lastAction` datetime NOT NULL,
  PRIMARY KEY  (`usid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Dumping data for table `a_sessionbase`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `a_userbase`
-- 

CREATE TABLE `a_userbase` (
  `uuid` varchar(36) collate utf8_bin NOT NULL,
  `username` varchar(255) collate utf8_bin NOT NULL,
  `password` varchar(255) collate utf8_bin NOT NULL,
  `firstName` varchar(255) collate utf8_bin NOT NULL,
  `lastName` varchar(255) collate utf8_bin NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `memberSince` date default NULL,
  `lastOn` datetime default NULL,
  PRIMARY KEY  (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 
-- Dumping data for table `a_userbase`
-- 

INSERT INTO `a_userbase` (`uuid`, `username`, `password`, `firstName`, `lastName`, `level`, `memberSince`, `lastOn`) VALUES ('CC35885E-9BF5-740B-FF4DDA35ADF5AE5E', 'D11F4E2F044C6CF5', 'CF8F3A9F3306F2DE2307CA9D114FAE0AA8128183291B843A5A17673CF16E44DF127C9CF2CEAE7C05', 'A8D83A3051F63D5089C2648151BF8B20 ', '9F0C8DF55106BCDCF4AB960F2B1CDD66', 1, '2008-10-05', '2008-10-08 05:19:52');
-- 
-- Database: `information_schema`
-- 
CREATE DATABASE `information_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `information_schema`;

-- --------------------------------------------------------

-- 
-- Table structure for table `CHARACTER_SETS`
-- 

CREATE TEMPORARY TABLE `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(64) NOT NULL default '',
  `DEFAULT_COLLATE_NAME` varchar(64) NOT NULL default '',
  `DESCRIPTION` varchar(60) NOT NULL default '',
  `MAXLEN` bigint(3) NOT NULL default '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `CHARACTER_SETS`
-- 

INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('big5', 'big5_chinese_ci', 'Big5 Traditional Chinese', 2);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('dec8', 'dec8_swedish_ci', 'DEC West European', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('cp850', 'cp850_general_ci', 'DOS West European', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('hp8', 'hp8_english_ci', 'HP West European', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('koi8r', 'koi8r_general_ci', 'KOI8-R Relcom Russian', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('latin1', 'latin1_swedish_ci', 'cp1252 West European', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('latin2', 'latin2_general_ci', 'ISO 8859-2 Central European', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('swe7', 'swe7_swedish_ci', '7bit Swedish', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('ascii', 'ascii_general_ci', 'US ASCII', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('ujis', 'ujis_japanese_ci', 'EUC-JP Japanese', 3);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('sjis', 'sjis_japanese_ci', 'Shift-JIS Japanese', 2);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('hebrew', 'hebrew_general_ci', 'ISO 8859-8 Hebrew', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('tis620', 'tis620_thai_ci', 'TIS620 Thai', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('euckr', 'euckr_korean_ci', 'EUC-KR Korean', 2);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('koi8u', 'koi8u_general_ci', 'KOI8-U Ukrainian', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('gb2312', 'gb2312_chinese_ci', 'GB2312 Simplified Chinese', 2);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('greek', 'greek_general_ci', 'ISO 8859-7 Greek', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('cp1250', 'cp1250_general_ci', 'Windows Central European', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('gbk', 'gbk_chinese_ci', 'GBK Simplified Chinese', 2);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('latin5', 'latin5_turkish_ci', 'ISO 8859-9 Turkish', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('armscii8', 'armscii8_general_ci', 'ARMSCII-8 Armenian', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('utf8', 'utf8_general_ci', 'UTF-8 Unicode', 3);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('ucs2', 'ucs2_general_ci', 'UCS-2 Unicode', 2);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('cp866', 'cp866_general_ci', 'DOS Russian', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('keybcs2', 'keybcs2_general_ci', 'DOS Kamenicky Czech-Slovak', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('macce', 'macce_general_ci', 'Mac Central European', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('macroman', 'macroman_general_ci', 'Mac West European', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('cp852', 'cp852_general_ci', 'DOS Central European', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('latin7', 'latin7_general_ci', 'ISO 8859-13 Baltic', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('cp1251', 'cp1251_general_ci', 'Windows Cyrillic', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('cp1256', 'cp1256_general_ci', 'Windows Arabic', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('cp1257', 'cp1257_general_ci', 'Windows Baltic', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('binary', 'binary', 'Binary pseudo charset', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('geostd8', 'geostd8_general_ci', 'GEOSTD8 Georgian', 1);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('cp932', 'cp932_japanese_ci', 'SJIS for Windows Japanese', 2);
INSERT INTO `CHARACTER_SETS` (`CHARACTER_SET_NAME`, `DEFAULT_COLLATE_NAME`, `DESCRIPTION`, `MAXLEN`) VALUES ('eucjpms', 'eucjpms_japanese_ci', 'UJIS for Windows Japanese', 3);

-- --------------------------------------------------------

-- 
-- Table structure for table `COLLATIONS`
-- 

CREATE TEMPORARY TABLE `COLLATIONS` (
  `COLLATION_NAME` varchar(64) NOT NULL default '',
  `CHARACTER_SET_NAME` varchar(64) NOT NULL default '',
  `ID` bigint(11) NOT NULL default '0',
  `IS_DEFAULT` varchar(3) NOT NULL default '',
  `IS_COMPILED` varchar(3) NOT NULL default '',
  `SORTLEN` bigint(3) NOT NULL default '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `COLLATIONS`
-- 

INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('big5_chinese_ci', 'big5', 1, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('big5_bin', 'big5', 84, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('dec8_swedish_ci', 'dec8', 3, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('dec8_bin', 'dec8', 69, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp850_general_ci', 'cp850', 4, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp850_bin', 'cp850', 80, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('hp8_english_ci', 'hp8', 6, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('hp8_bin', 'hp8', 72, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('koi8r_general_ci', 'koi8r', 7, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('koi8r_bin', 'koi8r', 74, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin1_german1_ci', 'latin1', 5, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin1_swedish_ci', 'latin1', 8, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin1_danish_ci', 'latin1', 15, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin1_german2_ci', 'latin1', 31, '', 'Yes', 2);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin1_bin', 'latin1', 47, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin1_general_ci', 'latin1', 48, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin1_general_cs', 'latin1', 49, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin1_spanish_ci', 'latin1', 94, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin2_czech_cs', 'latin2', 2, '', 'Yes', 4);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin2_general_ci', 'latin2', 9, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin2_hungarian_ci', 'latin2', 21, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin2_croatian_ci', 'latin2', 27, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin2_bin', 'latin2', 77, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('swe7_swedish_ci', 'swe7', 10, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('swe7_bin', 'swe7', 82, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ascii_general_ci', 'ascii', 11, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ascii_bin', 'ascii', 65, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ujis_japanese_ci', 'ujis', 12, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ujis_bin', 'ujis', 91, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('sjis_japanese_ci', 'sjis', 13, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('sjis_bin', 'sjis', 88, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('hebrew_general_ci', 'hebrew', 16, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('hebrew_bin', 'hebrew', 71, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('tis620_thai_ci', 'tis620', 18, 'Yes', 'Yes', 4);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('tis620_bin', 'tis620', 89, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('euckr_korean_ci', 'euckr', 19, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('euckr_bin', 'euckr', 85, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('koi8u_general_ci', 'koi8u', 22, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('koi8u_bin', 'koi8u', 75, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('gb2312_chinese_ci', 'gb2312', 24, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('gb2312_bin', 'gb2312', 86, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('greek_general_ci', 'greek', 25, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('greek_bin', 'greek', 70, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1250_general_ci', 'cp1250', 26, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1250_czech_cs', 'cp1250', 34, '', 'Yes', 2);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1250_croatian_ci', 'cp1250', 44, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1250_bin', 'cp1250', 66, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('gbk_chinese_ci', 'gbk', 28, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('gbk_bin', 'gbk', 87, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin5_turkish_ci', 'latin5', 30, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin5_bin', 'latin5', 78, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('armscii8_general_ci', 'armscii8', 32, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('armscii8_bin', 'armscii8', 64, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_general_ci', 'utf8', 33, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_bin', 'utf8', 83, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_unicode_ci', 'utf8', 192, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_icelandic_ci', 'utf8', 193, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_latvian_ci', 'utf8', 194, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_romanian_ci', 'utf8', 195, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_slovenian_ci', 'utf8', 196, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_polish_ci', 'utf8', 197, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_estonian_ci', 'utf8', 198, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_spanish_ci', 'utf8', 199, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_swedish_ci', 'utf8', 200, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_turkish_ci', 'utf8', 201, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_czech_ci', 'utf8', 202, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_danish_ci', 'utf8', 203, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_lithuanian_ci', 'utf8', 204, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_slovak_ci', 'utf8', 205, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_spanish2_ci', 'utf8', 206, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_roman_ci', 'utf8', 207, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_persian_ci', 'utf8', 208, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_esperanto_ci', 'utf8', 209, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('utf8_hungarian_ci', 'utf8', 210, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_general_ci', 'ucs2', 35, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_bin', 'ucs2', 90, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_unicode_ci', 'ucs2', 128, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_icelandic_ci', 'ucs2', 129, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_latvian_ci', 'ucs2', 130, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_romanian_ci', 'ucs2', 131, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_slovenian_ci', 'ucs2', 132, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_polish_ci', 'ucs2', 133, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_estonian_ci', 'ucs2', 134, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_spanish_ci', 'ucs2', 135, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_swedish_ci', 'ucs2', 136, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_turkish_ci', 'ucs2', 137, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_czech_ci', 'ucs2', 138, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_danish_ci', 'ucs2', 139, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_lithuanian_ci', 'ucs2', 140, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_slovak_ci', 'ucs2', 141, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_spanish2_ci', 'ucs2', 142, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_roman_ci', 'ucs2', 143, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_persian_ci', 'ucs2', 144, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_esperanto_ci', 'ucs2', 145, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('ucs2_hungarian_ci', 'ucs2', 146, '', 'Yes', 8);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp866_general_ci', 'cp866', 36, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp866_bin', 'cp866', 68, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('keybcs2_general_ci', 'keybcs2', 37, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('keybcs2_bin', 'keybcs2', 73, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('macce_general_ci', 'macce', 38, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('macce_bin', 'macce', 43, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('macroman_general_ci', 'macroman', 39, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('macroman_bin', 'macroman', 53, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp852_general_ci', 'cp852', 40, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp852_bin', 'cp852', 81, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin7_estonian_cs', 'latin7', 20, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin7_general_ci', 'latin7', 41, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin7_general_cs', 'latin7', 42, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('latin7_bin', 'latin7', 79, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1251_bulgarian_ci', 'cp1251', 14, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1251_ukrainian_ci', 'cp1251', 23, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1251_bin', 'cp1251', 50, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1251_general_ci', 'cp1251', 51, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1251_general_cs', 'cp1251', 52, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1256_general_ci', 'cp1256', 57, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1256_bin', 'cp1256', 67, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1257_lithuanian_ci', 'cp1257', 29, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1257_bin', 'cp1257', 58, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp1257_general_ci', 'cp1257', 59, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('binary', 'binary', 63, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('geostd8_general_ci', 'geostd8', 92, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('geostd8_bin', 'geostd8', 93, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp932_japanese_ci', 'cp932', 95, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('cp932_bin', 'cp932', 96, '', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('eucjpms_japanese_ci', 'eucjpms', 97, 'Yes', 'Yes', 1);
INSERT INTO `COLLATIONS` (`COLLATION_NAME`, `CHARACTER_SET_NAME`, `ID`, `IS_DEFAULT`, `IS_COMPILED`, `SORTLEN`) VALUES ('eucjpms_bin', 'eucjpms', 98, '', 'Yes', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `COLLATION_CHARACTER_SET_APPLICABILITY`
-- 

CREATE TEMPORARY TABLE `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(64) NOT NULL default '',
  `CHARACTER_SET_NAME` varchar(64) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `COLLATION_CHARACTER_SET_APPLICABILITY`
-- 

INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('big5_chinese_ci', 'big5');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('big5_bin', 'big5');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('dec8_swedish_ci', 'dec8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('dec8_bin', 'dec8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp850_general_ci', 'cp850');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp850_bin', 'cp850');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('hp8_english_ci', 'hp8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('hp8_bin', 'hp8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('koi8r_general_ci', 'koi8r');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('koi8r_bin', 'koi8r');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin1_german1_ci', 'latin1');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin1_swedish_ci', 'latin1');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin1_danish_ci', 'latin1');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin1_german2_ci', 'latin1');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin1_bin', 'latin1');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin1_general_ci', 'latin1');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin1_general_cs', 'latin1');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin1_spanish_ci', 'latin1');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin2_czech_cs', 'latin2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin2_general_ci', 'latin2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin2_hungarian_ci', 'latin2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin2_croatian_ci', 'latin2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin2_bin', 'latin2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('swe7_swedish_ci', 'swe7');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('swe7_bin', 'swe7');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ascii_general_ci', 'ascii');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ascii_bin', 'ascii');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ujis_japanese_ci', 'ujis');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ujis_bin', 'ujis');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('sjis_japanese_ci', 'sjis');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('sjis_bin', 'sjis');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('hebrew_general_ci', 'hebrew');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('hebrew_bin', 'hebrew');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('tis620_thai_ci', 'tis620');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('tis620_bin', 'tis620');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('euckr_korean_ci', 'euckr');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('euckr_bin', 'euckr');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('koi8u_general_ci', 'koi8u');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('koi8u_bin', 'koi8u');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('gb2312_chinese_ci', 'gb2312');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('gb2312_bin', 'gb2312');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('greek_general_ci', 'greek');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('greek_bin', 'greek');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1250_general_ci', 'cp1250');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1250_czech_cs', 'cp1250');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1250_croatian_ci', 'cp1250');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1250_bin', 'cp1250');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('gbk_chinese_ci', 'gbk');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('gbk_bin', 'gbk');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin5_turkish_ci', 'latin5');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin5_bin', 'latin5');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('armscii8_general_ci', 'armscii8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('armscii8_bin', 'armscii8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_general_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_bin', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_unicode_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_icelandic_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_latvian_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_romanian_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_slovenian_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_polish_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_estonian_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_spanish_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_swedish_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_turkish_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_czech_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_danish_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_lithuanian_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_slovak_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_spanish2_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_roman_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_persian_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_esperanto_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('utf8_hungarian_ci', 'utf8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_general_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_bin', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_unicode_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_icelandic_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_latvian_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_romanian_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_slovenian_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_polish_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_estonian_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_spanish_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_swedish_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_turkish_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_czech_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_danish_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_lithuanian_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_slovak_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_spanish2_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_roman_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_persian_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_esperanto_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('ucs2_hungarian_ci', 'ucs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp866_general_ci', 'cp866');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp866_bin', 'cp866');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('keybcs2_general_ci', 'keybcs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('keybcs2_bin', 'keybcs2');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('macce_general_ci', 'macce');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('macce_bin', 'macce');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('macroman_general_ci', 'macroman');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('macroman_bin', 'macroman');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp852_general_ci', 'cp852');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp852_bin', 'cp852');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin7_estonian_cs', 'latin7');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin7_general_ci', 'latin7');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin7_general_cs', 'latin7');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('latin7_bin', 'latin7');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1251_bulgarian_ci', 'cp1251');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1251_ukrainian_ci', 'cp1251');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1251_bin', 'cp1251');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1251_general_ci', 'cp1251');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1251_general_cs', 'cp1251');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1256_general_ci', 'cp1256');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1256_bin', 'cp1256');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1257_lithuanian_ci', 'cp1257');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1257_bin', 'cp1257');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp1257_general_ci', 'cp1257');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('binary', 'binary');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('geostd8_general_ci', 'geostd8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('geostd8_bin', 'geostd8');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp932_japanese_ci', 'cp932');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('cp932_bin', 'cp932');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('eucjpms_japanese_ci', 'eucjpms');
INSERT INTO `COLLATION_CHARACTER_SET_APPLICABILITY` (`COLLATION_NAME`, `CHARACTER_SET_NAME`) VALUES ('eucjpms_bin', 'eucjpms');

-- --------------------------------------------------------

-- 
-- Table structure for table `COLUMNS`
-- 

CREATE TEMPORARY TABLE `COLUMNS` (
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `COLUMN_NAME` varchar(64) NOT NULL default '',
  `ORDINAL_POSITION` bigint(21) NOT NULL default '0',
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL default '',
  `DATA_TYPE` varchar(64) NOT NULL default '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) default NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) default NULL,
  `NUMERIC_PRECISION` bigint(21) default NULL,
  `NUMERIC_SCALE` bigint(21) default NULL,
  `CHARACTER_SET_NAME` varchar(64) default NULL,
  `COLLATION_NAME` varchar(64) default NULL,
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL default '',
  `EXTRA` varchar(20) NOT NULL default '',
  `PRIVILEGES` varchar(80) NOT NULL default '',
  `COLUMN_COMMENT` varchar(255) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `COLUMNS`
-- 

INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'CHARACTER_SETS', 'CHARACTER_SET_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'CHARACTER_SETS', 'DEFAULT_COLLATE_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'CHARACTER_SETS', 'DESCRIPTION', 3, '', 'NO', 'varchar', 60, 180, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(60)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'CHARACTER_SETS', 'MAXLEN', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLLATIONS', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLLATIONS', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLLATIONS', 'ID', 3, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(11)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLLATIONS', 'IS_DEFAULT', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLLATIONS', 'IS_COMPILED', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLLATIONS', 'SORTLEN', 6, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'COLLATION_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'CHARACTER_SET_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'COLUMN_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'ORDINAL_POSITION', 5, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'COLUMN_DEFAULT', 6, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'IS_NULLABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'DATA_TYPE', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'CHARACTER_MAXIMUM_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'CHARACTER_OCTET_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'NUMERIC_PRECISION', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'NUMERIC_SCALE', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'CHARACTER_SET_NAME', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'COLLATION_NAME', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'COLUMN_TYPE', 15, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'COLUMN_KEY', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'EXTRA', 17, '', 'NO', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'PRIVILEGES', 18, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'COLUMN_COMMENT', 19, '', 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'COLUMN_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'PRIVILEGE_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'IS_GRANTABLE', 7, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_CATALOG', 4, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'TABLE_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'COLUMN_NAME', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'ORDINAL_POSITION', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'POSITION_IN_UNIQUE_CONSTRAINT', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(10)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_SCHEMA', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_TABLE_NAME', 11, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'REFERENCED_COLUMN_NAME', 12, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'QUERY_ID', 1, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'SEQ', 2, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'STATE', 3, '', 'NO', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'DURATION', 4, '0.000000', 'NO', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'CPU_USER', 5, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'CPU_SYSTEM', 6, NULL, 'YES', 'decimal', NULL, NULL, 9, 6, NULL, NULL, 'decimal(9,6)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'CONTEXT_VOLUNTARY', 7, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'CONTEXT_INVOLUNTARY', 8, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'BLOCK_OPS_IN', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'BLOCK_OPS_OUT', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'MESSAGES_SENT', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'MESSAGES_RECEIVED', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'PAGE_FAULTS_MAJOR', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'PAGE_FAULTS_MINOR', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'SWAPS', 15, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'SOURCE_FUNCTION', 16, NULL, 'YES', 'varchar', 30, 90, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(30)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'SOURCE_FILE', 17, NULL, 'YES', 'varchar', 20, 60, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'SOURCE_LINE', 18, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(20)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'SPECIFIC_NAME', 1, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'ROUTINE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'ROUTINE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'ROUTINE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'ROUTINE_TYPE', 5, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'DTD_IDENTIFIER', 6, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'ROUTINE_BODY', 7, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'ROUTINE_DEFINITION', 8, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'EXTERNAL_NAME', 9, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'EXTERNAL_LANGUAGE', 10, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'PARAMETER_STYLE', 11, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'IS_DETERMINISTIC', 12, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'SQL_DATA_ACCESS', 13, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'SQL_PATH', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'SECURITY_TYPE', 15, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'CREATED', 16, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'LAST_ALTERED', 17, '0000-00-00 00:00:00', 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'SQL_MODE', 18, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'ROUTINE_COMMENT', 19, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'DEFINER', 20, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMATA', 'CATALOG_NAME', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMATA', 'SCHEMA_NAME', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMATA', 'DEFAULT_CHARACTER_SET_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMATA', 'DEFAULT_COLLATION_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMATA', 'SQL_PATH', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'PRIVILEGE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'IS_GRANTABLE', 5, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'NON_UNIQUE', 4, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(1)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'INDEX_SCHEMA', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'INDEX_NAME', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'SEQ_IN_INDEX', 7, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(2)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'COLUMN_NAME', 8, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'COLLATION', 9, NULL, 'YES', 'varchar', 1, 3, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(1)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'CARDINALITY', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'SUB_PART', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'PACKED', 12, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'NULLABLE', 13, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'INDEX_TYPE', 14, '', 'NO', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'COMMENT', 15, NULL, 'YES', 'varchar', 16, 48, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(16)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'TABLE_TYPE', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'ENGINE', 5, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'VERSION', 6, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'ROW_FORMAT', 7, NULL, 'YES', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(10)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'TABLE_ROWS', 8, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'AVG_ROW_LENGTH', 9, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'DATA_LENGTH', 10, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'MAX_DATA_LENGTH', 11, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'INDEX_LENGTH', 12, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'DATA_FREE', 13, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'AUTO_INCREMENT', 14, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'CREATE_TIME', 15, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'UPDATE_TIME', 16, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'CHECK_TIME', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'TABLE_COLLATION', 18, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'CHECKSUM', 19, NULL, 'YES', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(21)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'CREATE_OPTIONS', 20, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(255)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'TABLE_COMMENT', 21, '', 'NO', 'varchar', 80, 240, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(80)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_SCHEMA', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'TABLE_NAME', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'CONSTRAINT_TYPE', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_SCHEMA', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_PRIVILEGES', 'TABLE_NAME', 4, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_PRIVILEGES', 'PRIVILEGE_TYPE', 5, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_PRIVILEGES', 'IS_GRANTABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'TRIGGER_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'EVENT_MANIPULATION', 4, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_CATALOG', 5, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_SCHEMA', 6, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'EVENT_OBJECT_TABLE', 7, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'ACTION_ORDER', 8, '0', 'NO', 'bigint', NULL, NULL, 19, 0, NULL, NULL, 'bigint(4)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'ACTION_CONDITION', 9, NULL, 'YES', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'ACTION_STATEMENT', 10, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'ACTION_ORIENTATION', 11, '', 'NO', 'varchar', 9, 27, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(9)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'ACTION_TIMING', 12, '', 'NO', 'varchar', 6, 18, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(6)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_TABLE', 13, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_TABLE', 14, NULL, 'YES', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_OLD_ROW', 15, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'ACTION_REFERENCE_NEW_ROW', 16, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'CREATED', 17, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'SQL_MODE', 18, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'DEFINER', 19, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'USER_PRIVILEGES', 'GRANTEE', 1, '', 'NO', 'varchar', 81, 243, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(81)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'USER_PRIVILEGES', 'TABLE_CATALOG', 2, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'USER_PRIVILEGES', 'PRIVILEGE_TYPE', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'USER_PRIVILEGES', 'IS_GRANTABLE', 4, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'VIEWS', 'TABLE_CATALOG', 1, NULL, 'YES', 'varchar', 512, 1536, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(512)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'VIEWS', 'TABLE_SCHEMA', 2, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'VIEWS', 'TABLE_NAME', 3, '', 'NO', 'varchar', 64, 192, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(64)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'VIEWS', 'VIEW_DEFINITION', 4, NULL, 'NO', 'longtext', 4294967295, 4294967295, NULL, NULL, 'utf8', 'utf8_general_ci', 'longtext', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'VIEWS', 'CHECK_OPTION', 5, '', 'NO', 'varchar', 8, 24, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(8)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'VIEWS', 'IS_UPDATABLE', 6, '', 'NO', 'varchar', 3, 9, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(3)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'VIEWS', 'DEFINER', 7, '', 'NO', 'varchar', 77, 231, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(77)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'information_schema', 'VIEWS', 'SECURITY_TYPE', 8, '', 'NO', 'varchar', 7, 21, NULL, NULL, 'utf8', 'utf8_general_ci', 'varchar(7)', '', '', 'select', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categorybase', 'ucid', 1, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', 'PRI', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categorybase', 'uuid', 2, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categorybase', 'categoryName', 3, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categorybase', 'categoryId', 4, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categorybase', 'categoryDesc', 5, NULL, 'YES', 'text', 65535, 65535, NULL, NULL, 'utf8', 'utf8_bin', 'text', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categorybase', 'addedOn', 6, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categorybase', 'archived', 7, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(3) unsigned', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categoryschedule', 'uschedid', 1, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', 'PRI', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categoryschedule', 'ucid', 2, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categoryschedule', 'contentId', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_categoryschedule', 'runDate', 4, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentbase', 'contentId', 1, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentbase', 'ucid', 2, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentbase', 'filename', 3, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentbase', 'addDate', 4, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentbase', 'totalViews', 5, '0', 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentbase', 'urecid', 6, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', 'PRI', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentbase', 'mimeType', 7, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentbase', 'isBinaryFile', 8, '1', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentlog', 'uslid', 1, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', 'PRI', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentlog', 'ucid', 2, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentlog', 'contentId', 3, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentlog', 'viewHostIP', 4, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentlog', 'viewReferer', 5, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentlog', 'viewDate', 6, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_defaultcategoryschedule', 'udefid', 1, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', 'PRI', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_defaultcategoryschedule', 'ucid', 2, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_defaultcategoryschedule', 'runDate', 3, NULL, 'NO', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_mimetypes', 'umimeid', 1, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', 'PRI', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_mimetypes', 'fileExt', 2, NULL, 'NO', 'varchar', 10, 30, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(10)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_mimetypes', 'extLen', 3, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_mimetypes', 'mimeType', 4, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_mimetypes', 'contentType', 5, '0', 'NO', 'tinyint', NULL, NULL, 3, 0, NULL, NULL, 'tinyint(4)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_mimetypes', 'iconFile', 6, NULL, 'YES', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_sessionbase', 'usid', 1, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', 'PRI', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_sessionbase', 'uuid', 2, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_sessionbase', 'lastAction', 3, NULL, 'NO', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_userbase', 'uuid', 1, NULL, 'NO', 'varchar', 36, 108, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(36)', 'PRI', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_userbase', 'username', 2, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_userbase', 'password', 3, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_userbase', 'firstName', 4, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_userbase', 'lastName', 5, NULL, 'NO', 'varchar', 255, 765, NULL, NULL, 'utf8', 'utf8_bin', 'varchar(255)', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_userbase', 'level', 6, NULL, 'NO', 'int', NULL, NULL, 10, 0, NULL, NULL, 'int(10) unsigned', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_userbase', 'memberSince', 7, NULL, 'YES', 'date', NULL, NULL, NULL, NULL, NULL, NULL, 'date', '', '', 'select,insert,update', '');
INSERT INTO `COLUMNS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `COLUMN_DEFAULT`, `IS_NULLABLE`, `DATA_TYPE`, `CHARACTER_MAXIMUM_LENGTH`, `CHARACTER_OCTET_LENGTH`, `NUMERIC_PRECISION`, `NUMERIC_SCALE`, `CHARACTER_SET_NAME`, `COLLATION_NAME`, `COLUMN_TYPE`, `COLUMN_KEY`, `EXTRA`, `PRIVILEGES`, `COLUMN_COMMENT`) VALUES (NULL, 'ccaster', 'a_userbase', 'lastOn', 8, NULL, 'YES', 'datetime', NULL, NULL, NULL, NULL, NULL, NULL, 'datetime', '', '', 'select,insert,update', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `COLUMN_PRIVILEGES`
-- 

CREATE TEMPORARY TABLE `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL default '',
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `COLUMN_NAME` varchar(64) NOT NULL default '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL default '',
  `IS_GRANTABLE` varchar(3) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `COLUMN_PRIVILEGES`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `KEY_COLUMN_USAGE`
-- 

CREATE TEMPORARY TABLE `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) default NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL default '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL default '',
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `COLUMN_NAME` varchar(64) NOT NULL default '',
  `ORDINAL_POSITION` bigint(10) NOT NULL default '0',
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10) default NULL,
  `REFERENCED_TABLE_SCHEMA` varchar(64) default NULL,
  `REFERENCED_TABLE_NAME` varchar(64) default NULL,
  `REFERENCED_COLUMN_NAME` varchar(64) default NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `KEY_COLUMN_USAGE`
-- 

INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES (NULL, 'ccaster', 'PRIMARY', NULL, 'ccaster', 'a_categorybase', 'ucid', 1, NULL, NULL, NULL, NULL);
INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES (NULL, 'ccaster', 'PRIMARY', NULL, 'ccaster', 'a_categoryschedule', 'uschedid', 1, NULL, NULL, NULL, NULL);
INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES (NULL, 'ccaster', 'PRIMARY', NULL, 'ccaster', 'a_contentbase', 'urecid', 1, NULL, NULL, NULL, NULL);
INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES (NULL, 'ccaster', 'PRIMARY', NULL, 'ccaster', 'a_contentlog', 'uslid', 1, NULL, NULL, NULL, NULL);
INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES (NULL, 'ccaster', 'PRIMARY', NULL, 'ccaster', 'a_defaultcategoryschedule', 'udefid', 1, NULL, NULL, NULL, NULL);
INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES (NULL, 'ccaster', 'PRIMARY', NULL, 'ccaster', 'a_mimetypes', 'umimeid', 1, NULL, NULL, NULL, NULL);
INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES (NULL, 'ccaster', 'PRIMARY', NULL, 'ccaster', 'a_sessionbase', 'usid', 1, NULL, NULL, NULL, NULL);
INSERT INTO `KEY_COLUMN_USAGE` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `COLUMN_NAME`, `ORDINAL_POSITION`, `POSITION_IN_UNIQUE_CONSTRAINT`, `REFERENCED_TABLE_SCHEMA`, `REFERENCED_TABLE_NAME`, `REFERENCED_COLUMN_NAME`) VALUES (NULL, 'ccaster', 'PRIMARY', NULL, 'ccaster', 'a_userbase', 'uuid', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `PROFILING`
-- 

CREATE TEMPORARY TABLE `PROFILING` (
  `QUERY_ID` bigint(20) NOT NULL default '0',
  `SEQ` bigint(20) NOT NULL default '0',
  `STATE` varchar(30) NOT NULL default '',
  `DURATION` decimal(9,6) NOT NULL default '0.000000',
  `CPU_USER` decimal(9,6) default NULL,
  `CPU_SYSTEM` decimal(9,6) default NULL,
  `CONTEXT_VOLUNTARY` bigint(20) default NULL,
  `CONTEXT_INVOLUNTARY` bigint(20) default NULL,
  `BLOCK_OPS_IN` bigint(20) default NULL,
  `BLOCK_OPS_OUT` bigint(20) default NULL,
  `MESSAGES_SENT` bigint(20) default NULL,
  `MESSAGES_RECEIVED` bigint(20) default NULL,
  `PAGE_FAULTS_MAJOR` bigint(20) default NULL,
  `PAGE_FAULTS_MINOR` bigint(20) default NULL,
  `SWAPS` bigint(20) default NULL,
  `SOURCE_FUNCTION` varchar(30) default NULL,
  `SOURCE_FILE` varchar(20) default NULL,
  `SOURCE_LINE` bigint(20) default NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `PROFILING`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `ROUTINES`
-- 

CREATE TEMPORARY TABLE `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL default '',
  `ROUTINE_CATALOG` varchar(512) default NULL,
  `ROUTINE_SCHEMA` varchar(64) NOT NULL default '',
  `ROUTINE_NAME` varchar(64) NOT NULL default '',
  `ROUTINE_TYPE` varchar(9) NOT NULL default '',
  `DTD_IDENTIFIER` varchar(64) default NULL,
  `ROUTINE_BODY` varchar(8) NOT NULL default '',
  `ROUTINE_DEFINITION` longtext,
  `EXTERNAL_NAME` varchar(64) default NULL,
  `EXTERNAL_LANGUAGE` varchar(64) default NULL,
  `PARAMETER_STYLE` varchar(8) NOT NULL default '',
  `IS_DETERMINISTIC` varchar(3) NOT NULL default '',
  `SQL_DATA_ACCESS` varchar(64) NOT NULL default '',
  `SQL_PATH` varchar(64) default NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL default '',
  `CREATED` datetime NOT NULL default '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL default '0000-00-00 00:00:00',
  `SQL_MODE` longtext NOT NULL,
  `ROUTINE_COMMENT` varchar(64) NOT NULL default '',
  `DEFINER` varchar(77) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `ROUTINES`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `SCHEMATA`
-- 

CREATE TEMPORARY TABLE `SCHEMATA` (
  `CATALOG_NAME` varchar(512) default NULL,
  `SCHEMA_NAME` varchar(64) NOT NULL default '',
  `DEFAULT_CHARACTER_SET_NAME` varchar(64) NOT NULL default '',
  `DEFAULT_COLLATION_NAME` varchar(64) NOT NULL default '',
  `SQL_PATH` varchar(512) default NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `SCHEMATA`
-- 

INSERT INTO `SCHEMATA` (`CATALOG_NAME`, `SCHEMA_NAME`, `DEFAULT_CHARACTER_SET_NAME`, `DEFAULT_COLLATION_NAME`, `SQL_PATH`) VALUES (NULL, 'information_schema', 'utf8', 'utf8_general_ci', NULL);
INSERT INTO `SCHEMATA` (`CATALOG_NAME`, `SCHEMA_NAME`, `DEFAULT_CHARACTER_SET_NAME`, `DEFAULT_COLLATION_NAME`, `SQL_PATH`) VALUES (NULL, 'ccaster', 'utf8', 'utf8_general_ci', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `SCHEMA_PRIVILEGES`
-- 

CREATE TEMPORARY TABLE `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL default '',
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL default '',
  `IS_GRANTABLE` varchar(3) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `SCHEMA_PRIVILEGES`
-- 

INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'SELECT', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'INSERT', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'UPDATE', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'DELETE', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'CREATE', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'DROP', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'INDEX', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'ALTER', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'CREATE TEMPORARY TABLES', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'LOCK TABLES', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'EXECUTE', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'CREATE VIEW', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'SHOW VIEW', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'CREATE ROUTINE', 'NO');
INSERT INTO `SCHEMA_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `TABLE_SCHEMA`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'ccaster', 'ALTER ROUTINE', 'NO');

-- --------------------------------------------------------

-- 
-- Table structure for table `STATISTICS`
-- 

CREATE TEMPORARY TABLE `STATISTICS` (
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `NON_UNIQUE` bigint(1) NOT NULL default '0',
  `INDEX_SCHEMA` varchar(64) NOT NULL default '',
  `INDEX_NAME` varchar(64) NOT NULL default '',
  `SEQ_IN_INDEX` bigint(2) NOT NULL default '0',
  `COLUMN_NAME` varchar(64) NOT NULL default '',
  `COLLATION` varchar(1) default NULL,
  `CARDINALITY` bigint(21) default NULL,
  `SUB_PART` bigint(3) default NULL,
  `PACKED` varchar(10) default NULL,
  `NULLABLE` varchar(3) NOT NULL default '',
  `INDEX_TYPE` varchar(16) NOT NULL default '',
  `COMMENT` varchar(16) default NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `STATISTICS`
-- 

INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES (NULL, 'ccaster', 'a_categorybase', 0, 'ccaster', 'PRIMARY', 1, 'ucid', 'A', 0, NULL, NULL, '', 'BTREE', '');
INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES (NULL, 'ccaster', 'a_categoryschedule', 0, 'ccaster', 'PRIMARY', 1, 'uschedid', 'A', 0, NULL, NULL, '', 'BTREE', '');
INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES (NULL, 'ccaster', 'a_contentbase', 0, 'ccaster', 'PRIMARY', 1, 'urecid', 'A', 0, NULL, NULL, '', 'BTREE', '');
INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES (NULL, 'ccaster', 'a_contentlog', 0, 'ccaster', 'PRIMARY', 1, 'uslid', 'A', 0, NULL, NULL, '', 'BTREE', '');
INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES (NULL, 'ccaster', 'a_defaultcategoryschedule', 0, 'ccaster', 'PRIMARY', 1, 'udefid', 'A', 0, NULL, NULL, '', 'BTREE', '');
INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES (NULL, 'ccaster', 'a_mimetypes', 0, 'ccaster', 'PRIMARY', 1, 'umimeid', 'A', 551, NULL, NULL, '', 'BTREE', '');
INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES (NULL, 'ccaster', 'a_sessionbase', 0, 'ccaster', 'PRIMARY', 1, 'usid', 'A', 0, NULL, NULL, '', 'BTREE', '');
INSERT INTO `STATISTICS` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `NON_UNIQUE`, `INDEX_SCHEMA`, `INDEX_NAME`, `SEQ_IN_INDEX`, `COLUMN_NAME`, `COLLATION`, `CARDINALITY`, `SUB_PART`, `PACKED`, `NULLABLE`, `INDEX_TYPE`, `COMMENT`) VALUES (NULL, 'ccaster', 'a_userbase', 0, 'ccaster', 'PRIMARY', 1, 'uuid', 'A', 1, NULL, NULL, '', 'BTREE', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `TABLES`
-- 

CREATE TEMPORARY TABLE `TABLES` (
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `TABLE_TYPE` varchar(64) NOT NULL default '',
  `ENGINE` varchar(64) default NULL,
  `VERSION` bigint(21) default NULL,
  `ROW_FORMAT` varchar(10) default NULL,
  `TABLE_ROWS` bigint(21) default NULL,
  `AVG_ROW_LENGTH` bigint(21) default NULL,
  `DATA_LENGTH` bigint(21) default NULL,
  `MAX_DATA_LENGTH` bigint(21) default NULL,
  `INDEX_LENGTH` bigint(21) default NULL,
  `DATA_FREE` bigint(21) default NULL,
  `AUTO_INCREMENT` bigint(21) default NULL,
  `CREATE_TIME` datetime default NULL,
  `UPDATE_TIME` datetime default NULL,
  `CHECK_TIME` datetime default NULL,
  `TABLE_COLLATION` varchar(64) default NULL,
  `CHECKSUM` bigint(21) default NULL,
  `CREATE_OPTIONS` varchar(255) default NULL,
  `TABLE_COMMENT` varchar(80) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `TABLES`
-- 

INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'CHARACTER_SETS', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 576, 0, 1048320, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=1820', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'COLLATIONS', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 423, 0, 1048194, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2478', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'COLLATION_CHARACTER_SET_APPLICABILITY', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 387, 0, 1048383, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2709', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMNS', 'SYSTEM VIEW', 'MyISAM', 0, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2008-10-08 21:13:00', '2008-10-08 21:13:00', NULL, 'utf8_general_ci', NULL, 'max_rows=272', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'COLUMN_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 2565, 0, 1046520, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=408', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'KEY_COLUMN_USAGE', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 4637, 0, 1047962, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=226', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'PROFILING', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 356, 0, 1048420, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=2945', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'ROUTINES', 'SYSTEM VIEW', 'MyISAM', 0, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2008-10-08 21:13:00', '2008-10-08 21:13:00', NULL, 'utf8_general_ci', NULL, 'max_rows=286', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMATA', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 3656, 0, 1045616, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=286', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'SCHEMA_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 2179, 0, 1048099, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=481', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'STATISTICS', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 2679, 0, 1047489, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=391', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'TABLES', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 3641, 0, 1044967, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=287', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_CONSTRAINTS', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 2504, 0, 1046672, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=418', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'TABLE_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 2372, 0, 1048424, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=442', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'TRIGGERS', 'SYSTEM VIEW', 'MyISAM', 0, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2008-10-08 21:13:00', '2008-10-08 21:13:00', NULL, 'utf8_general_ci', NULL, 'max_rows=239', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'USER_PRIVILEGES', 'SYSTEM VIEW', 'MEMORY', 0, 'Fixed', NULL, 1986, 0, 1046622, 0, 0, NULL, NULL, NULL, NULL, 'utf8_general_ci', NULL, 'max_rows=527', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'information_schema', 'VIEWS', 'SYSTEM VIEW', 'MyISAM', 0, 'Dynamic', NULL, 0, 0, 281474976710655, 1024, 0, NULL, '2008-10-08 21:13:00', '2008-10-08 21:13:00', NULL, 'utf8_general_ci', NULL, 'max_rows=471', '');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'ccaster', 'a_categorybase', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, NULL, '2008-10-05 01:27:52', NULL, NULL, 'utf8_bin', NULL, '', 'InnoDB free: 20480 kB');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'ccaster', 'a_categoryschedule', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, NULL, '2008-10-08 15:46:09', NULL, NULL, 'utf8_bin', NULL, '', 'InnoDB free: 20480 kB');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentbase', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, NULL, '2008-10-08 15:52:08', NULL, NULL, 'utf8_bin', NULL, '', 'InnoDB free: 20480 kB');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'ccaster', 'a_contentlog', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, NULL, '2008-10-08 15:23:58', NULL, NULL, 'utf8_bin', NULL, '', 'InnoDB free: 20480 kB');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'ccaster', 'a_defaultcategoryschedule', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, NULL, '2008-10-05 01:38:11', NULL, NULL, 'utf8_bin', NULL, '', 'InnoDB free: 20480 kB');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'ccaster', 'a_mimetypes', 'BASE TABLE', 'InnoDB', 10, 'Compact', 551, 148, 81920, 0, 0, 0, NULL, '2008-10-07 18:37:01', NULL, NULL, 'utf8_bin', NULL, '', 'InnoDB free: 20480 kB');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'ccaster', 'a_sessionbase', 'BASE TABLE', 'InnoDB', 10, 'Compact', 0, 0, 16384, 0, 0, 0, NULL, '2008-10-05 01:30:25', NULL, NULL, 'utf8_bin', NULL, '', 'InnoDB free: 20480 kB');
INSERT INTO `TABLES` (`TABLE_CATALOG`, `TABLE_SCHEMA`, `TABLE_NAME`, `TABLE_TYPE`, `ENGINE`, `VERSION`, `ROW_FORMAT`, `TABLE_ROWS`, `AVG_ROW_LENGTH`, `DATA_LENGTH`, `MAX_DATA_LENGTH`, `INDEX_LENGTH`, `DATA_FREE`, `AUTO_INCREMENT`, `CREATE_TIME`, `UPDATE_TIME`, `CHECK_TIME`, `TABLE_COLLATION`, `CHECKSUM`, `CREATE_OPTIONS`, `TABLE_COMMENT`) VALUES (NULL, 'ccaster', 'a_userbase', 'BASE TABLE', 'InnoDB', 10, 'Compact', 1, 16384, 16384, 0, 0, 0, NULL, '2008-10-05 01:31:26', NULL, NULL, 'utf8_bin', NULL, '', 'InnoDB free: 20480 kB');

-- --------------------------------------------------------

-- 
-- Table structure for table `TABLE_CONSTRAINTS`
-- 

CREATE TEMPORARY TABLE `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) default NULL,
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL default '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL default '',
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `CONSTRAINT_TYPE` varchar(64) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `TABLE_CONSTRAINTS`
-- 

INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES (NULL, 'ccaster', 'PRIMARY', 'ccaster', 'a_categorybase', 'PRIMARY KEY');
INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES (NULL, 'ccaster', 'PRIMARY', 'ccaster', 'a_categoryschedule', 'PRIMARY KEY');
INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES (NULL, 'ccaster', 'PRIMARY', 'ccaster', 'a_contentbase', 'PRIMARY KEY');
INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES (NULL, 'ccaster', 'PRIMARY', 'ccaster', 'a_contentlog', 'PRIMARY KEY');
INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES (NULL, 'ccaster', 'PRIMARY', 'ccaster', 'a_defaultcategoryschedule', 'PRIMARY KEY');
INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES (NULL, 'ccaster', 'PRIMARY', 'ccaster', 'a_mimetypes', 'PRIMARY KEY');
INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES (NULL, 'ccaster', 'PRIMARY', 'ccaster', 'a_sessionbase', 'PRIMARY KEY');
INSERT INTO `TABLE_CONSTRAINTS` (`CONSTRAINT_CATALOG`, `CONSTRAINT_SCHEMA`, `CONSTRAINT_NAME`, `TABLE_SCHEMA`, `TABLE_NAME`, `CONSTRAINT_TYPE`) VALUES (NULL, 'ccaster', 'PRIMARY', 'ccaster', 'a_userbase', 'PRIMARY KEY');

-- --------------------------------------------------------

-- 
-- Table structure for table `TABLE_PRIVILEGES`
-- 

CREATE TEMPORARY TABLE `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL default '',
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL default '',
  `IS_GRANTABLE` varchar(3) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `TABLE_PRIVILEGES`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `TRIGGERS`
-- 

CREATE TEMPORARY TABLE `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) default NULL,
  `TRIGGER_SCHEMA` varchar(64) NOT NULL default '',
  `TRIGGER_NAME` varchar(64) NOT NULL default '',
  `EVENT_MANIPULATION` varchar(6) NOT NULL default '',
  `EVENT_OBJECT_CATALOG` varchar(512) default NULL,
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL default '',
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL default '',
  `ACTION_ORDER` bigint(4) NOT NULL default '0',
  `ACTION_CONDITION` longtext,
  `ACTION_STATEMENT` longtext NOT NULL,
  `ACTION_ORIENTATION` varchar(9) NOT NULL default '',
  `ACTION_TIMING` varchar(6) NOT NULL default '',
  `ACTION_REFERENCE_OLD_TABLE` varchar(64) default NULL,
  `ACTION_REFERENCE_NEW_TABLE` varchar(64) default NULL,
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL default '',
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL default '',
  `CREATED` datetime default NULL,
  `SQL_MODE` longtext NOT NULL,
  `DEFINER` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `TRIGGERS`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `USER_PRIVILEGES`
-- 

CREATE TEMPORARY TABLE `USER_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL default '',
  `TABLE_CATALOG` varchar(512) default NULL,
  `PRIVILEGE_TYPE` varchar(64) NOT NULL default '',
  `IS_GRANTABLE` varchar(3) NOT NULL default ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `USER_PRIVILEGES`
-- 

INSERT INTO `USER_PRIVILEGES` (`GRANTEE`, `TABLE_CATALOG`, `PRIVILEGE_TYPE`, `IS_GRANTABLE`) VALUES ('''ccaster''@''%''', NULL, 'USAGE', 'NO');

-- --------------------------------------------------------

-- 
-- Table structure for table `VIEWS`
-- 

CREATE TEMPORARY TABLE `VIEWS` (
  `TABLE_CATALOG` varchar(512) default NULL,
  `TABLE_SCHEMA` varchar(64) NOT NULL default '',
  `TABLE_NAME` varchar(64) NOT NULL default '',
  `VIEW_DEFINITION` longtext NOT NULL,
  `CHECK_OPTION` varchar(8) NOT NULL default '',
  `IS_UPDATABLE` varchar(3) NOT NULL default '',
  `DEFINER` varchar(77) NOT NULL default '',
  `SECURITY_TYPE` varchar(7) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `VIEWS`
-- 

