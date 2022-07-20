create table if not exists data
(
    date       datetime   null,
    temp       double     null,
    humidity   double     null,
    pir        tinyint(1) null,
    flex       int        null,
    ultrasonic int        null
);