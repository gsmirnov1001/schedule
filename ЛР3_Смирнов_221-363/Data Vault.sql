-- Хабы
CREATE TABLE Hub_Faculty (
    hk_faculty CHAR(32) PRIMARY KEY,
    faculty_bk TEXT NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source TEXT NOT NULL
);

CREATE TABLE Hub_Specialty (
    hk_specialty CHAR(32) PRIMARY KEY,
    specialty_bk TEXT NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source TEXT NOT NULL
);

CREATE TABLE Hub_Group (
    hk_group CHAR(32) PRIMARY KEY,
    group_bk TEXT NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source TEXT NOT NULL
);

CREATE TABLE Hub_Discipline (
    hk_discipline CHAR(32) PRIMARY KEY,
    discipline_bk TEXT NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source TEXT NOT NULL
);

CREATE TABLE Hub_Teacher (
    hk_teacher CHAR(32) PRIMARY KEY,
    teacher_bk TEXT NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source TEXT NOT NULL
);

CREATE TABLE Hub_Classroom (
    hk_classroom CHAR(32) PRIMARY KEY,
    classroom_bk TEXT NOT NULL,
    load_date TIMESTAMP NOT NULL,
    record_source TEXT NOT NULL
);

-- Линки
CREATE TABLE Lnk_Specialty_Faculty (
    hk_link CHAR(32) PRIMARY KEY,
    hk_specialty CHAR(32) NOT NULL REFERENCES Hub_Specialty(hk_specialty),
    hk_faculty CHAR(32) NOT NULL REFERENCES Hub_Faculty(hk_faculty),
    load_date TIMESTAMP NOT NULL,
    record_source TEXT NOT NULL
);

CREATE TABLE Lnk_Group_Specialty (
    hk_link CHAR(32) PRIMARY KEY,
    hk_group CHAR(32) NOT NULL REFERENCES Hub_Group(hk_group),
    hk_specialty CHAR(32) NOT NULL REFERENCES Hub_Specialty(hk_specialty),
    load_date TIMESTAMP NOT NULL,
    record_source TEXT NOT NULL
);

CREATE TABLE Lnk_Curriculum (
    hk_link CHAR(32) PRIMARY KEY,
    hk_specialty CHAR(32) NOT NULL REFERENCES Hub_Specialty(hk_specialty),
    hk_discipline CHAR(32) NOT NULL REFERENCES Hub_Discipline(hk_discipline),
    load_date TIMESTAMP NOT NULL,
    record_source TEXT NOT NULL
);

CREATE TABLE Lnk_Schedule (
    hk_link CHAR(32) PRIMARY KEY,
    hk_group CHAR(32) NOT NULL REFERENCES Hub_Group(hk_group),
    hk_discipline CHAR(32) NOT NULL REFERENCES Hub_Discipline(hk_discipline),
    hk_teacher CHAR(32) NOT NULL REFERENCES Hub_Teacher(hk_teacher),
    hk_classroom CHAR(32) NOT NULL REFERENCES Hub_Classroom(hk_classroom),
    load_date TIMESTAMP NOT NULL,
    record_source TEXT NOT NULL
);

-- Сателлиты
CREATE TABLE Sat_Faculty (
    hk_faculty CHAR(32) NOT NULL REFERENCES Hub_Faculty(hk_faculty),
    load_date TIMESTAMP NOT NULL,
    name TEXT NOT NULL,
    PRIMARY KEY (hk_faculty, load_date)
);

CREATE TABLE Sat_Discipline (
    hk_discipline CHAR(32) NOT NULL REFERENCES Hub_Discipline(hk_discipline),
    load_date TIMESTAMP NOT NULL,
    name TEXT NOT NULL,
    hours_lectures INT,
    hours_practice INT,
    hours_labs INT,
    PRIMARY KEY (hk_discipline, load_date)
);

CREATE TABLE Sat_Curriculum (
    hk_link CHAR(32) NOT NULL REFERENCES Lnk_Curriculum(hk_link),
    load_date TIMESTAMP NOT NULL,
    semester INT,
    course INT,
    PRIMARY KEY (hk_link, load_date)
);

CREATE TABLE Sat_Schedule (
    hk_link CHAR(32) NOT NULL REFERENCES Lnk_Schedule(hk_link),
    load_date TIMESTAMP NOT NULL,
    day_of_week INT,
    period_number INT,
    week_type INT,
    PRIMARY KEY (hk_link, load_date)
);
