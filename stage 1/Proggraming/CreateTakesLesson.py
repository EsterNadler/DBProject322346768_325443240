import csv
import random

# Function to read foreign key values from CSV files
def read_csv(file_path):
    with open(file_path, mode='r') as file:
        reader = csv.reader(file)
        next(reader)  # Skip header row
        return [row for row in reader]

# Read foreign key values from CSV files
lessons = read_csv('lessons.csv')  # Assuming lessons.csv contains "LessonId,ClassId"
members = read_csv('membersIDs.csv')  # Assuming members.csv contains "PersonId"

# Function to generate random records for Takes_Lesson table
def generate_takes_lesson_data(num_records=500):
    takes_lesson_data = []
    for _ in range(num_records):
        lesson = random.choice(lessons)
        person_id = random.choice(members)[0]  # Only PersonId
        takes_lesson_data.append((lesson[0], lesson[1], person_id))
    return takes_lesson_data

# Function to write records to an SQL file
def write_takes_lesson_to_sql(takes_lesson_data, filename='takes_lesson.sql'):
    with open(filename, 'w') as file:
        for record in takes_lesson_data:
            file.write(f"INSERT INTO Takes_Lesson (LessonId, ClassId, PersonId) VALUES ({record[0]}, {record[1]}, {record[2]});\n")

# Generate 500 records for Takes_Lesson table
takes_lesson_data = generate_takes_lesson_data()

# Write the records to a SQL file
write_takes_lesson_to_sql(takes_lesson_data)

print("Takes_Lesson data has been written to takes_lesson.sql")
