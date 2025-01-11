SELECT * FROM clients

SELECT clients.first_name, clients.last_name, memberships.start_date, memberships.end_date, memberships.price
FROM clients
JOIN memberships ON clients.client_id = memberships.client_id; 

SELECT first_name, last_name, email, membership_type 
FROM clients 
WHERE membership_type = 'Gold';

UPDATE clients
SET email = 'new_email@example.com'
WHERE client_id = 3;

DELETE FROM equipment
WHERE equipment_id = 4;

SELECT membership_type, COUNT(*) AS client_count
FROM clients
GROUP BY membership_type;

SELECT c.client_id, c.first_name, c.last_name, COUNT(a.visit_date) AS visit_count
FROM clients c
JOIN attendance a ON c.client_id = a.client_id
WHERE a.visit_date BETWEEN '2024-01-01' AND '2024-05-31'
GROUP BY c.client_id;

SELECT 
    session_data.client_id,
    c.first_name,
    c.last_name,
    SUM(ser.price * session_data.session_count) AS total_spent
FROM (
    SELECT 
        a.client_id,
        s.service_id,
        COUNT(a.schedule_id) AS session_count
    FROM attendance a
    JOIN schedule s ON a.schedule_id = s.schedule_id
    GROUP BY a.client_id, s.service_id
) AS session_data
JOIN services ser ON session_data.service_id = ser.service_id
JOIN clients c ON session_data.client_id = c.client_id
GROUP BY session_data.client_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

SELECT t.trainer_id, t.first_name, t.last_name
FROM trainers t
LEFT JOIN schedule s ON t.trainer_id = s.trainer_id
WHERE s.trainer_id IS NULL;

