import os
import json
from collections import defaultdict

def delete_json_files_except_first_per_initial(directory):
    # Dictionary to keep track of the first file per initial
    first_files = defaultdict(lambda: None)
    
    # List all files in the directory
    files = os.listdir(directory)
    print(f"Files in directory '{directory}': {files}")
    
    # Filter out files that are not JSON
    json_files = [f for f in files if f.endswith('.json')]
    print(f"JSON files found: {json_files}")
    
    # Sort files to ensure we consider them in alphabetical order
    json_files.sort()
    print(f"Sorted JSON files: {json_files}")
    
    for file in json_files:
        # Get the initial of the file name (assuming no path included)
        initial = file[0].upper()
        
        # If it's the first file for this initial, remember it
        if first_files[initial] is None:
            first_files[initial] = file
            print(f"Keeping first file for initial '{initial}': {file}")
        else:
            # If it's not the first, delete it
            file_path = os.path.join(directory, file)
            os.remove(file_path)
            print(f"Deleted {file_path}")

# Usage example
# Use '.' to refer to the current directory
directory = '.'
delete_json_files_except_first_per_initial(directory)
