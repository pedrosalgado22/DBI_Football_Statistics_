/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     16/11/2025 19:30:11                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ACTIONS') and o.name = 'FK_ACTIONS_HAPPENED__LINEUPS')
alter table ACTIONS
   drop constraint FK_ACTIONS_HAPPENED__LINEUPS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CITIES') and o.name = 'FK_CITIES_CITIES_OF_COUNTRIE')
alter table CITIES
   drop constraint FK_CITIES_CITIES_OF_COUNTRIE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLUBMANAGER') and o.name = 'FK_CLUBMANA_CLUB_OF_M_CLUBS')
alter table CLUBMANAGER
   drop constraint FK_CLUBMANA_CLUB_OF_M_CLUBS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLUBMANAGER') and o.name = 'FK_CLUBMANA_MANAGER_O_MANAGERS')
alter table CLUBMANAGER
   drop constraint FK_CLUBMANA_MANAGER_O_MANAGERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLUBS') and o.name = 'FK_CLUBS_ACTUAL_MA_MANAGERS')
alter table CLUBS
   drop constraint FK_CLUBS_ACTUAL_MA_MANAGERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CLUBS') and o.name = 'FK_CLUBS_CITY_OF_O_CITIES')
alter table CLUBS
   drop constraint FK_CLUBS_CITY_OF_O_CITIES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LINEUPS') and o.name = 'FK_LINEUPS_LINEUP_CL_CLUBS')
alter table LINEUPS
   drop constraint FK_LINEUPS_LINEUP_CL_CLUBS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LINEUPS') and o.name = 'FK_LINEUPS_LINEUP_MA_MATCHES')
alter table LINEUPS
   drop constraint FK_LINEUPS_LINEUP_MA_MATCHES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('LINEUPS') and o.name = 'FK_LINEUPS_LINEUP_PL_PLAYERS')
alter table LINEUPS
   drop constraint FK_LINEUPS_LINEUP_PL_PLAYERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MANAGERS') and o.name = 'FK_MANAGERS_NATIONALI_COUNTRIE')
alter table MANAGERS
   drop constraint FK_MANAGERS_NATIONALI_COUNTRIE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATCHES') and o.name = 'FK_MATCHES_AWAY_CLUB_CLUBS')
alter table MATCHES
   drop constraint FK_MATCHES_AWAY_CLUB_CLUBS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATCHES') and o.name = 'FK_MATCHES_CITIES_MA_CITIES')
alter table MATCHES
   drop constraint FK_MATCHES_CITIES_MA_CITIES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATCHES') and o.name = 'FK_MATCHES_HOME_CLUB_CLUBS')
alter table MATCHES
   drop constraint FK_MATCHES_HOME_CLUB_CLUBS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('MATCHES') and o.name = 'FK_MATCHES_OCCUR_IN_SEASONS')
alter table MATCHES
   drop constraint FK_MATCHES_OCCUR_IN_SEASONS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PARTICIPATION') and o.name = 'FK_PARTICIP_CLUB_THAT_CLUBS')
alter table PARTICIPATION
   drop constraint FK_PARTICIP_CLUB_THAT_CLUBS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PARTICIPATION') and o.name = 'FK_PARTICIP_PARTICIPA_SEASONS')
alter table PARTICIPATION
   drop constraint FK_PARTICIP_PARTICIPA_SEASONS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PLAYERS') and o.name = 'FK_PLAYERS_ADOPTED_C_COUNTRIE')
alter table PLAYERS
   drop constraint FK_PLAYERS_ADOPTED_C_COUNTRIE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PLAYERS') and o.name = 'FK_PLAYERS_COUNTRY_O_COUNTRIE')
alter table PLAYERS
   drop constraint FK_PLAYERS_COUNTRY_O_COUNTRIE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PLAYER_MATCH_STATS') and o.name = 'FK_PLAYER_M_STATS_LINEUPS')
