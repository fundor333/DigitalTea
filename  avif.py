import os
import glob

jpg = glob.glob(os.getcwd() + "/**/*.jpg", recursive=True)
for e in jpg:
    command = 'avifenc "' + e + '" -o "' + e[:len(e) - 4] + '.avif"'
    print(command)
    os.system(command)
