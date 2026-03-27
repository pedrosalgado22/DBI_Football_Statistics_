-- TRABALHO DE BASE DE DADOS 21 de Dezembro de 2025

/* 
USE footballstatistics 
GO
*/
-- QUESTION ONE
GO
CREATE OR ALTER VIEW Player_Actual_Club
AS
SELECT
    P.PLAYERID,
    P.NAME AS PlayerName,
    C.CLUBID,
    C.NAME AS ClubName,
    T.TRANSFERDATE
FROM PLAYERS AS P
INNER JOIN TRANSFERS AS T
    ON T.TRANSFERID = (
        SELECT TOP 1 T2.TRANSFERID
        FROM TRANSFERS AS T2
        WHERE T2.PLAYERID = P.PLAYERID
          AND GETDATE() BETWEEN T2.TRANSFERDATE
              AND DATEADD(YEAR, T2.CONTRACTLENGHT, T2.TRANSFERDATE)
        ORDER BY T2.TRANSFERDATE DESC
    )
INNER JOIN CLUBS AS C
    ON C.CLUBID = T.TOCLUB;
GO
-- this creates the view requested in the guidelines
-- lists all players in the database using the transfers and players tables
-- specifically, it only lists players with transfer records.
-- since according to the guidelines all players have ONE transfer record at least with fromclub = toclub
-- not needed to cover with lineups for example 
-- "The first contract of a player is represented by a transfer where FromClub = ToClub"


-- QUESTION TWO
GO
CREATE OR ALTER FUNCTION FN_PLAYERCLUBHISTORY (@PLAYERID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT  
        T.TOCLUB       AS CLUBID,
        C.NAME         AS CLUBNAME,
        T.TRANSFERDATE AS CONTRACTSTART,
        DATEADD(YEAR, T.CONTRACTLENGHT, T.TRANSFERDATE) AS CONTRACTEND -- contractend = transferdate + c.length (years)
    FROM TRANSFERS AS T
    INNER JOIN CLUBS AS C 
        ON T.TOCLUB = C.CLUBID
    WHERE T.PLAYERID = @PLAYERID
);
GO

-- since the guidelines specify transfers
-- "a player was associated with (by a transfer)" 
-- no need to fix overlapping contract as according to the teacher
-- "we'll assume there is no overlapping in data", as per the teacher
-- table returned includes clubid,contractstart,contractend as requested


-- QUESTION THREE 

-- a) and d) 
-- Both request a) and d) want the same thing, a change in ClubManager should trigger an automatic defined response in CLUBS
-- Except a) is for insert/update and to update club manager
-- and d) is for delete and thus automatically delete club manager
-- that is the rasteira here
-- as creating 2 triggers massively overcomplicates things and creates a trigger vicious cycle


GO
CREATE OR ALTER TRIGGER TRG_ClubManager_Sync_All
ON CLUBMANAGER
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Today DATE = CAST(GETDATE() AS DATE);

    -- 1. Identify Affected Clubs (from both Inserted and Deleted tables)
    WITH AffectedClubs AS (
        SELECT CLUBID FROM inserted
        WHERE CLUBID IS NOT NULL
        UNION 
        SELECT CLUBID FROM deleted
        WHERE CLUBID IS NOT NULL
    )
    -- 2. Update CLUBS table
    UPDATE C
    SET C.MANAGERID = NewMgr.MANAGERID
    FROM CLUBS C
    INNER JOIN AffectedClubs AC ON C.CLUBID = AC.CLUBID
    -- 3. Recalculate Actual Manager (Matches 3a and 3d logic)
    OUTER APPLY (
        SELECT TOP 1 CM.MANAGERID
        FROM CLUBMANAGER CM
        WHERE CM.CLUBID = AC.CLUBID
          AND @Today BETWEEN CM.STARTDATE AND CM.ENDDATE
        ORDER BY 
            -- Priority to the row currently being touched (if Insert/Update)
            CASE WHEN CM.ID IN (SELECT ID FROM inserted) THEN 0 ELSE 1 END ASC,
            -- Then by most recent start date
            CM.STARTDATE DESC
    ) NewMgr
    
    -- Update only if value changes
    WHERE ISNULL(C.MANAGERID, -1) <> ISNULL(NewMgr.MANAGERID, -1);
END;
GO


-- Passed tests


-- b)
CREATE OR ALTER TRIGGER TRG_Clubs_ForceManagerNull
ON CLUBS
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
UPDATE CLUBS
SET MANAGERID = NULL
WHERE CLUBID IN (SELECT CLUBID FROM inserted);
END;
GO
-- PASSED TESTS; EVEN IN BATCH INSERTS, MANAGERID IS EMPTY


