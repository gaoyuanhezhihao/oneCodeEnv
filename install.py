#!/usr/bin/python3
import os
from glob import glob

def run_scripts():
    install_scripts = glob("./install/*.sh")
    for scrp in install_scripts:
        os.system("sh "+scrp)

if __name__ == '__main__':
    cwd = os.path.dirname(os.path.realpath(__file__))
    home = os.path.expanduser("~")
    cfg_names = ['bashrc', 'vimrc', 'tmux.conf',
                 'ycm_extra_conf.py', 'vim', 'powerline-shell.json']
    for n in cfg_names:
        src = cwd+"/"+n
        dst = home+"/."+n
        if os.path.exists(dst) or os.path.islink(dst):
            old_dst_bkp = dst+".bkp"
            if os.path.exists(old_dst_bkp):
                os.remove(old_dst_bkp)
            os.rename(dst, old_dst_bkp)
            print("there has been a \"%s\", moved to \"%s\""
                  %(dst, old_dst_bkp))
        os.symlink(src, dst)
    os.makedirs('~/bin', exist_ok=True)

    # os.symlink(cwd+"/bashrc", home+"/.bashrc")
    # os.symlink(cwd+"/vimrc", home+"/.vimrc")
    # os.symlink(cwd+"/tmux.conf", home+".tmux.conf")
    # os.symlink(cwd+"/ycm_ext")
