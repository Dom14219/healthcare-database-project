-- Lists all patient names and treatments
SELECT 
  first_name,
  last_name,
  treatment_date,
  treatment_medication
FROM patients AS a
JOIN treatments AS b 
  ON a.patient_id = b.patient_id
ORDER BY a.patient_id;

-- Lists all patients info
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name, 
    Date(dob) AS dob,
    gender,
    patient_email
FROM patients;


-- Lists all patients and their assigned doctors
SELECT 
	CONCAT(first_name, ' ', last_name) AS full_name, doctor_name
FROM patients as a
JOIN appointment as b
	ON a.patient_id = b.patient_id;
    

 
 -- Lists patients and their upcoming appointments
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name, 
    appointment_date_time, 
    doctor_name
FROM patients AS a
JOIN appointment AS b
	ON a.patient_id = b.patient_id
WHERE appointment_date_time > NOW()
ORDER BY appointment_date_time;


-- Added a new column called status to display if the appointment is completed 
ALTER TABLE appointment ADD status VARCHAR(20);

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
FROM patients as a
JOIN appointment as b
	ON a.patient_id = b.patient_id
ORDER BY 
	status = 'Upcoming' DESC,
    appointment_date_time;
 
 -- Count how many appointments fall under each status
SELECT status, COUNT(*) AS total
FROM appointment
GROUP BY status;
    

	
