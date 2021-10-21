-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2021 at 03:35 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` text NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `harga`, `stok`, `gambar`, `created_by`, `created_date`, `update_by`, `update_date`) VALUES
(2, 'Ayam Satu', 40000, 97, '1631364312_f4818cd4daece22e883d.jpg', 1, '2021-09-10 20:53:00', NULL, NULL),
(4, 'Iphone 6', 15000000, 3, '1631420042_1ef327fbac170483c48b.jpg', 1, '2021-09-11 23:14:02', NULL, NULL),
(5, '', 0, 2, '', 0, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_barang` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `komentar` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `id_barang`, `id_user`, `komentar`, `created_by`, `created_date`, `update_by`, `update_date`) VALUES
(1, 4, 2, '<p><strong>Ada </strong><i>diskon </i><strong>tidak </strong>bang ??</p>', 2, '0000-00-00 00:00:00', NULL, NULL),
(2, 4, 2, '<p><strong>Apakah </strong><i>ada </i>diskon ?</p>', 2, '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '20210825170000', 'App\\Database\\Migrations\\User', 'default', 'App', 1629996024, 1),
(2, '20210825200000', 'App\\Database\\Migrations\\Barang', 'default', 'App', 1629996025, 1),
(3, '20210825210000', 'App\\Database\\Migrations\\Transaksi', 'default', 'App', 1629996025, 1),
(4, '20210825220000', 'App\\Database\\Migrations\\Komentar', 'default', 'App', 1629996026, 1),
(5, '20200526074900', 'App\\Database\\Migrations\\TransaksiAlterFk', 'default', 'App', 1630113435, 2),
(6, '20210526084900', 'App\\Database\\Migrations\\KomentarAlterFk', 'default', 'App', 1630113437, 2),
(7, '20200526074900', 'App\\Database\\Migrations\\TransaksiAlterAlamat', 'default', 'App', 1631415463, 3);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_barang` int(11) UNSIGNED NOT NULL,
  `id_pembeli` int(11) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `ongkir` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_barang`, `id_pembeli`, `jumlah`, `total_harga`, `created_by`, `created_date`, `update_by`, `update_date`, `alamat`, `ongkir`, `status`) VALUES
