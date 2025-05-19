-- Lists all patient names and treatments
SELECT 
  first_name,
  last_name,
  DATE(treatment_date) as treatment_date,
  treatment_medication
FROM patient AS a
JOIN treatment AS b 
  ON a.patient_id = b.patient_id
ORDER BY a.patient_id;


-- Lists all patients info
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name, 
    Date(dob) AS dob,
    gender,
    patient_email
FROM patient;


-- Lists all patients and their assigned doctors
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name, doctor_name
FROM patient as a
JOIN appointment as b
	ON a.patient_id = b.patient_id;
    

 
 -- Lists patients and their upcoming appointments
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name, 
    DATE(appointment_date_time) AS appointment_date_time, 
    doctor_name
FROM patient AS a
JOIN appointment AS b
	ON a.patient_id = b.patient_id
WHERE appointment_date_time > NOW()
ORDER BY appointment_date_time;


-- Added a new column called status to display if the appointment is completed 
ALTER TABLE appointment ADD status CHAR(9);


-- Set status as Completed, Upcoming, or Unknown
UPDATE appointment
SET status = CASE
  WHEN appointment_date_time < NOW() THEN 'Completed'
  WHEN appointment_date_time > NOW() THEN 'Upcoming'
  ELSE 'Unknown'
END;


-- List all patients with appointment date and status, showing upcoming first
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name,
    DATE(appointment_date_time),
    status
FROM patient as a
JOIN appointment as b
	ON a.patient_id = b.patient_id
ORDER BY 
	status = 'Upcoming' DESC,
    appointment_date_time;
 
 
 -- Count how many appointments fall under each status
SELECT status, COUNT(*) AS total
FROM appointment
GROUP BY status;
    

	
