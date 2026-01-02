-- Факультеты
CREATE TABLE faculties (
    faculty_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Специальности
CREATE TABLE specialties (
    specialty_id SERIAL PRIMARY KEY,
    faculty_id INT NOT NULL REFERENCES faculties(faculty_id),
    name TEXT NOT NULL,
    code TEXT NOT NULL
);

-- Учебные группы
CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    specialty_id INT NOT NULL REFERENCES specialties(specialty_id),
    course INT NOT NULL CHECK (course BETWEEN 1 AND 6),
    name TEXT NOT NULL
);

-- Дисциплины
CREATE TABLE disciplines (
    discipline_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    hours_lectures INT DEFAULT 0,
    hours_practice INT DEFAULT 0,
    hours_labs INT DEFAULT 0
);

-- Преподаватели
CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    position TEXT
);

-- Аудитории
CREATE TABLE classrooms (
    classroom_id SERIAL PRIMARY KEY,
    number TEXT NOT NULL,
    capacity INT,
    building TEXT
);

-- Учебный план
CREATE TABLE curriculum (
    curriculum_id SERIAL PRIMARY KEY,
    specialty_id INT NOT NULL REFERENCES specialties(specialty_id),
    discipline_id INT NOT NULL REFERENCES disciplines(discipline_id),
    semester INT NOT NULL CHECK (semester BETWEEN 1 AND 12),
    course INT NOT NULL
);

-- Расписание
CREATE TABLE schedule (
    schedule_id SERIAL PRIMARY KEY,
    group_id INT NOT NULL REFERENCES groups(group_id),
    discipline_id INT NOT NULL REFERENCES disciplines(discipline_id),
    teacher_id INT NOT NULL REFERENCES teachers(teacher_id),
    classroom_id INT NOT NULL REFERENCES classrooms(classroom_id),
    day_of_week INT NOT NULL CHECK (day_of_week BETWEEN 1 AND 7),
    period_number INT NOT NULL CHECK (period_number BETWEEN 1 AND 6),
    week_type INT CHECK (week_type IN (0, 1, 2))
);
