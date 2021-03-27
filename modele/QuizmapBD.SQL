

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Quizmap`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` varchar(20) DEFAULT 'abonné',
  PRIMARY KEY(`idClient`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=0;

INSERT INTO `client` (`nom`, `mdp`, `email`,`role`) VALUES
('remy','remy','remy@hotmail.fr','admin');

-- --------------------------------------------------------

