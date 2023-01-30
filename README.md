# Firewall-Executable-Blocker

**What it does:**

This batch script will automatically block executables from acessing the internet.<br>
It automatically detects .exe files in the same directory you run it from and its subdirectories.<br>
It will add rules to the windows firewall with the .exe name, blocking outbound and inbound connections.<br>

Example:

If I run the script in ```c:\users\<yourusernamehere\downloads``` it will automatically block any .exe it finds in this directory and subdirectories.
So if you have **any other folder inside downloads** any .exe inside it will also be blocked
