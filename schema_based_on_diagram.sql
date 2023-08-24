-- Create a table patients
CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE
);

-- Create a table for medical_histories
CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at timestamp,
  patient_id INT,
  status VARCHAR(100),
  CONSTRAINT patient_id_fk FOREIGN KEY(patient_id) REFERENCES patients(id)
);

-- Create a table for treatments
CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  name VARCHAR(255)
);

-- Create a table for invoices
CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  total_amount DECIMAL(10, 2),
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id INT,
  CONSTRAINT medical_history_id_fk FOREIGN KEY(medical_history_id) REFERENCES medical_history(id)
);