#!/usr/bin/python3

import subprocess
import signal
import os


def kill_proc(pid):
    print("kill %d" % pid)
    # Kill process.
    os.kill(pid, signal.SIGTERM)


def close_flux():
    ps_str = subprocess.check_output(["ps", "aux"])
    ps_str = ps_str.decode()
    proc_list = ps_str.split('\n')
    flux_line = ''
    for l in proc_list:
        if "xflux" in l:
            flux_line = l
    if len(flux_line) > 0:
        flux_pid = int(flux_line.split()[1])
        print("flux_pid=%d" % flux_pid)
        kill_proc(flux_pid)

if __name__ == "__main__":
    close_flux()
