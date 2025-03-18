#!/usr/bin/env python3

# Ole W. Saastad, LB4PJ
# v0.1  24 Sep 2022
# v0.2  01 Oct 2022

import sys
import os
import time
import tkinter as tk
import subprocess as sp
#from subprocess import check_output, CalledProcessError

def check_pid(name):
    if name == "VARA.exe":
        p = sp.getoutput("ps auwx| grep VARA.exe |grep -v grep | awk '{print $2}'|head -1")
        return p
    try:
        p = sp.check_output(["pidof",name]).split()
    except  sp.CalledProcessError:
        p = str(0)
    return p


def display_pids():
    tk.Label(master, text="Service",anchor='c').grid(row=0)
    tk.Label(master, text="PID",anchor='c').grid(row=0, column=1)
    tk.Label(master, text="rigctl").grid(row=1)
    tk.Label(master, text="VARA").grid(row=2)
    tk.Label(master, text="pat").grid(row=3)
    e1 = tk.Entry(master, width="7")
    e2 = tk.Entry(master, width="7")
    e3 = tk.Entry(master, width="7")
    e1.insert(0, check_pid("rigctld"))
    e2.insert(0, check_pid("VARA.exe"))
    e3.insert(0, check_pid("pat"))
    e1.grid(row=1, column=1)
    e2.grid(row=2, column=1)
    e3.grid(row=3, column=1)

    
def stop_pat():
    tk.Label(master, text="Stopping Pat",anchor="e").grid(row=0)
    os.system("/home/pi/pat/pat.stop")
    master.destroy()

    
# main() start here. 

master = tk.Tk()
master.title("Pat")

os.system("/home/pi/pat/pat.start")
time.sleep(1)
tk.Button(master, text='Stop pat & vara', height="2", width="10",
          command=stop_pat).grid(row=4, column=1, sticky=tk.W, pady=1)

display_pids()     # Fill the object with info. 

master.mainloop()  # Let tk object loop until stopped.

