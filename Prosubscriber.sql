-- drop database prosubscriber;

create database prosubscriber;
use prosubscriber;


DROP TABLE IF EXISTS `User`;

-- chnaged name to name_

CREATE TABLE `User` (
  `email_address` varchar(50),
  `name_` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `is_student` tinyint DEFAULT 0,
  PRIMARY KEY (`email_address`)
) ;

INSERT INTO User(email_address,name_,gender,dob,is_student) VALUES
('cduran@gmail.com','Cello','M',STR_TO_DATE('1/1/1996','%d/%m/%Y'),1)
,('rpark@yahoo.com','Rustin','M',STR_TO_DATE('1/1/2004','%d/%m/%Y'),1)
,('itsleslie26@gmail.com','Lesli','M',STR_TO_DATE('1/1/1967','%d/%m/%Y'),0)
,('kvella@gmail.com','Kamila','F',STR_TO_DATE('1/1/1991','%d/%m/%Y'),1)
-- training data for the rec system

,('lpearce0@squidoo.com','Luci','F',STR_TO_DATE('1/1/1974','%d/%m/%Y'),0)
,('jjohnikin1@globo.com','Juliana','F',STR_TO_DATE('1/1/1984','%d/%m/%Y'),0)
,('sjobke2@sourceforge.net','Susannah','F',STR_TO_DATE('1/1/1982','%d/%m/%Y'),0)
,('gmcaughtry3@canalblog.com','Georgeta','F',STR_TO_DATE('1/1/1998','%d/%m/%Y'),0)
,('cduran4@elegantthemes.com','Cello','M',STR_TO_DATE('1/1/1996','%d/%m/%Y'),1)
,('rparkhouse5@timesonline.co.uk','Rustin','M',STR_TO_DATE('1/1/2004','%d/%m/%Y'),1)
,('jbrecher6@google.es','Julian','M',STR_TO_DATE('1/1/1970','%d/%m/%Y'),0)
,('yyvens7@wikipedia.org','Yvon','M',STR_TO_DATE('1/1/2000','%d/%m/%Y'),1)
,('awapple8@google.pl','Alfonso','M',STR_TO_DATE('1/1/2000','%d/%m/%Y'),0)
,('alivesay9@hp.com','Alfi','F',STR_TO_DATE('1/1/1965','%d/%m/%Y'),0)
,('dvequea@cisco.com','Dayle','F',STR_TO_DATE('1/1/1978','%d/%m/%Y'),0)
,('dledgleyb@histats.com','Diannne','F',STR_TO_DATE('1/1/1998','%d/%m/%Y'),1)
,('fbartlomiejc@un.org','Fifi','F',STR_TO_DATE('1/1/1986','%d/%m/%Y'),0)
,('cscoullard@dedecms.com','Cynthia','F',STR_TO_DATE('1/1/1996','%d/%m/%Y'),0)
,('mfishlocke@who.int','Mersey','F',STR_TO_DATE('1/1/2001','%d/%m/%Y'),1)
,('egraylandf@weibo.com','Elianore','F',STR_TO_DATE('1/1/2003','%d/%m/%Y'),1)
,('btitherg@deliciousdays.com','Blayne','M',STR_TO_DATE('1/1/1971','%d/%m/%Y'),0)
,('lirceh@issuu.com','Lauritz','M',STR_TO_DATE('1/1/1969','%d/%m/%Y'),0)
,('lbureli@live.com','Livvyy','F',STR_TO_DATE('1/1/1988','%d/%m/%Y'),0)
,('jferensj@yahoo.com','Jude','M',STR_TO_DATE('1/1/1993','%d/%m/%Y'),1)
,('lbeachk@google.ru','Lesley','F',STR_TO_DATE('1/1/1999','%d/%m/%Y'),1)
,('wgiorginil@pbs.org','Walt','M',STR_TO_DATE('1/1/1997','%d/%m/%Y'),1)
,('aminichillom@digg.com','Amelita','F',STR_TO_DATE('1/1/1997','%d/%m/%Y'),1)
,('hwarbrickn@usa.gov','Hashim','M',STR_TO_DATE('1/1/1968','%d/%m/%Y'),0)
,('ytomaso@earthlink.net','Yorker','M',STR_TO_DATE('1/1/1985','%d/%m/%Y'),1)
,('rbrantp@mediafire.com','Raleigh','M',STR_TO_DATE('1/1/1990','%d/%m/%Y'),0)
,('bsapsfordeq@hp.com','Burch','M',STR_TO_DATE('1/1/1996','%d/%m/%Y'),0)
,('pchasemoorer@sina.com.cn','Phyllis','F',STR_TO_DATE('1/1/1993','%d/%m/%Y'),1)
,('feffords@newyorker.com','Frederik','F',STR_TO_DATE('1/1/1978','%d/%m/%Y'),0)
,('okynfortht@sakura.ne.jp','Olivier','F',STR_TO_DATE('1/1/2001','%d/%m/%Y'),1)
,('rcroyu@mayoclinic.com','Ruperto','M',STR_TO_DATE('1/1/2005','%d/%m/%Y'),1)
,('agarriquev@de.vu','Aggie','M',STR_TO_DATE('1/1/2001','%d/%m/%Y'),1)
,('zachromovw@miibeian.gov.cn','Zara','M',STR_TO_DATE('1/1/1991','%d/%m/%Y'),0)
,('lsearlex@spiegel.de','Lesli','M',STR_TO_DATE('1/1/1967','%d/%m/%Y'),0)
,('aclayilly@tiny.cc','Alford','M',STR_TO_DATE('1/1/1978','%d/%m/%Y'),0)
,('srobotthamz@google.com.hk','Sherm','M',STR_TO_DATE('1/1/1995','%d/%m/%Y'),0)
,('twhithalgh10@mayoclinic.com','Twyla','F',STR_TO_DATE('1/1/2002','%d/%m/%Y'),1)
,('bgreatex11@shutterfly.com','Beilul','F',STR_TO_DATE('1/1/2004','%d/%m/%Y'),1)
,('bsutor12@vk.com','Bertram','M',STR_TO_DATE('1/1/1978','%d/%m/%Y'),0)
,('dcadore13@ustream.tv','Donavon','M',STR_TO_DATE('1/1/1972','%d/%m/%Y'),0)
,('ldornan14@bizjournals.com','Lamond','M',STR_TO_DATE('1/1/1979','%d/%m/%Y'),0)
,('tespinola15@wikipedia.org','Terese','M',STR_TO_DATE('1/1/2005','%d/%m/%Y'),0)
,('ependrick16@youku.com','Ethelred','M',STR_TO_DATE('1/1/2000','%d/%m/%Y'),1)
,('htheuss17@symantec.com','Harbert','M',STR_TO_DATE('1/1/2004','%d/%m/%Y'),0)
,('bduke18@china.com.cn','Bertine','F',STR_TO_DATE('1/1/1974','%d/%m/%Y'),0)
,('sparffrey19@mlb.com','Starlene','F',STR_TO_DATE('1/1/2000','%d/%m/%Y'),0)
,('rclemon1a@comsenz.com','Roscoe','M',STR_TO_DATE('1/1/1967','%d/%m/%Y'),0)
,('mlademann1b@wired.com','Mace','M',STR_TO_DATE('1/1/1976','%d/%m/%Y'),0)
,('lfayne1c@qq.com','Lynde','M',STR_TO_DATE('1/1/1980','%d/%m/%Y'),0)
,('hpatten1d@themeforest.net','Heddi','M',STR_TO_DATE('1/1/2003','%d/%m/%Y'),0)
,('lerricker1e@sohu.com','Lanni','M',STR_TO_DATE('1/1/2003','%d/%m/%Y'),1)
,('aburgill1f@baidu.com','Amata','M',STR_TO_DATE('1/1/1991','%d/%m/%Y'),0)
,('sdahlen1g@goo.ne.jp','Sibilla','M',STR_TO_DATE('1/1/1978','%d/%m/%Y'),0)
,('glimeburn1h@gnu.org','Gwendolen','F',STR_TO_DATE('1/1/1974','%d/%m/%Y'),0)
,('clehuquet1i@newsvine.com','Cassandry','F',STR_TO_DATE('1/1/1994','%d/%m/%Y'),1)
,('jelwood1j@facebook.com','Jillene','F',STR_TO_DATE('1/1/2000','%d/%m/%Y'),1)
,('mpiatek1k@scribd.com','Maryrose','F',STR_TO_DATE('1/1/1990','%d/%m/%Y'),0)
,('ukhilkov1l@hubpages.com','Ulick','M',STR_TO_DATE('1/1/2005','%d/%m/%Y'),1)
,('mstollenbeck1m@163.com','Mandi','F',STR_TO_DATE('1/1/1971','%d/%m/%Y'),0)
,('kvella1n@opera.com','Kamila','F',STR_TO_DATE('1/1/1991','%d/%m/%Y'),1)
,('aflavelle1o@typepad.com','Archibald','M',STR_TO_DATE('1/1/1964','%d/%m/%Y'),0)
,('tduncombe1p@omniture.com','Theressa','F',STR_TO_DATE('1/1/1994','%d/%m/%Y'),1)
,('rshovelin1q@domainmarket.com','Roselin','F',STR_TO_DATE('1/1/1995','%d/%m/%Y'),1)
,('bireson1r@google.nl','Barbette','F',STR_TO_DATE('1/1/2000','%d/%m/%Y'),1)
,('sgaze1s@zdnet.com','Shelbi','M',STR_TO_DATE('1/1/1971','%d/%m/%Y'),0)
,('ntrunchion1t@elegantthemes.com','Nial','M',STR_TO_DATE('1/1/2005','%d/%m/%Y'),1)
,('jnettleship1u@scientificamerican.com','Jammal','M',STR_TO_DATE('1/1/2002','%d/%m/%Y'),1)
,('dreast1v@ibm.com','Donnajean','F',STR_TO_DATE('1/1/1997','%d/%m/%Y'),1)
,('rcubbin1w@scribd.com','Rickie','M',STR_TO_DATE('1/1/1985','%d/%m/%Y'),0)
,('jfairholme1x@deviantart.com','John','M',STR_TO_DATE('1/1/2003','%d/%m/%Y'),1)
,('gyurtsev1y@ow.ly','Gwendolyn','F',STR_TO_DATE('1/1/1966','%d/%m/%Y'),0)
,('slaffin1z@a8.net','Shay','F',STR_TO_DATE('1/1/2005','%d/%m/%Y'),0)
,('dwildman20@craigslist.org','Dixie','F',STR_TO_DATE('1/1/1988','%d/%m/%Y'),0)
,('cbranton21@wsj.com','Christel','F',STR_TO_DATE('1/1/1996','%d/%m/%Y'),1)
,('amanueau22@un.org','Adda','F',STR_TO_DATE('1/1/1980','%d/%m/%Y'),1)
,('sbeck23@ft.com','Stanfield','M',STR_TO_DATE('1/1/1978','%d/%m/%Y'),1)
,('kroocroft24@time.com','Kinna','F',STR_TO_DATE('1/1/1984','%d/%m/%Y'),0)
,('rtomadoni25@indiegogo.com','Reiko','F',STR_TO_DATE('1/1/1984','%d/%m/%Y'),0)
,('csweetmore26@constantcontact.com','Chrissy','F',STR_TO_DATE('1/1/1999','%d/%m/%Y'),1)
,('wmaliffe27@posterous.com','Worthington','M',STR_TO_DATE('1/1/1971','%d/%m/%Y'),0)
,('tgroundwator28@com.com','Tiff','F',STR_TO_DATE('1/1/2001','%d/%m/%Y'),1)
,('kdearsley29@goodreads.com','Ky','M',STR_TO_DATE('1/1/2001','%d/%m/%Y'),0)
,('ocoldwell2a@newsvine.com','Ody','M',STR_TO_DATE('1/1/1971','%d/%m/%Y'),0)
,('mvidler2b@twitpic.com','Marylee','F',STR_TO_DATE('1/1/1994','%d/%m/%Y'),0)
,('gmurton2c@stumbleupon.com','Giulio','M',STR_TO_DATE('1/1/1992','%d/%m/%Y'),1)
,('bhandover2d@rambler.ru','Binny','F',STR_TO_DATE('1/1/1990','%d/%m/%Y'),0)
,('plenden2e@wikia.com','Paulie','F',STR_TO_DATE('1/1/2006','%d/%m/%Y'),1)
,('cdovington2f@topsy.com','Charles','M',STR_TO_DATE('1/1/1998','%d/%m/%Y'),1)
,('pgoodlud2g@newyorker.com','Petronilla','F',STR_TO_DATE('1/1/1996','%d/%m/%Y'),1)
,('alyddon2h@sphinn.com','Alexis','M',STR_TO_DATE('1/1/1998','%d/%m/%Y'),0)
,('xbubear2i@youku.com','Xenos','M',STR_TO_DATE('1/1/1995','%d/%m/%Y'),1)
,('medwins2j@vkontakte.ru','Mirabelle','F',STR_TO_DATE('1/1/2003','%d/%m/%Y'),1)
,('ngoodoune2k@domainmarket.com','Nikki','M',STR_TO_DATE('1/1/1964','%d/%m/%Y'),0)
,('rmaylour2l@istockphoto.com','Rebekah','F',STR_TO_DATE('1/1/2005','%d/%m/%Y'),1)
,('gbough2m@ebay.com','Gwynne','F',STR_TO_DATE('1/1/2005','%d/%m/%Y'),1)
,('lcaldayrou2n@mapquest.com','Loy','M',STR_TO_DATE('1/1/1997','%d/%m/%Y'),1)
,('crumford2o@plala.or.jp','Catherin','F',STR_TO_DATE('1/1/1998','%d/%m/%Y'),0)
,('rtustin2p@example.com','Reed','M',STR_TO_DATE('1/1/1976','%d/%m/%Y'),0)
,('wcoverdale2q@webmd.com','Willabella','F',STR_TO_DATE('1/1/1975','%d/%m/%Y'),0)
,('akike2r@4shared.com','Antoni','M',STR_TO_DATE('1/1/1997','%d/%m/%Y'),1)
,('tfarlham2s@slate.com','Torrie','F',STR_TO_DATE('1/1/1983','%d/%m/%Y'),0)
,('bkonke2t@ycombinator.com','Bethena','F',STR_TO_DATE('1/1/1971','%d/%m/%Y'),0)
,('vhallbord2u@senate.gov','Vassily','F',STR_TO_DATE('1/1/2003','%d/%m/%Y'),0)
,('gfetherstonhaugh2v@woothemes.com','Guthrie','F',STR_TO_DATE('1/1/1995','%d/%m/%Y'),1)
,('zsarten2w@miitbeian.gov.cn','Zara','F',STR_TO_DATE('1/1/2000','%d/%m/%Y'),0)
,('rwescott2x@google.com.au','Roxana','F',STR_TO_DATE('1/1/1992','%d/%m/%Y'),1)
,('vhenken2y@bbb.org','Verena','F',STR_TO_DATE('1/1/1995','%d/%m/%Y'),1)
,('bbatchelor2z@dailymotion.com','Britt','M',STR_TO_DATE('1/1/1982','%d/%m/%Y'),0)
,('fbrockton30@myspace.com','Francois','M',STR_TO_DATE('1/1/2003','%d/%m/%Y'),1)
,('lmarians31@fastcompany.com','Ly','M',STR_TO_DATE('1/1/1981','%d/%m/%Y'),0)
,('cbrownsall32@google.co.uk','Charlean','F',STR_TO_DATE('1/1/1975','%d/%m/%Y'),0)
,('ykettow33@soup.io','Yancy','M',STR_TO_DATE('1/1/1997','%d/%m/%Y'),0)
,('zraiston34@whitehouse.gov','Zorina','F',STR_TO_DATE('1/1/2000','%d/%m/%Y'),1)
,('hguillart35@github.io','Hammad','M',STR_TO_DATE('1/1/1995','%d/%m/%Y'),1)
,('cbunten36@discuz.net','Christal','F',STR_TO_DATE('1/1/1982','%d/%m/%Y'),0)
,('elarver37@blinklist.com','Ethelind','F',STR_TO_DATE('1/1/2000','%d/%m/%Y'),1)
,('ajanos38@nytimes.com','Almeta','F',STR_TO_DATE('1/1/1993','%d/%m/%Y'),0)
,('ddaspar39@etsy.com','Dion','M',STR_TO_DATE('1/1/1965','%d/%m/%Y'),0)
,('bmerkel3a@zimbio.com','Ban','M',STR_TO_DATE('1/1/1997','%d/%m/%Y'),1)
,('dmustarde3b@histats.com','Daria','F',STR_TO_DATE('1/1/1996','%d/%m/%Y'),1)
,('echarity3c@prnewswire.com','Eadie','F',STR_TO_DATE('1/1/1967','%d/%m/%Y'),0)
,('afurney3d@wunderground.com','Adair','M',STR_TO_DATE('1/1/2002','%d/%m/%Y'),0)
,('jmeltetal3e@tuttocitta.it','Jackqueline','F',STR_TO_DATE('1/1/1989','%d/%m/%Y'),0)
,('gcurado3f@baidu.com','Goldi','F',STR_TO_DATE('1/1/1991','%d/%m/%Y'),0)
,('cbuessen3g@adobe.com','Coriss','F',STR_TO_DATE('1/1/1966','%d/%m/%Y'),0)
,('mevangelinos3h@livejournal.com','Manuel','M',STR_TO_DATE('1/1/2003','%d/%m/%Y'),0)
,('vdavage3i@behance.net','Vi','F',STR_TO_DATE('1/1/2004','%d/%m/%Y'),0)
,('sattrey3j@etsy.com','Simonette','F',STR_TO_DATE('1/1/1964','%d/%m/%Y'),0)
,('mtwigg3k@cargocollective.com','Myriam','F',STR_TO_DATE('1/1/2002','%d/%m/%Y'),1)
,('tandrus3l@ning.com','Trefor','M',STR_TO_DATE('1/1/1984','%d/%m/%Y'),0)
,('nburnhams3m@google.de','Napoleon','M',STR_TO_DATE('1/1/1975','%d/%m/%Y'),0)
,('gsalvatore3n@spiegel.de','Goldia','F',STR_TO_DATE('1/1/1988','%d/%m/%Y'),0)
,('gcayser3o@constantcontact.com','Garth','M',STR_TO_DATE('1/1/1971','%d/%m/%Y'),0)
,('fblouet3p@wordpress.com','Feliza','F',STR_TO_DATE('1/1/2002','%d/%m/%Y'),1)
,('tbumfrey3q@independent.co.uk','Tomkin','F',STR_TO_DATE('1/1/1996','%d/%m/%Y'),1)
,('jbainbrigge3r@google.es','Jaquelyn','F',STR_TO_DATE('1/1/1998','%d/%m/%Y'),1)
,('gcrosskill3s@meetup.com','Glennie','F',STR_TO_DATE('1/1/1975','%d/%m/%Y'),0)
,('pgresswood3t@addtoany.com','Penelope','F',STR_TO_DATE('1/1/1984','%d/%m/%Y'),0)
,('nkovalski3u@sourceforge.net','Nikola','M',STR_TO_DATE('1/1/2002','%d/%m/%Y'),1)
,('hhundell3v@liveinternet.ru','Herby','M',STR_TO_DATE('1/1/1982','%d/%m/%Y'),0)
,('dmaclleese3w@meetup.com','Didi','M',STR_TO_DATE('1/1/2003','%d/%m/%Y'),1)
,('hgeeve3x@mozilla.org','Hartley','M',STR_TO_DATE('1/1/2002','%d/%m/%Y'),1)
,('bconnelly3y@scribd.com','Brocky','M',STR_TO_DATE('1/1/1982','%d/%m/%Y'),0)
,('jcoraini3z@mediafire.com','Jens','M',STR_TO_DATE('1/1/1988','%d/%m/%Y'),0)
,('ajorat40@meetup.com','Alf','M',STR_TO_DATE('1/1/2006','%d/%m/%Y'),0)
,('kmewitt41@arizona.edu','Kelsey','F',STR_TO_DATE('1/1/1999','%d/%m/%Y'),1)
,('wdepaepe42@chron.com','Wilhelmine','F',STR_TO_DATE('1/1/1972','%d/%m/%Y'),0)
,('mpoon43@globo.com','Melba','F',STR_TO_DATE('1/1/1982','%d/%m/%Y'),0)
,('pkleinhausen@forbes.com','Paddy','M',STR_TO_DATE('1/1/2000','%d/%m/%Y'),1)
,('ekayes45@indiegogo.com','Elwood','M',STR_TO_DATE('1/1/1997','%d/%m/%Y'),1)
,('scowthart46@xrea.com','Stephannie','F',STR_TO_DATE('1/1/1995','%d/%m/%Y'),1);


