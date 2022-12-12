import os
import glob

pngs = glob.glob(os.getcwd() + "/**/*.png", recursive=True)
for e in pngs:
    command = 'cwebp -q 100 "' + e + '" -o "' + e[:len(e) - 4] + '.webp"'
    print(command)
    os.system(command)
