# Football Statistics Database

A relational database system designed to store and manage detailed information about football competitions, clubs, players, matches and statistics. Built in two phases — data modelling first, followed by the implementation of integrity and business rules through triggers, views, functions and stored procedures.

**Course:** Databases I / Databases 2025/2026 — Nova IMS, Universidade Nova de Lisboa  
**Author:** Pedro Salgado

---

## Repository Contents

1. `Create_FootballStatistics.sql` — DDL script to create the database schema in Microsoft SQL Server
2. `Finalsolution.sql` — full implementation of Part II: views, functions, triggers and stored procedures
3. `Football Statistics Project Solution - Conceptual.cdm` — Entity-Relationship model developed in PowerDesigner
4. `Football Statistics Project Solution - Physical.pdm` — Physical relational model developed in PowerDesigner
5. `Final Project - Part I.pdf` — Part I guidelines
6. `projectguidelines.pdf` — Part II guidelines
7. `teachersannotations` — teacher's improvement suggestions

---

## Project Overview

### Part I — Data Modelling

Design of a football statistics database covering competitions, seasons, clubs, managers, players, transfers, matches, lineups, actions and player match statistics. Deliverables included the conceptual and physical data models in PowerDesigner and the DDL script to instantiate the schema in Microsoft SQL Server.

### Part II — Business Rules and Database Objects

Implementation of integrity and business rules using triggers, complemented by views, functions and stored procedures. All objects are in `Finalsolution.sql`. This includes a view listing each player's current club derived from the transfers table (`Player_Actual_Club`), a table-valued function returning a player's full transfer history (`FN_PlayerClubHistory`), three triggers keeping the actual manager field in `Clubs` consistent with the `ClubManager` table at all times while blocking direct user updates, an `INSTEAD OF` trigger on `Lineups` validating player-club-match consistency on insert and update with partial batch commit support, and a stored procedure populating `Player_Match_Stats` for all finished matches with correctly calculated minutes played, goals, passes and shots on target.

---

## Tech Stack

| Tool | Purpose |
|---|---|
| Microsoft SQL Server | Database engine |
| PowerDesigner | Conceptual and physical data modelling |
| SQL Server Management Studio | Query execution and testing |
| Claude Sonnet 4.6 / Opus 4.6 (Anthropic) | Development assistance |

---

*Nova IMS — Universidade Nova de Lisboa | Databases 2025/2026*
