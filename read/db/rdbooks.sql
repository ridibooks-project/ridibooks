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
CREATE DATABASE IF NOT EXISTS `rdbooks` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `rdbooks`;

-- 테이블 rdbooks.memberinfo 구조 내보내기
CREATE TABLE IF NOT EXISTS `memberinfo` (
  `id_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디 고유 식별 번호',
  `member_id` varchar(100) NOT NULL COMMENT '아이디',
  `member_email` varchar(100) NOT NULL COMMENT '이메일',
  `member_pw` varchar(100) NOT NULL COMMENT '비밀번호',
  `member_name` varchar(50) NOT NULL COMMENT '이름',
  `year` varchar(4) DEFAULT '' COMMENT '출생년도(4자리)',
  `gender` varchar(4) DEFAULT '' COMMENT '성별(M-남, F-여)',
  `marketing_agree` enum('Y','N') DEFAULT 'N' COMMENT '마케팅 수신 동의 여부',
  `select_agree` enum('Y','N') DEFAULT 'N' COMMENT '선택정보 제공 동의 여부',
  `signup_date` datetime NOT NULL COMMENT '회원가입 일',
  `login_date` datetime DEFAULT NULL COMMENT '마지막 접속 일, 시간',
  `cash` int(11) DEFAULT 0 COMMENT '보유 캐쉬',
  `point` int(11) DEFAULT 0 COMMENT '보유 포인트',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '회원상태\r\n0 -> 정상\r\n1 -> 탈퇴',
  PRIMARY KEY (`id_no`),
  UNIQUE KEY `member_id` (`member_id`),
  UNIQUE KEY `member_email` (`member_email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COMMENT='회원정보 테이블';

-- 테이블 데이터 rdbooks.memberinfo:~17 rows (대략적) 내보내기
DELETE FROM `memberinfo`;
/*!40000 ALTER TABLE `memberinfo` DISABLE KEYS */;
INSERT INTO `memberinfo` (`id_no`, `member_id`, `member_email`, `member_pw`, `member_name`, `year`, `gender`, `marketing_agree`, `select_agree`, `signup_date`, `login_date`, `cash`, `point`, `status`) VALUES
	(1, 'id0001', 'id0001@naver.com', 'qwe123!!', '홍길동', '1996', 'M', 'N', 'N', '2021-12-30 00:00:00', '2021-12-30 23:40:27', 0, 0, 0),
	(3, 'id0002', 'id0002@naver.com', 'qwe123!!', '두번째', '2000', '', 'Y', 'Y', '2022-01-09 23:45:22', NULL, 0, 0, 0),
	(4, 'id0003', 'id0003@gmail.com', 'qwe123!!', '고영희', '2001', 'F', 'Y', 'Y', '2022-01-10 22:01:07', NULL, 0, 0, 0),
	(5, 'id0004', 'id0004@gmail.com', 'qwe123!!', '사번', '1999', 'M', 'Y', 'Y', '2022-01-10 22:05:04', NULL, 0, 0, 0),
	(6, 'id0005', 'id0005@gmail.com', 'qwe123!!', '오번', '', 'F', 'Y', 'Y', '2022-01-10 22:08:47', NULL, 0, 0, 0),
	(7, 'id0006', 'id0006@gmail.com', 'qwe123!!', '육번', '', 'M', 'N', 'N', '2022-01-10 22:14:10', NULL, 0, 0, 0),
	(8, 'id0007', 'id0007@daum.net', 'qwe123!!', '칠번', '2000', '', 'N', 'N', '2022-01-10 22:39:06', NULL, 0, 0, 0),
	(9, 'id0008', 'id0008@naver.com', 'qwe123!!', '팔번', '', 'F', 'N', 'N', '2022-01-11 21:08:39', NULL, 0, 0, 0),
	(10, 'a0001', 'a0001@naver.com', 'qwe123!!', 'aa', '2000', '', 'N', 'N', '2022-01-11 21:11:25', NULL, 0, 0, 0),
	(11, 'b0001', 'a0002@naver.com', 'qwe123!!', 'bb', '', '', 'Y', 'Y', '2022-01-11 21:13:45', NULL, 0, 0, 0),
	(12, 'c0001', 'c0001@daum.net', 'qwe123!!', 'cc', '', '', 'N', 'N', '2022-01-11 21:40:59', NULL, 0, 0, 0),
	(13, 'd0001', 'd0001@naver.com', 'qwe123!!', 'dd', '', '', 'N', 'N', '2022-01-11 21:45:14', NULL, 0, 0, 0),
	(14, 'e0001', 'e0001@naver.com', 'qwe123!!', 'ee', '', '', 'N', 'N', '2022-01-11 21:45:44', NULL, 0, 0, 0),
	(15, 'g0001', 'g0001@naver.com', 'qwe123!!', 'gg', '', '', 'N', 'N', '2022-01-11 21:54:01', NULL, 0, 0, 0),
	(16, 'f0001', 'f0001@naver.com', 'qwe123!!', 'ff', '', '', 'N', 'N', '2022-01-11 21:57:35', NULL, 0, 0, 0),
	(18, 'z0001', 'z0001@naver.com', 'qwe123!!', '일번', '', '', 'N', 'N', '2022-01-12 21:13:34', NULL, 0, 0, 0),
	(19, 'x0001', 'x0001@gmail.com', 'qwe123!!', 'xx', '', '', 'N', 'N', '2022-01-12 21:18:29', NULL, 0, 0, 0),
	(20, 'y0001', 'y0001@naver.com', 'qwe123!!', 'yy', '', '', 'N', 'N', '2022-01-12 21:19:06', NULL, 0, 0, 0);
/*!40000 ALTER TABLE `memberinfo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
