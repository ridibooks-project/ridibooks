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

-- 테이블 rdbooks.bookinfo 구조 내보내기
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE IF NOT EXISTS `bookinfo` (
  `book_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '도서 식별 번호',
  `book_name` varchar(100) NOT NULL COMMENT '도서 제목',
  `buyprice` int(11) DEFAULT NULL COMMENT '도서 구매 가격',
  `rentprice` int(11) DEFAULT NULL COMMENT '도서 대여 가격',
  `introduction` varchar(255) DEFAULT NULL COMMENT '도서 소개',
  `book_date` datetime NOT NULL COMMENT '도서 추가 일',
  `book_image` varchar(255) NOT NULL COMMENT '도서 이미지',
  `category` varchar(50) NOT NULL COMMENT '카테고리 식별 번호',
  PRIMARY KEY (`book_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='도서정보 테이블';

-- 테이블 데이터 rdbooks.bookinfo:~3 rows (대략적) 내보내기
DELETE FROM `bookinfo`;
/*!40000 ALTER TABLE `bookinfo` DISABLE KEYS */;
INSERT INTO `bookinfo` (`book_no`, `book_name`, `buyprice`, `rentprice`, `introduction`, `book_date`, `book_image`, `category`) VALUES
	(1, '귀환했더니 신이되었다', 10000, 10000, '귀환했더니 신이되었다 소개내용', '2022-02-10 00:22:08', 'C:\\Users\\leeso\\OneDrive\\바탕 화면\\ridibooks\\WebContent\\image\\1.png', '판타지소설'),
	(2, '상점쓰는이세계전자', 10000, 10000, '상점쓰는이세계전자 소개내용', '2022-02-11 00:23:33', 'C:\\Users\\leeso\\OneDrive\\바탕 화면\\ridibooks\\WebContent\\image\\2.png', '판타지소설'),
	(3, '백작가의망나니가되었다', 10000, 10000, '백작가의망나니가되었다 소개내용', '2022-02-14 00:24:22', 'C:\\Users\\leeso\\OneDrive\\바탕 화면\\ridibooks\\WebContent\\image\\2.png', '판타지소설');
/*!40000 ALTER TABLE `bookinfo` ENABLE KEYS */;

-- 테이블 rdbooks.cart 구조 내보내기
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `열 1` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 rdbooks.cart:~0 rows (대략적) 내보내기
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`열 1`) VALUES
	('1');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 rdbooks.memberinfo 구조 내보내기
DROP TABLE IF EXISTS `memberinfo`;
CREATE TABLE IF NOT EXISTS `memberinfo` (
  `id_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디 고유 식별 번호',
  `member_id` varchar(100) NOT NULL COMMENT '아이디',
  `member_email` varchar(100) NOT NULL COMMENT '이메일',
  `member_pw` varchar(100) NOT NULL COMMENT '비밀번호',
  `member_name` varchar(50) NOT NULL COMMENT '이름',
  `year` year(4) DEFAULT NULL COMMENT '출생년도(4자리)',
  `gender` varchar(4) DEFAULT NULL COMMENT '성별(M-남, F-여)',
  `marketing_agree` enum('Y','N') DEFAULT 'N' COMMENT '마케팅 수신 동의 여부',
  `select_agree` enum('Y','N') DEFAULT 'N' COMMENT '선택정보 제공 동의 여부',
  `signup_date` datetime NOT NULL COMMENT '회원가입 일',
  `login_date` datetime DEFAULT NULL COMMENT '마지막 접속 일, 시간',
  `cash` int(11) DEFAULT 0 COMMENT '보유 캐쉬',
  `point` int(11) DEFAULT 0 COMMENT '보유 포인트',
  `m_status` int(11) NOT NULL DEFAULT 0 COMMENT '회원상태\r\n0 -> 정상\r\n1 -> 탈퇴',
  PRIMARY KEY (`id_no`),
  UNIQUE KEY `member_id` (`member_id`),
  UNIQUE KEY `member_email` (`member_email`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3 COMMENT='회원정보 테이블';

-- 테이블 데이터 rdbooks.memberinfo:~11 rows (대략적) 내보내기
DELETE FROM `memberinfo`;
/*!40000 ALTER TABLE `memberinfo` DISABLE KEYS */;
INSERT INTO `memberinfo` (`id_no`, `member_id`, `member_email`, `member_pw`, `member_name`, `year`, `gender`, `marketing_agree`, `select_agree`, `signup_date`, `login_date`, `cash`, `point`, `m_status`) VALUES
	(1, 'id0001', 'id0001@naver.com', '1o1RdQbXVM', '홍길동', NULL, NULL, 'N', 'N', '2021-12-30 00:00:00', '2022-01-18 23:42:35', 0, 0, 0),
	(3, 'id0002', 'id0002@gmail.com', 'qwe123@@', '두번째', NULL, NULL, 'Y', 'Y', '2022-01-09 23:45:22', '2022-02-09 21:56:09', 0, 0, 0),
	(4, 'id0003', 'id0003@gmail.com', 'qwe123!!', '고영희', NULL, NULL, 'Y', 'Y', '2022-01-10 22:01:07', '2022-01-17 00:19:54', 0, 0, 0),
	(5, 'id0004', 'id0004@gmail.com', 'qwe123!!', '사번', NULL, NULL, 'Y', 'Y', '2022-01-10 22:05:04', '2022-01-17 00:19:54', 0, 0, 0),
	(6, 'id0005', 'id0005@gmail.com', 'qwe123!!', '오번', NULL, NULL, 'Y', 'Y', '2022-01-10 22:08:47', '2022-01-17 00:19:54', 0, 0, 0),
	(7, 'id0006', 'id0006@gmail.com', 'qwe123!!', '육번', NULL, NULL, 'N', 'N', '2022-01-10 22:14:10', '2022-01-17 00:19:54', 0, 0, 0),
	(8, 'id0007', 'id0007@daum.net', 'qwe123!!', '칠번', NULL, NULL, 'N', 'N', '2022-01-10 22:39:06', '2022-01-17 00:19:54', 0, 0, 0),
	(9, 'id0008', 'id0008@naver.com', 'qwe123!!', '팔번', NULL, NULL, 'N', 'N', '2022-01-11 21:08:39', '2022-01-17 00:19:54', 0, 0, 0),
	(83, 'id0009', 'id0009@naver.com', 'qwe123!!', '구번', '1999', NULL, 'Y', 'Y', '2022-01-23 19:47:53', NULL, 0, 0, 0),
	(84, 'id0010', 'id0010@naver.com', 'qwe123!!', '십번', '1995', NULL, 'N', 'N', '2022-01-27 00:25:38', NULL, 0, 0, 0),
	(85, 'id0011', 'id0011@naver.com', 'qwe123!!', '십일번', '0000', 'F', 'Y', 'Y', '2022-01-27 00:33:32', NULL, 0, 0, 0);
/*!40000 ALTER TABLE `memberinfo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