--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Services`
--

DROP TABLE IF EXISTS `Services`;


CREATE TABLE `Services` (
  `service_name` varchar(40) primary key,
  `category` varchar(20) DEFAULT NULL,
  `ratings` decimal(5,2) DEFAULT NULL,
  `googleplay_link` varchar(200) 
) ;

--
-- Dumping data for table `Services`
--

-- Insert data into the Services table
INSERT INTO Services (service_name, category, ratings, googleplay_link) VALUES
('Netflix', 'Streaming', 4.3, 'https://play.google.com/store/apps/details?id=com.netflix.mediaclient&hl=en&gl=US'),
('Crunchyroll', 'Streaming', 4.7, 'https://play.google.com/store/apps/details?id=com.crunchyroll.crunchyroid&hl=en&gl=US'),
('OSN+', 'Streaming', 2.4, 'https://play.google.com/store/apps/details?id=com.osn.go&hl=en&gl=US'),
('Rakuten Viki', 'Streaming', 4.7, 'https://play.google.com/store/apps/details?id=com.viki.android&hl=en&gl=US'),
('Amazon Prime Video', 'Streaming', 4.2, 'https://play.google.com/store/apps/details?id=com.amazon.avod.thirdpartyclient&hl=en&gl=US'),
('Viu', 'Streaming', 3.7, 'https://play.google.com/store/apps/details?id=com.viu.phone&hl=en_US'),
('Disney+', 'Streaming', 4.4, 'https://play.google.com/store/apps/details?id=com.disney.disneyplus&hl=en&gl=US'),
('Zee5', 'Streaming', 4, 'https://play.google.com/store/apps/details?id=com.graymatrix.did&hl=en&gl=US'),
('Coursera', 'Education', 4.8, 'https://play.google.com/store/apps/details?id=org.coursera.android&hl=en&gl=US'),
('Brilliant.org', 'Education', 4.5, 'https://play.google.com/store/apps/details?id=org.brilliant.android&hl=en&gl=US'),
('Skillshare', 'Education', 4.2, 'https://play.google.com/store/apps/details?id=com.skillshare.Skillshare&hl=en&gl=US'),
('MasterClass', 'Education', 4.1, 'https://play.google.com/store/apps/details?id=com.yanka.mc&hl=en&gl=US'),
('Careem', 'Utilities', 4.3, 'https://play.google.com/store/apps/details?id=com.careem.acma&hl=en&gl=US'),
('Amazon Shopping', 'Utilities', 4.2, 'https://play.google.com/store/apps/details?id=com.amazon.mShop.android.shopping&hl=en&gl=US'),
('Talabat', 'Food', 3.8, 'https://play.google.com/store/apps/details?id=com.talabat&hl=en&gl=US'),
('Deliveroo', 'Food', 4.5, 'https://play.google.com/store/apps/details?id=com.deliveroo.orderapp&hl=en&gl=US'),
('Spotify', 'Music', 4.4, 'https://play.google.com/store/apps/details?id=com.spotify.music&hl=en&gl=US'),
('Hungama', 'Music', 4.1, 'https://play.google.com/store/apps/details?id=com.hungama.myplay.activity&hl=en&gl=US'),
('Anghami', 'Music', 4.6, 'https://play.google.com/store/apps/details?id=com.anghami&hl=en&gl=US'),
('Gaana', 'Music', 4.4, 'https://play.google.com/store/apps/details?id=com.gaana&hl=en&gl=US'),
('Youtube Music', 'Music', 4.5, 'https://play.google.com/store/apps/details?id=com.google.android.apps.youtube.music&hl=en&gl=US'),
('Deezer', 'Music', 4.3, 'https://play.google.com/store/apps/details?id=deezer.android.app&hl=en&gl=US');


--
-- Table structure for table `User Subscriptions`
--

DROP TABLE IF EXISTS `User_Subscriptions`;

-- changed type to type_
CREATE TABLE `User_Subscriptions` (
  `email_address` varchar(40),
  `service_name` varchar(20),
  `type_` varchar(20) DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `price` double(5,2) NULL DEFAULT NULL,
  `payment_frequency` varchar(30) DEFAULT NULL,
  `plan_name` varchar(20) NULL DEFAULT NULL,
  PRIMARY KEY (`service_name`,`email_address`),
  CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`email_address`) REFERENCES `User` (`email_address`),
  CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`service_name`) REFERENCES `Services` (`service_name`)
) ;

INSERT INTO User_Subscriptions (email_address, service_name, end_date, type_, price, payment_frequency, plan_name) VALUES 
('cduran@gmail.com', 'Viu', STR_TO_DATE('6/6/2024', '%d/%m/%Y'), 'Free-trial',  18, 'Yearly', 'Annual'),
('cduran@gmail.com', 'OSN+', STR_TO_DATE('10/12/2024', '%d/%m/%Y'), 'Free-trial',  52, 'Yearly', 'Yearly'),
('cduran@gmail.com', 'Disney+', STR_TO_DATE('12/5/2024', '%d/%m/%Y'), 'Permanent',  73, 'Monthly', 'Monthly'),
('cduran@gmail.com', 'Hungama', STR_TO_DATE('8/8/2024', '%d/%m/%Y'), 'Permanent',  99, 'Yearly', 'Yearly Music'),
('rpark@yahoo.com', 'MasterClass', STR_TO_DATE('4/11/2024', '%d/%m/%Y'), 'Permanent',10, 'Monthly', 'Duo'),
('rpark@yahoo.com', 'Anghami', STR_TO_DATE('6/12/2024', '%d/%m/%Y'), 'Free-trial', 73, 'Yearly', 'Student'),
('rpark@yahoo.com', 'Crunchyroll', STR_TO_DATE('4/11/2024', '%d/%m/%Y'), 'Free-trial',  88, 'Monthly', 'Mega Fan'),
('itsleslie26@gmail.com', 'Skillshare', STR_TO_DATE('4/11/2024', '%d/%m/%Y'), 'Free-trial',  12, 'Monthly', 'Monthly'),
('itsleslie26@gmail.com', 'OSN+', STR_TO_DATE('3/1/2024', '%d/%m/%Y'), 'Free-trial',  13, 'Yearly', 'Yearly'),
('itsleslie26@gmail.com', 'Youtube Music', STR_TO_DATE('5/8/2024', '%d/%m/%Y'), 'Permanent',  81, 'Monthly', 'Individual'),
('itsleslie26@gmail.com', 'Netflix', STR_TO_DATE('6/7/2024', '%d/%m/%Y'), 'Permanent',  7, 'Monthly', 'Standard'),
('kvella@gmail.com', 'Zee5', STR_TO_DATE('3/1/2024', '%d/%m/%Y'), 'Permanent',  5, 'Yearly', 'Annual'),
('kvella@gmail.com', 'Brilliant.org', STR_TO_DATE('12/3/2024', '%d/%m/%Y'), 'Permanent',  13, 'Monthly', 'Monthly'),
('kvella@gmail.com', 'Rakuten Viki', STR_TO_DATE('12/6/2024', '%d/%m/%Y'), 'Permanent',  41, 'Monthly', 'Monthly'),
('kvella@gmail.com', 'Youtube Music', STR_TO_DATE('3/7/2024', '%d/%m/%Y'), 'Permanent',  79, 'Monthly', 'Individual'),
('kvella@gmail.com', 'Coursera', STR_TO_DATE('2/4/2024', '%d/%m/%Y'), 'Permanent', 64, 'Yearly', 'Plus Annual');

-- trianing data for rec system
INSERT INTO User_Subscriptions (service_name,type_,end_date,price,payment_frequency,plan_name,email_address) VALUES
 ('Hungama','Permanent',STR_TO_DATE('22/03/2024','%d/%m/%Y'),12,'Monthly','Monthly Movies','lpearce0@squidoo.com')
,('Viu','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),86,'Yearly','Annual','jjohnikin1@globo.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),93,'Monthly','Basic','jjohnikin1@globo.com')
,('Disney+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),91,'Monthly','Monthly','sjobke2@sourceforge.net')
,('Anghami','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),46,'Yearly','Yearly','sjobke2@sourceforge.net')
,('Gaana','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),90,'Monthly','Monthly','gmcaughtry3@canalblog.com')
,('Viu','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),18,'Yearly','Annual','cduran4@elegantthemes.com')
,('OSN+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),52,'Yearly','Yearly','cduran4@elegantthemes.com')
,('Disney+','Permanent',STR_TO_DATE('13/03/2024','%d/%m/%Y'),73,'Monthly','Monthly','cduran4@elegantthemes.com')
,('Hungama','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),99,'Yearly','Yearly Music','cduran4@elegantthemes.com')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),10,'Monthly','Duo','rparkhouse5@timesonline.co.uk')
,('Anghami','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),73,'Yearly','Student','rparkhouse5@timesonline.co.uk')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),88,'Monthly','Mega Fan','rparkhouse5@timesonline.co.uk')
,('Disney+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),20,'Monthly','Monthly','jbrecher6@google.es')
,('Netflix','Permanent',STR_TO_DATE('21/02/2024','%d/%m/%Y'),12,'Monthly','Basic','jbrecher6@google.es')
,('Netflix','Permanent',STR_TO_DATE('21/02/2024','%d/%m/%Y'),12,'Monthly','Basic','yyvens7@wikipedia.org')
,('Spotify','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),12,'Monthly','Family','awapple8@google.pl')
,('Gaana','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),97,'Yearly','Yearly','awapple8@google.pl')
,('Brilliant.org','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),42,'Monthly','Monthly','awapple8@google.pl')
,('Rakuten Viki','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),43,'Monthly','Monthly','alivesay9@hp.com')
,('Netflix','Free-trial',STR_TO_DATE('29/01/2024','%d/%m/%Y'),74,'Monthly','Premium','alivesay9@hp.com')
,('Viu','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),98,'Yearly','Annual','alivesay9@hp.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),67,'Monthly','Premium','dvequea@cisco.com')
,('Viu','Permanent',STR_TO_DATE('5/2/2024','%d/%m/%Y'),17,'Yearly','Annual','dledgleyb@histats.com')
,('Viu','Permanent',STR_TO_DATE('5/2/2024','%d/%m/%Y'),17,'Yearly','Annual','fbartlomiejc@un.org')
,('Skillshare','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),74,'Monthly','Monthly','fbartlomiejc@un.org')
,('Spotify','Free-trial',STR_TO_DATE('4/1/2024','%d/%m/%Y'),12,'Monthly','Individual','fbartlomiejc@un.org')
,('Anghami','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),77,'Yearly','Family Yearly','fbartlomiejc@un.org')
,('Netflix','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),15,'Monthly','Basic','cscoullard@dedecms.com')
,('Deezer','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),42,'Monthly','Family','cscoullard@dedecms.com')
,('Amazon Shopping','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),9,'Monthly','Monthly','mfishlocke@who.int')
,('Amazon Shopping','Permanent',STR_TO_DATE('6/2/2024','%d/%m/%Y'),22,'Yearly','Annual','egraylandf@weibo.com')
,('Deliveroo','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),63,'Monthly','Plus Silver','egraylandf@weibo.com')
,('Skillshare','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),97,'Monthly','Monthly','egraylandf@weibo.com')
,('Careem','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),77,'Monthly','Monthly','egraylandf@weibo.com')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),25,'Yearly','Annual','egraylandf@weibo.com')
,('Deliveroo','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),84,'Monthly','Plus Silver','btitherg@deliciousdays.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),7,'Monthly','Standard','btitherg@deliciousdays.com')
,('Skillshare','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),84,'Monthly','Monthly','btitherg@deliciousdays.com')
,('Skillshare','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),55,'Monthly','Monthly','lirceh@issuu.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),18,'Monthly','Basic','lirceh@issuu.com')
,('OSN+','Free-trial',STR_TO_DATE('27/03/2024','%d/%m/%Y'),91,'Yearly','Yearly','lirceh@issuu.com')
,('Viu','Free-trial',STR_TO_DATE('12/1/2024','%d/%m/%Y'),98,'Yearly','Annual','lirceh@issuu.com')
,('Deezer','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),34,'Yearly','Family Yearly','lirceh@issuu.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),19,'Monthly','Premium','lbureli@live.com')
,('OSN+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),83,'Yearly','Yearly','lbureli@live.com')
,('Zee5','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),48,'Monthly','Monthly','jferensj@yahoo.com')
,('Spotify','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),91,'Monthly','Student','jferensj@yahoo.com')
,('Gaana','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),75,'Yearly','Yearly','jferensj@yahoo.com')
,('MasterClass','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),37,'Monthly','Individual','lbeachk@google.ru')
,('Deezer','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),57,'Monthly','Monthly','wgiorginil@pbs.org')
,('Youtube Music','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),62,'Monthly','Student','wgiorginil@pbs.org')
,('Disney+','Free-trial',STR_TO_DATE('24/03/2024','%d/%m/%Y'),16,'Monthly','Monthly','wgiorginil@pbs.org')
,('Zee5','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),28,'Yearly','Annual','aminichillom@digg.com')
,('MasterClass','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),67,'Monthly','Individual','aminichillom@digg.com')
,('OSN+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),28,'Monthly','Monthly','aminichillom@digg.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),22,'Yearly','Mega Fan (yearly)','aminichillom@digg.com')
,('Brilliant.org','Free-trial',STR_TO_DATE('7/3/2024','%d/%m/%Y'),30,'Yearly','Annual','aminichillom@digg.com')
,('Brilliant.org','Permanent',STR_TO_DATE('12/2/2024','%d/%m/%Y'),12,'Yearly','Annual','hwarbrickn@usa.gov')
,('OSN+','Free-trial',STR_TO_DATE('7/1/2024','%d/%m/%Y'),38,'Yearly','Yearly','hwarbrickn@usa.gov')
,('Amazon Shopping','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),76,'Monthly','Monthly','hwarbrickn@usa.gov')
,('Youtube Music','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),29,'Monthly','Individual','ytomaso@earthlink.net')
,('Amazon Shopping','Free-trial',STR_TO_DATE('8/1/2024','%d/%m/%Y'),32,'Monthly','Monthly','ytomaso@earthlink.net')
,('Deliveroo','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),97,'Monthly','Plus Silver','rbrantp@mediafire.com')
,('Zee5','Permanent',STR_TO_DATE('21/01/2024','%d/%m/%Y'),60,'Yearly','Annual','rbrantp@mediafire.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE('27/01/2024','%d/%m/%Y'),11,'Monthly','Prime Monthly','bsapsfordeq@hp.com')
,('Disney+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),63,'Yearly','Annual','bsapsfordeq@hp.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),34,'Monthly','Standard','pchasemoorer@sina.com.cn')
,('Talabat','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),85,'Monthly','Pro','pchasemoorer@sina.com.cn')
,('Amazon Shopping','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),18,'Monthly','Monthly','feffords@newyorker.com')
,('Skillshare','Permanent',STR_TO_DATE('12/1/2024','%d/%m/%Y'),46,'Monthly','Monthly','okynfortht@sakura.ne.jp')
,('Coursera','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),59,'Yearly','Plus Annual','okynfortht@sakura.ne.jp')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),91,'Monthly','Duo','okynfortht@sakura.ne.jp')
,('MasterClass','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),85,'Monthly','Individual','rcroyu@mayoclinic.com')
,('Anghami','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),32,'Yearly','Student','rcroyu@mayoclinic.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),41,'Monthly','Basic','agarriquev@de.vu')
,('Spotify','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),94,'Monthly','Student','agarriquev@de.vu')
,('Coursera','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),88,'Monthly','Plus Monthly','zachromovw@miibeian.gov.cn')
,('Youtube Music','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),81,'Monthly','Family','zachromovw@miibeian.gov.cn')
,('Skillshare','Free-trial',STR_TO_DATE('14/03/2024','%d/%m/%Y'),12,'Monthly','Monthly','lsearlex@spiegel.de')
,('Talabat','Free-trial',STR_TO_DATE('9/1/2024','%d/%m/%Y'),62,'Monthly','Pro','lsearlex@spiegel.de')
,('OSN+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),13,'Yearly','Yearly','lsearlex@spiegel.de')
,('Youtube Music','Permanent',STR_TO_DATE('19/01/2024','%d/%m/%Y'),81,'Monthly','Individual','lsearlex@spiegel.de')
,('Netflix','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),7,'Monthly','Standard','lsearlex@spiegel.de')
,('Hungama','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),65,'Quarterly','Quarterly Movies','aclayilly@tiny.cc')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),45,'Monthly','Individual','aclayilly@tiny.cc')
,('Skillshare','Permanent',STR_TO_DATE('9/3/2024','%d/%m/%Y'),63,'Monthly','Monthly','aclayilly@tiny.cc')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),95,'Monthly','Duo','srobotthamz@google.com.hk')
,('Coursera','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),7,'Yearly','Plus Annual','srobotthamz@google.com.hk')
,('Crunchyroll','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),23,'Monthly','Fan','srobotthamz@google.com.hk')
,('Zee5','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),57,'Monthly','Monthly','srobotthamz@google.com.hk')
,('Viu','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),78,'Yearly','Annual','twhithalgh10@mayoclinic.com')
,('Hungama','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),69,'Quarterly','Quarterly Movies','twhithalgh10@mayoclinic.com')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),9,'Monthly','Individual','twhithalgh10@mayoclinic.com')
,('Anghami','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),45,'Yearly','Student','twhithalgh10@mayoclinic.com')
,('Gaana','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),42,'Yearly','Yearly','bgreatex11@shutterfly.com')
,('Amazon Prime Video','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),92,'Yearly','Prime Annual','bgreatex11@shutterfly.com')
,('Youtube Music','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),82,'Monthly','Individual','bgreatex11@shutterfly.com')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),41,'Monthly','Monthly','bgreatex11@shutterfly.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),25,'Monthly','Prime Monthly','bsutor12@vk.com')
,('Zee5','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),22,'Monthly','Monthly','dcadore13@ustream.tv')
,('OSN+','Free-trial',STR_TO_DATE('14/02/2024','%d/%m/%Y'),74,'Monthly','Monthly','dcadore13@ustream.tv')
,('Gaana','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),10,'Monthly','Monthly','dcadore13@ustream.tv')
,('Talabat','Free-trial',STR_TO_DATE('6/3/2024','%d/%m/%Y'),3,'Monthly','Pro','ldornan14@bizjournals.com')
,('Amazon Prime Video','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),26,'Monthly','Prime Monthly','ldornan14@bizjournals.com')
,('Netflix','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),60,'Monthly','Premium','ldornan14@bizjournals.com')
,('Deezer','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),16,'Yearly','Annual Plan','tespinola15@wikipedia.org')
,('Crunchyroll','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),27,'Monthly','Mega Fan','tespinola15@wikipedia.org')
,('Talabat','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),16,'Monthly','Pro','tespinola15@wikipedia.org')
,('Deliveroo','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),23,'Monthly','Plus Silver','tespinola15@wikipedia.org')
,('Careem','Free-trial',STR_TO_DATE('12/2/2024','%d/%m/%Y'),84,'Monthly','Monthly','ependrick16@youku.com')
,('Talabat','Free-trial',STR_TO_DATE('6/2/2024','%d/%m/%Y'),47,'Monthly','Pro','htheuss17@symantec.com')
,('Deliveroo','Free-trial',STR_TO_DATE('7/1/2024','%d/%m/%Y'),87,'Monthly','Plus Gold','bduke18@china.com.cn')
,('Skillshare','Permanent',STR_TO_DATE('17/03/2024','%d/%m/%Y'),68,'Monthly','Monthly','bduke18@china.com.cn')
,('Rakuten Viki','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),31,'Monthly','Monthly','sparffrey19@mlb.com')
,('Careem','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),79,'Monthly','Monthly','sparffrey19@mlb.com')
,('Zee5','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),14,'Monthly','Monthly','sparffrey19@mlb.com')
,('Skillshare','Permanent',STR_TO_DATE('20/02/2024','%d/%m/%Y'),3,'Monthly','Monthly','sparffrey19@mlb.com')
,('Deliveroo','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),68,'Monthly','Plus Silver','sparffrey19@mlb.com')
,('Talabat','Free-trial',STR_TO_DATE('9/1/2024','%d/%m/%Y'),100,'Monthly','Pro','rclemon1a@comsenz.com')
,('MasterClass','Free-trial',STR_TO_DATE('4/2/2024','%d/%m/%Y'),4,'Monthly','Duo','rclemon1a@comsenz.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),62,'Yearly','Mega Fan (yearly)','rclemon1a@comsenz.com')
,('Brilliant.org','Permanent',STR_TO_DATE('22/03/2024','%d/%m/%Y'),7,'Yearly','Annual','mlademann1b@wired.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),82,'Monthly','Prime Monthly','mlademann1b@wired.com')
,('Rakuten Viki','Free-trial',STR_TO_DATE('25/03/2024','%d/%m/%Y'),39,'Monthly','Monthly','lfayne1c@qq.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),92,'Monthly','Standard','lfayne1c@qq.com')
,('Anghami','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),7,'Yearly','Yearly','hpatten1d@themeforest.net')
,('Coursera','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),73,'Yearly','Plus Annual','lerricker1e@sohu.com')
,('Deezer','Free-trial',STR_TO_DATE('23/03/2024','%d/%m/%Y'),52,'Yearly','Family Yearly','lerricker1e@sohu.com')
,('Brilliant.org','Permanent',STR_TO_DATE('18/02/2024','%d/%m/%Y'),51,'Yearly','Annual','lerricker1e@sohu.com')
,('Crunchyroll','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),76,'Monthly','Mega Fan','lerricker1e@sohu.com')
,('Spotify','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),95,'Monthly','Duo','aburgill1f@baidu.com')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),69,'Monthly','Duo','aburgill1f@baidu.com')
,('Deliveroo','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),26,'Monthly','Plus Gold','aburgill1f@baidu.com')
,('Youtube Music','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),53,'Monthly','Family','aburgill1f@baidu.com')
,('Anghami','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),12,'Yearly','Yearly','sdahlen1g@goo.ne.jp')
,('Deliveroo','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),11,'Monthly','Plus Silver','sdahlen1g@goo.ne.jp')
,('Netflix','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),18,'Monthly','Standard','sdahlen1g@goo.ne.jp')
,('Hungama','Permanent',STR_TO_DATE('22/02/2024','%d/%m/%Y'),35,'Yearly','Yearly Movies','glimeburn1h@gnu.org')
,('Amazon Shopping','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),80,'Yearly','Annual','glimeburn1h@gnu.org')
,('Skillshare','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),53,'Monthly','Monthly','glimeburn1h@gnu.org')
,('Gaana','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),91,'Monthly','Monthly','glimeburn1h@gnu.org')
,('Spotify','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),79,'Monthly','Student','clehuquet1i@newsvine.com')
,('Zee5','Free-trial',STR_TO_DATE('17/03/2024','%d/%m/%Y'),88,'Yearly','Annual','clehuquet1i@newsvine.com')
,('Disney+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),18,'Monthly','Monthly','jelwood1j@facebook.com')
,('Zee5','Free-trial',STR_TO_DATE('10/2/2024','%d/%m/%Y'),32,'Monthly','Monthly','jelwood1j@facebook.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),37,'Monthly','Basic','mpiatek1k@scribd.com')
,('Disney+','Free-trial',STR_TO_DATE('5/1/2024','%d/%m/%Y'),39,'Monthly','Monthly','mpiatek1k@scribd.com')
,('Rakuten Viki','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),62,'Monthly','Monthly','mpiatek1k@scribd.com')
,('Careem','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),51,'Monthly','Monthly','mpiatek1k@scribd.com')
,('Youtube Music','Free-trial',STR_TO_DATE('14/02/2024','%d/%m/%Y'),29,'Monthly','Individual','mpiatek1k@scribd.com')
,('Gaana','Free-trial',STR_TO_DATE('20/03/2024','%d/%m/%Y'),26,'Monthly','Monthly','ukhilkov1l@hubpages.com')
,('Gaana','Free-trial',STR_TO_DATE('20/03/2024','%d/%m/%Y'),26,'Monthly','Monthly','mstollenbeck1m@163.com')
,('Zee5','Permanent',STR_TO_DATE('8/3/2024','%d/%m/%Y'),5,'Yearly','Annual','kvella1n@opera.com')
,('Brilliant.org','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),13,'Monthly','Monthly','kvella1n@opera.com')
,('Rakuten Viki','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),41,'Monthly','Monthly','kvella1n@opera.com')
,('Youtube Music','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),79,'Monthly','Individual','kvella1n@opera.com')
,('Coursera','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),64,'Yearly','Plus Annual','kvella1n@opera.com')
,('Amazon Shopping','Permanent',STR_TO_DATE('2/2/2024','%d/%m/%Y'),82,'Monthly','Monthly','kvella1n@opera.com')
,('Careem','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),36,'Monthly','Monthly','aflavelle1o@typepad.com')
,('Skillshare','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),71,'Monthly','Monthly','aflavelle1o@typepad.com')
,('Talabat','Free-trial',STR_TO_DATE('20/01/2024','%d/%m/%Y'),58,'Monthly','Pro','aflavelle1o@typepad.com')
,('Amazon Prime Video','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),9,'Yearly','Prime Annual','tduncombe1p@omniture.com')
,('Youtube Music','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),69,'Monthly','Student','rshovelin1q@domainmarket.com')
,('Viu','Permanent',STR_TO_DATE('5/2/2024','%d/%m/%Y'),96,'Yearly','Annual','rshovelin1q@domainmarket.com')
,('Deliveroo','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),65,'Monthly','Plus Silver','bireson1r@google.nl')
,('Viu','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),33,'Yearly','Annual','bireson1r@google.nl')
,('Zee5','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),28,'Yearly','Annual','bireson1r@google.nl')
,('Rakuten Viki','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),44,'Monthly','Monthly','bireson1r@google.nl')
,('Youtube Music','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),33,'Monthly','Family','sgaze1s@zdnet.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),21,'Monthly','Standard','sgaze1s@zdnet.com')
,('Amazon Shopping','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),34,'Yearly','Annual','ntrunchion1t@elegantthemes.com')
,('Coursera','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),47,'Monthly','Plus Monthly','ntrunchion1t@elegantthemes.com')
,('Spotify','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),94,'Monthly','Student','ntrunchion1t@elegantthemes.com')
,('Youtube Music','Permanent',STR_TO_DATE('18/02/2024','%d/%m/%Y'),73,'Monthly','Individual','jnettleship1u@scientificamerican.com')
,('Amazon Prime Video','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),46,'Yearly','Prime Annual','jnettleship1u@scientificamerican.com')
,('Skillshare','Free-trial',STR_TO_DATE('30/03/2024','%d/%m/%Y'),43,'Monthly','Monthly','jnettleship1u@scientificamerican.com')
,('Spotify','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),68,'Monthly','Student','dreast1v@ibm.com')
,('Disney+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),25,'Monthly','Monthly','dreast1v@ibm.com')
,('Deliveroo','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),4,'Monthly','Plus Gold','dreast1v@ibm.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),43,'Monthly','Mega Fan','rcubbin1w@scribd.com')
,('MasterClass','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),60,'Monthly','Individual','rcubbin1w@scribd.com')
,('Hungama','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),85,'Yearly','Yearly Movies','rcubbin1w@scribd.com')
,('Careem','Permanent',STR_TO_DATE('10/3/2024','%d/%m/%Y'),95,'Monthly','Monthly','jfairholme1x@deviantart.com')
,('Brilliant.org','Free-trial',STR_TO_DATE('1/4/2024','%d/%m/%Y'),59,'Monthly','Monthly','jfairholme1x@deviantart.com')
,('Deezer','Free-trial',STR_TO_DATE('1/2/2024','%d/%m/%Y'),43,'Monthly','Monthly','jfairholme1x@deviantart.com')
,('Crunchyroll','Free-trial',STR_TO_DATE('4/3/2024','%d/%m/%Y'),20,'Monthly','Fan','jfairholme1x@deviantart.com')
,('Talabat','Free-trial',STR_TO_DATE('13/03/2024','%d/%m/%Y'),23,'Monthly','Pro','jfairholme1x@deviantart.com')
,('Skillshare','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),45,'Monthly','Monthly','gyurtsev1y@ow.ly')
,('Hungama','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),23,'Monthly','Monthly Music','gyurtsev1y@ow.ly')
,('Deliveroo','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),73,'Monthly','Plus Gold','gyurtsev1y@ow.ly')
,('Talabat','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),63,'Monthly','Pro','gyurtsev1y@ow.ly')
,('Netflix','Permanent',STR_TO_DATE('16/01/2024','%d/%m/%Y'),90,'Monthly','Basic','slaffin1z@a8.net')
,('Amazon Shopping','Free-trial',STR_TO_DATE('4/3/2024','%d/%m/%Y'),92,'Yearly','Annual','slaffin1z@a8.net')
,('Spotify','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),10,'Monthly','Individual','slaffin1z@a8.net')
,('Viu','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),70,'Yearly','Annual','slaffin1z@a8.net')
,('Brilliant.org','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),76,'Yearly','Annual','slaffin1z@a8.net')
,('OSN+','Permanent',STR_TO_DATE('8/3/2024','%d/%m/%Y'),80,'Yearly','Yearly','dwildman20@craigslist.org')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),38,'Monthly','Duo','dwildman20@craigslist.org')
,('Amazon Shopping','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),66,'Monthly','Monthly','cbranton21@wsj.com')
,('Anghami','Free-trial',STR_TO_DATE('8/1/2024','%d/%m/%Y'),82,'Half-yearly','6-months Single','amanueau22@un.org')
,('Deezer','Free-trial',STR_TO_DATE('4/3/2024','%d/%m/%Y'),25,'Yearly','Family Yearly','amanueau22@un.org')
,('Amazon Prime Video','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),43,'Yearly','Prime Annual','amanueau22@un.org')
,('Spotify','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),91,'Monthly','Duo','sbeck23@ft.com')
,('Brilliant.org','Free-trial',STR_TO_DATE('20/03/2024','%d/%m/%Y'),9,'Monthly','Monthly','sbeck23@ft.com')
,('Rakuten Viki','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),14,'Monthly','Monthly','kroocroft24@time.com')
,('Deliveroo','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),19,'Monthly','Plus Gold','rtomadoni25@indiegogo.com')
,('Amazon Shopping','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),77,'Yearly','Annual','rtomadoni25@indiegogo.com')
,('Disney+','Permanent',STR_TO_DATE('27/01/2024','%d/%m/%Y'),50,'Monthly','Monthly','rtomadoni25@indiegogo.com')
,('Rakuten Viki','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),1,'Yearly','Annual','rtomadoni25@indiegogo.com')
,('Gaana','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),82,'Yearly','Yearly','rtomadoni25@indiegogo.com')
,('Viu','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),44,'Yearly','Annual','rtomadoni25@indiegogo.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),75,'Yearly','Prime Annual','rtomadoni25@indiegogo.com')
,('Brilliant.org','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),71,'Yearly','Annual','rtomadoni25@indiegogo.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),37,'Monthly','Fan','csweetmore26@constantcontact.com')
,('Amazon Prime Video','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),2,'Yearly','Prime Annual','csweetmore26@constantcontact.com')
,('Skillshare','Free-trial',STR_TO_DATE('28/03/2024','%d/%m/%Y'),50,'Monthly','Monthly','csweetmore26@constantcontact.com')
,('Deliveroo','Free-trial',STR_TO_DATE('9/2/2024','%d/%m/%Y'),99,'Monthly','Plus Silver','csweetmore26@constantcontact.com')
,('Disney+','Permanent',STR_TO_DATE('1/2/2024','%d/%m/%Y'),28,'Yearly','Annual','wmaliffe27@posterous.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),27,'Monthly','Prime Monthly','wmaliffe27@posterous.com')
,('Spotify','Permanent',STR_TO_DATE('24/01/2024','%d/%m/%Y'),58,'Monthly','Duo','wmaliffe27@posterous.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),27,'Yearly','Mega Fan (yearly)','tgroundwator28@com.com')
,('Skillshare','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),41,'Monthly','Monthly','tgroundwator28@com.com')
,('Amazon Shopping','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),46,'Monthly','Monthly','tgroundwator28@com.com')
,('Rakuten Viki','Permanent',STR_TO_DATE('10/2/2024','%d/%m/%Y'),7,'Monthly','Monthly','tgroundwator28@com.com')
,('Brilliant.org','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),20,'Monthly','Monthly','kdearsley29@goodreads.com')
,('Deezer','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),91,'Yearly','Family Yearly','ocoldwell2a@newsvine.com')
,('Deliveroo','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),44,'Monthly','Plus Gold','ocoldwell2a@newsvine.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),2,'Monthly','Premium','ocoldwell2a@newsvine.com')
,('Disney+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),90,'Yearly','Annual','mvidler2b@twitpic.com')
,('Netflix','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),90,'Monthly','Premium','mvidler2b@twitpic.com')
,('Rakuten Viki','Permanent',STR_TO_DATE('14/01/2024','%d/%m/%Y'),68,'Yearly','Annual','mvidler2b@twitpic.com')
,('Anghami','Free-trial',STR_TO_DATE('3/2/2024','%d/%m/%Y'),78,'Yearly','Yearly','mvidler2b@twitpic.com')
,('Skillshare','Permanent',STR_TO_DATE('25/02/2024','%d/%m/%Y'),74,'Monthly','Monthly','mvidler2b@twitpic.com')
,('Deliveroo','Free-trial',STR_TO_DATE('28/03/2024','%d/%m/%Y'),99,'Monthly','Plus Silver','gmurton2c@stumbleupon.com')
,('Gaana','Free-trial',STR_TO_DATE('13/01/2024','%d/%m/%Y'),95,'Monthly','Monthly','gmurton2c@stumbleupon.com')
,('Viu','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),59,'Yearly','Annual','bhandover2d@rambler.ru')
,('Spotify','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),18,'Monthly','Individual','bhandover2d@rambler.ru')
,('OSN+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),85,'Monthly','Monthly','bhandover2d@rambler.ru')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),59,'Monthly','Monthly','plenden2e@wikia.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),12,'Monthly','Mega Fan','plenden2e@wikia.com')
,('Spotify','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),19,'Monthly','Student','plenden2e@wikia.com')
,('OSN+','Permanent',STR_TO_DATE('23/01/2024','%d/%m/%Y'),40,'Monthly','Monthly','cdovington2f@topsy.com')
,('Amazon Shopping','Permanent',STR_TO_DATE('21/02/2024','%d/%m/%Y'),66,'Yearly','Annual','cdovington2f@topsy.com')
,('Spotify','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),74,'Monthly','Student','pgoodlud2g@newyorker.com')
,('Coursera','Permanent',STR_TO_DATE('29/02/2024','%d/%m/%Y'),50,'Monthly','Plus Monthly','pgoodlud2g@newyorker.com')
,('OSN+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),77,'Monthly','Monthly','pgoodlud2g@newyorker.com')
,('Deliveroo','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),5,'Monthly','Plus Silver','pgoodlud2g@newyorker.com')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),58,'Yearly','Annual','pgoodlud2g@newyorker.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),80,'Monthly','Fan','alyddon2h@sphinn.com')
,('OSN+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),56,'Monthly','Monthly','alyddon2h@sphinn.com')
,('Viu','Free-trial',STR_TO_DATE('8/2/2024','%d/%m/%Y'),34,'Yearly','Annual','alyddon2h@sphinn.com')
,('Hungama','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),97,'Yearly','Yearly Music','alyddon2h@sphinn.com')
,('Spotify','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),62,'Monthly','Individual','alyddon2h@sphinn.com')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),14,'Monthly','Monthly','xbubear2i@youku.com')
,('Rakuten Viki','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),7,'Monthly','Monthly','xbubear2i@youku.com')
,('Youtube Music','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),54,'Monthly','Family','xbubear2i@youku.com')
,('Gaana','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),54,'Monthly','Monthly','medwins2j@vkontakte.ru')
,('Viu','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),21,'Yearly','Annual','medwins2j@vkontakte.ru')
,('Rakuten Viki','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),56,'Yearly','Annual','medwins2j@vkontakte.ru')
,('Hungama','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),65,'Yearly','Yearly Music','medwins2j@vkontakte.ru')
,('MasterClass','Free-trial',STR_TO_DATE('11/1/2024','%d/%m/%Y'),69,'Monthly','Duo','ngoodoune2k@domainmarket.com')
,('Disney+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),59,'Yearly','Annual','ngoodoune2k@domainmarket.com')
,('Skillshare','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),8,'Monthly','Monthly','ngoodoune2k@domainmarket.com')
,('Skillshare','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),88,'Monthly','Monthly','rmaylour2l@istockphoto.com')
,('Zee5','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),54,'Monthly','Monthly','rmaylour2l@istockphoto.com')
,('Coursera','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),45,'Monthly','Plus Monthly','rmaylour2l@istockphoto.com')
,('Anghami','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),45,'Yearly','Student','gbough2m@ebay.com')
,('MasterClass','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),48,'Monthly','Individual','gbough2m@ebay.com')
,('Deezer','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),91,'Monthly','Monthly','lcaldayrou2n@mapquest.com')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),85,'Yearly','Annual','lcaldayrou2n@mapquest.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),20,'Monthly','Prime Monthly','lcaldayrou2n@mapquest.com')
,('Crunchyroll','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),16,'Yearly','Mega Fan (yearly)','crumford2o@plala.or.jp')
,('Deliveroo','Free-trial',STR_TO_DATE('26/01/2024','%d/%m/%Y'),89,'Monthly','Plus Silver','rtustin2p@example.com')
,('Amazon Shopping','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),52,'Yearly','Annual','rtustin2p@example.com')
,('Brilliant.org','Permanent',STR_TO_DATE('12/2/2024','%d/%m/%Y'),98,'Yearly','Annual','wcoverdale2q@webmd.com')
,('Spotify','Free-trial',STR_TO_DATE('20/03/2024','%d/%m/%Y'),75,'Monthly','Family','wcoverdale2q@webmd.com')
,('Viu','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),49,'Yearly','Annual','wcoverdale2q@webmd.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),19,'Yearly','Prime Annual','akike2r@4shared.com')
,('Disney+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),41,'Monthly','Monthly','akike2r@4shared.com')
,('Netflix','Permanent',STR_TO_DATE('1/3/2024','%d/%m/%Y'),49,'Monthly','Standard','akike2r@4shared.com')
,('Rakuten Viki','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),42,'Yearly','Annual','akike2r@4shared.com')
,('Amazon Shopping','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),61,'Yearly','Annual','tfarlham2s@slate.com')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),79,'Monthly','Duo','tfarlham2s@slate.com')
,('Youtube Music','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),75,'Monthly','Family','tfarlham2s@slate.com')
,('Talabat','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),72,'Monthly','Pro','tfarlham2s@slate.com')
,('Deezer','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),15,'Monthly','Monthly','bkonke2t@ycombinator.com')
,('Viu','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),54,'Yearly','Annual','bkonke2t@ycombinator.com')
,('Coursera','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),51,'Yearly','Plus Annual','bkonke2t@ycombinator.com')
,('Zee5','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),59,'Yearly','Annual','vhallbord2u@senate.gov')
,('Rakuten Viki','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),21,'Monthly','Monthly','vhallbord2u@senate.gov')
,('Deezer','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),78,'Yearly','Family Yearly','vhallbord2u@senate.gov')
,('Hungama','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),75,'Monthly','Monthly Movies','gfetherstonhaugh2v@woothemes.com')
,('OSN+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),46,'Monthly','Monthly','gfetherstonhaugh2v@woothemes.com')
,('Amazon Shopping','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),44,'Yearly','Annual','gfetherstonhaugh2v@woothemes.com')
,('Coursera','Permanent',STR_TO_DATE('7/1/2024','%d/%m/%Y'),66,'Monthly','Plus Monthly','gfetherstonhaugh2v@woothemes.com')
,('Talabat','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),63,'Monthly','Pro','gfetherstonhaugh2v@woothemes.com')
,('Coursera','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),54,'Monthly','Plus Monthly','zsarten2w@miitbeian.gov.cn')
,('Crunchyroll','Permanent',STR_TO_DATE('25/03/2024','%d/%m/%Y'),79,'Yearly','Mega Fan (yearly)','zsarten2w@miitbeian.gov.cn')
,('Anghami','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),8,'Yearly','Student','rwescott2x@google.com.au')
,('Careem','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),34,'Monthly','Monthly','rwescott2x@google.com.au')
,('Zee5','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),19,'Yearly','Annual','rwescott2x@google.com.au')
,('Viu','Permanent',STR_TO_DATE('14/02/2024','%d/%m/%Y'),97,'Yearly','Annual','vhenken2y@bbb.org')
,('Zee5','Free-trial',STR_TO_DATE('27/01/2024','%d/%m/%Y'),52,'Monthly','Monthly','vhenken2y@bbb.org')
,('MasterClass','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),18,'Monthly','Family','vhenken2y@bbb.org')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),4,'Monthly','Prime Monthly','vhenken2y@bbb.org')
,('Talabat','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),34,'Monthly','Pro','vhenken2y@bbb.org')
,('Amazon Shopping','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),91,'Monthly','Monthly','vhenken2y@bbb.org')
,('Brilliant.org','Free-trial',STR_TO_DATE('25/02/2024','%d/%m/%Y'),27,'Monthly','Monthly','vhenken2y@bbb.org')
,('Amazon Shopping','Free-trial',STR_TO_DATE('12/1/2024','%d/%m/%Y'),88,'Monthly','Monthly','bbatchelor2z@dailymotion.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),57,'Yearly','Prime Annual','bbatchelor2z@dailymotion.com')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),85,'Yearly','Annual','bbatchelor2z@dailymotion.com')
,('Deezer','Permanent',STR_TO_DATE('15/03/2024','%d/%m/%Y'),37,'Monthly','Monthly','bbatchelor2z@dailymotion.com')
,('Skillshare','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),81,'Monthly','Monthly','bbatchelor2z@dailymotion.com')
,('Disney+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),8,'Yearly','Annual','bbatchelor2z@dailymotion.com')
,('MasterClass','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),18,'Monthly','Duo','fbrockton30@myspace.com')
,('Youtube Music','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),93,'Monthly','Family','lmarians31@fastcompany.com')
,('Hungama','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),2,'Yearly','Yearly Movies','lmarians31@fastcompany.com')
,('Zee5','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),16,'Yearly','Annual','lmarians31@fastcompany.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),18,'Yearly','Prime Annual','lmarians31@fastcompany.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),64,'Monthly','Prime Monthly','cbrownsall32@google.co.uk')
,('Gaana','Permanent',STR_TO_DATE('3/4/2024','%d/%m/%Y'),42,'Monthly','Monthly','ykettow33@soup.io')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),49,'Monthly','Duo','zraiston34@whitehouse.gov')
,('Amazon Prime Video','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),82,'Monthly','Prime Monthly','zraiston34@whitehouse.gov')
,('OSN+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),9,'Yearly','Yearly','zraiston34@whitehouse.gov')
,('Careem','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),20,'Monthly','Monthly','zraiston34@whitehouse.gov')
,('Deliveroo','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),3,'Monthly','Plus Silver','zraiston34@whitehouse.gov')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),72,'Monthly','Duo','hguillart35@github.io')
,('Youtube Music','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),27,'Monthly','Family','hguillart35@github.io')
,('Coursera','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),17,'Yearly','Plus Annual','cbunten36@discuz.net')
,('Rakuten Viki','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),11,'Yearly','Annual','cbunten36@discuz.net')
,('Gaana','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),75,'Monthly','Monthly','cbunten36@discuz.net')
,('Deezer','Free-trial',STR_TO_DATE('6/2/2024','%d/%m/%Y'),9,'Monthly','Family','elarver37@blinklist.com')
,('Viu','Free-trial',STR_TO_DATE('24/02/2024','%d/%m/%Y'),12,'Yearly','Annual','elarver37@blinklist.com')
,('Careem','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),74,'Monthly','Monthly','elarver37@blinklist.com')
,('Deliveroo','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),28,'Monthly','Plus Gold','ajanos38@nytimes.com')
,('Deliveroo','Permanent',STR_TO_DATE('6/2/2024','%d/%m/%Y'),22,'Monthly','Plus Silver','ddaspar39@etsy.com')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),76,'Yearly','Prime Annual','ddaspar39@etsy.com')
,('MasterClass','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),71,'Monthly','Individual','ddaspar39@etsy.com')
,('Netflix','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),5,'Monthly','Standard','ddaspar39@etsy.com')
,('Amazon Shopping','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),40,'Monthly','Monthly','ddaspar39@etsy.com')
,('Disney+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),5,'Monthly','Monthly','bmerkel3a@zimbio.com')
,('Hungama','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),31,'Yearly','Yearly Music','bmerkel3a@zimbio.com')
,('Viu','Free-trial',STR_TO_DATE('15/01/2024','%d/%m/%Y'),64,'Yearly','Annual','bmerkel3a@zimbio.com')
,('OSN+','Permanent',STR_TO_DATE('28/01/2024','%d/%m/%Y'),37,'Monthly','Monthly','dmustarde3b@histats.com')
,('Careem','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),73,'Monthly','Monthly','dmustarde3b@histats.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),7,'Monthly','Basic','dmustarde3b@histats.com')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),35,'Monthly','Individual','echarity3c@prnewswire.com')
,('Anghami','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),95,'Yearly','Family Yearly','echarity3c@prnewswire.com')
,('Talabat','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),28,'Monthly','Pro','echarity3c@prnewswire.com')
,('Talabat','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),24,'Monthly','Pro','afurney3d@wunderground.com')
,('OSN+','Permanent',STR_TO_DATE('21/01/2024','%d/%m/%Y'),61,'Monthly','Monthly','afurney3d@wunderground.com')
,('Disney+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),82,'Monthly','Monthly','afurney3d@wunderground.com')
,('Netflix','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),94,'Monthly','Premium','jmeltetal3e@tuttocitta.it')
,('Hungama','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),69,'Yearly','Yearly Music','jmeltetal3e@tuttocitta.it')
,('OSN+','Permanent',STR_TO_DATE('16/01/2024','%d/%m/%Y'),41,'Monthly','Monthly','gcurado3f@baidu.com')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),34,'Monthly','Monthly','gcurado3f@baidu.com')
,('Careem','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),4,'Monthly','Monthly','cbuessen3g@adobe.com')
,('Deliveroo','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),31,'Monthly','Plus Silver','cbuessen3g@adobe.com')
,('Talabat','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),5,'Monthly','Pro','cbuessen3g@adobe.com')
,('Zee5','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),31,'Yearly','Annual','mevangelinos3h@livejournal.com')
,('Spotify','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),85,'Monthly','Duo','mevangelinos3h@livejournal.com')
,('Disney+','Free-trial',STR_TO_DATE('25/03/2024','%d/%m/%Y'),59,'Monthly','Monthly','mevangelinos3h@livejournal.com')
,('OSN+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),41,'Yearly','Yearly','vdavage3i@behance.net')
,('Rakuten Viki','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),98,'Monthly','Monthly','vdavage3i@behance.net')
,('Anghami','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),92,'Yearly','Family Yearly','vdavage3i@behance.net')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),84,'Monthly','Duo','sattrey3j@etsy.com')
,('Anghami','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),23,'Half-yearly','6-months Single','sattrey3j@etsy.com')
,('Brilliant.org','Free-trial',STR_TO_DATE('20/01/2024','%d/%m/%Y'),47,'Yearly','Annual','sattrey3j@etsy.com')
,('Disney+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),75,'Monthly','Monthly','mtwigg3k@cargocollective.com')
,('Deezer','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),82,'Yearly','Family Yearly','mtwigg3k@cargocollective.com')
,('Netflix','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),1,'Monthly','Premium','mtwigg3k@cargocollective.com')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),51,'Monthly','Monthly','tandrus3l@ning.com')
,('Viu','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),53,'Yearly','Annual','tandrus3l@ning.com')
,('Zee5','Free-trial',STR_TO_DATE('1/3/2024','%d/%m/%Y'),75,'Yearly','Annual','tandrus3l@ning.com')
,('Coursera','Permanent',STR_TO_DATE('4/1/2024','%d/%m/%Y'),36,'Yearly','Plus Annual','tandrus3l@ning.com')
,('Coursera','Free-trial',STR_TO_DATE('11/3/2024','%d/%m/%Y'),49,'Monthly','Plus Monthly','nburnhams3m@google.de')
,('Hungama','Free-trial',STR_TO_DATE('1/3/2024','%d/%m/%Y'),49,'Quarterly','Quarterly Music','nburnhams3m@google.de')
,('Amazon Prime Video','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),30,'Monthly','Prime Monthly','gsalvatore3n@spiegel.de')
,('Crunchyroll','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),30,'Monthly','Fan','gcayser3o@constantcontact.com')
,('Spotify','Free-trial',STR_TO_DATE('9/3/2024','%d/%m/%Y'),43,'Monthly','Individual','gcayser3o@constantcontact.com')
,('MasterClass','Permanent',STR_TO_DATE('21/03/2024','%d/%m/%Y'),7,'Monthly','Family','gcayser3o@constantcontact.com')
,('Deezer','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),29,'Yearly','Family Yearly','gcayser3o@constantcontact.com')
,('Amazon Shopping','Free-trial',STR_TO_DATE('29/01/2024','%d/%m/%Y'),19,'Yearly','Annual','gcayser3o@constantcontact.com')
,('Amazon Prime Video','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),79,'Monthly','Prime Monthly','gcayser3o@constantcontact.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),1,'Monthly','Fan','fblouet3p@wordpress.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),44,'Monthly','Mega Fan','tbumfrey3q@independent.co.uk')
,('Spotify','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),8,'Monthly','Student','tbumfrey3q@independent.co.uk')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),94,'Yearly','Annual','tbumfrey3q@independent.co.uk')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),94,'Yearly','Annual','jbainbrigge3r@google.es')
,('OSN+','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),89,'Monthly','Monthly','gcrosskill3s@meetup.com')
,('Amazon Shopping','Permanent',STR_TO_DATE('8/1/2024','%d/%m/%Y'),82,'Yearly','Annual','gcrosskill3s@meetup.com')
,('Rakuten Viki','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),82,'Yearly','Annual','gcrosskill3s@meetup.com')
,('Brilliant.org','Free-trial',STR_TO_DATE('25/02/2024','%d/%m/%Y'),38,'Monthly','Monthly','gcrosskill3s@meetup.com')
,('Coursera','Free-trial',STR_TO_DATE('27/02/2024','%d/%m/%Y'),80,'Yearly','Plus Annual','pgresswood3t@addtoany.com')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),64,'Yearly','Annual','pgresswood3t@addtoany.com')
,('Youtube Music','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),21,'Monthly','Family','pgresswood3t@addtoany.com')
,('Careem','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),52,'Monthly','Monthly','nkovalski3u@sourceforge.net')
,('Crunchyroll','Permanent',STR_TO_DATE('4/2/2024','%d/%m/%Y'),37,'Yearly','Mega Fan (yearly)','nkovalski3u@sourceforge.net')
,('Talabat','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),81,'Monthly','Pro','nkovalski3u@sourceforge.net')
,('Brilliant.org','Permanent',STR_TO_DATE('27/03/2024','%d/%m/%Y'),12,'Yearly','Annual','nkovalski3u@sourceforge.net')
,('Spotify','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),33,'Monthly','Student','nkovalski3u@sourceforge.net')
,('Hungama','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),16,'Quarterly','Quarterly Movies','hhundell3v@liveinternet.ru')
,('Anghami','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),42,'Yearly','Yearly','hhundell3v@liveinternet.ru')
,('OSN+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),59,'Yearly','Yearly','hhundell3v@liveinternet.ru')
,('Spotify','Permanent',STR_TO_DATE('14/02/2024','%d/%m/%Y'),5,'Monthly','Student','dmaclleese3w@meetup.com')
,('Coursera','Permanent',STR_TO_DATE('5/3/2024','%d/%m/%Y'),73,'Monthly','Plus Monthly','hgeeve3x@mozilla.org')
,('Disney+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),99,'Yearly','Annual','bconnelly3y@scribd.com')
,('Brilliant.org','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),44,'Yearly','Annual','jcoraini3z@mediafire.com')
,('Coursera','Free-trial',STR_TO_DATE('24/02/2024','%d/%m/%Y'),45,'Monthly','Plus Monthly','jcoraini3z@mediafire.com')
,('Crunchyroll','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),36,'Monthly','Fan','jcoraini3z@mediafire.com')
,('Brilliant.org','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),99,'Monthly','Monthly','ajorat40@meetup.com')
,('Youtube Music','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),36,'Monthly','Individual','ajorat40@meetup.com')
,('MasterClass','Free-trial',STR_TO_DATE('2/4/2024','%d/%m/%Y'),33,'Monthly','Individual','ajorat40@meetup.com')
,('Zee5','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),44,'Yearly','Annual','ajorat40@meetup.com')
,('Deezer','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),6,'Monthly','Monthly','ajorat40@meetup.com')
,('Netflix','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),84,'Monthly','Standard','kmewitt41@arizona.edu')
,('Rakuten Viki','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),90,'Monthly','Monthly','kmewitt41@arizona.edu')
,('Skillshare','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),33,'Monthly','Monthly','kmewitt41@arizona.edu')
,('Deezer','Permanent',STR_TO_DATE('17/03/2024','%d/%m/%Y'),98,'Monthly','Monthly','kmewitt41@arizona.edu')
,('MasterClass','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),94,'Monthly','Duo','kmewitt41@arizona.edu')
,('Brilliant.org','Permanent',STR_TO_DATE('12/2/2024','%d/%m/%Y'),71,'Monthly','Monthly','kmewitt41@arizona.edu')
,('Coursera','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),74,'Monthly','Plus Monthly','kmewitt41@arizona.edu')
,('Anghami','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),22,'Yearly','Yearly','wdepaepe42@chron.com')
,('Amazon Prime Video','Permanent',STR_TO_DATE('23/01/2024','%d/%m/%Y'),56,'Monthly','Prime Monthly','wdepaepe42@chron.com')
,('Youtube Music','Permanent',STR_TO_DATE('19/02/2024','%d/%m/%Y'),22,'Monthly','Individual','wdepaepe42@chron.com')
,('OSN+','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),37,'Monthly','Monthly','mpoon43@globo.com')
,('Anghami','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),29,'Half-yearly','6-months Single','mpoon43@globo.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),97,'Monthly','Fan','mpoon43@globo.com')
,('Talabat','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),94,'Monthly','Pro','mpoon43@globo.com')
,('Viu','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),25,'Yearly','Annual','mpoon43@globo.com')
,('Spotify','Free-trial',STR_TO_DATE('22/03/2024','%d/%m/%Y'),27,'Monthly','Student','pkleinhausen@forbes.com')
,('Rakuten Viki','Free-trial',STR_TO_DATE('10/2/2024','%d/%m/%Y'),68,'Yearly','Annual','pkleinhausen@forbes.com')
,('Hungama','Free-trial',STR_TO_DATE('19/01/2024','%d/%m/%Y'),49,'Yearly','Yearly Movies','pkleinhausen@forbes.com')
,('Youtube Music','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),19,'Monthly','Individual','pkleinhausen@forbes.com')
,('Viu','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),43,'Yearly','Annual','pkleinhausen@forbes.com')
,('OSN+','Permanent',STR_TO_DATE('15/03/2024','%d/%m/%Y'),17,'Yearly','Yearly','ekayes45@indiegogo.com')
,('OSN+','Permanent',STR_TO_DATE('15/03/2024','%d/%m/%Y'),17,'Yearly','Yearly','scowthart46@xrea.com')
,('Zee5','Permanent',STR_TO_DATE(NULL,'%d/%m/%Y'),31,'Yearly','Annual','scowthart46@xrea.com')
,('Crunchyroll','Free-trial',STR_TO_DATE(NULL,'%d/%m/%Y'),2,'Yearly','Mega Fan (yearly)','scowthart46@xrea.com');



--
-- Dumping data for table `User Subscriptions`
--

LOCK TABLES `User_Subscriptions` WRITE;
/*!40000 ALTER TABLE `User_Subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;