alter table PLAYER_MATCH_STATS
   drop constraint FK_PLAYER_M_STATS_LINEUPS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SEASONS') and o.name = 'FK_SEASONS_IS_DIVIDE_COMPETIT')
alter table SEASONS
   drop constraint FK_SEASONS_IS_DIVIDE_COMPETIT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TAKES_PLACE_IN') and o.name = 'FK_TAKES_PL_TAKES_PLA_COUNTRIE')
alter table TAKES_PLACE_IN
   drop constraint FK_TAKES_PL_TAKES_PLA_COUNTRIE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TAKES_PLACE_IN') and o.name = 'FK_TAKES_PL_TAKES_PLA_COMPETIT')
alter table TAKES_PLACE_IN
   drop constraint FK_TAKES_PL_TAKES_PLA_COMPETIT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSFERS') and o.name = 'FK_TRANSFER_FROM_CLUB_CLUBS')
alter table TRANSFERS
   drop constraint FK_TRANSFER_FROM_CLUB_CLUBS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSFERS') and o.name = 'FK_TRANSFER_TO_CLUB_CLUBS')
alter table TRANSFERS
   drop constraint FK_TRANSFER_TO_CLUB_CLUBS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSFERS') and o.name = 'FK_TRANSFER_TRANSFERE_PLAYERS')
alter table TRANSFERS
   drop constraint FK_TRANSFER_TRANSFERE_PLAYERS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ACTIONS')
            and   name  = 'HAPPENED_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index ACTIONS.HAPPENED_IN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ACTIONS')
            and   type = 'U')
   drop table ACTIONS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CITIES')
            and   name  = 'CITIES_OF_FK'
            and   indid > 0
            and   indid < 255)
   drop index CITIES.CITIES_OF_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CITIES')
            and   type = 'U')
   drop table CITIES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLUBMANAGER')
            and   name  = 'CLUB_OF_MANAGER_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLUBMANAGER.CLUB_OF_MANAGER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLUBMANAGER')
            and   name  = 'MANAGER_OF_CLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLUBMANAGER.MANAGER_OF_CLUB_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLUBMANAGER')
            and   type = 'U')
   drop table CLUBMANAGER
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLUBS')
            and   name  = 'ACTUAL_MANAGER_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLUBS.ACTUAL_MANAGER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CLUBS')
            and   name  = 'CITY_OF_ORIGIN_FK'
            and   indid > 0
            and   indid < 255)
   drop index CLUBS.CITY_OF_ORIGIN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLUBS')
            and   type = 'U')
   drop table CLUBS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COMPETITIONS')
            and   type = 'U')
   drop table COMPETITIONS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('COUNTRIES')
            and   type = 'U')
   drop table COUNTRIES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LINEUPS')
            and   name  = 'LINEUP_MATCH_FK'
            and   indid > 0
            and   indid < 255)
   drop index LINEUPS.LINEUP_MATCH_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LINEUPS')
            and   name  = 'LINEUP_CLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index LINEUPS.LINEUP_CLUB_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('LINEUPS')
            and   name  = 'LINEUP_PLAYER_FK'
            and   indid > 0
            and   indid < 255)
   drop index LINEUPS.LINEUP_PLAYER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LINEUPS')
            and   type = 'U')
   drop table LINEUPS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MANAGERS')
            and   name  = 'NATIONALITY_FK'
            and   indid > 0
            and   indid < 255)
   drop index MANAGERS.NATIONALITY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MANAGERS')
            and   type = 'U')
   drop table MANAGERS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATCHES')
            and   name  = 'CITIES_MATCH_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATCHES.CITIES_MATCH_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATCHES')
            and   name  = 'OCCUR_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATCHES.OCCUR_IN_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATCHES')
            and   name  = 'HOME_CLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATCHES.HOME_CLUB_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('MATCHES')
            and   name  = 'AWAY_CLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index MATCHES.AWAY_CLUB_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MATCHES')
            and   type = 'U')
   drop table MATCHES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARTICIPATION')
            and   name  = 'PARTICIPATE_IN_SEASON_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARTICIPATION.PARTICIPATE_IN_SEASON_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PARTICIPATION')
            and   name  = 'CLUB_THAT_PARTICIPATE_FK'
            and   indid > 0
            and   indid < 255)
   drop index PARTICIPATION.CLUB_THAT_PARTICIPATE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PARTICIPATION')
            and   type = 'U')
   drop table PARTICIPATION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PLAYERS')
            and   name  = 'ADOPTED_COUNTRY_FK'
            and   indid > 0
            and   indid < 255)
   drop index PLAYERS.ADOPTED_COUNTRY_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PLAYERS')
            and   name  = 'COUNTRY_OF_BIRTH_FK'
            and   indid > 0
            and   indid < 255)
   drop index PLAYERS.COUNTRY_OF_BIRTH_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PLAYERS')
            and   type = 'U')
   drop table PLAYERS
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PLAYER_MATCH_STATS')
            and   type = 'U')
   drop table PLAYER_MATCH_STATS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SEASONS')
            and   name  = 'IS_DIVIDED_INTO_FK'
            and   indid > 0
            and   indid < 255)
   drop index SEASONS.IS_DIVIDED_INTO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SEASONS')
            and   type = 'U')
   drop table SEASONS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TAKES_PLACE_IN')
            and   name  = 'TAKES_PLACE_IN2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TAKES_PLACE_IN.TAKES_PLACE_IN2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TAKES_PLACE_IN')
            and   name  = 'TAKES_PLACE_IN_FK'
            and   indid > 0
            and   indid < 255)
   drop index TAKES_PLACE_IN.TAKES_PLACE_IN_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TAKES_PLACE_IN')
            and   type = 'U')
   drop table TAKES_PLACE_IN
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSFERS')
            and   name  = 'TO_CLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSFERS.TO_CLUB_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSFERS')
            and   name  = 'FROM_CLUB_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSFERS.FROM_CLUB_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSFERS')
            and   name  = 'TRANSFERED_PLAYER_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSFERS.TRANSFERED_PLAYER_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRANSFERS')
            and   type = 'U')
   drop table TRANSFERS
