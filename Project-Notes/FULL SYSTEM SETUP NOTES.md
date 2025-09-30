# Project Setup Guide

## Requirements
- **XAMPP** (Apache and MySQL only)
- **Python 3.x**
- **VS Code** with Live Server extension
- **requirements.txt** installed in a virtual environment

---

## Step 1: Start XAMPP
1. Open **XAMPP Control Panel**.  
2. Start **Apache** and **MySQL** (these are the only two we need).  
3. Make sure MySQL is running on port **3307** (update Apache and MySQL configs if needed).  CHECK XAMPP SETUP NOTES FILE


SETUP DATABASE SCHEMA AND SEED once in phpmyadmin
1. setup data base called byte2bite_db
2. within byte2bite_db run the seed.sql query
should be all green then you did it right.



---

## Step 2: Run the Flask Backend
1. Navigate to the backend folder in your terminal.  
2. Run the Flask app:  

   ```bash
   python app.py


then you can use the 'live server' extension in vs code to run the .html index files