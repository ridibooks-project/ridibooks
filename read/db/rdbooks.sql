-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.5-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- rdbooks 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `rdbooks`;
CREATE DATABASE IF NOT EXISTS `rdbooks` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `rdbooks`;

-- 테이블 rdbooks.memberinfo 구조 내보내기
DROP TABLE IF EXISTS `memberinfo`;
CREATE TABLE IF NOT EXISTS `memberinfo` (
  `id_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디 고유 식별 번호',
  `member_id` varchar(100) NOT NULL COMMENT '아이디',
  `member_pw` varchar(100) NOT NULL COMMENT '비밀번호',
  `member_email` varchar(100) NOT NULL COMMENT '이메일',
  `member_name` varchar(50) NOT NULL COMMENT '이름',
  `year` year(4) DEFAULT NULL COMMENT '출생년도(4자리)',
  `gender` enum('M','F') DEFAULT NULL COMMENT '성별(M-남, F-여)',
  `marketing_agree` enum('Y','N') DEFAULT 'N' COMMENT '마케팅 수신 동의 여부',
  `select_agree` enum('Y','N') DEFAULT 'N' COMMENT '선택정보 제공 동의 여부',
  `signup_date` datetime NOT NULL COMMENT '회원가입 일',
  `login_date` datetime DEFAULT NULL COMMENT '마지막 접속 일, 시간',
  `cash` int(11) DEFAULT 0 COMMENT '보유 캐쉬',
  `point` int(11) DEFAULT 0 COMMENT '보유 포인트',
  PRIMARY KEY (`id_no`),
  UNIQUE KEY `member_id` (`member_id`),
  UNIQUE KEY `member_email` (`member_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='회원정보 테이블';

-- 테이블 데이터 rdbooks.memberinfo:~2 rows (대략적) 내보내기
DELETE FROM `memberinfo`;
/*!40000 ALTER TABLE `memberinfo` DISABLE KEYS */;
INSERT INTO `memberinfo` (`id_no`, `member_id`, `member_pw`, `member_email`, `member_name`, `year`, `gender`, `marketing_agree`, `select_agree`, `signup_date`, `login_date`, `cash`, `point`) VALUES
	(1, 'id0001', 'qwe123!!', 'id0001@naver.com', '홍길동', '1996', 'M', 'N', 'N', '2021-12-30 00:00:00', '2021-12-30 23:40:27', 0, 0),
	(3, 'id0002', 'qwe123!!', 'id0002@naver.com', '두번째', '2000', NULL, 'Y', 'Y', '2022-01-09 23:45:22', NULL, 0, 0);
/*!40000 ALTER TABLE `memberinfo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