go

/*==============================================================*/
/* Table: ACTIONS                                               */
/*==============================================================*/
create table ACTIONS (
   ACTIONID             numeric              identity,
   PLAYERID             numeric              not null,
   CLUBID               numeric              not null,
   MATCHID              numeric              not null,
   MINUTE               float                not null,
   TYPE_OF_ACTION       varchar(30)          not null
      constraint CKC_TYPE_OF_ACTION_ACTIONS check (TYPE_OF_ACTION in ('Goal','Assist','Enter into match','Exit from match','Received Yellow Card','Received Red Card','Pass done','Shot on target','Shot off target')),
   MATCHPART            varchar(30)          not null
      constraint CKC_MATCHPART_ACTIONS check (MATCHPART in ('First Half','Second Half','Extra Time First Half','Extra Time Second Half','Penalties')),
   constraint PK_ACTIONS primary key nonclustered (ACTIONID)
)
go

/*==============================================================*/
/* Index: HAPPENED_IN_FK                                        */
/*==============================================================*/
create index HAPPENED_IN_FK on ACTIONS (
PLAYERID ASC,
CLUBID ASC,
MATCHID ASC
)
go

/*==============================================================*/
/* Table: CITIES                                                */
/*==============================================================*/
create table CITIES (
   COUNTRYCODE          char(3)              not null,
   CITYID               numeric              identity,
   CITYNAME             varchar(50)          not null,
   constraint PK_CITIES primary key nonclustered (COUNTRYCODE, CITYID)
)
go

/*==============================================================*/
/* Index: CITIES_OF_FK                                          */
/*==============================================================*/
create index CITIES_OF_FK on CITIES (
COUNTRYCODE ASC
)
go

