import os
import json

# Get the current directory of the script
current_dir = os.path.dirname(os.path.abspath(__file__))

# Specify the paths to your folders using relative paths
json_folder = os.path.join(current_dir, "lib", "src", "data", "json")
image_folder = os.path.join(current_dir, "assets", "images")

# Check if the json_folder path exists
if not os.path.exists(json_folder):
    print(f"JSON folder path does not exist: {json_folder}")
    exit(1)

# Check if the image_folder path exists
if not os.path.exists(image_folder):
    print(f"Image folder path does not exist: {image_folder}")
    exit(1)

# Iterate over all JSON files in the json_folder
for json_filename in os.listdir(json_folder):
    if json_filename.endswith('.json'):
        json_path = os.path.join(json_folder, json_filename)
        
        # Check if the file is empty
        if os.path.getsize(json_path) == 0:
            print(f"File is empty: {json_path}")
            continue
        
        # Open and read the JSON file
        try:
            with open(json_path, 'r') as json_file:
                data = json.load(json_file)
        except json.JSONDecodeError as e:
            print(f"Error decoding JSON from file {json_path}: {e}")
            continue
        except Exception as e:
            print(f"An error occurred while reading file {json_path}: {e}")
            continue
        
        if data is None:
            print(f"Data is None for file: {json_path}")
            continue
        
        # Extract the 'pid' value
        pid = data.get('pid')
        if pid:
            # Construct the image filename
            image_filename = f'{pid}.jpg'
            image_path = os.path.join(image_folder, image_filename)
            
            # Check if the image file exists
            if os.path.exists(image_path):
                # Set the image path in the JSON data to the desired format
                rel_image_path = f'assets/images/{image_filename}'
                
                # Update the 'image' value in the JSON data with the new path
                data['image'] = rel_image_path
                
                # Write the updated JSON back to the file
                try:
                    with open(json_path, 'w') as json_file:
                        json.dump(data, json_file, indent=4)
                except Exception as e:
                    print(f"An error occurred while writing to file {json_path}: {e}")
        else:
            print(f"No 'pid' found in file: {json_path}")

print("Finished updating JSON files with new image paths.")
