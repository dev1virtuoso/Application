import os
import subprocess
import tqdm
from cryptography.hazmat.primitives import hashes
import csv

def check_permissions(path):
    return os.access(path, os.R_OK)

def hash_text(text):
    digest = hashes.Hash(hashes.SHA256())
    digest.update(text.encode('utf-8'))
    return digest.finalize().hex()

def clone_seclists():
    # Get the script's directory
    script_dir = os.path.dirname(os.path.abspath(__file__))
    seclists_dir = os.path.join(script_dir, "SecLists")
    passwords_dir = os.path.join(seclists_dir, "Passwords")

    # Check if SecLists is already cloned
    if not os.path.exists(seclists_dir):
        print("Cloning SecLists repository...")
        try:
            subprocess.run(
                ["git", "clone", "https://github.com/danielmiessler/SecLists.git", seclists_dir],
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True
            )
            print("Clone completed")
        except subprocess.CalledProcessError as e:
            print(f"Error: Failed to clone SecLists: {e.stderr}")
            return None
    else:
        print("SecLists repository already exists, skipping clone")

    # Check if Passwords folder exists
    if not os.path.exists(passwords_dir):
        print(f"Error: Passwords folder {passwords_dir} does not exist")
        return None

    return passwords_dir

def collect_and_process_txt_files():
    # Clone and get Passwords folder path
    source_folder = clone_seclists()
    if not source_folder:
        return

    output_txt = "output.txt"
    output_csv = "output_hashed.csv"
    all_text = []
    output_data = []
    txt_files = []

    # Check read permissions
    if not check_permissions(source_folder):
        print(f"Error: No permission to read {source_folder}, try running with sudo: sudo python3 {__file__}")
        return

    # Collect txt file paths
    for root, _, files in os.walk(source_folder):
        for file in files:
            if file.lower().endswith('.txt'):
                txt_files.append(os.path.join(root, file))

    if not txt_files:
        print(f"Error: No .txt files found in {source_folder}")
        return

    # Iterate through files with progress bar
    for file_path in tqdm.tqdm(txt_files, desc="Collecting files"):
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
                all_text.append(content)
                # Process each line and generate SHA256
                for line in content.splitlines():
                    line = line.strip()
                    if line:  # Ignore empty lines
                        hashed = hash_text(line)
                        output_data.append([line, hashed])
        except Exception as e:
            print(f"Cannot read file {file_path}: {e}")

    if not all_text:
        print("Error: No content collected")
        return

    # Sort and write to txt
    all_text.sort()
    try:
        with open(output_txt, 'w', encoding='utf-8') as f:
            f.write('\n'.join(all_text))
        print(f"Completed, output txt file: {output_txt}, processed {len(txt_files)} files")
    except Exception as e:
        print(f"Failed to write txt file: {e}")

    # Write to CSV
    if output_data:
        try:
            with open(output_csv, 'w', encoding='utf-8', newline='') as f:
                writer = csv.writer(f)
                writer.writerow(['Original', 'SHA256'])
                writer.writerows(output_data)
            print(f"Completed, output CSV file: {output_csv}")
        except Exception as e:
            print(f"Failed to write CSV: {e}")
    else:
        print("Error: No valid content to write to CSV")

if __name__ == "__main__":
    collect_and_process_txt_files()