-- c)
CREATE OR ALTER TRIGGER TRG_CLUBS_BLOCKMANAGERUPDATE
ON CLUBS
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- allow trigger updates (3a and 3d)
    IF TRIGGER_NESTLEVEL() > 1
    BEGIN
        UPDATE C
        SET
            C.NAME = I.NAME,
            C.YEARFOUNDED = I.YEARFOUNDED,
            C.MANAGERID = I.MANAGERID,     -- USE INSERTED AS-IS
            C.COUNTRYCODE = I.COUNTRYCODE,
            C.CITYID = I.CITYID
        FROM CLUBS C
        JOIN INSERTED I ON C.CLUBID = I.CLUBID;

        RETURN;
    END;

    -- block user updates to MANAGERID
    IF UPDATE(MANAGERID)
    BEGIN
        IF EXISTS (
            SELECT 1 FROM INSERTED I
            JOIN DELETED D ON I.CLUBID = D.CLUBID
            WHERE ISNULL(I.MANAGERID,-1) <> ISNULL(D.MANAGERID,-1)
        )
        BEGIN
            RAISERROR('Direct update of MANAGERID is not allowed.',16,1);

            UPDATE C
            SET
                C.NAME = I.NAME,
                C.YEARFOUNDED = I.YEARFOUNDED,
                C.COUNTRYCODE = I.COUNTRYCODE,
                C.CITYID = I.CITYID
            FROM CLUBS C
            JOIN INSERTED I ON C.CLUBID = I.CLUBID;

            RETURN;
        END
    END

    -- normal user updates
    UPDATE C
    SET
        C.NAME = I.NAME,
        C.YEARFOUNDED = I.YEARFOUNDED,
        C.MANAGERID = I.MANAGERID,
        C.COUNTRYCODE = I.COUNTRYCODE,
        C.CITYID = I.CITYID
    FROM CLUBS C
    JOIN INSERTED I ON C.CLUBID = I.CLUBID;
END;
GO


-- IF MANAGERID IS CHANGED, THAT DOES NOT GO THROUGH. IF MANAGERID IS THE SAME IN ANY UPDATE, UPDATE GOES THROUGH
-- IF MANAGERID CHANGED IN AN UPDATE IN A DIFFERENT ROW TO DIFFERENT CLUB COLUMNS, ALL CHANGES BUT MANAGER ID GO THROUGH

-- QUESTION FOUR
CREATE OR ALTER TRIGGER TRG_Lineups_Validate
ON LINEUPS
INSTEAD OF INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Filter the batch for VALID rows only
    WITH ValidRows AS (
        SELECT I.PLAYERID, I.CLUBID, I.MATCHID, I.POSITION, I.STARTER
        FROM inserted AS I
        JOIN MATCHES AS M ON M.MATCHID = I.MATCHID
        WHERE 
            -- Rule A says Club must be playing in the match
            I.CLUBID IN (M.HOMECLUB, M.AWAYCLUB)
            
            -- Rule B says Player must have a valid contract covering the match date
            AND EXISTS (
                SELECT 1
                FROM TRANSFERS AS T
                WHERE T.PlayerID = I.PlayerID
                  AND T.ToClub = I.ClubID
                  
                  AND M.DateOfMatch BETWEEN T.TransferDate
                                       AND DATEADD(YEAR, T.ContractLenght, T.TransferDate)
            )
    )
    -- MERGE changes into the target table (Handles both Insert and Update)
    MERGE INTO LINEUPS AS Target
    USING ValidRows AS Source
    ON Target.PLAYERID = Source.PLAYERID 
       AND Target.CLUBID = Source.CLUBID 
       AND Target.MATCHID = Source.MATCHID

    -- If row exists, UPDATE it
    WHEN MATCHED THEN
        UPDATE SET 
            Target.POSITION = Source.POSITION,
            Target.STARTER = Source.STARTER

    -- If row does not exist, INSERT it
    WHEN NOT MATCHED THEN
        INSERT (PLAYERID, CLUBID, MATCHID, POSITION, STARTER)
        VALUES (Source.PLAYERID, Source.CLUBID, Source.MATCHID, Source.POSITION, Source.STARTER);

    --  Raise Warning if rows were dropped
    IF (SELECT COUNT(*) FROM inserted) > (@@ROWCOUNT) 
    BEGIN
        RAISERROR('Some LINEUPS rows were rejected. Player-club-match relationship invalid.', 10, 1);
    END
END;
GO
-- we wondered about null contracts but deemed them not needed
-- this does not protect against null contract since all players in lineups have valid contract obviously


--- QUESTION FIVE 
-- Insert for all finished matches (TOTALMINUTES IS NOT NULL)

