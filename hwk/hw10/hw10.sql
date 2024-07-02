CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child FROM parents as par,dogs AS dog WHERE par.parent=dog.name order by -dog.height;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name as name ,s.size as size FROM dogs AS d,sizes AS s 
    WHERE d.height<=s.max AND d.height>s.min;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT MIN(a.child,b.child) as dog1 ,MAX(a.child,b.child) as dog2 , szd1.size as dogsize
    FROM parents AS a,parents AS b ,size_of_dogs AS szd1,size_of_dogs AS szd2
     WHERE a.parent = b.parent AND a.child <> b.child AND a.child=szd1.name and b.child=szd2.name and szd1.size=szd2.size
     group by MIN(a.child,b.child) ;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || dog1 || " and " || dog2 || ", have the same size: " || dogsize FROM siblings;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur ,MAX(height)-MIN(height) FROM dogs
    GROUP BY fur 
    having MIN(height)>=AVG(height)*0.7 AND MAX(height)<=AVG(height)*1.3;


