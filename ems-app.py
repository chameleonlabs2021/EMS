from flask import Flask, jsonify, render_template
import psycopg2

app = Flask(__name__)

# Define database connection details
conn = psycopg2.connect(
    host="localhost",
    database="employee_db",
    user="postgres",
    password="postgres"
)

# Define API route to get all employees
@app.route('/api/employees', methods=['GET'])
def get_employees():
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM employees")
    employees = cursor.fetchall()
    cursor.close()
    return jsonify(employees)

# Define API route to get employee contact information
@app.route('/api/employees/<int:employee_id>/contact', methods=['GET'])
def get_employee_contact(employee_id):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM employee_contact_information WHERE employee_id = %s", (employee_id,))
    contact_info = cursor.fetchone()
    cursor.close()
    return jsonify(contact_info)

# Define route to render HTML page with employee information
@app.route('/employees', methods=['GET'])
def employees():
    # Get a list of employees from the database
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM employees")
    employees = cursor.fetchall()
    cursor.close()
    
    # Render the employees.html template with the list of employees
    return render_template('employees.html', employees=employees)

if __name__ == '__main__':
    app.run(debug=True, port=5000)

