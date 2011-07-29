# Run MacVim Test in iTerm #

The best way to use this script is to hook it up to a hot key.  
When executed, it will provide you with a list of possible tests to run  
from the file you have highlighted in MacVim.  

There are many shortcut managers but the one I currently use is [Spark](http://www.macupdate.com/app/mac/14352/spark)  
  
Current setup - change the path to match where you put the files.  
![Spark Setup](http://allancraig.net/personal/spark_setup.png "Spark Setup")

# RSpec and Cucumber Files
If the file is a Cucumber file, then all the Scenarios will be in the  
list of choices along with a default "Run'em All!" that will execute  
the entire file.  
  
![Choosing Available Tests](http://allancraig.net/personal/choose_from_tests.png)

# iTerm
The iTerm tab and session used is the one that is currently visible.

# Terminal #

There is a file "macvim_to_terminal.applescript" that I should get you started if you  
use Terminal. When I get a chance, I will add this functionality but it may not be very  
soon since I rarely use Terminal outside of Visor.

# License #

BSD