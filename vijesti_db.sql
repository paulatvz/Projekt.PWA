-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 13, 2024 at 09:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vijesti_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `korisnicko_ime` varchar(50) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `razina` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `ime`, `prezime`, `korisnicko_ime`, `lozinka`, `razina`) VALUES
(1, 'Paula', 'Nikolić', 'pnik18', '$2y$10$n7t2ys0H00ccsnv22DQ3Le2BkjMELc8L/sVwckN9AjOJbs5ce6SYO', 0),
(2, 'Tin', 'Savić', 'admin', '$2y$10$K7ogn.nB9/X65VZ/b5QFKez8.oLCGArIOmQMSBCa7PsSKil78HnL2', 1),
(3, 'Marko', 'Lovrić', 'mlov45', '$2y$10$4UesKrlzzQPMoQl4kHPvm.JdfKIJzdqndN9Yqq/VF4ZwtHn5MHa56', 0),
(4, 'Ana', 'Bazarota', 'bazi12', '$2y$10$ROwewZCO3v/Oc3zY4iJ7A.ntnFHYiPqYwae2nQnZijjFZVwleEFUO', 0),
(5, 'Ana', 'Horvat', 'ahorvat1', '$2y$10$N.0wvsaljAk5ouEhNZ/nFufrWi3D583j5ucJlNc8OUOzEE8fSazjO', 0),
(6, 'Lana', 'Jurčević', 'lalana1', '$2y$10$RiR6k9J8yZocCBvn5cmpQuus.cH9Tsd6a6HG0ksbnntmwzw9kMgAG', 0),
(7, 'Valentino', 'Perutina', 'vlpt', '$2y$10$awZcbFr9rx8oTcT/s42iW.wg5Xj0t9Cb/YuVKaXkUWxLlDOA8bBIy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `naslov` varchar(255) NOT NULL,
  `opis` text NOT NULL,
  `tekst` text NOT NULL,
  `kategorija` varchar(255) NOT NULL,
  `arhiva` tinyint(1) DEFAULT 1,
  `slika` varchar(255) NOT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `naslov`, `opis`, `tekst`, `kategorija`, `arhiva`, `slika`, `datum`) VALUES