-- Types are in concordance with database, as in :
 /* TYPE_OF_ACTION = 'Goal'
 TYPE_OF_ACTION = 'Assist'
 TYPE_OF_ACTION = 'Shot on target'
TYPE_OF_ACTION = 'Pass done'
TYPE_OF_ACTION = 'Enter into match'
TYPE_OF_ACTION = 'Shot off target'
TYPE_OF_ACTION = 'Exit from match' */
GO
CREATE OR ALTER PROCEDURE sp_populatematchstats
AS
BEGIN
    SET NOCOUNT ON;

    -- as that it does not hurt the triggers
    DELETE old_g
    FROM dbo.PLAYER_MATCH_STATS AS old_g
    INNER JOIN dbo.MATCHES AS m 
    ON old_g.MATCHID = m.MATCHID
    WHERE m.TOTALMINUTES IS NOT NULL;

    -- to protect against errors if the procedure is ran more than twice
    -- Calculate
    -- There is no specific mention of how actions will be written in the type of action. 
    -- So we'll assume "Goal", "Pass done", "Shot" and are protected for "GOAL" or "goal" as SQL is not case sensitive
    -- As for minutes played and substituion calculation we ll assume the same name as in the tutorial database
    -- "Enter into match" "Exit from match"

    INSERT INTO PLAYER_MATCH_STATS (
        PLAYERID,
        CLUBID,
        MATCHID,
        GOALSSCORED,
        MINUTESPLAYED,
        PASSESCOMPLETED,
        SHOTSONTARGET
    )
    SELECT
        L.PLAYERID,                           -- player in the lineup
        L.CLUBID,                             -- club player represented in the match
        L.MATCHID,                            -- match played
        ISNULL(G.GoalsScored, 0),             -- Number of goals (0 if none)

        -- MINUTES PLAYED (correct substitution logic)
        CASE
            WHEN L.STARTER = 1 THEN
                CASE
                    WHEN XIT.ExitMinute IS NOT NULL THEN XIT.ExitMinute
                    ELSE M.TOTALMINUTES
                END
            ELSE
                CASE
                    WHEN ENT.EnterMinute IS NULL THEN 0
                    WHEN XIT.ExitMinute IS NOT NULL THEN XIT.ExitMinute - ENT.EnterMinute
                    ELSE M.TOTALMINUTES - ENT.EnterMinute
                END
        END,

        ISNULL(P.PassesCompleted, 0),         -- Total passes completed (0 if none)

        -- Total shots on target
        ISNULL(S.ShotsOnTarget, 0) 
    FROM LINEUPS AS L
    INNER JOIN MATCHES AS M
        ON M.MATCHID = L.MATCHID              -- Only use valid match info

    -- Enter minute
    LEFT JOIN (
        SELECT PLAYERID, CLUBID, MATCHID, MIN(MINUTE) AS EnterMinute
        FROM ACTIONS
        WHERE TYPE_OF_ACTION = 'Enter into match'
        GROUP BY PLAYERID, CLUBID, MATCHID
    ) ENT
        ON ENT.PLAYERID = L.PLAYERID
       AND ENT.CLUBID = L.CLUBID
       AND ENT.MATCHID = L.MATCHID

    -- Exit minute
    LEFT JOIN (
        SELECT PLAYERID, CLUBID, MATCHID, MIN(MINUTE) AS ExitMinute
        FROM ACTIONS
        WHERE TYPE_OF_ACTION = 'Exit from match'
        GROUP BY PLAYERID, CLUBID, MATCHID
    ) XIT
        ON XIT.PLAYERID = L.PLAYERID
       AND XIT.CLUBID = L.CLUBID
       AND XIT.MATCHID = L.MATCHID

    LEFT JOIN (
        -- Count goals by player in match
        SELECT PLAYERID, CLUBID, MATCHID, COUNT(*) AS GoalsScored
        FROM ACTIONS
        WHERE TYPE_OF_ACTION = 'Goal'
        GROUP BY PLAYERID, CLUBID, MATCHID
    ) G ON G.PLAYERID = L.PLAYERID
       AND G.CLUBID = L.CLUBID
       AND G.MATCHID = L.MATCHID

    LEFT JOIN (
        -- Count completed passes
        SELECT PLAYERID, CLUBID, MATCHID, COUNT(*) AS PassesCompleted
        FROM ACTIONS
        WHERE TYPE_OF_ACTION = 'Pass done'
        GROUP BY PLAYERID, CLUBID, MATCHID
    ) P ON P.PLAYERID = L.PLAYERID
       AND P.CLUBID = L.CLUBID
       AND P.MATCHID = L.MATCHID

    LEFT JOIN (
        -- Count shots on target
        SELECT PLAYERID, CLUBID, MATCHID, COUNT(*) AS ShotsOnTarget
        FROM ACTIONS
        WHERE TYPE_OF_ACTION = 'Shot on target'
        GROUP BY PLAYERID, CLUBID, MATCHID
    ) S ON S.PLAYERID = L.PLAYERID
       AND S.CLUBID = L.CLUBID
       AND S.MATCHID = L.MATCHID

    WHERE M.TOTALMINUTES IS NOT NULL         -- Only finished matches
      AND NOT EXISTS (
            -- Prevent inserting duplicates
            SELECT 1
            FROM PLAYER_MATCH_STATS AS PX
            WHERE PX.PLAYERID = L.PLAYERID
              AND PX.CLUBID = L.CLUBID
              AND PX.MATCHID = L.MATCHID
      );
END;
GO
