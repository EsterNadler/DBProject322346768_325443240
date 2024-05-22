import random

# List of possible class names
class_names = [
    "Pilates for Beginners", "Yoga Basics", "Advanced Yoga", "Strength Training",
    "Cardio Blast", "Zumba Dance", "Aerobics", "CrossFit Intro", "Boxing Fundamentals",
    "Martial Arts", "Cycling", "HIIT", "Kickboxing", "Senior Fitness", "Boot Camp",
    "Core Strength", "Stretch and Flex", "Bodybuilding Basics", "Nutrition 101",
    "Healthy Cooking", "Weight Loss Tips", "Muscle Gain Strategies", "Meditation and Relaxation",
    "Prenatal Yoga", "Postnatal Yoga", "Youth Sports Training", "Teen Fitness",
    "Water Aerobics", "Triathlon Training", "Running Club", "Walking Group", "Dance Aerobics",
    "Body Sculpt", "Fitness for New Moms", "Tai Chi", "Strength for Seniors", "Kids Yoga",
    "Powerlifting Basics", "Rowing", "Sports Nutrition", "Gymnastics Conditioning",
    "Spinning", "Ballet Fitness", "Flexibility Training", "Aqua Zumba", "Mindfulness Meditation",
    "Trail Running", "Obstacle Course Training", "Functional Fitness", "Strength and Conditioning"
]

def generate_course_data(num_courses=100):
    courses = []
    for i in range(1, num_courses + 1):
        class_name = random.choice(class_names)
        min_age = random.randint(2, 70)
        max_age = min_age+random.randint(1, 65)
        duration = random.randint(30, 120)  # Duration in minutes
        courses.append((i, class_name, min_age, max_age, duration))
    return courses

def write_courses_to_file(courses, filename='courses.sql'):
    with open(filename, 'w') as file:
        for course in courses:
            file.write("INSERT INTO Gym_Class (ClassId, ClassName, MinAge, MaxAge, Duration) VALUES\n")
            file.write(f"  ({course[0]}, '{course[1]}', {course[2]}, {course[3]}, {course[4]});\n")

# Generate the courses
courses = generate_course_data()

# Write the courses to a file
write_courses_to_file(courses)

print("Course data has been written to courses.sql")