(10, 'Stiže ekranizacija hit ljubavnog romana s Blake Lively u glavnoj ulozi.', 'Adaptacija bestselera \"It ends with us\" autorice Colleen Hoover u kolovozu stiže u kina, a u glavnoj ulozi gledat ćemo slavnu glumicu Blake Lively.', 'Uz stihove pjesme \"My Tears Ricochet\", Taylor Swift s njenog albuma \"Folklore\" iz 2020., objavljen je prvi trailer za ljubavnu dramu \"Priča završava s nama\" (\"It Ends with Us\"). Radi se o adaptaciji romana Colleen Hoover u kojoj glavne uloge igraju Blake Lively i Justin Baldoni, koji je ujedno i redatelj filma.Priča prati Lily Bloom (Blake Lively) i njezino preseljenje u Boston u kojem ostvaruje svoje snove otvaranjem cvjećarne, a uskoro upozna Rylea Kincaida (Justin Baldoni), šarmantnog neurokirurga u kojeg se zaljubi. No intenzivna romansa uskoro je počinje podsjećati na odnos koji su imali njezini roditelji - njezin otac, koji je nedugo prije preminuo, zlostavljao je njezinu majku. Stvari se dodatno zakompliciraju kada joj se u život vrati njezina stara ljubav Atlas Corrigan (Brandon Sklenar). Njena veza s Ryleom postaja još nestabilnija i Lily shvati da se mora osloniti na vlastitu snagu kako bi donijela pravu odluku za sebe. Glumačka postava filma \"It Ends with Us\", koji je za ekranizaciju napisala Christy Hall, također uključuje Jenny Slate kao Ryleovu sestru Allysu, Hasana Minhaja kao Allysina muža Marshalla i Amy Morton kao Lilynu majku Jenny. Film snimljen prema romanu Colleen Hover iz 2016., koji je postao hit na TikToku nekoliko godina kasnije, u kina stiže 9. kolovoza.', 'filmovi', 0, 'it_ends_with_us.jpg', '2024-06-12 13:05:56'),
(13, 'Stiže potpuno novo izdanje ‘Garfielda’!', 'Dražestan mačak i njegov najbolji prijatelj Odie naći će se u do sad neviđenim avanturama', 'Dva dana opuštanja, druženja i bezbrižnosti naglo prekida zvuk alarma koji najavljuje početak novog radnog tjedna. Scenarij je ovo koji je većini poznat, a ponavlja se svaki ponedjeljak. Upravo zato, iako je samo jedan od njih sedam u tjednu, ovaj dan mnogima daje razloga za uzdah pun nezadovoljstva. Prebačaj na školske ili poslovne obaveze često je mentalno iscrpljujuć pa se može činiti kao da taj ponedjeljak traje vječno.\r\n\r\nMržnju ponedjeljka dodatno je popularizirao omiljeni sarkastični mačak Garfield i to 1978. kada je prvi put izašao istoimeni strip tvorca Jima Davisa, koji kaže kako je Garfield zapravo ljudsko biće u mačjem odjelu. Svoju ljubav prema lazanjama i mržnju prema ponedjeljcima počeo je svakodnevno dijeliti s milijunima čitatelja i ubrzo postao najdraži lijeni mačak na svijetu.\r\nOvaj urnebesni kućni ljubimac 2004. je dobio svoj prvi dugometražni film, koji je bio kombinacija igranog i animiranog, a 2006. godine je uslijedio nastavak. Publika je kroz dosadašnje filmove imala priliku upoznati Garfieldov karakter koji ga redovito uvaljuje u nevolje. Tako u prvom djelu od kuće otjera pa spašava psa Odieja, a u drugom dvojac luta po Londonu i otkriva kako narančasti mačak ima dvojnika plemića.\r\n\r\nSada se Garfield vraća gotovo 20 godina kasnije, gladniji i sarkastičniji nego ikada, u svom prvom potpuno animiranom dugometražnom filmu koji 23. svibnja stiže u hrvatska kina. Ovaj dražestan vizualni spektakl idealan je za cijelu obitelj, a zanimljivo je da se radi o potpuno novoj priči koja, osim likova, nema ništa zajedničko s prijašnjim nastavcima.\r\n\r\nNove pustolovine\r\nRežiser filma je Mark Dindal, Disneyev veteran koji je radio na animaciji “Aladina”, “Male sirene” “Velikog mišjeg detektiva”, a sam je režirao “Carevu novu ćud” i “Žutu minutu”. Za Dindala i njegov tim proces stvaranja ovog animiranog filma započeo je istraživanjem onoga što Garfielda čini Garfieldom i pronalaženjem situacija u kojima njegov lik može rasti i mijenjati se.\r\n\r\nGarfield u novom animiranom izdanju upada u nevolje kao nikada prije. Do sada je najgora stvar s kojom se ikada morao suočiti bila bol u trbuhu od previše lazanja, no trailer otkriva kako su Garfield i njegov suputnik, pas Odie, izvučeni iz svoje kuće i bačeni u još neviđenu avanturu.\r\nProducent ovog filma, John Cohen, poznat po hit animiranim filmovima “Kako je Gru ukrao mjesec” i “Angry Birds”, kaže kako će ovo izdanje Garfielda baciti daleko izvan njegove komfor zone.\r\n\r\n- Garfield ostaje bez svojih redovnih toplih obroka, fotelje, deke i daljinskog upravljača te se nađe usred nepoznatog terena. Ludo smo se zabavljali smišljajući brojne avanture za najlijenijeg mačka na svijetu koji se sasvim neočekivano nađe usred velike pljačke – otkriva.', 'filmovi', 1, 'garfield.png', '2024-06-12 15:01:07'),
(17, 'Kreće nova serija u kojoj glumi najveći turski zavodnik! ', 'Can Yaman, najveći turski zavodnik u novoj seriji ‘Viola boje mroa’, 17. lipnja na rtl-u!', 'U seriji ‘Viola boje mora’, Viola Vitale, pobjednica natjecanja za Miss Italije i modna novinarka, vraća se iz Pariza u Palermo kako bi pronašla svog oca kojeg nikad nije upoznala. Počinje raditi kao novinarka na kriminalističkoj priči i tako ujedno počinje i njezina suradnja s inspektorom Francescom Demirom (Can Yaman). Za razliku od optimistične Viole koja vjeruje u ljudsku dobrotu, Francesco je ciničan i nepovjerljiv te sklon kršenju pravila. Stoga će Viola i Francesco u početku teško pronalaziti zajednički jezik, ali s vremenom naučit će uspješno surađivati na slučajevima koji otkrivaju tamnu stranu Palerma.\r\nViola također ima poseban dar koji joj pomaže u rješavanju zločina – sinesteziju, koja joj omogućava da ljudske emocije vidi kao boje. Ovo će joj omogućiti da otkrije stvarne i skrivene osjećaje ljudi s kojima se susreće i tako bolje shvati njihove namjere. Ova jedinstvena sposobnost ujedno skriva i tajnu stvarnog razloga njezinog povratka u Palermo.\r\nUz rješavanje zločina i istraživanja granice znanosti i nadnaravnog, ‘Viola boje mora’ ujedno donosi priču o ženi koja se pokušava snaći u novom okruženju, dokazati šefici koja u njezine sposobnosti nema povjerenja i steći prijatelje. Odnos Viole i Francesca pun je iskrica od samog upoznavanja – dinamični razgovori uz dozu flerta i šala, razlike u njihovim osobnostima i situacije u kojima se nađu dovode do zanimljivih i često smiješnih scena.\r\nLik Viole tumači lijepa Francesca Chillemi koja je, baš kao i lik kojeg glumi, svojedobno bila pobjednica natjecanja za Miss Italije. Osim kao Violu, Chillemi su gledatelji zapazili i kao Azzuru Leonardi iz dugovječne talijanske humoristično-kriminalističke serije ‘Neka nam Bog pomogne’.\r\nIpak, posebna poslastica je Can Yaman, popularni turski glumac, kojeg obožavateljice sigurno pamte i iz serije u kojoj je ostvario svoj prvi glumački uspjeh, ‘Pun mjesec’, kao i uloge u serijama ‘Sanjalica’ i ‘Gospodin pogrešni’. Veliki turski zavodnik i miljenik gledateljica u seriji ‘Viola boje mora’ glumi karizmatičnog i impulzivnog inspektora Francesca Demira. Yaman se, osim privlačnim izgledom i zavidnom figurom, može pohvaliti i znanjem čak tri strana jezika uz materinji turski, a upravo u ovoj seriji Yaman je ostvario svoju prvu ulogu na talijanskom jeziku i oduševio gledatelje!\r\nPredivni kadrovi Palerma, uzbudljivi kriminalistički slučajevi, tajne koje se kriju u pozadini, kemija među likovima i njihova ljubavna priča te divni Francesca Chillemi i Can Yaman čine ‘Violu boje mora’ idealnom serijom za opustiti se tijekom vrućih ljetnih večeri! Serija kreće s emitiranjem na RTL-u od 17. lipnja u 21:15! ‘Viola boje mora’ dostupna je i na platformi Voyo.', 'serije', 0, 'viola_boje_mora.jpg', '2024-06-12 15:23:46'),
(18, '‘Planeta majmuna: Novo kraljevstvo’: Novo kraljevstvo, stare dileme', 'Film ima svojih mana ali to ne umanjuje dojam da je udario dobre temelje za novu eru naslova ove franšize.', 'Filmska franšiza Planeta majmuna započela je davne 1968. godine a do 1973. godine snimljena su još četiri nastavaka. Svemu treba dodati da je 1974. godine snimljena i TV serija a godinu dana kasnije i animirana serija.Godine 2001. redatelj Tim Burton snimio je remake originalnog filma. Deset godina nakon tog filma započela je tzv. reboot serija, odnosno, trilogija. Središnji lik te trilogije bio je čimpanza Cezar, kojeg je utjelovio Andy Serkis, kojeg svi pamte kao Golluma u trilogiji Gospodar prstenova (The Lord of  the Rings, 2001-2003) i jednom nastavku Hobita (Hobit: Neočekivano putovanje/The Hobbit: An Unexpected Journey, 2012.).\r\nNakon te reboot trilogije pred nas je stigao i najnoviji film franšize, Planeta majmuna: Novo kraljevstvo (Kingdom of the Planet of the Apes, 2024.). Redatelj filma je Wes Ball (filmski serijal Labirint/The Maze Runner) a scenarist je Josh Friedman (Avatar: Put vode /Avatar: The Way of Water, 2022.), Terminator: Mračna sudbina /Terminator: Dark Fate, 2019.), kreator TV serije Foundation (2021-2023.).\r\nPriča filma vremenski se odvija nekoliko generacija u budućnosti, nakon Cezarove vladavine i njegove smrti. Majmuni su dominantna vrsta koja živi skladno, a ljudi su svedeni na život u sjeni. Neke skupine majmuna nikada nisu čule za Cezara ali jedan je iskrivio njegovo učenje te gradi svoje carstvo i porobljavati druge skupine.Tom tiranskom vođi majmuna, Proximus Cezar (Kevin Durand), cilj je da se dokopa ljudske tehnologije i u potpunosti stvori svoje carstvo. Majmuni Proximusa Cezara porobe klan majmuna Noe (Owen Teague), koji se usavršio u sokolarstvu. Noa, na grobu svog mrtvog oca, obeća da će vratiti klan natrag. \r\nKreće na opasan put za Proximusovom skupinom. Na tom putu susreće orangutana Raku. Raka upoznaje Nou o tome tko je bio pravi, majmunski Cezar i koje je bilo njegovo učenje i nasljeđe. Uskoro primjećuju djevojku Mae (Freya Allan), koja zna govoriti (ljudska evolucija je nazadovala) koje je pratila Nou.Ona im se pridružuje na putovanju i otkrije da da se Proximus Cezar nalazi kraj velikog i zatvorenog skloništa (rekli bi – vojnog, atomskog skloništa). Svi zajedno kreću tamo ali uskoro ih opaki Proximusovi majmuni zarobljavaju.\r\nOno što slijedi je borba za opstanak ali borba povjerenja između Noe i Mae, koja i nije bila baš potpuno iskrena prema njemu. U svemu tome, Noa je prisiljen preispitati sve što je znao o prošlosti i donijetu odluke koje će definirati budućnost i majmuna i ljudi.\r\nPriča filma podijeljena u dva dijela. Prvi dio, nakon početnog uvoda i odvođena Noinog klana u zatočeništvo, zapravo je svojevrsni film ceste. U njemu se oživljava sjećanje na preminulog, iskonskog Cezara. To je svojevrsna rekapitulacija njegovog lika i djela te ostavštine. Neosporno je da se time htjelo ‘olakšati’ gledanje onima koji nisu gledali predhodne filmove i nemaju pojma tko je bio Cezar. Drugi dio počinje zarobljavanjem Noe i sadržajno prati daljnje događaje.', 'filmovi', 0, 'planet_majmuna.jpg', '2024-06-12 15:28:22'),
(19, 'Baby reindeer broj jedan je trending serija na Netflixu u Hrvatskoj', 'Serija prati Donnyja, propalog komičara čiji se život promjeni kada mu žena po imenu Martha uđe u život i počne mu slati stotine e-poruka dnevno.', 'Netflixova nova serija \"Baby Reindeer\" brzo je osvojila srca gledatelja i kritičara svojom dubokom tematikom i snažnim izvedbama. Iako je serija fikcija, inspirirana je stvarnim događajima iz života kreatora Richarda Gadda. Evo što trebate znati o istinitoj priči iza ove izvanredne TV serije.Serija prati Donnyja, propalog komičara čiji se život promjeni kada mu žena po imenu Martha uđe u život i počne mu slati stotine e-poruka dnevno. Dok pokušava i ne uspijeva zaustaviti svog uhoditelja, Donny se također prisjeća razdoblja u svom životu tijekom kojeg ga je nasilno zlostavljao mentor po imenu Darrien.Richard Gadd, pisac, tvorac i glavna zvijezda serije, već je bio poznat po svojim radovima, ali \"Baby Reindeer\" je vrhunac gotovo desetljeća rada. Inspiracija za seriju proizlazi iz Gaddovih osobnih iskustava, posebno seksualnog nasilja koje je doživio kao mladi komičar. Njegova predstava \"Monkey See Monkey Do\" otkrila je ove traumatične događaje, a \"Baby Reindeer\" nastavlja istraživati njihove posljedice. Raspravljajući o uspjehu predstave Baby Reindeer u Edinburghu, Gadd je u Netflixovom priopćenju napisao: \"Sve što sam ikada želio učiniti bilo je snimiti nešto komplicirano o ljudskom stanju. Da svi griješimo. Da nijedna osoba nikada nije dobra ili loša. Da mi sve smo izgubljene duše koje traže ljubav na svoj čudan način.\"U Netflixovoj seriji, Donny se prvi put povezuje s Marthom nakon što ona dođe u bar u kojem on radi. On joj ponudi besplatnu šalicu čaja u pokušaju da je oraspoloži, ali Martha tu ljubaznu gestu ozbiljno prima k srcu. Ubrzo se svakodnevno pojavljuje u baru, komentira njegove objave na Facebooku i šalje mu hrpu e-mailova. Kad počne napadati Donnyjev stvarni život posjećujući njegove stand-up nastupe i uznemiravajući njegovu djevojku, postaje jasno da bi Martha mogla predstavljati legitimnu prijetnju. Naposljetku, Martha dobiva njegov telefonski broj i stalno mu ostavlja poruke u govornoj pošti, nešto što je radila i prava Martha. Tijekom intervjua za The Independent, Gadd je ispričao da mu je njegova uhoditeljica poslala 41.071 e-mailova, 350 sati govorne pošte, 744 tweeta, 46 Facebook poruka, 106 stranica pisama, tablete za spavanje, vunenu kapu, par potpuno novih bokserica i umiljatu igračku soba. Gadd je o Marthinim glasovnim porukama rekao: \"Otišao bih u krevet navečer i još uvijek je čuo u svojim ušima. Njezin glas vrtio mi se u glavi. Njezine riječi skakale su mi oko kapaka dok sam pokušavao zaspati.\" Također je počeo kategorizirati govornu poštu, slično kao što to Donny radi u seriji, i nadajući se da će u nekoj od poruka pronaći dokaze o njezinom nedjelu. Ono što je važno, Gadd je želio da gledatelji shvate da ga je nasilje koje je napravio stvarni Darrien ostavilo ranjivim na Marthino udvaranje. \"Želio sam pokazati da je ono što je Darrien učinio bilo pogubno zlo, dok je Marthino ponašanje dolazilo iz mjesta duboke ranjivosti\", rekao je.', 'serije', 0, 'baby_reindeer.jpeg', '2024-06-12 15:48:04'),
(20, 'Na Netflix stigla uzbudljiva triler serija, ljudi pišu: \"Pogledao sam je preko noći\"', 'Uzbudljiva nova serija gledateljima se toliko svidjela da je gledaju u roku od jednog dana. Riječ je o korejskoj triler seriji A Killer Paradox, koja je na Netflixu dostupna od 9. veljače 2024.', 'A Killer Paradox, također poznat kao Murder DIEary, kriminalistička je serija bazirana na istoimenom popularnom webtoonu. Priča prati mladog studenta Lee Tanga (Choi Woo-shik), koji živi sa svojim roditeljima, radi u trgovini i sanja o odlasku u Kanadu.\r\n\r\nNakon što ga jednu večer napadne kupac, Tang ga ubije u samoobrani, no to ga počne izjedati, sve dok ne dozna da je ubio traženog serijskog ubojicu. Tang ubrzo otkrije da ima skriveni talent koji mu pomaže da prepozna zle ljude, zbog čega nastavlja ubijati kriminalce. \r\n\r\nNo svojim ubojstvima privuče pažnju detektiva Janga Nam-Gama (Son Suk-Ku) i bivšeg detektiva Songa Chona (Lee Hee-Jun), koji vjeruju da je on kriv i ne prestaju ga loviti.\r\nTriler serija oduševila je gledatelje, sudeći prema njihovim reakcijama na društvenim mrežama.\r\n\r\n\"Ovo je tako dobra serija, dovršila sam je sinoć\", \"Pogledao sam je preko noći\", \"Jako dobro\", samo su neki od komentara u Facebook grupi Netflix Bangers.\r\n\r\n\"Ova serija izgleda tako prekrasno\", \"Upravo sam dovršila ovo, svih osam epizoda. Provela sam cijeli petak gledajući ovo remek-djelo, stvarno mi se sviđa\", pisali su korisnici Reddita.', 'serije', 1, 'a_killer_paradox.jpg', '2024-06-12 15:51:35'),
(21, 'Anne Hathaway se u novom filmu zaljubi u 16 godina mlađu pop zvijezdu', 'Naime, upravo je stigao film The Idea of You. Radnja je temeljena na istoimenoj knjizi autorice koja je glavnu mušku ulogu bazirala na Harryju Stylesu. Ono što je nas zainteresiralo jest da glavnu žensku ulogu glumi ni više ni manje nego Anne Hathaway.', 'The Idea of You prati Solene (Hathaway), 40-godišnju majku koja započne neočekivanu romansu s Hayesom Campbellom (Nicholas Galitzine), 24-godišnjom pop zvijezdom iz boybanda August Moon. Priča ide tako da Solene odvede svoju kćer tinejdžerku na Coachellu nakon što je njezin bivši suprug otkazao dogovor. Tamo upoznaje Hayesa koji je odmah privuče i u kojeg se zaljubi.\r\n\r\nHayesa glumi Nicholas Galitzine, zvijezda hit filma Red, White & Royal Blue, a pojavljuju se i Reid Scott, Ella Rubin, Annie Mumulo i Perry Mattfeld. Režiju potpisuje Michael Showalter, poznat po režiraju oskarovskog filma The Big Sick te hvaljene serije Search Party. Moramo priznati, kad smo čuli da će doći film u kojem se 40-godišnjakinja zaljubi u 24-godišnjaka koji je uz to i pop zvijezda temeljena na Harryju Stylesu odmah smo pomislili kako će biti flop. Međutim, uključenost Hathaway i Showaltera u film mogao bi ga učiniti hitom.\r\nMnogi tvrde kako je The Idea of You temeljen na Harry Styles fanfictionu, no autorica romana Robinne Lee to demantira, no kaže kako je lik Hayesa Campbella definitivno inspiriran poznatim pjevačem. Nakon što je vidjela jedan video Stylesa, stvorila joj se ideja za roman. Osim što je Styles bio dio megapopularnog boybanda, glavni lik The Idea of You dijeli još jednu sličnost s pjevačem. Riječ je o ljubavi prema starijim ženama. Styles je poznat po romansama sa ženama koje su barem 15 godina starije od njega, a to je inspiriralo i autoricu romana.\r\n\r\nMeđutim, The Idea of You nije fokusirana na pop zvijezdu, već na Solene. Film slavi žensku seksualnost i ženu koja je ponovno uzima u svoje ruke, u trenutku u kojem je društvo tradicionalno otpisuje. Zapravo je riječ o tome kako se u društvu često insinuira kako žena gubi na vrijednosti čim malo ostari. Izgleda kako ćemo onda dobiti puno dublji film umjesto tradicionalne romantične drame.\r\nMarketing za film u punom je jeku. I prije nego je izašao trailer za film, fiktivni boyband iz filma, August Moon već je imao i svoj Instagram profil. I ne samo to, izbacili su i svoju prvu pjesmu – Dance Before We Walk. Profil je predstavio članove filmskog boybanda – Hayesa, Simona, Olivera, Roryja i Adriana. Instagram profil već ima preko četiri tisuće pratitelja, a sadrži slike s koncerata i promo photoshootinga. To je način da se fanove zainteresira za film i da ih učini fanovima benda kako bi The Idea of You došli pogledati u kina. Ne zna se točno koliko ćemo August Moona dobiti u filmu, no s obzirom na slike s koncerta na Instagram profilu i trailer, možemo očekivati da ćemo dobiti barem jednu koncertnu scenu.\r\n\r\nFilm je stigao na Amazon Prime.', 'filmovi', 0, 'the_idea_of_you.jpg', '2024-06-12 16:05:07'),
(22, '‘Izvrnuto obrnuto 2’: Nove emocije, novi kaos u glavi', 'Jedan od najuspješnijih filmova animacijskog studija Pixar dobiva svoj nastavak ovog ljeta koji će zasigurno izazvati nove emocije.\r\n', 'Emocije Sreća, Strah, Tuga, Ljutnja i Gađenje imaju novog posla u Rileyinom umu. Dok su se u prvom nastavku morale nositi s privikavanjem na novu okolinu zbog selidbe u novi grad, sada dobivaju društvo novih emocija jer Riley ipak odrasta u mladu djevojku. Tinejdžerske godine znaju biti emotivno jako zahtjevne. Još od 1995. godine i Priče o igračkama (Toy Story) koji je bio prvi dugometražni film animiran u potpunosti s CGI-jem, Pixar se kroz idućih gotovo tri desetljeća postavio kao jedan od vodećih studija za animirane hitove. Osim tehnoloških inovacija u animaciji i uvijek fantastičnog izgleda, vjerojatno najveću privlačnost njihovim filmovima studio može zahvaliti pričama kojima udahnjuju život na velikim ekranima. Svi Pixarovi filmovi usmjereni su na publiku svih uzrasta pronašavši savršeni balans između filma za djecu i tema s kojima se može poistovjetiti odrasla publika – ispričanima na šaren i zabavan način kroz emocije i smijeh. Naravno, to nije pravilo jer Život buba (A Bug’s Life, 1998.) je ipak prvenstveno bio usmjeren najmlađoj publici, a ovdje se može svrstati i franšiza Auti (Cars). Pixarovo ostvarenje koje je osvojilo Oscara za najbolji animirani film Izvrnuto obrnuto (Inside Out, 2015.) je pak oduševio publiku svih uzrasta, prikazujući na originalan i lako shvatljiv način kako ljudske emocije funkcioniraju. Na taj način, Izvrnuto obrnuto dotaknuo se teme koja se tiče emotivnog stanja, a sve je sve češća u današnje vrijeme. Izvrnuto obrnuto pokazao je kako treba prihvatiti i proživjeti osjećaje koje se najčešće naziva lošima, a to je u prvom redu tuga. Takvi neugodni osjećaji su bitni i važni za proživjeti, a to je u filmu naučila i Sreća koja se htjela riješiti Tuge pod svaku cijenu. Kad svi osjećaji imaju svoje trenutke u kojima mogu zasjati, to djevojčicu Riley u čijem se umu oni izmjenjuju čini potpunom i izbalansiranom osobom. Kako godine prolaze i Riley sazrijeva, tako se pojavljuju i nove emocije što znači da će Sreća, Tuga, Bijes, Strah i Gađenje dobiti društvo. Na Rileyin 13. rođendan stižu i četiri nove emocije koje će unijeti novu dozu kaosa, a one su Tjeskoba, Sram, Zavist i Ennui, tj. Dosada. Nakon što se upali alarm puberteta, novopridošlice odlučuju kako Rileyin um treba profinjenije emocije nego što su to Sreća i ostatak ekipe iz prvog filma. Nazvavši ih ‘starom školom’, nove emocije zatoče Sreću, Tugu, Ljutnju, Strah i Gađenje te ih uklone kako se više ne bi miješale u Rileyino ponašanje. Ono što slijedi je da njih petoro mora pronaći povratak u glavni stožer kako bi Riley mogla normalno funkcionirati, a njihov put bit će duži i opasniji nego u prvom filmu. Za razliku od prvog filma gdje su samo Sreća i Tuga morale pronaći put natrag, ovaj puta im se pridružuju Bijes, Strah i Gađenje što će avanturu učiniti još smiješnijom i emotivnijom. Negdje se mota i Nostalgija, ali ako je zaključiti prema trailerima, ona se ovdje više mota da dobaci kakav šaljivi, nostalgični komentar. Kako se u hrvatskim kinima Izvrnuto obrnuto 2 prikazuje u sinkroniziranoj verziji, glumci koji su posudili glasove emocijama i ostalim likovima se vraćaju i za njegov nastavak, a pridružuje im se i nova ekipa. Samo neki od navedenih su Judita Franković (Sreća), Biserka Ipša (Tuga), Marko Makovičić (Strah), Bojan Navojec (Bijes), Iva Šulentić (Gadljivost), Neva Serdarević (Riley), Jelena Miholjević (Mama), Frano Mašković (Tata), Amanda Prenkaj (Tjeskoba), Mia Čičak (Valentina), Niko Čuturić (Torbić), Leona Paraminski (Trenerica), Ella Dvornik (Dosada), Mara Picukarić (Zavist), Mirela Brekalo (Nostalgija), i Ida Bedenik (Bree).\r\nSinkronizirano u kinima od 13.06.', 'filmovi', 1, 'izvrnuto_obrnuto.jpg', '2024-06-12 18:21:15'),
(23, 'Furiosa: A Mad Max Saga s Cannesa je napokon stigao i u naša kina', 'Jedan od prvih filmova koji je imao premijeru u Cannesu je apokaliptični film Furiosa: A Mad Max Saga i ako je suditi po reakcijama publike, bit će hit.', 'Prvi Mad Max film izašao je davne 1979. kada je Maxa glumio Mel Gibson. Film je pratio policajca u postapokaliptičnoj Australiji koji se nakon određenih događaja ide osvetiti motociklističkoj bandi. Uslijedila su još dva nastavka s Gibsonom u glavnoj ulozi, no ponovni interes za lika vratio se 2015. kada je izašao izvrsni kino hit Mad Max: Fury Road u kojem je Maxa glumio Tom Hardy. Film je osvojio nekoliko tehničkih Oscara, a lik Furiose prvi put se pojavljuje u tom filmu. Tada ju je glumila Charlize Theron, a u prequelu koji nam dolazi gledat ćemo njezin origin story i kako se udružila s Maxom. Anya Taylor-Joy neprepoznatljiva je kao junakinja Furiosa u novom traileru. Film započinje njezinim odrastanjem u idiličnom Green Placeu gdje služi Vuvalini vojsci prije nego što postane neustrašiva ratnica koju smo gledali u Fury Roadu. Furiosu najavljuju više kao dramu u tri čina, nego akcijski spektakl kao Fury Road. Radnja u filmu se stoga odvija kroz nekoliko godina te bi trebalo obuhvaćati njezino odrastanje, odnos s Vuvalinima, kako je izgubila ruku te kako je postala ratnica kakvu sada znamo. Publika Filmskog festivala u Cannesu nakon premijere Furiose, nagradila je ekipu sa šestominutnim pljeskom. Takve ovacije nisu ništa novo kada je riječ o filmskim festivalima, no rijetko kad film koji dobije gromoglasni pljesak ispadne loš. Anya Taylor-Joy slala je poljupce kamerama, a Chris Hemsworth bio je vidno ganut sa suzama u očima. Prethodni film je bio poznat i po tome da se Tom Hardy i Charlize Theron nisu baš dobro slagali, no Taylor-Joy i Hemsworth na premijeri su se činili opušteni i prijateljski raspoloženi. Njihova kemija vidljiva je i na ekranu što potvrđuju prve recenzije filma. Malo je reći da smo uzbuđeni da je Furiosa stigla u kina. Redateljsku palicu ponovno preuzima George Miller, čovjek zaslužan za stvaranje Mad Maxa koji je napisao i režirao sve Max Mad filmove dosad. Anyu Taylor-Joy nismo još imali prilike gledati u ovakvom filmu. Podsjetimo, glumicu je proslavila hit Netflixova miniserija Queen’s Gambit te manja uloga u Peaky Blindersima. Od tad niže odlične filmske uloge u hororu The VVitch, Last Night in Soho te The Menu. Osim nje, u Furiosi će glumiti i Chris Hemsworth. Furiosa: A Mad Max Saga stigao je u naša kina.', 'filmovi', 0, 'furiosa.jpg', '2024-06-12 18:28:34'),
(24, 'Započelo snimanje trećeg nastavka serijala ‘Knives Out’', 'Produkcija ‘Wake Up Dead Man: A Knives Out Mystery’ službeno je započela, a Johnsonov projekt već je potpisao niz poznatih lica.', 'Produkcija trećeg dijela franšize “Knives Out” Riana Johnsona službeno je u tijeku. Redatelj i scenarist objavio je prvu sliku omiljenog detektiva Benoita Blanca kojeg glumi Daniel Craig, a koji bi se trebao naći upleten u još jednu misteriju ubojstva u “Wake Up Dead Man: A Knives Out Mystery”. Mnoštvo vrhunskih glumaca u filmu već je objavljeno kako bi pobudili apetit publike. Oni zasad uključuju Josha Brolina iz “Dunea“, Josha O’Connora iz “Challengers“, glumicu iz “Civil War” Cailee Spaeny, zvijezdu “Ripleyja” Andrewa Scotta, te Kerry Washington, veteranku na platnu i pozornici Glenn Close, Jeremyja Rennera i Milu Kunis. Johnson je jučer podijelio fotografiju Craiga na setu, napisavši: “Iiiiii krećemo! Danas je prvi dan snimanja sljedeće misterije Benoita Blanca ‘Wake Up Dead Man’ – vidimo se na drugoj strani.” Priložio je crno-bijelu fotografiju Craiga u trodijelnom odijelu, kako zamišljeno zuri udesno. Detalji radnje i podaci o likovima još su u tajnosti, ali možemo očekivati ​​još jedan divlji labirint optužbi i ubojstava koji smo vidjeli u “Knives Out” i “Glass Onion: A Knives Out Mystery“. Johnson je napisao scenarij i režira film, te ga producira sa svojim partnerom Ramom Bergmanom. ', 'filmovi', 0, 'knives_out.png', '2024-06-12 18:33:44'),
(25, 'Dvadeseta sezona legendarne kriminalističke serije \"Navy CIS\"', 'Ova dugovječna serija stekla je svoj kultni status, što potvrđuje impresivna činjenica da je čak planirana i 21. sezona.', 'U novoj sezoni kriminalističke serije \"Navy CIS\" profesionalni tim agenata dat će sve od sebe kako bi riješio i najteže slučajeve, i to na dobro poznat, samo njima svojstven način koji uvijek uključuje dozu humora. U glavnim ulogama sada su Sean Murray kao specijalni agent Timothy McGee, Wilmer Valderrama kao agent Nickolas \"Nick\" Torres, Katrina Law kao specijalna agentica Jessica Knight, Diona Reasonover u ulozi forenzičarke Kasie Hines i Gary Cole kao specijalni agent NCIS-a Alden Parker. Nova sezona zadat će završni udarac na šokantne preokrete iz finala prethodne sezone. Potpuno nesvjestan surove realnosti u kojoj se nalazi, na samom početku sezone Parker je zbog lažne optužbe za ubojstvo i dalje u bijegu s bivšom ženom Vivian. Dok tajanstveni negativac provodi svoj zlobni plan, NCIS tim provest će detaljnu potragu za misterioznim osvetnikom. Već u prvoj epizodi serija donosi zanimljive goste, specijalnu agenticu Jane Tennant i računalnog stručnjaka Earnija Malika, koji se spletom okolnosti nalaze u istom gradu i pomažu riješiti najteži slučaj do sada. Tennant i Malik dio su glavne glumačke postave serije \"Navy CIS Havaji\" koja se trenutno emitira na kanalu Doma TV. Također, u jednoj od epizoda s NCIS timom sastat će se i agenti Los Angeles Navy CIS-a kada se okupe na proslavi umirovljenja najdražeg bivšeg profesora. No, jedna slobodna i sasvim obična večer pretvorit će se u posao i tragičnu dužnost kada pronađu njegovo mrtvo tijelo. Tim će se suočiti i s nizom drugih izazova i misterija. Počevši od zaštite direktora Vancea nakon nasilnog upada u njegov dom, tim mora razotkriti tko stoji iza napada. U jednom od slučajeva, tijekom godišnje utrke za Dan zahvalnosti, nepoznati strijelac uzrokovat će pomutnju, a NCIS tim mora hitno otkriti motiv i krivca. Također, tijekom istraživanja neobičnih zločina, agent Parker postat će žrtva krađe identiteta, a među žrtvama kriminalističkih incidenata pronaći će se student, marinac, kći senatora i brojni drugi. Dvadeseta sezona, prema piscima serije, prozvana je i sezonom ljubavi. Romansa Jessice i Jimmya cvate, iako iznenadni događaji prijete njihovoj sreći. U finalnim epizodama, specijalni agent Torres mogao bi se naći u zatvoru dok dobro poznati tim pokušava spriječiti teroristički napad na tlu SAD-a. Nova sezona donosi uzbuđenje, tajne i napetost dok junaci vojne mornarice SAD-a pokušavaju razriješiti složene slučajeve i održati sigurnost zemlje.', 'serije', 0, 'nsic.jpg', '2024-06-12 18:39:35'),
(30, 'Nova miniserija na Netflixu', 'Triler serija je inspirirana istinitim slučajem, a prati očajnog oca usred velike tragedije.', 'Vincent (Cumberbatch) je poznati lutkar i tvorac popularne TV serije za djecu – Good Day Sunshine. Život mu se okrene naglavačke kada njegov devetogodišnji sin Edgar misteriozno nestane na putu do škole. Boreći se s gubitkom sina, Vincent postaje sve tužniji i nestalniji. Pun samoprijezira i krivnje zbog Edgarova nestanka, on se uhvati crteža koji je Edgar nacrtao – plavog čudovišta, Erica, uvjeren da će se on vratiti kući ako uspije dovesti Erica na TV. Dok Vincentovo progresivno destruktivno ponašanje otuđuje njegovu obitelj, njegovi kolege i detektive koji mu pokušavaju pomoći, Eric postaje njegov jedini saveznik u potrazi za vraćanjem sina kući. Radnja je smještena u 80-e godine prošlog stoljeća, a miniserija će imati šest epizoda. Osim Cumberbatcha, pojavljuju se i Gaby Hoffman, Jeff Hephner, McKinley Belcher III, Ivan Morris Howe, dok režiju potpisuje Lucy Forbes, a kreatorica je Abi Morgan.', 'serije', 0, 'eric.jpg', '2024-06-13 10:56:07'),
(34, 'Najgori film o superherojima', 'Stiže nam film kojeg bi se i glavna glumica najradije odrekla. Navodno je toliko loš.', 'Pred nama je slučaj filma koji je osuđen na propast i bez da se pojavio pred gledateljima. Riječ je o Madame Web, novom filmu o superherojima koji je direktno inspiriran istoimenim likom iz Marvelovih stripova.\r\nKako je istaknuto u najavi, za razliku od tipičnog žanra, Madame Web priča samostalnu priču o podrijetlu jedne od najzagonetnijih Marvelovih junakinja – Cassandre Webb, bolničarke koja stječe nadnaravne sposobnosti… Naslovna uloga povjerena je Dakoti Johnson, kojoj se pridružuju Sydney Sweeney, Isabela Merced i Emma Roberts. Premda je okupljena sjajna glumačka ekipa, film je u prvim danima prikazivanja prikupio mahom negativne kritike. One se prvenstveno odnose na loše razrađen scenarij i osrednju izvedbu zvjezdane postave. Neki idu toliko daleko da ga nazivaju i najgorim filmom o superherojima ikad snimljenim. Ova osuda je možda ipak prejaka, ali sasvim je jasno da je ovo još jedno loše ostvarenje žanra koji rapidno gubi popularnost. A toga je itekako bila svjesna Dakota Johnson koja je u najavama isticala kako ni sama nije sigurna da je obavila dobar posao te da će rezultat biti zadovoljavajuć. Sumnju u vlastite sposobnosti, kao i uspjeh filma, iznijela je osvrnuvši se na svoje iskustvo rada s plavim ekranom za CGI efekte, a isto je okarakterizirala kao – psihotično. Nije velika utjeha gledateljima, ali renomirani  filmski kritičari ističu kako Madam Web ipak nije najgori Spider Manov spin off (tu su ulogu  namijenili filmovima Venom i Morbidus). Također, napominju i kako nije sve za plakanje, film bi vas na trenutke mogao i nasmijati. Razgovori jesu otrcani, ali na momente funkcioniraju. Je li dosta toliko loš? U ovu tvrdnju moći ćete se uvjeriti sami jer film Madam Web u domaća kina stiže u četvrtak, 15. veljače.', 'filmovi', 0, 'madame_web.jpg', '2024-06-13 18:51:53'),
(35, 'Nova sezona serije Bridgerton!', 'Colin i Pen susreću se na jednom balu te kratko razgovaraju.', 'Ljubavni zapleti, drame i intrige iz londonskog visokog društva s početka 19. stoljeća ponovno se vraćaju na male ekrane. Netflixova popularna serija \"Bridgerton\" vraća se sa svojom trećom sezonom nakon dvije godine, a datum izlaska prvih epizoda je 16. svibnja. Naime, Netflix je nove nastavke, kao i za druge serije, podijelio na dva dijela. Jedan dio tako će biti dostupan u svibnju, a drugi od 13. lipnja. Obožavatelji ovih likova nestrpljivo iščekuju ove datume, a do tada ih je popularna streaming platforma počastila isječcima. Netflix je objavio najavu serije, a radi se o videu koji prikazuje odnos Colina Bridgertona i Penelope Featherington, glavnih likova treće sezone. Colin i Pen susreću se na jednom balu te kratko razgovaraju, a ona iznosi svoje nezadovoljstvo njegovim ophođenjem prema njoj. Ovaj razgovor pobudio je interes za novu sezonu i njihov odnos među brojnim obožavateljima, a 80 sekundi dug video objavljen je na Valentinovo. Početkom veljače objavljen je i još jedan kratki video ovog para, a nedavno je procurio i romantični trenutak glavnih likova. Kako se bliži datum objave, cure i nove informacije o voljenoj seriji na čijoj produkciji radi poznata kuća Shondaland iza koje stoji Shonda Rhimes. Tako je otkriveno da glavne likove nove sezone, Colina i Penelope, koje obožavatelji zajedno nazivaju \"Polin\", igraju Luke Newton i Nicola Coughlan, a serija, nastala po serijalu romana Julie Quinn, sada prati četvrti nastavak književnog serijala. Ovaj nastavak serije logičan je s obzirom na to da je u finalu druge sezone Pen načula razgovor svoje simpatije Colina o tome kako se on nikada ne bi oženio njome. Nakon toga u seriji je slijedila pauza, Colin se uputio na putovanje, a Penelope je odlučila promijeniti svoj stil i ponašanje prema Colinu te pronaći supruga. Nakon povratka normalnom životu i otvaranja nove društvene sezone u trećoj sezoni serije Pen je odlučna u svojoj namjeri, no udaja joj ne polazi za rukom. Colin se u međuvremenu vratio sa svojih putovanja kao drugi čovjek – promijenjenog izgleda te drugačijeg karaktera. No shvatio je i da je Pen promijenila svoje ponašanje prema njemu, što mu je zasmetalo. S obzirom na to da je njihov odnos postao hladniji, Colin želi obnoviti njihovo prijateljstvo te joj nudi mentorstvo kako bi je podučio kako se treba ponašati kako bi uspjela u naumu da pronađe supruga kakvog želi. No tijekom druženja oboje shvaćaju da njihovi osjećaji nisu samo prijateljski te se njihov odnos počinje razvijati. Treća sezona prati i Colinovu sestru Francescu, koja se također ove godine nalazi u londonskom društvu. Francescu glumi Hannah Dodd koja je na setu zamijenila kolegicu Ruby Stokes. Na žalost brojnih obožavateljica, ni ova sezona neće nam donijeti povratak markantnog vojvode od Hastingsa kojeg je utjelovio Regé-Jean Page, a \"Bridgerton\" je nakon dvije sezone napustila i glumica Phoebe Dynevor, koja je igrala najstariju sestru Daphne. Ostale članove obitelji Bridgerton i članove londonskog visokog društva igrat će već poznati glumci.Valja istaknuti i da Penelope ostaje u razdoru s Colinovom sestrom Eloise koja joj je bila dobra prijateljica, a i dalje skriva svoj alter ego Lady Whistledown. U ovoj sezoni gledatelji će moći vidjeti i odnos Antonyja Bridgertona, najstarijeg brata, i njegove supruge Kate čiju su ljubavnu priču mogli pratiti u drugoj sezoni. Ovaj par zbog svoje je priče brzo postao voljen, a još neki romantični trenuci dodatno će privući gledatelje malim ekranima.\r\n', 'serije', 0, 'bridgerton.jpg', '2024-06-13 18:59:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
