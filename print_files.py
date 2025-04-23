import os

root_dir = "src"  # adjust this if your source files are elsewhere

with open("out.txt", "w", encoding="utf-8") as out:
    for subdir, _, files in os.walk(root_dir):
        for file in files:
            if not file.endswith((".cpp", ".h")):
                continue  # only include .cpp and .h files

            file_path = os.path.join(subdir, file)
            out.write(f"\n==> {file_path}\n")
            try:
                with open(file_path, "r", encoding="utf-8") as f:
                    out.write(f.read())
                    out.write("\n")
            except Exception as e:
                out.write(f"[ERROR] Could not read {file_path}: {e}\n")