CREATE TABLE `Transactions` (
  `date_paid` date,
  `amount_paid` float DEFAULT NULL,
  `email_address` varchar(30),
  `service_name` varchar(20),
	PRIMARY KEY (`service_name`,`email_address`,`date_paid`),
  CONSTRAINT `Transactions_ibfk_1` FOREIGN KEY (`email_address`) REFERENCES `User` (`email_address`),
  CONSTRAINT `Transactions_ibfk_2` FOREIGN KEY (`service_name`) REFERENCES `Services` (`service_name`)
) ;


INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('06/06/2024','%d/%m/%Y'),18,'cduran@gmail.com','Viu');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('10/03/2024','%d/%m/%Y'),52,'cduran@gmail.com','OSN+');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('12/05/2024','%d/%m/%Y'),73,'cduran@gmail.com','Disney+');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('08/08/2024','%d/%m/%Y'),99,'cduran@gmail.com','Hungama');
 
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('04/1/2024','%d/%m/%Y'),10,'rpark@yahoo.com','MasterClass');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('6/3/2024','%d/%m/%Y'),73,'rpark@yahoo.com','Anghami');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('4/3/2024','%d/%m/%Y'),88,'rpark@yahoo.com','Crunchyroll');

INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('4/1/2024','%d/%m/%Y'),12,'itsleslie26@gmail.com','Skillshare');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('3/1/2024','%d/%m/%Y'),13,'itsleslie26@gmail.com','OSN+');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('05/3/2024','%d/%m/%Y'),81,'itsleslie26@gmail.com','Youtube Music');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('6/3/2024','%d/%m/%Y'),7,'itsleslie26@gmail.com','Netflix');

INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('03/01/2024','%d/%m/%Y'),5,'kvella@gmail.com','Zee5');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('12/3/2024','%d/%m/%Y'),13,'kvella@gmail.com','Brilliant.org');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('12/1/2024','%d/%m/%Y'),41,'kvella@gmail.com','Rakuten Viki');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('03/03/2024','%d/%m/%Y'),79,'kvella@gmail.com','Youtube Music');
INSERT INTO Transactions(date_paid,amount_paid,email_address,service_name) VALUES
 (str_to_date('02/3/2024','%d/%m/%Y'),64,'kvella@gmail.com','Coursera');



--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `app_usage`
--

DROP TABLE IF EXISTS `app_usage`;

CREATE TABLE `app_usage` (
  `email_address` varchar(30),
  `date_measured` date NOT NULL,
  `service_name` varchar(20) NOT NULL,
  `num_hours` double DEFAULT NULL,
  PRIMARY KEY (`email_address`,`service_name`,`date_measured`),
  CONSTRAINT `app_usage_ibfk_1` FOREIGN KEY (`service_name`) REFERENCES `User_Subscriptions` (`service_name`),
  CONSTRAINT `app_usage_ibfk_2` FOREIGN KEY (`email_address`) REFERENCES `User` (`email_address`)
) ;

