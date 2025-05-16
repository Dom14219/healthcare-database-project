# Healthcare Patient Management Database
This project is a mock healthcare database system built using MySQL. It uses data generated via Mockaroo to simulate patients, appointments, and treatments. The goal was to practice SQL skills, data integration, and basic analytics relevant to real-world healthcare systems.

## Files Included
patients.csv — Mock patient info (name, DOB, gender, email)

appointment.csv — Appointment dates, assigned doctors

treatments.csv — Patient treatment history and medications

healthcare database.sql — All SQL queries and table logic

## Features & Queries
Data Import & Table Setup
Imported CSV data into structured MySQL tables.

Established relationships via patient_id.

## Core Queries
List all patient info and treatments.

Join patients with their appointment and doctor info.

Filter for upcoming appointments using NOW().

## Status Feature
Added a status column to the appointment table to mark if an appointment is:

Upcoming

Completed

Unknown

Automatically updated using SQL CASE logic.

## Analytics
Count of appointments by status.

Sort patients to show those with upcoming visits first.

Identify the next upcoming appointment.

## What I Learned
Creating and managing relational databases in MySQL.

Using JOINs, DATE functions, and conditional logic.

Writing clear, maintainable SQL with comments.

Simulating real-world business logic using mock data.

