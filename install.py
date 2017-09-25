#!/usr/bin/python3
import os

if __name__ == '__main__':
    cwd = os.path.dirname(os.path.realpath(__file__))
    home = os.path.expanduser("~")
    cfg_names = ['bashrc', 'vimrc', 'tmux.conf',
                 'ycm_extra_conf.py', 'vim']
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

    os.system("git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
    # os.symlink(cwd+"/bashrc", home+"/.bashrc")
    # os.symlink(cwd+"/vimrc", home+"/.vimrc")
    # os.symlink(cwd+"/tmux.conf", home+".tmux.conf")
    # os.symlink(cwd+"/ycm_ext")