/*==============================================================*/
/* Table: CLUBMANAGER                                           */
/*==============================================================*/
create table CLUBMANAGER (
   ID                   numeric              identity,
   MANAGERID            numeric              not null,
   CLUBID               numeric              not null,
   STARTDATE            datetime             not null,
   ENDDATE              datetime             not null,
   constraint PK_CLUBMANAGER primary key nonclustered (ID)
)
go

/*==============================================================*/
/* Index: MANAGER_OF_CLUB_FK                                    */
/*==============================================================*/
create index MANAGER_OF_CLUB_FK on CLUBMANAGER (
MANAGERID ASC
)
go

/*==============================================================*/
/* Index: CLUB_OF_MANAGER_FK                                    */
/*==============================================================*/
create index CLUB_OF_MANAGER_FK on CLUBMANAGER (
CLUBID ASC
)
go

/*==============================================================*/
/* Table: CLUBS                                                 */
/*==============================================================*/
create table CLUBS (
   CLUBID               numeric              identity,
   MANAGERID            numeric              null,
   COUNTRYCODE          char(3)              not null,
   CITYID               numeric              not null,
   NAME                 varchar(50)          not null,
   YEARFOUNDED          datetime             null,
   constraint PK_CLUBS primary key nonclustered (CLUBID)
)
go

/*==============================================================*/
/* Index: CITY_OF_ORIGIN_FK                                     */
/*==============================================================*/
create index CITY_OF_ORIGIN_FK on CLUBS (
COUNTRYCODE ASC,
CITYID ASC
)
go

/*==============================================================*/
/* Index: ACTUAL_MANAGER_FK                                     */
/*==============================================================*/
create index ACTUAL_MANAGER_FK on CLUBS (
MANAGERID ASC
)
go

/*==============================================================*/
/* Table: COMPETITIONS                                          */
/*==============================================================*/
create table COMPETITIONS (
   COMPETITIONID        numeric              identity,
   NAME                 varchar(50)          not null,
   TYPE                 varchar(50)          not null
      constraint CKC_TYPE_COMPETIT check (TYPE in ('League','Cup','International Competition')),
   constraint PK_COMPETITIONS primary key nonclustered (COMPETITIONID)
)
go

/*==============================================================*/
/* Table: COUNTRIES                                             */
/*==============================================================*/
create table COUNTRIES (
   COUNTRYCODE          char(3)              not null,
   NAME                 varchar(50)          not null,
   constraint PK_COUNTRIES primary key nonclustered (COUNTRYCODE)
)
go

/*==============================================================*/
/* Table: LINEUPS                                               */
/*==============================================================*/
create table LINEUPS (
   PLAYERID             numeric              not null,
   CLUBID               numeric              not null,
   MATCHID              numeric              not null,
   POSITION             varchar(30)          not null
      constraint CKC_POSITION_LINEUPS check (POSITION in ('Goalkeeper','Right Defender','Central Right','Central','Central Left','Left Defender','Right Midfielder','Central Right Midfielder','Central Midfielder','Central Left Midfielder','Left Midfielder','Right Offense','Central Right Ofense','Central Ofense','Central Left Ofense','Left Ofense')),
   STARTER              bit                  not null,
   constraint PK_LINEUPS primary key (PLAYERID, CLUBID, MATCHID)
)
go

/*==============================================================*/
/* Index: LINEUP_PLAYER_FK                                      */
/*==============================================================*/
create index LINEUP_PLAYER_FK on LINEUPS (
PLAYERID ASC
)
go

/*==============================================================*/
/* Index: LINEUP_CLUB_FK                                        */
/*==============================================================*/
create index LINEUP_CLUB_FK on LINEUPS (
CLUBID ASC
)
go

/*==============================================================*/
/* Index: LINEUP_MATCH_FK                                       */
/*==============================================================*/
create index LINEUP_MATCH_FK on LINEUPS (
MATCHID ASC
)
go

/*==============================================================*/
/* Table: MANAGERS                                              */
/*==============================================================*/
create table MANAGERS (
   MANAGERID            numeric              identity,
   COUNTRYCODE          char(3)              not null,
   NAME                 varchar(50)          not null,
   DATE_OF_BIRTH        datetime             null,
   constraint PK_MANAGERS primary key nonclustered (MANAGERID)
)
go

