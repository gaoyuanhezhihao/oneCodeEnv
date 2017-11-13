#!/usr/bin/python3

import subprocess
import signal
import os
import time
from close import close_flux

class Time_Pt:
    def __init__(self, hour, minu):
        self.tm_hour = hour
        self.tm_min = minu


day_head = Time_Pt(6, 0)
day_end = Time_Pt(18, 0)


def run_night_flux():
    print("night flux ...")
    sh_dir = os.path.dirname(os.path.realpath(__file__))
    night_flux_path = sh_dir+"/night.sh"
    os.system(night_flux_path)


def run_day_flux():
    print("day flux...")
    sh_dir = os.path.dirname(os.path.realpath(__file__))
    os.system(sh_dir+"/day.sh")


def main():
    close_flux()
    # ps_str = subprocess.check_output(["ps", "aux"])
    # ps_str = ps_str.decode()
    # proc_list = ps_str.split('\n')
    # flux_line = ''
    # for l in proc_list:
        # if "xflux" in l:
            # flux_line = l
    # if len(flux_line) > 0:
        # flux_pid = int(flux_line.split()[1])
        # print("flux_pid=%d" % flux_pid)
        # kill_proc(flux_pid)
    if is_day_time():
        run_day_flux()
    else:
        run_night_flux()


def after_time(time_point, std_time):
    if std_time.tm_hour < time_point.tm_hour:
        return True
    elif std_time.tm_hour == time_point.tm_hour and\
            std_time.tm_min < time_point.tm_min:
        return True
    else:
        return False


def is_day_time():
    now = time.localtime()
    if after_time(now, std_time=day_head) and after_time(day_end, std_time=now):
        return True
    else:
        return False


def kill_proc(pid):
    print("kill %d"%pid)
    # Kill process.
    os.kill(pid, signal.SIGTERM)
    # # Check if the process that we killed is alive.
    # try:
        # os.kill(pid, 0)
        # raise Exception("""wasn't able to kill the process HINT:use signal.SIGKILL or signal.SIGABORT""")
    # except OSError as ex:
        # pass

if __name__ == "__main__":
    main()
