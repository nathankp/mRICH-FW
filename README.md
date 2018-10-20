HMB
----------
DESCRIPTION:
This project contains spartan6 FPGA VHDL firmware for the SCROD REVA5 and HMB daughtercard (which uses lx9 Spartan6). Each board 
has an ISE project which can be found in their corresponding sub-directories. Scripts to configure and test the boards and 
their firmwarecan be found in the scripts/ folder. 

For more informatation on how to use the scripts see the Resources section of mRICH site: 
https://www.phys.hawaii.edu/~idlab/taskAndSchedule/HI_muBeamline/HMB.html

PROJECT STATUS: 
  - Work in progress: 
  - Fixing ethernet module (needs to be added to repo)
  - Integrating ByteLine protocol (needs to be added to repo)
  - PMT board firmware (needs to be added to repo)
  
PROJECT CONTRIBUTORS:
+ Gary Varner ~ Varner@phys.hawaii.edu | varner@hawaii.edu | gsvarner@gmail.com
+ Emily Lum (Ethernet Module) ~ emilyolum@gmail.com
+ Nathan Park (Byte Link Integration, version control) ~ nathankp@hawaii.edu
+ Dawei Yang (PMT FW) ~ yangdawe@hawaii.edu
 
*Coming Soon: Implementation Instructions and Debugging Information*


                     *VERSION CONTROL POLICY*
To access project from nathankp's online repo, please fork into your own github account and clone into your local repo.
To contribute to the project, submit a pull request. DO NOT PUSH TO THE REMOTE MASTER UNTIL CHANGES HAVE BEEN APPROVED!

COMMITTING CHANGES:   
When you reach a logical stopping point (i.e. when you made functional changes) it's time to commit your changes. 
Commit allows you to save a snapshot of your project. It allows you to create check points that you can return
to if you get stuck. 
	Here's how you commit in git bash: 
		1. stage your changes inwith "git add ." 
		2. then commit in git: 
		        - If you are making small changes use "git commit -m <Short message>" (see next section) 
			- When you made a big change or a lot of changes: use "git commit " 
			  and add a full commit message (see next section) 
COMMIT MESSAGES:
 - Short messages: Capitalize first word in message. Make an action statement (ex. "Fix syntax errors")
 - Full messages: Below is a suggested template for commit messages. Following this template will make 
   it easier to document revisions and retrace steps. 
  
  {Message Template} 
  ----------------------------------------------
   <Insert commit title here>
   <Author>
   Changes:
      - <Filename> <List Changes>

   Issues addressed by changes:
      + <Issue/need>: <explanation>

   Comments:
    <Describe remaining issues and bugs>
    <List activities other than development (i.e. Hardware tests, simulation, hardware design, documentation)>
   ---------------------------------------------
   You can add this template to your ~/.gitconfig use it with all commit messages automatically:     
      1. (git bash) vim ~/.gitconfig
	    2. (in vim or other txt editor add the following lines, then exit) 
	       [commit] 
	   	   template = ~/.gitmessage
	    3. create the file ~/.gitmessage with vim 
		     (git bash) vim ~/.gitmessage 
	    4. (in vim copy template, replace <Author> with your name, then exit)
	    5. ALL DONE! 
*************************************************************************************************************