/*==============================================================*/
/* Index: NATIONALITY_FK                                        */
/*==============================================================*/
create index NATIONALITY_FK on MANAGERS (
COUNTRYCODE ASC
)
go

/*==============================================================*/
/* Table: MATCHES                                               */
/*==============================================================*/
create table MATCHES (
   MATCHID              numeric              identity,
   HOMECLUB             numeric              not null,
   AWAYCLUB             numeric              not null,
   COMPETITIONID        numeric              not null,
   SEASONID             numeric              not null,
   COUNTRYCODE          char(3)              not null,
   CITYID               numeric              not null,
   MATCHDAY             smallint             not null,
   DATEOFMATCH          datetime             not null,
   ATTENDANCE           int                  null,
   TOTALMINUTES         smallint             null,
   constraint PK_MATCHES primary key nonclustered (MATCHID)
)
go

/*==============================================================*/
/* Index: AWAY_CLUB_FK                                          */
/*==============================================================*/
create index AWAY_CLUB_FK on MATCHES (
AWAYCLUB ASC
)
go

/*==============================================================*/
/* Index: HOME_CLUB_FK                                          */
/*==============================================================*/
create index HOME_CLUB_FK on MATCHES (
HOMECLUB ASC
)
go

/*==============================================================*/
/* Index: OCCUR_IN_FK                                           */
/*==============================================================*/
create index OCCUR_IN_FK on MATCHES (
COMPETITIONID ASC,
SEASONID ASC
)
go

/*==============================================================*/
/* Index: CITIES_MATCH_FK                                       */
/*==============================================================*/
create index CITIES_MATCH_FK on MATCHES (
COUNTRYCODE ASC,
CITYID ASC
)
go

/*==============================================================*/
/* Table: PARTICIPATION                                         */
/*==============================================================*/
create table PARTICIPATION (
   CLUBID               numeric              not null,
   COMPETITIONID        numeric              not null,
   SEASONID             numeric              not null,
   WON                  bit                  not null,
   constraint PK_PARTICIPATION primary key (COMPETITIONID, CLUBID, SEASONID)
)
go

/*==============================================================*/
/* Index: CLUB_THAT_PARTICIPATE_FK                              */
/*==============================================================*/
create index CLUB_THAT_PARTICIPATE_FK on PARTICIPATION (
CLUBID ASC
)
go

/*==============================================================*/
/* Index: PARTICIPATE_IN_SEASON_FK                              */
/*==============================================================*/
create index PARTICIPATE_IN_SEASON_FK on PARTICIPATION (
COMPETITIONID ASC,
SEASONID ASC
)
go

/*==============================================================*/
/* Table: PLAYERS                                               */
/*==============================================================*/
create table PLAYERS (
   PLAYERID             numeric              identity,
   ADOPTEDCOUNTRY       char(3)              null,
   BIRTHCOUNTRY         char(3)              not null,
   NAME                 varchar(50)          not null,
   DATE_OF_BIRTH        datetime             null,
   WEIGHT__KG_          smallint             null,
   HEIGHT__CM_          smallint             null,
   CURRENT_MARKET_VALUE money                null,
   constraint PK_PLAYERS primary key nonclustered (PLAYERID)
)
go

/*==============================================================*/
/* Index: COUNTRY_OF_BIRTH_FK                                   */
/*==============================================================*/
create index COUNTRY_OF_BIRTH_FK on PLAYERS (
BIRTHCOUNTRY ASC
)
go

/*==============================================================*/
/* Index: ADOPTED_COUNTRY_FK                                    */
/*==============================================================*/
create index ADOPTED_COUNTRY_FK on PLAYERS (
ADOPTEDCOUNTRY ASC
)
go

