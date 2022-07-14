import os
import string
import pathlib

def repair_filenames():
    count = 0
    path = pathlib.Path(".") #assigns current directory as base
    for folder in path.rglob("*"):
        if folder.is_dir():
            tpath = pathlib.Path(folder.name)
            for file in folder.rglob("*"):
                if file.is_file():
                    if file.name.lower() == folder.name.lower() + ".yy" and file.name != folder.name + ".yy":
                        count += 1
                        target = pathlib.Path(folder)
                        print("RENAMING",file.name,"TO",folder.name + ".yy")
                        file.rename(target / (folder.name + ".yy"))
                        print("RENAMED FILE");
    print(count,"FILES RENAMED!")
if __name__ == "__main__":
    repair_filenames()