Minimal example of modules from C++20 on `g++`. Intended for a Linux environment.

When running `make`, the current project will create a `lib` structured as follows:

```
- lib
  - gcm.cache 
    (all module-related files, i.e. all .gcm suffix files, go here)
  (other generated files, e.g. shared objects / libraries, also go in this folder)
```

The very first commit is taken largely from the answer to [this SO question](https://stackoverflow.com/questions/69452740/shared-libraries-and-c20-modules). This initial project setup autogenerated files and didn't take into account an ideal project setup, but you can redirect built modules to a  `./lib/gcm.cache` folder by including `'-fmodule-mapper=|@g++-mapper-server -r'<PATH TO CACHE>` as a compile flag on `g++`. From what I can tell, `-r` specifies where to search for and generate module files, so the entire flag needs to be included on any command that creates or generates a module. [Credit goes to this answer on SO](https://stackoverflow.com/questions/69549286/how-to-modify-gcm-cache-path-when-using-gcc-11-to-build-c20-modules).

I think it's useful to include the options from the mapper, which I can access like so on my machine:

```
$ /usr/lib/gcc/x86_64-linux-gnu/11/g++-mapper-server --help
Usage: g++-mapper-server [OPTION...] [CONNECTION] [MAPPINGS...] 

C++ Module Mapper.

  -a, --accept     Netmask to accept from
  -f, --fallback   Use fallback for missing mappings
  -h, --help       Print this help, then exit
  -n, --noisy      Print progress messages
  -1, --one        One connection and then exit
  -r, --root DIR   Root compiled module directory
  -s, --sequential Process connections sequentially
  -v, --version    Print version number, then exit
Send SIGTERM(15) to terminate

For bug reporting instructions, please see:
```
