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

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 rdbooks.cart 구조 내보내기
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `c_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '카트 고유 식별 번호',
  `id_no` int(11) NOT NULL COMMENT '아이디 고유 식별 번호',
  `book_no` int(11) NOT NULL COMMENT '도서 고유 식별 번호',
  `c_date` datetime NOT NULL COMMENT '도서 카트 추가 일',
  PRIMARY KEY (`c_no`) USING BTREE,
  KEY `FK_cart_memberinfo` (`id_no`),
  KEY `FK_cart_bookinfo` (`book_no`),
  CONSTRAINT `FK_cart_bookinfo` FOREIGN KEY (`book_no`) REFERENCES `bookinfo` (`book_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cart_memberinfo` FOREIGN KEY (`id_no`) REFERENCES `memberinfo` (`id_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='카트 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

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

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 rdbooks.notification 구조 내보내기
DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `noti_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '알림 고유 식별 번호',
  `id_no` int(11) DEFAULT NULL COMMENT '아이디 고유 식별 번호',
  `noti_title` varchar(255) NOT NULL COMMENT '알림 제목',
  `noti_text` varchar(255) NOT NULL COMMENT '알림 내용',
  `noti_date` datetime NOT NULL COMMENT '알림 추가 일',
  `noti_status` int(11) NOT NULL DEFAULT 0 COMMENT '알림 상태\r\n0 -> 신규\r\n1 -> 읽음',
  PRIMARY KEY (`noti_no`),
  KEY `FK_notification_memberinfo` (`id_no`),
  CONSTRAINT `FK_notification_memberinfo` FOREIGN KEY (`id_no`) REFERENCES `memberinfo` (`id_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='알림 테이블';

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
