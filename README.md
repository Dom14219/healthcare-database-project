# Healthcare Patient Management Database

This project simulates a healthcare database system using MySQL. It was designed to practice data modeling, table relationships, data importing, and SQL querying in a realistic medical context. All data was mock-generated using Mockaroo.

## Files Included
- `patients.csv` – Contains patient information (name, date of birth, gender, email)
- `appointment.csv` – Includes appointment date, time, doctor name, and status
- `treatments.csv` – Tracks patient treatment dates and medications
- `healthcare_database.sql` – Contains table creation statements and SQL queries

## Database Structure and Setup

- Tables were created using appropriate data types such as `INT`, `TEXT`, `DATE`, `DATETIME`, and `TIME`
- Relationships were enforced using foreign keys (e.g., `patient_id`)
- CSV data was imported using MySQL Workbench's Table Import Wizard
- Formatting issues like AM/PM time values were fixed by converting to 24-hour format
- Safe update mode was disabled where necessary using `SET SQL_SAFE_UPDATES = 0`

## Key Features

### Table Relationships
- `appointments` and `treatments` tables are linked to `patients` using the `patient_id` foreign key

### Core SQL Queries
- Display all patients and their treatments
- List upcoming appointments using `NOW()` to filter future dates
- Join patients with appointment and doctor information
- Format date and time using `DATE()` and `DATE_FORMAT()` for cleaner output

### Appointment Status Logic
- A `status` column was added to the `appointment` table
- Appointments are automatically marked as "Completed" or "Upcoming" based on the current time

```sql
UPDATE appointment
SET status = CASE
  WHEN appointment_date_time < NOW() THEN 'Completed'
  ELSE 'Upcoming'
END;
