Healthcare Clinic Database Management System 🏥

Project Overview

This project is a relational database management system designed for a healthcare clinic. It was created as part of a 45-day B.Tech summer training program focusing on Database Management Systems (DBMS) and SQL. The system efficiently tracks patients, doctors, appointments, and medical prescriptions.

Database Schema (ER Model)

The database consists of 4 main interconnected tables:

Patients: Stores demographic and basic medical details.

Doctors: Stores details of medical staff and their specializations.

Appointments (Junction Table): Links Patients and Doctors with scheduled dates/times and statuses.

Prescriptions: Stores medication details linked to completed appointments.

Key Features & SQL Concepts Used

Primary Key & Foreign Key Constraints: Ensuring referential integrity (e.g., ON DELETE CASCADE).

Multi-Table JOINs: Fetching comprehensive patient history by connecting 4 tables.

Data Aggregation: Using GROUP BY and COUNT() to generate doctor-wise appointment reports.

Views: Created virtual tables (e.g., Clinic_Dashboard) for quick and secure data retrieval.

How to Run This Project

Clone this repository or download the .sql file.

Open your MySQL Workbench or preferred SQL IDE.

Import the clinic_database.sql file or open it and run the script.

The database Clinic_DB and all tables with dummy data will be created automatically.

Sample Complex Query Used

Fetching the complete prescription history for a specific patient using 3 INNER JOINs:

SELECT 
    Patients.First_name, 
    Doctors.Name AS Doctor, 
    Prescriptions.Medicine_Name, 
    Prescriptions.Dosage, 
    Prescriptions.Duration
FROM Prescriptions
INNER JOIN Appointments ON Prescriptions.ApptID = Appointments.ApptID
INNER JOIN Patients ON Appointments.PatientID = Patients.PatientID
INNER JOIN Doctors ON Appointments.DoctorID = Doctors.DoctorID
WHERE Patients.First_name = 'Taranveer';
