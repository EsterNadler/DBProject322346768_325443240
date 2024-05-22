import random

# List of possible room types
room_types = [
    "Conference Hall", "Yoga Room", "Gymnasium", "Dance Studio",
    "Spinning Room", "Boxing Ring", "Martial Arts Room", "Swimming Pool",
    "Cardio Room", "Weightlifting Room", "Sauna", "Steam Room", "Pilates Studio",
    "Aerobics Room", "Cycling Room", "HIIT Room", "Functional Training Room",
    "CrossFit Area", "Massage Room", "Spa", "Lecture Room", "Seminar Room",
    "Personal Training Room", "Outdoor Training Area", "Indoor Track"
]


def generate_room_data(num_rooms=100):
    rooms = []
    used_room_numbers = set()

    for _ in range(num_rooms):
        capacity = random.randint(10, 200)
        room_num = random.randint(1, 1000)
        while room_num in used_room_numbers:
            room_num = random.randint(1, 1000)
        used_room_numbers.add(room_num)
        room_type = random.choice(room_types)
        rooms.append((capacity, room_num, room_type))

    return rooms


def write_rooms_to_file(rooms, filename='rooms.txt'):
    with open(filename, 'w') as file:
        for room in rooms:
            file.write(f"{room[0]}, {room[1]}, {room[2]}\n")


# Generate the rooms
rooms = generate_room_data()

# Write the rooms to a file
write_rooms_to_file(rooms)

print("Room data has been written to rooms.txt")