(1, 4, 2, 1, 15008000, 2, '2021-09-30 10:17:23', NULL, NULL, 'Bogor Barat', 8000, 0),
(2, 2, 2, 3, 129000, 2, '2021-10-07 08:02:59', NULL, NULL, 'Pusat', 9000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `salt` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `role` int(1) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `salt`, `avatar`, `role`, `created_by`, `created_date`, `update_by`, `update_date`) VALUES
(1, 'renaldinoviandi', '37bbc2eb94c5bba282b263b21ca5b518', '612cd275131078.01402648', NULL, 0, 0, '2021-08-30 07:43:33', NULL, NULL),
(2, 'user01', '858e4bc2494da16a048866c8950eaeb0', '613d70c2107ff2.47745221', NULL, 1, 0, '2021-09-11 22:15:14', NULL, NULL),
(3, 'user01', '6001f7a92ecc049204470338dad3ef68', '613d75ef9457a1.75285558', NULL, 1, 0, '2021-09-11 22:37:19', NULL, NULL),
(4, 'tdavis', ':u{4@OfTD', ']g(mr|0', NULL, 1, 0, '2021-10-16 19:13:06', NULL, NULL),
(5, 'taylor.hoeger', 'Rn\"pOykH', '*Vd#Q:V>', NULL, 1, 0, '2021-10-16 19:13:08', NULL, NULL),
(6, 'arnulfo.conn', 'wn#:a~\"AMg}', '1YPop(u(PazP', NULL, 1, 0, '2021-10-16 19:13:08', NULL, NULL),
(7, 'marguerite43', 'eZLvIx=:G~I&I>b5fW&', 'F2E2X\'[Sg', NULL, 1, 0, '2021-10-16 19:13:08', NULL, NULL),
(8, 'stephanie.rolfson', 'DRIE|1-vWQ%3,|)^Ge', 'vGbb65k\"c6pVt`', NULL, 1, 0, '2021-10-16 19:13:08', NULL, NULL),
(9, 'rickey.heidenreich', 'm%vVbLl@(1', 'M$^RKo$z:.po*`.M/Q<', NULL, 1, 0, '2021-10-16 19:13:08', NULL, NULL),
(10, 'americo78', '=\\e2GA2y7o:_Ev\"oPj]w', 'ha#=P)^y[f<KdyKS}\\(G', NULL, 1, 0, '2021-10-16 19:13:08', NULL, NULL),
(11, 'gabrielle33', 'T{z\\$Yvh^Jy97K*d', 'lk|balU-L?', NULL, 1, 0, '2021-10-16 19:13:08', NULL, NULL),
(12, 'ttremblay', 'El/iwD@Pz97,S-[.\'', '^?ckN2m\'', NULL, 1, 0, '2021-10-16 19:13:08', NULL, NULL),
(13, 'sydney.rodriguez', '#.y;IzGa,>-+dUh[H{/~', 'TW\'lPL#&@', NULL, 1, 0, '2021-10-16 19:13:08', NULL, NULL),
(14, 'dan.fadel', 'Z1I^$$WkvGqbJ^2-}XH', 'QB1p*nnc.zLnZ\"9-(8EK', NULL, 1, 0, '2021-10-16 19:13:08', NULL, NULL),
(15, 'elaina84', 'L+sz\\1-3', 'gp:?N;\"e/A:', NULL, 1, 0, '2021-10-16 19:13:09', NULL, NULL),
(16, 'richard.franecki', 'QMBK;^s[,VD{Q_T{rJ5', '?=7A9%4%', NULL, 1, 0, '2021-10-16 19:13:09', NULL, NULL),
(17, 'everette32', 'rOMG<N0|#FX', '?;o@7*~8*][0G', NULL, 1, 0, '2021-10-16 19:13:09', NULL, NULL),
(18, 'mwalter', '~~g|hMNhI', '\"R)@W0`Z,C>M^TI', NULL, 1, 0, '2021-10-16 19:13:09', NULL, NULL),
(19, 'lambert18', 'cIWA<YHnZ!:#SY4*', '<u\\S-xHlx8K\"3\'e', NULL, 1, 0, '2021-10-16 19:13:09', NULL, NULL),
(20, 'esteban22', 'dm1YzxN/|GS=~U', '-eg+\'uDZy146M*.O|', NULL, 1, 0, '2021-10-16 19:13:09', NULL, NULL),
(21, 'turner.lauren', 'Q,f)9Xi\\R{A', 'Cu8s<D|~a\\4B', NULL, 1, 0, '2021-10-16 19:13:09', NULL, NULL),
(22, 'uswift', 'Z6\\J3=nS0', 'VU\'eP+0.@i', NULL, 1, 0, '2021-10-16 19:13:09', NULL, NULL),
(23, 'kiehn.ophelia', '9gc5.H>ZWHa1E', 'Iq;hg&O8AtKA0;', NULL, 1, 0, '2021-10-16 19:13:09', NULL, NULL),
(24, 'jasper40', 'CS-}qRw{(=D', 'E/M|vcg.6}U66R{', NULL, 1, 0, '2021-10-16 19:13:09', NULL, NULL),
(25, 'whitney.oreilly', 'f-en}MdZ_fvh6\\s', 'C&$b}Y|1)0d4', NULL, 1, 0, '2021-10-16 19:13:10', NULL, NULL),
(26, 'littel.kathleen', '~f*7sN\'\",VbeK)dN?k', '4yde1$w%@m57uCn-', NULL, 1, 0, '2021-10-16 19:13:10', NULL, NULL),
(27, 'casper.rowe', 'cmj}[&Q', 'F@AhaqFsN[=OM[nL^$', NULL, 1, 0, '2021-10-16 19:13:10', NULL, NULL),
(28, 'jaeden80', '0QkReg', '/(!sl8\'hOP]25y%&4', NULL, 1, 0, '2021-10-16 19:13:10', NULL, NULL),
(29, 'bartoletti.janice', '{zp3Ck4J6/@t9', 'Gd$cjO3\"N', NULL, 1, 0, '2021-10-16 19:13:10', NULL, NULL),
(30, 'garrison26', '}$QK!_QIufrQ6`p6A-:', '3zGT{`Vd+qQ', NULL, 1, 0, '2021-10-16 19:13:10', NULL, NULL),
(31, 'tamia.dare', 'kO~t#3i0@=_-^pp{', 'KCTs~RW<f\"F?@3{!', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(32, 'marta23', '3WE<q-~!B', '!qNQ)!:ZH:,/$mC', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(33, 'zlebsack', '\'r9B@W(nP\'Lc2tp.(0', 'O^r~dogN>7h:r}/!n-[Y', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(34, 'abbigail21', 'eB3&O~C|m-g', 'bF|8$[U@C$d5OkFQ@*', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(35, 'sschaefer', '1Z/-/5mrsoIf', 'E=IhF$tgCT(\"p\'3>s9v)', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(36, 'ykerluke', 'Sw5z2<%', '\\yOHbXdu\'Qym7-;', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(37, 'lindgren.maryam', 'lOh!BMMz$g7::!2){FKZ', 'hub3N:d.?%Du07.dIR],', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(38, 'will.tamara', 'm|oHYVd3bC\"2RD', '@qyQ5uZIJn|H\"aEH&', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(39, 'iturcotte', 'Gwpgrded^y8b~FScV2VI', 'I5i7xrkk@!@(R/.|?', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(40, 'rowe.alexanne', '&fK,]]RC4V<du?C*', '8$=HUGH_#xP\\_Scn[}T', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(41, 'gbins', 'x,FL\\9vd<0\'TQC;B', '_~IM*v>dJ8(~o!!2NWp', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(42, 'cruickshank.emely', 'c.v-\'YRmV`Lk', ']WR(oxi)`rkQeYp&l2V7', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(43, 'alexandra.ward', 'HgU2l3y\\.926\'>', '^<yf-5', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(44, 'bwaters', '>7WaFbIF8\";?xoTfBy^S', 'o>:xa}jW]<{8p/k-9L', NULL, 1, 0, '2021-10-16 19:13:11', NULL, NULL),
(45, 'francesca23', 'Ua;Ectzw', 'w&i2=dE[%D9wtEd[`;A', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(46, 'herman.luisa', 'P3]2Y[Guxs`f]1z;)nl', 'xv*x/*2[', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(47, 'lframi', 'j@s?Uu=b<nI&2', 'z1(WtUCW', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(48, 'predovic.ila', '|1T.4I}/R)j^p[cwkVU\\', 'PWs+N[kkZHS:o{{N', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(49, 'kattie.emmerich', 'E36<mn', '(m2}_heB}Wh', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(50, 'hoppe.yessenia', 'J_Z*qHIA;x~c~L-1(0>\'', 'eHVnX7K?,3mAlWbABS', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(51, 'patsy.vandervort', '1vIBg<?OOHKSp6K;~1', ';?{4tb\"=GeKv&^^e]Ht~', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(52, 'phirthe', 'nr*i/b@/NSi=5!S}\'', 'B\"kuIe,', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(53, 'lia04', '1p]sIQAu*`Jt.P*.d:', 'gHD9%k8LpE3', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(54, 'unikolaus', 'ZEMGH<jv\\eZ*j)F>', ':m\"B@xv{y', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(55, 'brittany47', 'qe#)Y+u<rsF\\ajB/', '$xd@x(OGr\'', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(56, 'ronaldo.quigley', 'oWB{$?zj', 't1Ih+6&iZr$3\\nq15', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(57, 'eleanore.powlowski', '-PX\"iBg_48', 'od3S\\<', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(58, 'xgerlach', 'Tf5x&VF:y', '9]MY2tyt<1hvcDn^', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(59, 'boris.lemke', 'd\\7]($n', 'Iu%}F$kIf3[', NULL, 1, 0, '2021-10-16 19:13:12', NULL, NULL),
(60, 'marcelina.beatty', '=}Z$sO<i_Hs-~Zbqq', 'K7pQG7s9R[ULvogyH', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(61, 'mills.victoria', 'HA8Zr#5>', 'J%&.%oBf5', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(62, 'britney.bartoletti', 'WXVbgQR{f*qf', ']i>)H$Jq=AP|>s\\6i}ZH', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(63, 'ayla.braun', '6~^EKS6lV^Uy-$', 'ys8:7}Xd`7jwQ[E', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(64, 'donato42', 'zDjm-\\N<', 'm\\[oBL', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(65, 'dion.greenholt', 'D*7R(Qvd\');>^7v', '.,\\rKVTJ=_$;18`', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(66, 'schinner.rosina', '~dxvTt<^}Ls]#g&', '\\}PE:^4U%[Ba&', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(67, 'elisabeth.heaney', '>Q_NL9U??@Fs2j', 'T5|4PPL>lqJo', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(68, 'spagac', '_IQCftS>', 'V[@pTk', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(69, 'kaylin99', '\"p1ad-S%[8XRz>QKO', '{$po^I&(', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(70, 'corwin.zoila', 'qB[{#Lw?6IpXV', '=UW7_,odxq5>p/\'', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(71, 'tturcotte', 'pYtTK2^6rTUX?ihk6Im', 'bGN~A*Pjqt\\(^55N', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(72, 'levi67', 'B7tlaL]Wiz2', 'lAiT;n4!Y\'8`', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(73, 'gillian.bashirian', '11seB9<`F', 'UxpQpf', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(74, 'medhurst.brandt', 'Z.@nxY', 'S^K.MR', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(75, 'tavares97', 's,M]oG', '*(cw)L{z,&Ao=', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(76, 'kunde.dominic', '4Vz[iG', 'F\\}|$xxO/|h)?ihQdPCh', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(77, 'ccrona', ';\\P\"vwWgb~L`', 'F\"m{E^}=@/X-f\\2Z#*', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(78, 'spencer.violette', 'Q-<_I$u(', '6#\\/k5>rn^Nj', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(79, 'slesch', 'v13*owD', 'Ylicp!8:h/UYD2fIQ8)', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(80, 'laury61', '|!8)->&lA6dSH?p', 'Gh~;(=OJG', NULL, 1, 0, '2021-10-16 19:13:13', NULL, NULL),
(81, 'hyatt.griffin', '||vB*F', ',8ZGqucm+~6;E%NAP*ua', NULL, 1, 0, '2021-10-16 19:13:14', NULL, NULL),
(82, 'haley16', '8!\'G}7Y|6({-:h=\'m', '~`,7dmm#JT_O~3', NULL, 1, 0, '2021-10-16 19:13:14', NULL, NULL),
(83, 'katherine.emard', '\"<h>Ll$,ik4ob>p', 'L4E*72y9D,yfwS7nrbN', NULL, 1, 0, '2021-10-16 19:13:14', NULL, NULL),
(84, 'jerod.gulgowski', 'mI%RvvRj10\\M!P', '{],^BVXctU*', NULL, 1, 0, '2021-10-16 19:13:14', NULL, NULL),
(85, 'brianne.heidenreich', 'vzjJ{J<c~p', '\\#SaH-;', NULL, 1, 0, '2021-10-16 19:13:14', NULL, NULL),
(86, 'osinski.wanda', 'v\"rCP.(pE]ODi$vl', 'h3LpRd>OBq.5\'', NULL, 1, 0, '2021-10-16 19:13:14', NULL, NULL),
(87, 'hemard', 'TS/Z1+b>', '/ReBWb', NULL, 1, 0, '2021-10-16 19:13:14', NULL, NULL),
(88, 'garth58', '=-~8a.\'M8k\"*ye~?GX1(', 'QO9)\\;', NULL, 1, 0, '2021-10-16 19:13:14', NULL, NULL),
(89, 'vdonnelly', '1{.&U&lA$\'HB49]q(BFu', 'kh#JPEtzAH)!u#AA>>;', NULL, 1, 0, '2021-10-16 19:13:14', NULL, NULL),
(90, 'fgulgowski', 'aXCY={', '{Z}4YG', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(91, 'yfeil', ':!*nN|OniO@sMz9K:A-', 'c_>m1i}:', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(92, 'lily.stehr', 'E*M9tj,', '\\gvG`WR@y0MRgueZ)-\'', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(93, 'jazmyn.kub', '8Qgv!i;Pgx&_i_,O=n', '!.c7[)Aoy$@7F_I@*', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(94, 'shanahan.geraldine', '^9XxX\\.s', 'jZZK1q}Tw>$RO-', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(95, 'ojast', 'YtaMv{\"FXqa#%gX', 'ma[0->T3zd^', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(96, 'mwill', 's:Pj;~v{xy]I\'', 'F9zD#K}a', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(97, 'onie46', '/NPf8DvW@3{', '6?brUUap3teP)\\\'E:~', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(98, 'letha.bahringer', '%_vJG4+s=7.n3', '4r^PoJKkc(f,55p', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(99, 'blick.joseph', '|j\"sWZ%IU$/ijJiNQ', '6dK:1\\^&r', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(100, 'kristin.schroeder', '/>age;RB|MdRGS+HZ0', 'ZF!vW[H_c)\\@},[C,K|', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(101, 'ardith.mclaughlin', 'WZemWu+fMY', 'j73<G%KCrs+gL*AS', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(102, 'jerrod62', '6]6uq2y8]f~*?J?q[yea', '@FHPXaFX{o2vn4', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(103, 'hwalter', 'Q&r+U8ZN~N', 'K>Kh2SKZsyEP^', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(104, 'ariane.cummerata', '9\\PGnX?M-*Oq7m', 'yT\\w(W>&vtf+!=CW~', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(105, 'toy.polly', '>gYdD>~oVI/+e7', '18H*+7I0ELc]MW', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(106, 'alvera.tromp', '4hKnX\'L;', '\'nV\'KfXS$d', NULL, 1, 0, '2021-10-16 19:13:15', NULL, NULL),
(107, 'rosemary.sporer', 'no6D*J=/', 'Ds{/Vr3Hct/', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(108, 'mayert.percival', 'mWzDPORTIITI6s/GO\\>-', ']ri\",l|[<ll5.', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(109, 'heidi.kohler', '[Tzko4l3eYZ8Y3\\<_U', '`Z=j>(zEa\'N', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(110, 'gromaguera', 'cj{T=Pvqay.u/s', '(!Px|CnT1x]7=dGE)YxI', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(111, 'lesley.crona', 'XED)LU+><W/\"4e1ww', '}FImx\'+D5q!{$iE', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(112, 'adella.green', '+=ht21_`^o', ',_dN^@A', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(113, 'conroy.milan', 'P^#>J[v:\"):/?URjx)\'', '8mg+yi6r1', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(114, 'jane80', 'JnkRB:nQS8vC$\\FJS', 'm<9K>A5k^:', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(115, 'maritza.brakus', 'VhU\'ChRy', 'HI^R`(h[Egs', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(116, 'erdman.webster', 'w96,gWN4ZKkXjE{tWJ', ',n$+\\!`G7Z73a;V\'', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(117, 'elinore.lubowitz', ',r+<M*K\"Ln9Z8', '#v,8\\`!{{X#`3R]b', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(118, 'linnie03', 'G#X(TqApK5WzD', 't5UQ4E(,?&]b$RD:p', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(119, 'cartwright.tyreek', 'f&LTmb9Eg0i[E', '`|R}tWgs4]WCbVvBm', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(120, 'benny15', 'VyV\\xe-', '27H%Uix`<MgL33>|t', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(121, 'marianne.littel', 'dW15,H^b76', 'roD:&\\1T@n', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(122, 'oblick', '`[)(F-dwMe@r', 'fyi+9?Ohp<WX-,oBi-', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(123, 'annetta.larkin', 'YIgIHX2}W-', '`YM\\Zq-E-5Z$!', NULL, 1, 0, '2021-10-16 19:13:16', NULL, NULL),
(124, 'elaina.roberts', 'xgK$7s(s}]', '>Lg?z4F\\_f?ZAX', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(125, 'vito.cremin', '7R+h3vA`IXs#ftu', '+0q1$?Hny;?.ZK].NZD', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(126, 'rhett92', 'WPW),0w>8', 'fLNd4zD', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(127, 'nova.hermann', 'd;SR\'o[oEPMILzgp}4=', 'eD++As*c\\UQKZrxSjMN\\', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(128, 'twila.crooks', '|\'ka.5YxCC#2k5', 'yti]@<BWh=:.>^=^', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(129, 'harvey.kelsie', '4\'*(ZIRjLql3iMQAxDz', '57=q2lq{q', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(130, 'vonrueden.meda', '7o,sX[*7Cb5hf|x\\2G', 'PFMX15XHRx', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(131, 'gjohnston', 'P#@2sC7im$4c}uJZ$J+', 'nxd9`c:\"^a*;\\SzQ\'VH', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(132, 'heather70', 'bo\\s@Jm*', 'i3M\"hTbd]^eqEyX%', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(133, 'turcotte.assunta', 'GyFg^Pf)l<k*j]C', 'a3]o4-c>`', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(134, 'senger.enoch', '.bT}\"AT}&9-m&', '(uG{s3lTXhmrtwYG5SnH', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(135, 'ahmed03', '2$yqnXSXav', '4AJa@haklQJ\'', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(136, 'monserrat32', 'Ep,rG8/?`aG-#J$3/15', 'qFoUW$m}Za38!=Okzt`}', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(137, 'xritchie', ',mIGOtgChfcP=JbuR6', 'Uy\\tcBuG#9\\\\PV~u', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(138, 'helga.jast', 'LzHmE{jIvtn>', '\'d05E+{T&Ko\\!-=', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(139, 'schmidt.hank', 'vnzOm9NblP+', 'GpP!LxDUCsO%', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(140, 'eduardo.ebert', 'l_[phQlq1|Z', '4G(8R4K>+5s', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(141, 'heaven.zieme', 'y5}6C~+;P2iUx+H', '^p3VoPw/+', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(142, 'jerome19', 'uu{7*I>9D/W', '\'{f@rr#l;!rcp^Q6C`', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(143, 'dgottlieb', 'ClBC)0U', 'fo~spCW:U', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(144, 'jacynthe.robel', 'cCaX1ls(?}0ZODt^v', 'WP;)kq*/WW>^A<', NULL, 1, 0, '2021-10-16 19:13:17', NULL, NULL),
(145, 'webster.funk', 'J(R`viD]pI0LEe\\&>\'A', '_pzUxp{O\'6wMaxG5)\\', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(146, 'blubowitz', 'ILkiUM_\\m', 'NSWK1wm', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(147, 'gerson85', 'zUYvOk{0k', 'Mw[FUamf~7DP', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(148, 'bmosciski', '[7xe_e_3ai/i3S\":/', 'm8hI*]$99+U9\"x[>t', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(149, 'sid96', 'Je1M5bvsIn%zb', '`{H8:v5(55=D+Y', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(150, 'gerhold.rhiannon', 'I^Ed_n=Wn/e', 'k=5GsM', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(151, 'makenzie.cremin', 'Rb3\"(W\'&8?eH$%mW', '0|pWib', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(152, 'lyda11', 'e>J\'=/dr$/U(SLmOD', 'g{m0`{b{5Nd}8', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(153, 'lilla.mcclure', 'cC>X5uP#}JbS', '`s?nGS\"K', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(154, 'providenci51', ';j7LK`+{zvy0I)Cf.7i', 'c5d1>8ZU', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(155, 'misty32', '+6mbW]K{^?Vt', 'UZ,tg(-w|lU$', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(156, 'volkman.kamren', '+O*9tb3.aHK1uvgn', 'g+]tI8A<.<`<Ym~K/)', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(157, 'sswaniawski', '~4os8jM$_Bu+)FA.W', '8>S:A+mW+$[h2', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(158, 'gretchen62', '6}q]~S><3-7uPJ', 'd2,=PAuY)TI/^H-pu1%<', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(159, 'wanderson', 'xpMpJjg/g,fAr!OMfMq', 'nQM#:Q8&`8;9SZ!zL<TC', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(160, 'haleigh.mccullough', 'Oh\'ZzTs=g1)iDyX;Uwt', '(&8{hNeUy', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(161, 'wsteuber', '|*.+\\Hk\'Z$L\"|5C,', '=_!;;5%6v8D?k', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(162, 'gmarks', 'XT>=6QDHY', 'n4%c\"f#', NULL, 1, 0, '2021-10-16 19:13:18', NULL, NULL),
(163, 'hyatt.diego', 'z!_|lW', '|LB0fUWAG', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(164, 'rory68', 'ZUx.P\\w1QEJdX6A', ']\\bgTuk`_-5', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(165, 'donnelly.marilou', 'K{9U%\\F]', 'JwND/F1N1jWI}&fU@daY', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(166, 'flavio66', 'O-l6#4SSo4_Rt8r', 'D)!8R2F~w', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(167, 'america94', '6RsIX6)/reRt1', '0FrlWQo33jAjao<q\"0', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(168, 'hschaden', 's2cjM\\8#.V63/zcgVg', 'mgHm)\"\'t{\\MHXY', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(169, 'angus.champlin', '3n*sL:', '-EIkB#n$Pva!J', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(170, 'bartoletti.alexandrine', '?NH4X~!BMyo)k]Vy', 'V(V(WO#\"sH{h)$4s*v[', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(171, 'strosin.grant', 'uJ\'`=.~|b', '-5,%R(l3\'', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(172, 'boyer.lincoln', 'd\'e&E(g^?VM', '#UkPT\'~,7~OqJt', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(173, 'bradley70', 'riRSVRD;$\\?Bi8[-H8a', '4VrWS06mUFYb\\}b', NULL, 1, 0, '2021-10-16 19:13:19', NULL, NULL),
(174, 'ucarroll', 'Hpw.FA].>F.0LX~[cX]', 'B`m<Io%7H', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(175, 'tpaucek', '5<AANV', '3Wl@L(skkS,t-7SgQF`', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(176, 'schaden.kennedy', 'c{Er2fQh*]\\:NHy', '!WzAP]6TF(\\|V$/59C@', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(177, 'raven35', 'n:pj9XX`nRXoN', 'h53i#0adRz*-0Er', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(178, 'eleanore87', '%5:Q?z/j!{`', ',zS4#NB\\\\V/=6Z~7^%s{', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(179, 'favian.pfannerstill', '@CSR)Q%lAn', '^o@7Jy*,', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(180, 'casey.schroeder', 'FhInC|xu:Z|B3', '#Ko[Ow^>07:?%', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(181, 'nina.parker', 'i-%]`<itw)^', '\\dUb\\kpU=q6,AP', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(182, 'carey.wehner', 'xJJ@r3NY9*zz2D', '/5@kX7;yr1>2](', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(183, 'meda76', '<V34uY<j,IW>', '{C?4!w__$!y\"\'P!kGj~', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(184, 'pkuvalis', 'Uv2YU\',LpGY\'(|-/tDL', '31-sMD\\WAKze', NULL, 1, 0, '2021-10-16 19:13:20', NULL, NULL),
(185, 'vincent89', 'qHu*ks*RN7tpCB', '3`:}S=iWg&><h', NULL, 1, 0, '2021-10-16 19:13:21', NULL, NULL),
(186, 'jordi.stokes', 'p~4\\F=mf%EltB0`!', '{!|76cj^8&]Qol]|v', NULL, 1, 0, '2021-10-16 19:13:21', NULL, NULL),
(187, 'ctillman', 'iZ*`*sr3zn0?smJh', 'Et3q{)\"+3e:VL7^_', NULL, 1, 0, '2021-10-16 19:13:21', NULL, NULL),
(188, 'kmccullough', '6<sIm%0', 'Kk!a[Td>Y', NULL, 1, 0, '2021-10-16 19:13:21', NULL, NULL),
(189, 'zelda.hessel', 'z=%d\\Cn8', ']sjPzp{F0ofqs$w', NULL, 1, 0, '2021-10-16 19:13:21', NULL, NULL),
(190, 'runolfsdottir.kadin', '6puG}RM\\:Z:]6/@', '>,,J?o=b^f1gYJ&pJ0Zj', NULL, 1, 0, '2021-10-16 19:13:21', NULL, NULL),
(191, 'kenyatta79', '^1n^8zotDDmZn,BSr8w', 'zSx+&5', NULL, 1, 0, '2021-10-16 19:13:21', NULL, NULL),
(192, 'oma.lebsack', '+2qa^/&kgh;qon~e%', 'wU\"6Xt*/pb!d!S-?hdR', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(193, 'qleannon', 'b|uJg.xbW?4:,oaY!w', '1AVaRN*55', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(194, 'hwolf', '$E)$m&=a.&', 'p<Q%KQ\\C`:]', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(195, 'stehr.loraine', 'c.V]B7ACdH$cD;X<E{,', '$Vu+(O2_|t2', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(196, 'geo55', ']J6vKkye5Y[xE\\HIW(0', ':v,O8uL', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(197, 'beier.friedrich', 'r-v~3A', 'u@c],#6ET+<N3Hn', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(198, 'egibson', 'g%#<!msS7nu]', 'nndXz\"TpArP&', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(199, 'kris.eloy', '@4+Ql}nQ!b4ylPD!]2Gt', 'if]#!nQz', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(200, 'bernice86', 'M#.\'jF', '^!%nb?', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(201, 'luna.zboncak', '*[e\"oF\"Xi]{', '\\W)*pnj', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(202, 'rodrigo.lind', 'QD:A@8I$grT!8j', 'kPZ>_FqbnYuS2', NULL, 1, 0, '2021-10-16 19:13:22', NULL, NULL),
(203, 'aluettgen', '`-xkeblrdj\\YW', 'oi\\G2:P1A[fP', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(204, 'gwilkinson', ';?{B-+X', 'TbPNA@?^]D', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(205, 'ehansen', '.Gacb+z', '=6J7ZyTq8PPmC', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(206, 'henderson.blick', '3]x8ih', '\'FN:H[', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(207, 'bleannon', '?~$6XN)W5z[H\\N;ac>].', '\'>n~&@P4]}){PW/z4M', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(208, 'ohettinger', '>$.D<3`AawoYxS~G', '%fo|)z`FV&]KF,,U`', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(209, 'keven87', '9}?\\{\\wX', 'QWcj+h]', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(210, 'ernie49', '(+Cyzr', '(QS0fXv\\W+SzekS', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(211, 'brock.hegmann', '>5WfW&Z*zk`s', 'fK-DeC+?X7', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(212, 'marley.gibson', '{P:-+`zs%X\'JCC\\?TsR', 't\'3Cx4J{5XmW', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(213, 'leland87', ']o\\SQr@)?KG9\"', '[iW#7561ZnX;m2)ROP4#', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(214, 'gianni.gutmann', 'h\\B^KZj', '3/sBmP', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(215, 'osbaldo72', '<Z|ryBzk2rNEWv<4i4[', '4`#)Rn70S;A|1{?,z*', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(216, 'xander.beier', '4A1swYx@6pnIGLR', 'nO3\\4Nyng+CI-I6Gi^=x', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(217, 'ryder.ebert', '\\wwQgq=ll7sdq-1:^\\l[', '\\6GSj(cP', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(218, 'goodwin.rodrigo', 'egl]Iv4M<m7A5]B', 'E(S/G;Gf', NULL, 1, 0, '2021-10-16 19:13:23', NULL, NULL),
(219, 'cole.shirley', ']Z5x$$*k][;fg=|', '|5vpd3s&q[i#F', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(220, 'kassandra06', '79HUbkw|)', 'E2m]jFG&T/', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(221, 'annamarie40', '\\,%u34LE\\P,/rZ', '7~G\\dMmtZ[[*>', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(222, 'ppfannerstill', '@\'k]}$mNz', 'bssIR\"T2W;J)_eCoB=', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(223, 'deangelo.dietrich', '/bu^q}3+TY](7_b', '7\"2w_uK~4_O8', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(224, 'yundt.ernestine', 'hdYHwF4W8te$*oh6o', 'wiL@%r\'8{U<mk', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(225, 'ipfannerstill', '3{Tk>;zUg', '07v@vCCZNkgLcO', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(226, 'osborne.davis', '!U*#/]451x/8', 'dof]HNaHA', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(227, 'acremin', 'Vs`+ztr+c', '1@_I\',D;${tFyS\\]', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(228, 'mccullough.reinhold', '|vL)my!-`[', '|AFQN28<I7pDiAM0', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(229, 'gleichner.elenor', '|3A@c3-', 'sOvu69', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(230, 'candido.schaden', '0Kq}TRBRhG', '5%;\'t?CDL@', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(231, 'alessia19', 'g\\#Q3Q)n&l^K?~V(vb`F', 'jK,)-dN\'uhUDkZ0fA', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(232, 'gmayert', 'UcRb){_', 'IX<L%}6', NULL, 1, 0, '2021-10-16 19:13:24', NULL, NULL),
(233, 'mittie24', 'FJpe8ZsY\"$pl@SmsfGZl', '#9INMaAq,(|\'9:M+Ptq?', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(234, 'florine.glover', 'V`[_\'iL#%!h', 'N_{jYM0)zu1h{=8', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(235, 'tschaden', '>/%*;J', '4el3OA.uZ_t(@n', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(236, 'patience36', 'z[&,(c3ll&XKtKbUS', 'kR\\lcLkv9gVr,Q', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(237, 'clarabelle.welch', '/gGxM#Ovco:0=}%B>IP', 'Tcj(`IrBgu7', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(238, 'csporer', '\"o_A!!b=?O.', '?e>|Q$gVK', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(239, 'padberg.abigail', 'boyP[ikic^438pjU', '>%\'TL?,Obvl\\pGGtZy$', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(240, 'renner.carli', '_o}r+nT]c%Sl[GmnX', 'LdK%v?#E}XKk%b', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(241, 'norma57', '|+q^[*p', 'omLT:O+k', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(242, 'santiago.kuvalis', 'V1X1TYIZuRxua(6~nQ', '.958f.', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(243, 'nconsidine', 'R_]FBs7~IDNm(/_', 'nvU=9q', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(244, 'davonte.ryan', 'er{L_kHV@aON+9mLo!', '%)\'h&^t.wXf`', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(245, 'ayana91', 'kWu0Z$%(|5b|+=V*g[', 'R`}-]HW\\!YY0oXcyGm', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(246, 'boyle.dorcas', '\'0{(qT?Gm[M}PlRGT&]l', 'Aqv=LM=\"KmB{J7S', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(247, 'fritsch.hiram', 'X#)eoD5~;e\\vPu220', 'Mre?Afwa1>', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(248, 'mueller.avery', 'v4{t%>339/iO', '(CzR2X>]z%RKIx)EB@E', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(249, 'vandervort.callie', 'RNOzAb:4.\'', ')h\'fOII', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(250, 'goodwin.hector', ';ah0@yx<', 'M0$Xx?y5w{PvSw,6-f', NULL, 1, 0, '2021-10-16 19:13:25', NULL, NULL),
(251, 'nturner', ':gilrP+<pl+Nz4n#J_x', 'CpQa>_,', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(252, 'irobel', '0V2,{2', '7K$@S,`59tqc\'9k7wK', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(253, 'cremin.tyrese', 'L_QBsw', '`@j`JG2FjQ@', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(254, 'cara25', 'lHvq-;yU(O7mzjnpp#I', 'A5b7H`_!', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(255, 'pschumm', 'gI\'A7?>e', 'sF<BOCCp8A!h.', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(256, 'esperanza65', '(qBpg5~y', 'jrgTmqwMimd', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(257, 'elfrieda48', '\"T:E6ZYr2i', 'I-1v3/?B:$#vF6DD_y-\\', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(258, 'lubowitz.luis', '`ChC[$vCCq;Kez3#', '#eT@4_J$\\nO#pY4s', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(259, 'stamm.zella', ';T[-6Tz>hA%_Pz:)', '\'mt4O3', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(260, 'oskiles', 'p37TNTYQx&q6Sj', '2.c]x\'y', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(261, 'verla.schmeler', 'ICC9mX[FfY&>b^S', '<-s(#@54NYwO>{P|{', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(262, 'thomenick', 'CR[Ffly!&DV4RiKj', 'R<=<yh^.ZR2-l', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(263, 'ellie91', 'k^!L0&\\O~-vtoI-_', 'STxu,?`blzq\"~9^t`e2', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(264, 'taya.mcglynn', '<f}?1K7R}0fQu', 'g,J53AU', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(265, 'taylor52', ',q2}^/FMB,m9BzV03N', 'y%=d!iJM@n3kT7q3nnJJ', NULL, 1, 0, '2021-10-16 19:13:26', NULL, NULL),
(266, 'littel.tommie', 'J`jnCop]~amy@P~M.7', 'B$?LmQ', NULL, 1, 0, '2021-10-16 19:13:27', NULL, NULL),
(267, 'wuckert.pamela', 'vRY\"uJr2', 'v3;Q5,', NULL, 1, 0, '2021-10-16 19:13:27', NULL, NULL),
(268, 'hschroeder', ',K*?y.#$1]g8Y^\\/Yjg7', 'x.FUx%cS\'c', NULL, 1, 0, '2021-10-16 19:13:27', NULL, NULL),
(269, 'pfannerstill.maxine', '8XEBetTC4$F>M\"', '=T[4##NSm)tDb9+nW', NULL, 1, 0, '2021-10-16 19:13:27', NULL, NULL),
(270, 'jadyn30', 'C[63AW``{[KA$xXI@', 'T5Y>5DW1;7', NULL, 1, 0, '2021-10-16 19:13:28', NULL, NULL),
(271, 'jwiegand', ';C8aL6]3(cCuX=o\"et', 'D5QdUe_1Ii-\\&TxE;', NULL, 1, 0, '2021-10-16 19:13:28', NULL, NULL),
(272, 'ykutch', 'I)/N-V-%/@O2QJu8vt', '){m&Uk*tiLFtz', NULL, 1, 0, '2021-10-16 19:13:28', NULL, NULL),
(273, 'fdaniel', '`K{~fgl&7Rfqd]V=ewq', '22(P&sS2#', NULL, 1, 0, '2021-10-16 19:13:28', NULL, NULL),
(274, 'gleason.heloise', '*@5c@.=6Tp5cgx8iE>u', 'S<gG&?=(x?R1\'$g(', NULL, 1, 0, '2021-10-16 19:13:28', NULL, NULL),
(275, 'ahmed73', '.AtoR/L&NW/Bg\'[7<<uw', 'V@:Y+nxI9M^!NYX/', NULL, 1, 0, '2021-10-16 19:13:28', NULL, NULL),
(276, 'fhudson', '/|D~y_h', '*D\\yq-', NULL, 1, 0, '2021-10-16 19:13:28', NULL, NULL),
(277, 'dayne15', '^<c}yAoerml;L{WVLw=w', 'pY@Sslh9)~;', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(278, 'neoma37', 'ufI*\\Yk(ZvE', '//zGLYV', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(279, 'cristian99', ':8[ig\\?I(Mk[', 'l^D^V6@', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(280, 'judy.spinka', 'H$tf8(', '/U;Yv.PDC+3)7Q~#i.$', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(281, 'gerhold.maxime', 'dF!SZlgD>tB]P7AJ6_}J', 'zO(ddr22o)<o%J', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(282, 'lindgren.elta', '%$J\"#AyZsE#', '7}*>iabj()Y', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(283, 'arnoldo.runte', 'dpb[vB9', '5PQH2qIk6', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(284, 'laurianne.abernathy', '7%)1PJXvNmM', 'tgzWG5\'cR&/&z*', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(285, 'jayda.pouros', ':_Dv\'6Qj^zf\'QTbJ', 'hFl>l1WL', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(286, 'pwalker', '@13slZuoI_eo0Nz', '.H\"3~n>nUQN_WT&V{\"O', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(287, 'kris.frank', 'l,v#wkNGWxDw2b', 'q\"/=~:ha.BvQ', NULL, 1, 0, '2021-10-16 19:13:29', NULL, NULL),
(288, 'tremblay.sierra', '%;`Mtp*6[c>9>3N', '%x^4uQcEPWK', NULL, 1, 0, '2021-10-16 19:13:30', NULL, NULL),
(289, 'huels.verla', '-NwC5[', '(+5v1o*|g]Bs|', NULL, 1, 0, '2021-10-16 19:13:30', NULL, NULL),
(290, 'jeanette.balistreri', '>1aIX+H*5%n;', 'E-w1{`.{YW67di*:-j!b', NULL, 1, 0, '2021-10-16 19:13:30', NULL, NULL),
(291, 'olson.olen', '_DHG<v?Q@~|mmH9U', 'yqe0/3ST/\\wAA)X', NULL, 1, 0, '2021-10-16 19:13:30', NULL, NULL),
(292, 'paris.bergnaum', 'u3>SCq0zsT]Zyc72', 'B)w%-~K4bRCYxFuyU', NULL, 1, 0, '2021-10-16 19:13:30', NULL, NULL),
(293, 'mjerde', '!z]Jvl0T`,(', 'xi{ru/U?`v', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(294, 'dickinson.destany', 'Ubl*51=NUcT;,pd[(;', 'gTxL?F)^j', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(295, 'jonathan.renner', '<*f=%<EqynQ_RPs+umZ2', 'PlX\"7@f`6GqPZvd3v', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(296, 'hahn.lacy', 'e71aun>', '(S,;.%v/LbWE<JBh3', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(297, 'fabian63', 'fCtGR\\GJ.^Kz6h\"cj}b', 'f(>v(~;{,PzyyO@fq(', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(298, 'parker.rhett', '+93R3!kK\"?\"`&-}4', 'N\'R$ChC3:ZnUnvD`bRQ9', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(299, 'johnathon12', '^P5CO\">BONGKe)', 'wx72Rn)+\'CB\"AK', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(300, 'sanford.jerde', '?TA?/u', 'ZM}n[cm}DTcj+X&r>.!K', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(301, 'haley.aletha', '7U2i}yPJf^LaE3z/', 'GmO.#iPXGRox`bV28tZR', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(302, 'anya84', 'RUZn]IvW\'5l7}3Qcn', '`n:`Ub<%+dF[;)M1j5', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(303, 'ecorwin', '\"8%(e(3>[n3!kHY|\\mc', 'iYru\"NL?', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(304, 'ernser.viola', '!FQbQ+Slncs?~JIeL}JA', 'Z}f3Y|k{g=z', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(305, 'kailee59', 'JWjz*>;>', 'NDpy_S)', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(306, 'wkertzmann', '&-4s.hR|', 'skbl~hb', NULL, 1, 0, '2021-10-16 19:13:31', NULL, NULL),
(307, 'filiberto.blanda', '7\\uUzw&\'nxw0[\\<9', 'd@|`X@?>gEzD1`\\I0(>', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(308, 'qbogan', '2x_Mt6/', 'W)4UrD', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(309, 'mozell.thiel', 'bev%4Ws_[zeU', '~0vLz[4<`Y%nWe,/#fR', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(310, 'hermina21', 'D%1=I.BJ', 'p(n1hBFqe', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(311, 'nia.krajcik', 'yWB`G]Xf@G,xcuh%', 'n%Ly0c9E<U\\z~uxYz5', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(312, 'esatterfield', '9VXUqWwZ', 'Up+0i$Kq[', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(313, 'megane68', 'f(y\\oWl', 'S+f:hr', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(314, 'kyleigh.bayer', '6~M7,V>6T3&D', 'Qhh8R%y\"0y#W', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(315, 'kdibbert', '#AN16i', 'rmq;a$\'n#N', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(316, 'dankunding', '>j{uA|6)ux#', 'Q3i[Ta', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(317, 'cornelius54', 'SEY7:7', '9GeBQ9}3m$*xmmw@=Cz', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(318, 'ewilderman', 'XNO=D5P=ck&y.B', 'e@`t7P[T', NULL, 1, 0, '2021-10-16 19:13:32', NULL, NULL),
(319, 'schoen.columbus', 'sV[y!d17!:xx@a\\pW', '{p/u:9y:m5j0z!q?GKdJ', NULL, 1, 0, '2021-10-16 19:13:33', NULL, NULL),
(320, 'bbahringer', 'NYLvJ@$.4SH-u', 'w_aQ5cTQ]OH|bgsjV=\\', NULL, 1, 0, '2021-10-16 19:13:33', NULL, NULL),
(321, 'neha40', '\")3;j*qy', 'aPG~vx\\', NULL, 1, 0, '2021-10-16 19:13:33', NULL, NULL),
(322, 'johnson.baylee', 'c%|I>7r3|', 'sSB.\"{I[wWm\'dT', NULL, 1, 0, '2021-10-16 19:13:33', NULL, NULL),
(323, 'prohaska.roy', '7fxaVJLt', 'd*xnv/Rx+Jg2K#ka', NULL, 1, 0, '2021-10-16 19:13:33', NULL, NULL),
(324, 'conroy.elsa', 'Ux5<F1/n2yhHP', 'cyRejE|8kK', NULL, 1, 0, '2021-10-16 19:13:33', NULL, NULL),
(325, 'kara15', ':=hr=x\'8G&aq', '\"gtOI.\\Gx4sJ', NULL, 1, 0, '2021-10-16 19:13:33', NULL, NULL),
(326, 'dominic76', '2Vh:)NMW0Tcrrh', '.rNwx2pa7WDV\'~/?A-Ux', NULL, 1, 0, '2021-10-16 19:13:33', NULL, NULL),
(327, 'theresia.kertzmann', 'B;L)C^|W__IV%NT;9', ',7s{}7}WW!`', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(328, 'ustanton', '>3+`oLe.v2', '(<(zoy5', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(329, 'gnitzsche', 'xH\'s`B}`p#Uo\'=9\"1VS0', 'n[@5\\@aj9', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(330, 'heidi62', 'xiT\\sJ(]?s', 'l~xAzm0($CaVs?b', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(331, 'scot81', '\\-tzi3(9Q7nIQrI8\"', 'fjZxH,J|JGLD', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(332, 'volkman.cordia', '6|Etn32^UdJ', 'LC9(Fm%/hP@8zg', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(333, 'xkeeling', 'S?=xe$E{(9`Ck', ']pFoSu>ED--l', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(334, 'green37', '8-S#-_ASU', 'Z?kNkl!9>I$?Q^n]f\'T9', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(335, 'maribel12', 'iWEP+\\k3bf]M', 'zqeko0Pn', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(336, 'ophelia81', '!/c*NZHj3Z$Tc>(u/)]', '?mNy%m;p!5ci', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(337, 'boyer.keven', '`pX:-:86>Ap$', '](MO6W1jMl^f', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(338, 'lisandro.gerlach', 'cg<A1\"', 'zpI(_uPD?q{a8<wpNVSS', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(339, 'erdman.floyd', '7RlN/f', 'c$v.:Fk<^33', NULL, 1, 0, '2021-10-16 19:13:34', NULL, NULL),
(340, 'pouros.yoshiko', 'Er{Y]0PGG3p9t32}', '*o#`HQ&QpCE\"', NULL, 1, 0, '2021-10-16 19:13:35', NULL, NULL),
(341, 'greenholt.hazle', 'Y5bjx7S0X;8IQzJCzYVK', '{]|FckjO@o1pa@c1#\"', NULL, 1, 0, '2021-10-16 19:13:35', NULL, NULL),
(342, 'vivian.carter', '|1|0w}TV\'p^mju', '\\H,3:u,y`_+Sw0ZF]`d-', NULL, 1, 0, '2021-10-16 19:13:35', NULL, NULL),
(343, 'heloise09', ';o|#P#81J%6h*Zo', '|D?hE=i', NULL, 1, 0, '2021-10-16 19:13:35', NULL, NULL),
(344, 'marietta.casper', ';zc%g1+-O2cd', 'u:f?J6M{ZGW!GImSJvuW', NULL, 1, 0, '2021-10-16 19:13:35', NULL, NULL),
(345, 'leffler.garret', '@!IXfm*', 'jGx$1KJN|\\bSM\\`1&a/J', NULL, 1, 0, '2021-10-16 19:13:35', NULL, NULL),
(346, 'zortiz', ')T^XrI', 'lB;XLisliG4', NULL, 1, 0, '2021-10-16 19:13:35', NULL, NULL),
(347, 'sbeer', 'R@LcW#', '9|&rf;bNQ', NULL, 1, 0, '2021-10-16 19:13:35', NULL, NULL),
(348, 'hackett.gertrude', 'Z\'7(XxQi_Dw1^AZ`x9ka', '9Vx|qFHWKhCS%J\'T/4>a', NULL, 1, 0, '2021-10-16 19:13:35', NULL, NULL),
(349, 'greenfelder.roosevelt', 'H.}Wi{+DLWHWjJm?j5hw', ')voakgf0N5a*jZmDLG', NULL, 1, 0, '2021-10-16 19:13:35', NULL, NULL),
(350, 'phirthe', 'RHw:p9DCu0rdT:xp', 't4K\"&{s\"^', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(351, 'stanford.daugherty', '(,!ySF8\\RCB7<6`', '0)XWDm7\'2TZ]PzAGk', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(352, 'miller.kianna', 'm*]EvxTV/QJB', 'dh-dgb1JlOVLj}]', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(353, 'derick88', 'Lgr5xm;Ph2E4#R6w\\', 'AEO;U$!|y', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(354, 'yost.yvonne', ',X8IQx;\"mRw:', '}FBPnPui9!]\"cXwb@[', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(355, 'webster46', 'my*#,W[!Ul', '%FvH}An~Wrh5', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(356, 'jaylan25', 'z1rEgYgGi', '77NI*u3(mjiQ#~Y', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(357, 'rempel.anastacio', '{vfwxAVyAJO', 'QLeV$w0H6I_dlvs', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(358, 'hayes.felipa', 'Go&7ZFY=.[FN7whz\'', ';QK9XDJ[l^[=.]', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(359, 'delpha.rohan', '+nwL4V_zaOuE`3_%5', 'jQB)D\"]', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(360, 'kayla.hill', 'hFi:M~nB', 'Tqk2itRQqxp$i*m:$t', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(361, 'skeebler', '0?\\TcOAc', 'lil@O9Js<+;', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(362, 'moises.hodkiewicz', 'q\'P\\\"~59', 'Su_~H.,y/2ix', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(363, 'jonatan.skiles', '#;9>D)%q.U', '\\:r4UzI}+', NULL, 1, 0, '2021-10-16 19:13:36', NULL, NULL),
(364, 'rowland30', '(k\'7+v^;P%R[aYN', '\\9.+5Y{h;>G', NULL, 1, 0, '2021-10-16 19:13:37', NULL, NULL),
(365, 'tyra47', '`+R`,\'sQKPQbsIGS/u%q', 't95/1>?p]', NULL, 1, 0, '2021-10-16 19:13:37', NULL, NULL),
(366, 'rsanford', 'KL!zjczM55hNhD5p', '>E8Tt}pW4+ZxV)|icHO', NULL, 1, 0, '2021-10-16 19:13:37', NULL, NULL),
(367, 'nicola.dach', '=\"ypd3V&knobf^', 'ZV:WBU\\.Sp.Qei}}', NULL, 1, 0, '2021-10-16 19:13:37', NULL, NULL),
(368, 'burley00', '4UA}%KGx|m<A<wWexE', '\\O9Njx9Y}]U6>3z', NULL, 1, 0, '2021-10-16 19:13:37', NULL, NULL),
(369, 'gmoen', 'A|\'#&Jcv*~', 'a[P.d]e4#4ni&ZNX*', NULL, 1, 0, '2021-10-16 19:13:37', NULL, NULL),
(370, 'shania58', '%xR{qGxv^k|E-&}', 'Cf@{mt5h', NULL, 1, 0, '2021-10-16 19:13:37', NULL, NULL),
(371, 'favian.witting', 'lf#!BIJ4JD', 'pS=nm\"Dvu]:i', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(372, 'lacy.okon', 'f>0Dfr2{*7', '#)^2?9<K', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(373, 'nryan', 'bq>?sgI', ')q*\"|N\'`q.Z?{', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(374, 'durgan.henriette', 'SRRs^A0iN\'VE3r=', 'G?\'mD[oc/e`noY', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(375, 'mann.yesenia', 'AYhS0mnSP*VvuD_xZ\'@p', 'DHZI`>UvxH/TxT', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(376, 'renner.serenity', 'W6>m4/|{p', 'A7`W[?X*FpcO6u#yG*r,', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(377, 'madisyn.stroman', 'eiGk9?~XoCYC', 'gPKDtijnR5cU.$$;q', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(378, 'powlowski.kimberly', '`*`_kbryVdq,uo=M', 'hl6llg;H?Gw>', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(379, 'hconnelly', '$tCV_m9sbcA', 'I28<(%a/f/3+\\PR~aJX', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(380, 'arlo28', 'yAiVm4', '=4P/X3m', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(381, 'nkuhlman', 'vN2F\\1ExSWC:8M', 'Qb!*5fNeRR', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(382, 'jmurazik', ',Wm4.pI', '[,6|>\\0RA&H9Z.hI6cm', NULL, 1, 0, '2021-10-16 19:13:38', NULL, NULL),
(383, 'yasmin69', '8j\"Hd>IWB2i;*', 'eg5VV1I?', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(384, 'bartell.candido', 'uZ[@*T7V2q5iD', 'lmYi^/:UKJ;\"3u8_', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(385, 'qdare', 'vlD^C^J5&QM>i?,8s{', '-++6.sDo5(:_kh37!', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(386, 'tristin34', 'a\\q\'t`', 'CgTda\"}K1!Cb4-|12]i8', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(387, 'marianna.bogan', 'x\"=it;\\!', 'VOl=9Utj7f,,r2V9HI4u', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(388, 'vfritsch', '7oiXB@\\.U', 'Qe7Blny~tk.h5', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(389, 'swaniawski.mylene', '+rEKKIai[', '{YD<`WC&~4F1)kTt!)', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(390, 'lurline.dibbert', '3bR#iJ2fK2y-9I', '`ZzthpMw+p2(=O\\vG', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(391, 'maurice36', 'y&e$]Xw:EIg6wtFQn0%', '[lq2@zqx,?1~A\\|yf}4C', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(392, 'ogottlieb', 'L]$8D|AK', '}wbmNt89=z', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(393, 'mante.manuela', '(k_.D%9', 'k(:r)lro383', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(394, 'benny90', 'L(yk@xWVyoKDRE', ',{Pp,(\\@Fa@Q', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(395, 'tremblay.geo', 'TZJjMpib\\Gk', 'E*krlVG', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(396, 'klang', '\\8!FBw', '910?XZbC#0A#`&oo!=M', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(397, 'volkman.francesca', 'b,<47.IuCe_\'4', 'n}E|?mnG', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(398, 'xrogahn', '$9/Jrh}y3\"YN', 'IwrB_aVv|SH&Q/X/', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(399, 'kevin81', '\\%4!f0=Q}3#R-2[C', '>dy&QP', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(400, 'wlesch', 'P[!m1LV~xt)yp2.Qt1U4', 'WI;rX{HN~Ai', NULL, 1, 0, '2021-10-16 19:13:39', NULL, NULL),
(401, 'adela93', '[!,#JNk~seS(U$}@', 'XITP2r', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(402, 'nichole64', '6:mM.Id!.>&Sm]6LE', '^r(wb-|I9G', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(403, 'scrona', '}\\6qnSd', '\\E[]Se=X&R4', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(404, 'murray.lilliana', 'f7t|FbSTC7', 'cesQ^mUgPGf', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(405, 'bria.weissnat', 'H\\Zr-{sG)>Jc\'*mB', 'jFla%j1', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(406, 'spadberg', 'O$KJ~5Wte_<~0hm', 'D+WL5xFe', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(407, 'tyrique01', '],{]YlG}}B4d.\\', 'DeAm@PqT!V*', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(408, 'elza86', 'F.Tre-oIYr6{T/', '8fbE)f/E', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(409, 'gbayer', '0fj~Gy', '955$XZ9P)h', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(410, 'fanderson', '?w\\5n;#K6fi?D!<', '\\b8&RKF6L@ZP2l', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(411, 'torey17', 'm7))Ae0Rl!YY', '!(w``%29*)g1>o0M', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(412, 'lrice', '2GF36tumMO&', '[EERnl@ZR`>j&#c7}', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(413, 'vgreenfelder', '_.`S0%%?4Y_^', 'Pk3g9~k3', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(414, 'parisian.rowena', 'KDag?~oqYPWsQRO', 'vA,GuD_&', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(415, 'lorenz96', 'Jc3EiBA]5Ql,J`_S', '>S+&/y', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(416, 'addison21', '8WO+c-[)(wZEu1@q&', '#8f,@]<XwK', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(417, 'summer27', '&c9g6Hn', '/R{G1*fY<qaM', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(418, 'keira84', 'MNhpG&\\)rA}Z1|W^', 't27Wptj1H\\::*Fw:k', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(419, 'cyrus54', 'OzpzMvFZ\\,1:\\lM9\"e>O', ':/i5JUwK', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(420, 'cwilkinson', 'qn8_F=8dU#9', 'I8dK-UJ', NULL, 1, 0, '2021-10-16 19:13:40', NULL, NULL),
(421, 'gardner25', 'RT^XfXPUe^>', 'xN!B{u]ys?_mxwJvdQ', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(422, 'rempel.charlotte', '9)mDli\")6?W', '*3D-*\']aOg', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(423, 'ufeest', 'YA;XOW3#`c$-3qyjW)Q', 'XAtma[}^0', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(424, 'brad71', '~jNj\\3,W^>$8}Mw3', 'EXAFN)E>G9\':#Hu?u', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(425, 'uconroy', '3p(*O$jP%6^dBWzjt', '@,\"u(7)fMA5=?1', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(426, 'kroberts', '?g1n)4:', '1,V[A^sU', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(427, 'rconroy', '^~Ch>w$a~', '.R$J{WoQ3', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(428, 'charlene64', 'F}tA|OP]w\'$Ed', 'l3p?G,c!S', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(429, 'albert75', 'S7znpI`>', '8[RA-.', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(430, 'eichmann.roman', 'fgTzn-RI', 'KL\"I4th', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(431, 'weldon.brakus', 'Y&J>@L$?^Ct', 'T*umJxBXrk', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(432, 'sanford.lina', '#9{dFST\"A%yEOB=Ph_W', '\'Sri4Pb%^O', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(433, 'yrice', '%UU4Lb\"6}^rO4iB}', ';1D^fG-Qr', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(434, 'parisian.lisa', '#gphX\'Ao;Mv9G', 'Q@^7{FG5ja', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(435, 'arnoldo34', '\"lw-2?N.d3mKvnM)oUo', '<-.[Q:e5?]%j\'+NAuw?', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(436, 'grady.mohamed', ':a&p0T', 'y-a$!wm{', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(437, 'ford52', 'tGKWUy~b', '5A4_iN,2W', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(438, 'aharris', 'HJOgmVi!=', 'ZHc!.EbO', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(439, 'goldner.aiden', '^)g7Ks4lKZ:J', '~i\"nmNk)|hjL6', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(440, 'vidal.gusikowski', 'DJDvib$DD@EWKa$\"j', '|1o{`x(}Zp-?el!k^', NULL, 1, 0, '2021-10-16 19:13:41', NULL, NULL),
(441, 'amina95', 'S@k&.:', 'm6oCq((&\',r:', NULL, 1, 0, '2021-10-16 19:13:42', NULL, NULL),
(442, 'mwehner', 'dN4bYJ#9h', ';#,F)cI3\"ExYD+nAtaTb', NULL, 1, 0, '2021-10-16 19:13:42', NULL, NULL),
(443, 'fred56', '3Gs<Tf;z:M4', '$\\DeCv62v6BUs', NULL, 1, 0, '2021-10-16 19:13:42', NULL, NULL),
(444, 'kayla10', '>~(Dpp(Fh[s', 's#B3?${|nG^OT\'4nb@', NULL, 1, 0, '2021-10-16 19:13:42', NULL, NULL),
(445, 'jacobson.shannon', '(NtDzka', '[fHa7g5.v7zoKp6x', NULL, 1, 0, '2021-10-16 19:13:42', NULL, NULL),
(446, 'adriana.lind', '<rU22-rDlrM^yO^r^~Z$', 'L39peO', NULL, 1, 0, '2021-10-16 19:13:42', NULL, NULL),
(447, 'bruce95', 'IApC~N}e.', '|\'Lq_{(@neF&', NULL, 1, 0, '2021-10-16 19:13:43', NULL, NULL),
(448, 'kaycee.cassin', '=N=Z.o[', 'MEn\\~E07q3=5-', NULL, 1, 0, '2021-10-16 19:13:43', NULL, NULL),
(449, 'loy.leffler', 'G=5`k#\";0\\C[R\\a,g', '_fO:,Z<?', NULL, 1, 0, '2021-10-16 19:13:43', NULL, NULL),
(450, 'jenifer19', 'nqFzOquD', 'a>r~k#mAPg^\\;g\'\'k*Td', NULL, 1, 0, '2021-10-16 19:13:43', NULL, NULL),
(451, 'mcdermott.hellen', 'sIM43+\\E)CJ#NX{tZC/<', 'M[1b}/k8=~2bE$oWXX', NULL, 1, 0, '2021-10-16 19:13:43', NULL, NULL),
(452, 'claudine12', 'aV}7KN', '2Ea\'o^&`4OHNF[NE', NULL, 1, 0, '2021-10-16 19:13:43', NULL, NULL),
(453, 'kristina90', 'tOj65T]?', 'r8u45ywJ8kT', NULL, 1, 0, '2021-10-16 19:13:43', NULL, NULL),
(454, 'lucius64', 'ZK91bNP)hEl', 'u20*F&IYjo!]SU}3N0', NULL, 1, 0, '2021-10-16 19:13:44', NULL, NULL),
(455, 'davis.hilton', '18_IUO3(ElI', '{M/!pE.buQ7-y:=+/.G', NULL, 1, 0, '2021-10-16 19:13:44', NULL, NULL),
(456, 'schuyler95', '^\"*-|v?]l', ',\\WJjO_', NULL, 1, 0, '2021-10-16 19:13:45', NULL, NULL),
(457, 'marcia.feeney', '+TsX^H6`', ']m==>F2', NULL, 1, 0, '2021-10-16 19:13:45', NULL, NULL),
(458, 'oscar.wiza', 'VtA/-fYo*', 'pWkuF>w:z', NULL, 1, 0, '2021-10-16 19:13:45', NULL, NULL),
(459, 'amitchell', 'E|QdGXH~\'~8cCo20', '%>^R{^', NULL, 1, 0, '2021-10-16 19:13:45', NULL, NULL),
(460, 'beer.paula', '{[,hRbqfIf%Nm9ms^', '4y2>\'tD?', NULL, 1, 0, '2021-10-16 19:13:46', NULL, NULL),
(461, 'charlie20', 't-\\1/qme^X5\\f/F~>Xql', 'qv$uk|9`{<m', NULL, 1, 0, '2021-10-16 19:13:46', NULL, NULL),
(462, 'fdavis', 'N@27ULBS43<}Tx{d', 'T>U_=h*gq', NULL, 1, 0, '2021-10-16 19:13:46', NULL, NULL),
(463, 'boyer.katlyn', 'f|zZ8{i57m&02{ep-', 'Fwpgf7wU', NULL, 1, 0, '2021-10-16 19:13:46', NULL, NULL),
(464, 'robel.lourdes', '%J1^SV+pY', 'UC.)jxtjZY,V<9S-b}', NULL, 1, 0, '2021-10-16 19:13:46', NULL, NULL),
(465, 'rippin.lonzo', 'S+*%]w', '@Ipuw8.tPYbzK{', NULL, 1, 0, '2021-10-16 19:13:46', NULL, NULL),
(466, 'nleuschke', '>SZ^Z]nmBIq]PWK?n}', 'Sf@?.ikop', NULL, 1, 0, '2021-10-16 19:13:46', NULL, NULL),
(467, 'xkub', 'wijbzC9&\"725ytNbg99', 'B[.8/B!\'-6o~6M', NULL, 1, 0, '2021-10-16 19:13:46', NULL, NULL),
(468, 'kody.pouros', '!qpRU]', ',b<L<9', NULL, 1, 0, '2021-10-16 19:13:47', NULL, NULL),
(469, 'thuels', '?\\^H:g>]~t}Fjo#Qx', '@Li=+,$fV`W', NULL, 1, 0, '2021-10-16 19:13:47', NULL, NULL),
(470, 'kertzmann.wade', '=6=T3A[k)\'fWbIJ6', 'GqwVtFufI[.8x2$', NULL, 1, 0, '2021-10-16 19:13:47', NULL, NULL),
(471, 'rosetta38', 'Z|BRyd6(H|IrvxF3|4W', '3jLh].#<_e/Er*D*iw\\', NULL, 1, 0, '2021-10-16 19:13:47', NULL, NULL),
(472, 'ryan.harmon', 'GU<PrmaG/R%e9m:e', 'M2hJtB|APPc]q,e!R', NULL, 1, 0, '2021-10-16 19:13:47', NULL, NULL),
(473, 'zkessler', '>z]>K+\\I', '6+M]U:w|O)@^;', NULL, 1, 0, '2021-10-16 19:13:48', NULL, NULL),
(474, 'hmcdermott', 're:;b8|', 'fLj}h=BNT', NULL, 1, 0, '2021-10-16 19:13:48', NULL, NULL),
(475, 'mann.valentin', 'WJuqt1*e~`eujKA[pJ]', '+!V(/|==7K<', NULL, 1, 0, '2021-10-16 19:13:48', NULL, NULL),
(476, 'lakin.kiana', 'z4=7TOUj)i4birG}', 'CmK+R\\S', NULL, 1, 0, '2021-10-16 19:13:48', NULL, NULL),
(477, 'corine87', '9Z6<>\\{Tx6>\"8BJ!2_q', 'UPgZc<`\'RV*,}|.*KJ', NULL, 1, 0, '2021-10-16 19:13:48', NULL, NULL),
(478, 'dietrich.samara', 'HQ!]hM`(z]PnZo\\%?*r', 'pxI]z\\.HWX', NULL, 1, 0, '2021-10-16 19:13:48', NULL, NULL),
(479, 'qfarrell', 'gxLnk8T\\AJ|4', '<,X~;oW%yv', NULL, 1, 0, '2021-10-16 19:13:49', NULL, NULL),
(480, 'edavis', 'AoyLE[0l', '$,t@(unK(N', NULL, 1, 0, '2021-10-16 19:13:49', NULL, NULL),
(481, 'vesta.green', '9kk2lJf=G', 'vk7La\"80%eS', NULL, 1, 0, '2021-10-16 19:13:49', NULL, NULL),
(482, 'alberta61', '#zI-5+{~=', 'S8WZW`O:T', NULL, 1, 0, '2021-10-16 19:13:49', NULL, NULL),
(483, 'glebsack', '#wn,/rs2y+]h+>\'}N', 'asFYqDdSUm\"2z[=vh', NULL, 1, 0, '2021-10-16 19:13:49', NULL, NULL),
(484, 'magdalen.lang', '>S@FU^\'QpsS\\', 'q6}-fXW~T{/?l``@8w\'j', NULL, 1, 0, '2021-10-16 19:13:49', NULL, NULL),
(485, 'bergnaum.laney', 'WR#KpOUX=^*|s%x(Biq', 'J~.U}Csa9Bc7vlvP$yv}', NULL, 1, 0, '2021-10-16 19:13:49', NULL, NULL),
(486, 'rath.scotty', 'PnG>oUdN>{?', 'jC+}}6)9*<V', NULL, 1, 0, '2021-10-16 19:13:49', NULL, NULL),
(487, 'lesch.ottilie', 'q_<Wbu&H8BDq)\\', '/&0?hZ7yJawu\"d\'~2', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(488, 'stroman.hallie', 'N=~-;((wSY9Hl', '||e=x)Q5?-TM3&?B{[f9', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(489, 'hammes.assunta', 'g+T_)?q\"#', '0q<b+sn*=Al-$y(', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(490, 'zita.gleason', 'uUr$=>Vi;;', '?UE:ANg\',', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `salt`, `avatar`, `role`, `created_by`, `created_date`, `update_by`, `update_date`) VALUES
(491, 'fahey.mitchel', '7?j$$71(X)Gju', 'ah0r\'z+z;ai~?{x\"y', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(492, 'elizabeth51', 'aejcgn\"x[gb\"r\\Oi', '.24Rth0smnH}JO', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(493, 'garett.jacobi', 'L>ny.0de', 'O`yTXoXg(1^K)%4a+=pP', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(494, 'rreichert', '8O-I<Q,', '%q7y+}gg>fE-sZF>[)_', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(495, 'hkonopelski', 'yLRDYnbC2[PIm>H', '|O,9Gqh', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(496, 'hkonopelski', 'FRd:DUvs', 'B^*JgJ\\%5Ga!{]H', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(497, 'conroy.elijah', 'iqy!Cr3T#x?;2|=', '~t?=\\~', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(498, 'kunze.travon', '#ShNA.i-qQ-*l', '&,vp!4FKB^;hz', NULL, 1, 0, '2021-10-16 19:13:50', NULL, NULL),
(499, 'madie49', '5?Dv[+W4vU\\dxR8?', 'yLuxxH<', NULL, 1, 0, '2021-10-16 19:13:51', NULL, NULL),
(500, 'tina.morissette', 'v4KYTSN', '&Fj#u[75vneELg', NULL, 1, 0, '2021-10-16 19:13:51', NULL, NULL),
(501, 'jayda.hackett', 'wL|b[>x5b[/.8=!m{m/', 'Jm~:YP}G_<03l/r[~q#', NULL, 1, 0, '2021-10-16 19:13:51', NULL, NULL),
(502, 'gage.jaskolski', '12(j{zPUNxlju', 'lfC;yiv\'9/L3<I]]Y8/', NULL, 1, 0, '2021-10-16 19:13:51', NULL, NULL),
(503, 'lennie.wiegand', '%95(b$Pfj', '5m4)jI*A9|J', NULL, 1, 0, '2021-10-16 19:13:51', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `komentar_id_user_foreign` (`id_user`),
  ADD KEY `komentar_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_id_pembeli_foreign` (`id_pembeli`),
  ADD KEY `transaksi_id_barang_foreign` (`id_barang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `komentar_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_id_pembeli_foreign` FOREIGN KEY (`id_pembeli`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