/*==============================================================*/
/* Table: PLAYER_MATCH_STATS                                    */
/*==============================================================*/
create table PLAYER_MATCH_STATS (
   PLAYERID             numeric              not null,
   CLUBID               numeric              not null,
   MATCHID              numeric              not null,
   GOALSSCORED          smallint             null,
   MINUTESPLAYED        smallint             null,
   PASSESCOMPLETED      smallint             null,
   SHOTSONTARGET        smallint             null,
   constraint PK_PLAYER_MATCH_STATS primary key (PLAYERID, CLUBID, MATCHID)
)
go

/*==============================================================*/
/* Table: SEASONS                                               */
/*==============================================================*/
create table SEASONS (
   COMPETITIONID        numeric              not null,
   SEASONID             numeric              identity,
   STARTDATE            datetime             not null,
   ENDDATE              datetime             not null,
   constraint PK_SEASONS primary key nonclustered (COMPETITIONID, SEASONID)
)
go

/*==============================================================*/
/* Index: IS_DIVIDED_INTO_FK                                    */
/*==============================================================*/
create index IS_DIVIDED_INTO_FK on SEASONS (
COMPETITIONID ASC
)
go

/*==============================================================*/
/* Table: TAKES_PLACE_IN                                        */
/*==============================================================*/
create table TAKES_PLACE_IN (
   COUNTRYCODE          char(3)              not null,
   COMPETITIONID        numeric              not null,
   constraint PK_TAKES_PLACE_IN primary key (COUNTRYCODE, COMPETITIONID)
)
go

/*==============================================================*/
/* Index: TAKES_PLACE_IN_FK                                     */
/*==============================================================*/
create index TAKES_PLACE_IN_FK on TAKES_PLACE_IN (
COUNTRYCODE ASC
)
go

/*==============================================================*/
/* Index: TAKES_PLACE_IN2_FK                                    */
/*==============================================================*/
create index TAKES_PLACE_IN2_FK on TAKES_PLACE_IN (
COMPETITIONID ASC
)
go

/*==============================================================*/
/* Table: TRANSFERS                                             */
/*==============================================================*/
create table TRANSFERS (
   TRANSFERID           numeric              identity,
   PLAYERID             numeric              not null,
   TOCLUB               numeric              not null,
   FROMCLUB             numeric              not null,
   TRANSFERDATE         datetime             not null,
   FEE                  money                null,
   CONTRACTLENGHT       smallint             null,
   constraint PK_TRANSFERS primary key nonclustered (TRANSFERID)
)
go

/*==============================================================*/
/* Index: TRANSFERED_PLAYER_FK                                  */
/*==============================================================*/
create index TRANSFERED_PLAYER_FK on TRANSFERS (
PLAYERID ASC
)
go

/*==============================================================*/
/* Index: FROM_CLUB_FK                                          */
/*==============================================================*/
create index FROM_CLUB_FK on TRANSFERS (
FROMCLUB ASC
)
go

/*==============================================================*/
/* Index: TO_CLUB_FK                                            */
/*==============================================================*/
create index TO_CLUB_FK on TRANSFERS (
TOCLUB ASC
)
go

alter table ACTIONS
   add constraint FK_ACTIONS_HAPPENED__LINEUPS foreign key (PLAYERID, CLUBID, MATCHID)
      references LINEUPS (PLAYERID, CLUBID, MATCHID)
go

alter table CITIES
   add constraint FK_CITIES_CITIES_OF_COUNTRIE foreign key (COUNTRYCODE)
      references COUNTRIES (COUNTRYCODE)
go

alter table CLUBMANAGER
   add constraint FK_CLUBMANA_CLUB_OF_M_CLUBS foreign key (CLUBID)
      references CLUBS (CLUBID)
go

alter table CLUBMANAGER
   add constraint FK_CLUBMANA_MANAGER_O_MANAGERS foreign key (MANAGERID)
      references MANAGERS (MANAGERID)
go

alter table CLUBS
   add constraint FK_CLUBS_ACTUAL_MA_MANAGERS foreign key (MANAGERID)
      references MANAGERS (MANAGERID)