INSERT INTO app_usage(email_address,date_measured,service_name,num_hours) VALUES
 ('cduran@gmail.com',str_to_date('6/6/2024','%d/%m/%Y'),'Viu',1)
,('cduran@gmail.com',str_to_date('7/6/2024','%d/%m/%Y'),'Viu',0.25)
,('cduran@gmail.com',str_to_date('8/6/2024','%d/%m/%Y'),'Viu',1)
,('cduran@gmail.com',str_to_date('9/6/2024','%d/%m/%Y'),'Viu',0)
,('cduran@gmail.com',str_to_date('10/6/2024','%d/%m/%Y'),'Viu',0.25)
,('cduran@gmail.com',str_to_date('11/6/2024','%d/%m/%Y'),'Viu',1.5)
,('cduran@gmail.com',str_to_date('12/6/2024','%d/%m/%Y'),'Viu',1)
,('cduran@gmail.com',str_to_date('13/10/2024','%d/%m/%Y'),'OSN+',0.75)
,('cduran@gmail.com',str_to_date('14/10/2024','%d/%m/%Y'),'OSN+',0)
,('cduran@gmail.com',str_to_date('15/10/2024','%d/%m/%Y'),'OSN+',0.25)
,('cduran@gmail.com',str_to_date('16/10/2024','%d/%m/%Y'),'OSN+',1.25)
,('cduran@gmail.com',str_to_date('17/10/2024','%d/%m/%Y'),'OSN+',1.5)
,('cduran@gmail.com',str_to_date('18/10/2024','%d/%m/%Y'),'OSN+',1)
,('cduran@gmail.com',str_to_date('19/10/2024','%d/%m/%Y'),'OSN+',0.75)
,('cduran@gmail.com',str_to_date('5/12/2024','%d/%m/%Y'),'Disney+',1.25)
,('cduran@gmail.com',str_to_date('6/12/2024','%d/%m/%Y'),'Disney+',0.75)
,('cduran@gmail.com',str_to_date('7/12/2024','%d/%m/%Y'),'Disney+',0.5)
,('cduran@gmail.com',str_to_date('8/12/2024','%d/%m/%Y'),'Disney+',0)
,('cduran@gmail.com',str_to_date('9/12/2024','%d/%m/%Y'),'Disney+',0.25)
,('cduran@gmail.com',str_to_date('10/12/2024','%d/%m/%Y'),'Disney+',0.5)
,('cduran@gmail.com',str_to_date('11/12/2024','%d/%m/%Y'),'Disney+',1.25)
,('cduran@gmail.com',str_to_date('8/8/2024','%d/%m/%Y'),'Hungama',0)
,('cduran@gmail.com',str_to_date('9/8/2024','%d/%m/%Y'),'Hungama',0.25)
,('cduran@gmail.com',str_to_date('10/8/2024','%d/%m/%Y'),'Hungama',0.25)
,('cduran@gmail.com',str_to_date('11/8/2024','%d/%m/%Y'),'Hungama',0.5)
,('cduran@gmail.com',str_to_date('12/8/2024','%d/%m/%Y'),'Hungama',0.25)
,('cduran@gmail.com',str_to_date('13/8/2024','%d/%m/%Y'),'Hungama',0)
,('cduran@gmail.com',str_to_date('14/8/2024','%d/%m/%Y'),'Hungama',0)
,('rpark@yahoo.com',str_to_date('11/4/2024','%d/%m/%Y'),'MasterClass',0.75)
,('rpark@yahoo.com',str_to_date('12/4/2024','%d/%m/%Y'),'MasterClass',0)
,('rpark@yahoo.com',str_to_date('13/4/2024','%d/%m/%Y'),'MasterClass',1)
,('rpark@yahoo.com',str_to_date('14/4/2024','%d/%m/%Y'),'MasterClass',0.75)
,('rpark@yahoo.com',str_to_date('15/4/2024','%d/%m/%Y'),'MasterClass',1.25)
,('rpark@yahoo.com',str_to_date('16/4/2024','%d/%m/%Y'),'MasterClass',0.75)
,('rpark@yahoo.com',str_to_date('17/4/2024','%d/%m/%Y'),'MasterClass',0.25)
,('rpark@yahoo.com',str_to_date('17/6/2024','%d/%m/%Y'),'Anghami',0.25)
,('rpark@yahoo.com',str_to_date('18/6/2024','%d/%m/%Y'),'Anghami',0)
,('rpark@yahoo.com',str_to_date('19/6/2024','%d/%m/%Y'),'Anghami',0.5)
,('rpark@yahoo.com',str_to_date('20/6/2024','%d/%m/%Y'),'Anghami',1.5)
,('rpark@yahoo.com',str_to_date('21/6/2024','%d/%m/%Y'),'Anghami',0)
,('rpark@yahoo.com',str_to_date('22/6/2024','%d/%m/%Y'),'Anghami',1.5)
,('rpark@yahoo.com',str_to_date('23/6/2024','%d/%m/%Y'),'Anghami',0.25)
,('rpark@yahoo.com',str_to_date('14/4/2024','%d/%m/%Y'),'Crunchyroll',1.5)
,('rpark@yahoo.com',str_to_date('15/4/2024','%d/%m/%Y'),'Crunchyroll',1)
,('rpark@yahoo.com',str_to_date('16/4/2024','%d/%m/%Y'),'Crunchyroll',0)
,('rpark@yahoo.com',str_to_date('17/4/2024','%d/%m/%Y'),'Crunchyroll',0.5)
,('rpark@yahoo.com',str_to_date('18/4/2024','%d/%m/%Y'),'Crunchyroll',1)
,('rpark@yahoo.com',str_to_date('19/4/2024','%d/%m/%Y'),'Crunchyroll',0)
,('rpark@yahoo.com',str_to_date('20/4/2024','%d/%m/%Y'),'Crunchyroll',1.5)
,('itsleslie26@gmail.com',str_to_date('19/4/2024','%d/%m/%Y'),'Skillshare',1)
,('itsleslie26@gmail.com',str_to_date('20/4/2024','%d/%m/%Y'),'Skillshare',1.25)
,('itsleslie26@gmail.com',str_to_date('21/4/2024','%d/%m/%Y'),'Skillshare',1.25)
,('itsleslie26@gmail.com',str_to_date('22/4/2024','%d/%m/%Y'),'Skillshare',0.5)
,('itsleslie26@gmail.com',str_to_date('23/4/2024','%d/%m/%Y'),'Skillshare',1.25)
,('itsleslie26@gmail.com',str_to_date('24/4/2024','%d/%m/%Y'),'Skillshare',0.25)
,('itsleslie26@gmail.com',str_to_date('25/4/2024','%d/%m/%Y'),'Skillshare',1.5)
,('itsleslie26@gmail.com',str_to_date('21/3/2024','%d/%m/%Y'),'OSN+',1.5)
,('itsleslie26@gmail.com',str_to_date('22/3/2024','%d/%m/%Y'),'OSN+',1.5)
,('itsleslie26@gmail.com',str_to_date('23/3/2024','%d/%m/%Y'),'OSN+',0.75)
,('itsleslie26@gmail.com',str_to_date('24/3/2024','%d/%m/%Y'),'OSN+',0)
,('itsleslie26@gmail.com',str_to_date('25/3/2024','%d/%m/%Y'),'OSN+',0)
,('itsleslie26@gmail.com',str_to_date('26/3/2024','%d/%m/%Y'),'OSN+',1.25)
,('itsleslie26@gmail.com',str_to_date('27/3/2024','%d/%m/%Y'),'OSN+',0)
,('itsleslie26@gmail.com',str_to_date('8/5/2024','%d/%m/%Y'),'Youtube Music',0)
,('itsleslie26@gmail.com',str_to_date('9/5/2024','%d/%m/%Y'),'Youtube Music',1.25)
,('itsleslie26@gmail.com',str_to_date('10/5/2024','%d/%m/%Y'),'Youtube Music',0.25)
,('itsleslie26@gmail.com',str_to_date('11/5/2024','%d/%m/%Y'),'Youtube Music',1.5)
,('itsleslie26@gmail.com',str_to_date('12/5/2024','%d/%m/%Y'),'Youtube Music',0.75)
,('itsleslie26@gmail.com',str_to_date('13/5/2024','%d/%m/%Y'),'Youtube Music',0.5)
,('itsleslie26@gmail.com',str_to_date('14/5/2024','%d/%m/%Y'),'Youtube Music',0.5)
,('itsleslie26@gmail.com',str_to_date('17/6/2024','%d/%m/%Y'),'Netflix',1)
,('itsleslie26@gmail.com',str_to_date('18/6/2024','%d/%m/%Y'),'Netflix',0.75)
,('itsleslie26@gmail.com',str_to_date('19/6/2024','%d/%m/%Y'),'Netflix',1.5)
,('itsleslie26@gmail.com',str_to_date('20/6/2024','%d/%m/%Y'),'Netflix',0.75)
,('itsleslie26@gmail.com',str_to_date('21/6/2024','%d/%m/%Y'),'Netflix',0)
,('itsleslie26@gmail.com',str_to_date('22/6/2024','%d/%m/%Y'),'Netflix',1.25)
,('itsleslie26@gmail.com',str_to_date('23/6/2024','%d/%m/%Y'),'Netflix',0.25)
,('kvella@gmail.com',str_to_date('1/3/2024','%d/%m/%Y'),'Zee5',0.5)
,('kvella@gmail.com',str_to_date('2/3/2024','%d/%m/%Y'),'Zee5',0.25)
,('kvella@gmail.com',str_to_date('3/3/2024','%d/%m/%Y'),'Zee5',0.25)
,('kvella@gmail.com',str_to_date('4/3/2024','%d/%m/%Y'),'Zee5',0.25)
,('kvella@gmail.com',str_to_date('5/3/2024','%d/%m/%Y'),'Zee5',0.75)
,('kvella@gmail.com',str_to_date('6/3/2024','%d/%m/%Y'),'Zee5',0.25)
,('kvella@gmail.com',str_to_date('7/3/2024','%d/%m/%Y'),'Zee5',0)
,('kvella@gmail.com',str_to_date('13/12/2024','%d/%m/%Y'),'Brilliant.org',0)
,('kvella@gmail.com',str_to_date('14/12/2024','%d/%m/%Y'),'Brilliant.org',0)
,('kvella@gmail.com',str_to_date('15/12/2024','%d/%m/%Y'),'Brilliant.org',0)
,('kvella@gmail.com',str_to_date('16/12/2024','%d/%m/%Y'),'Brilliant.org',0)
,('kvella@gmail.com',str_to_date('17/12/2024','%d/%m/%Y'),'Brilliant.org',0)
,('kvella@gmail.com',str_to_date('18/12/2024','%d/%m/%Y'),'Brilliant.org',0)
,('kvella@gmail.com',str_to_date('19/12/2024','%d/%m/%Y'),'Brilliant.org',0)
,('kvella@gmail.com',str_to_date('16/12/2024','%d/%m/%Y'),'Rakuten Viki',0)
,('kvella@gmail.com',str_to_date('17/12/2024','%d/%m/%Y'),'Rakuten Viki',0.25)
,('kvella@gmail.com',str_to_date('18/12/2024','%d/%m/%Y'),'Rakuten Viki',0.5)
,('kvella@gmail.com',str_to_date('19/12/2024','%d/%m/%Y'),'Rakuten Viki',0.5)
,('kvella@gmail.com',str_to_date('20/12/2024','%d/%m/%Y'),'Rakuten Viki',0.5)
,('kvella@gmail.com',str_to_date('21/12/2024','%d/%m/%Y'),'Rakuten Viki',1.25)
,('kvella@gmail.com',str_to_date('22/12/2024','%d/%m/%Y'),'Rakuten Viki',0.75)
,('kvella@gmail.com',str_to_date('7/3/2024','%d/%m/%Y'),'Youtube Music',1.25)
,('kvella@gmail.com',str_to_date('8/3/2024','%d/%m/%Y'),'Youtube Music',1.25)
,('kvella@gmail.com',str_to_date('9/3/2024','%d/%m/%Y'),'Youtube Music',0.75)
,('kvella@gmail.com',str_to_date('10/3/2024','%d/%m/%Y'),'Youtube Music',0.75)
,('kvella@gmail.com',str_to_date('11/3/2024','%d/%m/%Y'),'Youtube Music',0.75)
,('kvella@gmail.com',str_to_date('12/3/2024','%d/%m/%Y'),'Youtube Music',1.5)
,('kvella@gmail.com',str_to_date('13/3/2024','%d/%m/%Y'),'Youtube Music',1.25)
,('kvella@gmail.com',str_to_date('4/2/2024','%d/%m/%Y'),'Coursera',1.5)
,('kvella@gmail.com',str_to_date('5/2/2024','%d/%m/%Y'),'Coursera',0.25)
,('kvella@gmail.com',str_to_date('6/2/2024','%d/%m/%Y'),'Coursera',1.25)
,('kvella@gmail.com',str_to_date('7/2/2024','%d/%m/%Y'),'Coursera',0.25)
,('kvella@gmail.com',str_to_date('8/2/2024','%d/%m/%Y'),'Coursera',1.5)
,('kvella@gmail.com',str_to_date('9/2/2024','%d/%m/%Y'),'Coursera',0)
,('kvella@gmail.com',str_to_date('10/2/2024','%d/%m/%Y'),'Coursera',0.75);


