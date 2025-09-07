CREATE TABLE IF NOT EXISTS accounts (
    id VARCHAR(255) NOT NULL PRIMARY KEY COMMENT 'primary key',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
    name VARCHAR(255) COMMENT 'User Name',
    email VARCHAR(255) UNIQUE COMMENT 'User Email',
    picture VARCHAR(255) COMMENT 'User Picture'
) default charset utf8mb4 COMMENT '';

-- 3 Highest level Sorcers
SELECT
    id,
    name,
    class,
    guildId,
    level,
    emoji
FROM heroes
WHERE
    class = 'sorcerer'
ORDER BY level DESC
LIMIT 3;

-- Heroes, guild, class Joined
SELECT
    name,
    class,
    emoji,
    guildName,
    skills
FROM heroes
    JOIN guilds ON guilds.id = heroes.guildId
    JOIN classes ON classes.type = heroes.class
ORDER BY name;

SELECT * FROM heroes

SELECT * From classes

SELECT * FROM guilds

SELECT * FROM quests

-- Member Count
SELECT guildName, banner, COUNT(heroes.id) AS memberCount
FROM guilds
    JOIN heroes ON heroes.guildId = guilds.id
GROUP BY
    guilds.id;

-- Reward Sum
SELECT guildName, banner, SUM(quests.reward) AS rewardSum
FROM guilds
    JOIN quests ON quests.completedById = guilds.id
GROUP BY
    guilds.id
ORDER BY rewardSum DESC