go

alter table CLUBS
   add constraint FK_CLUBS_CITY_OF_O_CITIES foreign key (COUNTRYCODE, CITYID)
      references CITIES (COUNTRYCODE, CITYID)
go

alter table LINEUPS
   add constraint FK_LINEUPS_LINEUP_CL_CLUBS foreign key (CLUBID)
      references CLUBS (CLUBID)
go

alter table LINEUPS
   add constraint FK_LINEUPS_LINEUP_MA_MATCHES foreign key (MATCHID)
      references MATCHES (MATCHID)
go

alter table LINEUPS
   add constraint FK_LINEUPS_LINEUP_PL_PLAYERS foreign key (PLAYERID)
      references PLAYERS (PLAYERID)
go

alter table MANAGERS
   add constraint FK_MANAGERS_NATIONALI_COUNTRIE foreign key (COUNTRYCODE)
      references COUNTRIES (COUNTRYCODE)
go

alter table MATCHES
   add constraint FK_MATCHES_AWAY_CLUB_CLUBS foreign key (AWAYCLUB)
      references CLUBS (CLUBID)
go

alter table MATCHES
   add constraint FK_MATCHES_CITIES_MA_CITIES foreign key (COUNTRYCODE, CITYID)
      references CITIES (COUNTRYCODE, CITYID)
go

alter table MATCHES
   add constraint FK_MATCHES_HOME_CLUB_CLUBS foreign key (HOMECLUB)
      references CLUBS (CLUBID)
go

alter table MATCHES
   add constraint FK_MATCHES_OCCUR_IN_SEASONS foreign key (COMPETITIONID, SEASONID)
      references SEASONS (COMPETITIONID, SEASONID)
go

alter table PARTICIPATION
   add constraint FK_PARTICIP_CLUB_THAT_CLUBS foreign key (CLUBID)
      references CLUBS (CLUBID)
go

alter table PARTICIPATION
   add constraint FK_PARTICIP_PARTICIPA_SEASONS foreign key (COMPETITIONID, SEASONID)
      references SEASONS (COMPETITIONID, SEASONID)
go

alter table PLAYERS
   add constraint FK_PLAYERS_ADOPTED_C_COUNTRIE foreign key (ADOPTEDCOUNTRY)
      references COUNTRIES (COUNTRYCODE)
go

alter table PLAYERS
   add constraint FK_PLAYERS_COUNTRY_O_COUNTRIE foreign key (BIRTHCOUNTRY)
      references COUNTRIES (COUNTRYCODE)
go

alter table PLAYER_MATCH_STATS
   add constraint FK_PLAYER_M_STATS_LINEUPS foreign key (PLAYERID, CLUBID, MATCHID)
      references LINEUPS (PLAYERID, CLUBID, MATCHID)
go

alter table SEASONS
   add constraint FK_SEASONS_IS_DIVIDE_COMPETIT foreign key (COMPETITIONID)
      references COMPETITIONS (COMPETITIONID)
go

alter table TAKES_PLACE_IN
   add constraint FK_TAKES_PL_TAKES_PLA_COUNTRIE foreign key (COUNTRYCODE)
      references COUNTRIES (COUNTRYCODE)
go

alter table TAKES_PLACE_IN
   add constraint FK_TAKES_PL_TAKES_PLA_COMPETIT foreign key (COMPETITIONID)
      references COMPETITIONS (COMPETITIONID)
go

alter table TRANSFERS
   add constraint FK_TRANSFER_FROM_CLUB_CLUBS foreign key (FROMCLUB)
      references CLUBS (CLUBID)
go

alter table TRANSFERS
   add constraint FK_TRANSFER_TO_CLUB_CLUBS foreign key (TOCLUB)
      references CLUBS (CLUBID)
go

alter table TRANSFERS
   add constraint FK_TRANSFER_TRANSFERE_PLAYERS foreign key (PLAYERID)
      references PLAYERS (PLAYERID)
go

