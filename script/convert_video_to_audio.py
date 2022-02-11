# sudo add-apt-repository ppa:mc3man/trusty-media  
# sudo apt-get update  
# sudo apt-get install ffmpeg  
# sudo apt-get install frei0r-plugins
# pip install moviepy

import os
from os.path import join
# Python code to convert video to audio
import moviepy.editor as mp

# Insert Local Video File Path

# Insert Local Audio File Path

DIR = "/home/zhihaohe/vbox_shared/下载/fofa/刘素云老师第二次复讲无量寿经"
failed_files = []
for f in os.listdir(DIR):
    if os.path.isdir(join(DIR, f)):
        continue
    audio_file_path = join(DIR, 'mp3/', os.path.splitext(f)[0]+'.mp3')
    print(f, "-->", audio_file_path)
    try:
        clip = mp.VideoFileClip(join(DIR, f))
        clip.audio.write_audiofile(audio_file_path)
    except Exception as e:
        print(e)
        failed_files.append(f)

print("failed files:", failed_files)
