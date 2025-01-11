
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    membership_type VARCHAR(50),
    join_date DATE
);


CREATE TABLE memberships (
    membership_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(client_id),
    start_date DATE,
    end_date DATE,
    price DECIMAL(10, 2)
);


CREATE TABLE trainers (
    trainer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100)
);


CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    service_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2)
);


CREATE TABLE schedule (
    schedule_id SERIAL PRIMARY KEY,
    service_id INT REFERENCES services(service_id),
    trainer_id INT REFERENCES trainers(trainer_id),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    location VARCHAR(100)
);


CREATE TABLE halls (
    hall_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    capacity INT
);


CREATE TABLE attendance (
    attendance_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(client_id),
    schedule_id INT REFERENCES schedule(schedule_id),
    visit_date DATE
);


CREATE TABLE equipment (
    equipment_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(50),
    condition VARCHAR(50)
);


CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    address TEXT,
    contact_number VARCHAR(15)
);
