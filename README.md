# Firewall-Executable-Blocker<br>

**What it does:**<br>

This batch script will automatically block executables from acessing the internet.<br>
It automatically detects programs with .exe in the same directory you run it from and its subdirectories.<br>
It will add rules to the windows firewall with the executable name, blocking outbound and inbound connections.<br>
<br>
<br>
**Example:**<br>

If I run the script in ```C:\Users\<yourusernamehere\Downloads``` it will automatically block any .exe it finds in this directory and subdirectories.<br>
So if you have **any other folder inside downloads**, the .exe inside it will also be blocked<br>
<br>
<br>
**Real use case scenario:**<br>

Razer Synapse is known for being bloatware software, if you want to block it from acessing the Internet you would do:<br>
Drop the script inside ```C:\Program Files (x86)\Razer``` and run it. It will grab any .exe it finds<br> 
Or, if you only want it to block synapse executables, you'd drop it inside ```C:\Program Files (x86)\Razer\Synapse3``` instead.