--
-- Dumping data for table `app_usage`
--

LOCK TABLES `app_usage` WRITE;
/*!40000 ALTER TABLE `app_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recommendations`
--

DROP TABLE IF EXISTS `Recommendations`;
-- added category
CREATE TABLE `Recommendations` (
  `email_address` varchar(30),
  `service_name` varchar(20),
  `category` varchar(20),
  `advantages` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`service_name`,`email_address`),
  CONSTRAINT `reccomendations_ibfk_1` FOREIGN KEY (`email_address`) REFERENCES `User` (`email_address`),
  CONSTRAINT `reccomendations_ibfk_2` FOREIGN KEY (`service_name`) REFERENCES `Services` (`service_name`)
) ;

INSERT INTO Recommendations(service_name,advantages,email_address,category) VALUES
 ('Crunchyroll','Similar; Cheaper; More popular in demographic','cduran@gmail.com','Streaming')
,('Rakuten Viki','Similar; Cheaper; More popular in demographic','cduran@gmail.com','Streaming')
,('Netflix','Similar; Cheaper; More popular in demographic','cduran@gmail.com','Streaming')
,('Youtube Music','Similar; Cheaper','cduran@gmail.com','Music')
,('Anghami','Similar; Cheaper','cduran@gmail.com','Music')
,('Deezer','Similar; Cheaper','cduran@gmail.com','Music')
,('Coursera','Similar','rpark@yahoo.com','Education')
,('Brilliant.org','Similar; Cheaper; More popular in demographic','rpark@yahoo.com','Education')
,('Skillshare','Similar','rpark@yahoo.com','Education')
,('Rakuten Viki','Similar; Cheaper','rpark@yahoo.com','Streaming')
,('Disney+','Similar; Cheaper','rpark@yahoo.com','Streaming')
,('Netflix','Similar; Cheaper','rpark@yahoo.com','Streaming')
,('Spotify','Similar; Cheaper','rpark@yahoo.com','Music')
,('Youtube Music','Similar; Cheaper','rpark@yahoo.com','Music')
,('Gaana','Similar; Cheaper','rpark@yahoo.com','Music')
,('Coursera','Similar','itsleslie26@gmail.com','Education')
,('Brilliant.org','Similar; Cheaper; More popular in demographic','itsleslie26@gmail.com','Education')
,('MasterClass','Similar; Cheaper; More popular in demographic','itsleslie26@gmail.com','Education')
,('Crunchyroll','Similar; Cheaper','itsleslie26@gmail.com','Streaming')
,('Rakuten Viki','Similar; Cheaper','itsleslie26@gmail.com','Streaming')
,('Disney+','Similar; Cheaper','itsleslie26@gmail.com','Streaming')
,('Anghami','Similar; Cheaper','itsleslie26@gmail.com','Music')
,('Gaana','Similar; Cheaper','itsleslie26@gmail.com','Music')
,('Deezer','Similar; Cheaper','itsleslie26@gmail.com','Music')
,('Crunchyroll','Similar; Cheaper','kvella@gmail.com','Streaming')
,('Disney+','Similar; Cheaper','kvella@gmail.com','Streaming')
,('Netflix','Similar; Cheaper; More popular in demographic','kvella@gmail.com','Streaming')
,('MasterClass','Similar; Cheaper','kvella@gmail.com','Education')
,('Skillshare','Similar','kvella@gmail.com','Education')
,('Brilliant.org','Similar; Cheaper','kvella@gmail.com','Education')
,('Anghami','Similar; Cheaper','kvella@gmail.com','Music')
,('Spotify','Similar; Cheaper','kvella@gmail.com','Music')
,('Gaana','Similar; Cheaper','kvella@gmail.com','Music');

--
-- Dumping data for table `Recommendations`
--

LOCK TABLES `Recommendations` WRITE;
/*!40000 ALTER TABLE `Recommendations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recommendations` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Service_Plans`;

-- chnaged price(AED) to priceAED
CREATE TABLE `Service_Plans` (
  `service_name` varchar(20),
  `plan_name` varchar(40) NOT NULL,
  `app_description` varchar(200) DEFAULT NULL,
  `priceAED` float DEFAULT NULL,
  `payment_frequency` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`service_name`,`plan_name`),
  CONSTRAINT `service_plans_ibfk_1` FOREIGN KEY (`service_name`) REFERENCES `Services` (`service_name`)
) ;

-- Dump completed on 2024-12-21  9:25:54
-- Adding in service details

-- Insert data into the service_plans table
INSERT INTO Service_Plans (service_name, plan_name, app_description, priceAED, payment_frequency) VALUES
('Netflix', 'Basic', '720p video;1 device; movies and tv shows; documentary;hollywood;bollywood;desi;korean;japanese;chinese;arabic;parental controls;kids;cartoon;anime', 29, 'Monthly'),
('Netflix', 'Standard', '1080p video;2 devices; movies and tv shows; documentary;hollywood;bollywood;desi;korean;japanese;chinese;arabic;parental controls;kids;cartoon;anime', 39, 'Monthly'),
('Netflix', 'Premium', '4k video; 4 devices; movies and tv shows; documentary;hollywood;bollywood;desi;korean;japanese;chinese;arabic;parental controls;kids;cartoon;anime', 56, 'Monthly'),
('Crunchyroll', 'Fan', '1 device; anime;japanese;cartoon and tv shows; asian', 15, 'Monthly'),
('Crunchyroll', 'Mega Fan', '4 devices; offline viewing; games; anime;japanese;cartoon and tv shows;asian', 19, 'Monthly'),
('Crunchyroll', 'Mega Fan (yearly)', '4 devices; offline viewing; games; anime;japanese;cartoon and tv shows;asian', 190, 'Yearly'),
('OSN+', 'Monthly', 'news; movies; documentary; arabic;hollywood; cartoon;asian', 35, 'Monthly'),
('OSN+', 'Yearly', 'news; movies; documentary; arabic;hollywood; cartoon;asian', 330, 'Yearly'),
('Rakuten Viki', 'Monthly', 'asian; korean;japanese; movies and tv shows; anime', 18.33, 'Monthly'),
('Rakuten Viki', 'Annual', 'asian; korean;japanese; movies and tv shows; anime', 183.6, 'Yearly'),
('Amazon Prime Video', 'Prime Monthly', 'movies and tv shows; documentary; hollywood; bollywood ;desi; arabic; asian, anime;korean;kids;cartoon;parental controls', 16, 'Monthly'),
('Amazon Prime Video', 'Prime Annual', 'movies and tv shows; documentary;hollywood; bollywood ;desi; arabic; asian, anime;korean;kids;cartoon;parental controls', 140, 'Yearly'),
('Viu', 'Annual', 'asian;arabic;turkish;korean;tagalog; movies and tv shows; anime', 130, 'Yearly'),
('Disney+', 'Monthly', 'disney originals; parental controls; pixar; marvel; movies and tv shows', 39.99, 'Monthly'),
('Disney+', 'Annual', 'disney originals; parental controls; pixar; marvel; movies and tv shows', 354.99, 'Yearly'),
('Zee5', 'Monthly', 'movies and tv shows;bollywood;hollywood;arabic;indian', 18.99, 'Monthly'),
('Zee5', 'Annual', 'movies and tv shows;bollywood;hollywood;arabic;indian', 112.99, 'Yearly'),
('Coursera', 'Plus Monthly', 'online courses; Specializations; business; programming;math;Professional Certificates; learning', 216.53, 'Monthly'),
('Coursera', 'Plus Annual', 'online courses; Specializations; business; programming;math;Professional Certificates; learning', 1464.33, 'Yearly'),
('Brilliant.org', 'Monthly', 'Math; programming; science; simple to learn; online courses;learning;certificates', 74.99, 'Monthly'),
('Brilliant.org', 'Annual', 'Math; programming; science; simple to learn; online courses; learning;certificates', 489.12, 'Yearly'),
('Skillshare', 'Monthly', 'illustration; math; design; photography; video;business;leadership; freelancing; online courses; learning; certificates', 117.44, 'Monthly'),
('MasterClass', 'Individual', '1 user; business;leadership; photography;Professional Certificates cooking; writing; acting; sports; learning; online courses', 40, 'Monthly'),
('MasterClass', 'Duo', '2 users; offline viewing; business;leadership;Professional Certificates; photography; cooking; writing; acting; sports; learning; online courses', 58, 'Monthly'),
('MasterClass', 'Family', '6 users; offline viewing;business;leadership;Professional Certificates;photography; cooking; writing; acting;sports; learning; online courses', 47, 'Monthly'),
('Careem', 'Monthly', 'savings on rides; discounts and deals;food delivery and grocery shopping; dining out', 19, 'Monthly'),
('Amazon Shopping', 'Annual', 'free delivery; early access; online shopping; fashion;health;beauty;homeware', 140, 'Yearly'),
('Amazon Shopping', 'Monthly', 'free delivery; early access; online shopping; fashion;health;beauty;homeware', 16, 'Monthly'),
('Talabat', 'Pro', 'food delivery and grocery shopping; discounts and deals; health and beauty and more', 19, 'Monthly'),
('Deliveroo', 'Plus Silver', 'food delivery ;grocery shopping;discounts and deals; free delivery for orders 60 aed above', 19, 'Monthly'),
('Deliveroo', 'Plus Gold', 'food delivery;grocery shopping;discounts and deals;free delivery for orders 30 aed above', 29, 'Monthly'),
('Spotify', 'Individual', 'ad-free music; offline; 1 user; unlimited skips ; personalised reccomendations; view lyrics', 21.99, 'Monthly'),
('Spotify', 'Duo', 'ad-free music; offline; 2 users; unlimited skips  personalised reccomendations; view lyrics', 27.99, 'Monthly'),
('Spotify', 'Family', 'ad-free music; offline; 6 users; parental control;unlimited skips  personalised reccomendations; view lyrics', 33.99, 'Monthly'),
('Spotify', 'Student', 'ad-free music; offline; 1 user; university students;unlimited skips  personalised reccomendations; view lyrics', 11.99, 'Monthly'),
('Hungama', 'Monthly Movies', 'hollywood;bollywood;desi movies and shortfilms;hd;ad-free; downloads', 18.36, 'Monthly'),
('Hungama', 'Monthly Music', 'music; ad-free; downloads; 5 devices', 14.69, 'Monthly'),
('Hungama', 'Quarterly Movies', 'hollywood;bollywood; desi movies and shortfilms;hd;ad-free; downloads', 44.04, 'Quarterly'),
('Hungama', 'Quarterly Music', 'music; ad-free; downloads; 5 devices', 29.36, 'Quarterly'),
('Hungama', 'Yearly Movies', 'hollywood;bollywood;desi  movies and shortfilms;hd;ad-free; downloads', 146.8, 'Yearly'),
('Hungama', 'Yearly Music', 'music; ad-free; downloads; 5 devices', 102.76, 'Yearly'),
('Anghami', '6-months Single', '1 user; music; ad-free; offline;music; download; view lyrics', 119.99, 'Half-yearly'),
('Anghami', 'Yearly', '2 user; music;ad-free; offline;music; download; view lyrics', 199.99, 'Yearly'),
('Anghami', 'Student', '3 user; music;ad-free; offline;music; download; view lyrics', 99.99, 'Yearly'),
('Anghami', 'Family Yearly', '5 users; music;ad-free; offline;music; download; view lyrics', 359.99, 'Yearly'),
('Gaana', 'Monthly', 'offline;music; android auto app; unlimited skips;ad-free;download', 14.64, 'Monthly'),
('Gaana', 'Yearly', 'offline;music; android auto app; unlimited skips;ad-free;download', 62.35, 'Monthly'),
('Youtube Music', 'Individual', 'download videos; ad-free; background play; 1 user;music', 23.99, 'Monthly'),
('Youtube Music', 'Family', 'download videos; ad-free; background play; 5 users; parental control;music', 35.99, 'Monthly'),
('Youtube Music', 'Student', 'download videos; ad-free; background play; 1 user; annual verification;music', 13.99, 'Monthly'),
('Deezer', 'Annual Plan', 'ad-free; cross-device; song catcher;music', 197.9, 'Yearly'),
('Deezer', 'Monthly', 'ad-free; cross-device; song catcher;music', 21.99, 'Monthly'),
('Deezer', 'Family', 'ad-free; cross-device; song catcher; 6 users; parental control;music', 32, 'Monthly'),
('Deezer', 'Family Yearly', 'ad-free; cross-device; song catcher; 6 users; parental control;music', 352, 'Yearly');

-- select * from recommendations order by email_address;
