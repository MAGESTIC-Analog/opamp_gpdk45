# Set your environment up to work with all necessary tools and our
# design environment.
# After editing any necessary paths below, do: 
#        % source setup.csh


# Set environment variables for Cadence software

setenv CDSHOME   /vols/downloads/ICADVM18.1/ISR_released/lnx86/64/ISR8/
setenv MMSIMHOME /pscratch/fallon/tools/SPECTRE191
setenv PVEHOME   /pscratch/fallon/tools/PVS191/
setenv QRC_HOME   /pscratch/fallon/tools/EXT191/

# Set license file location for Cadence software
setenv 	CDS_LIC_FILE 	5280@rmflex01
# Set the path to the GPDK045 installation
setenv GPDK045HOME /pscratch/fallon/toIDEA_Jan2020/gpdk045_v_6_0


##################################################################
## DO NOT update any env. Variable below:
##################################################################
setenv PROJECT `pwd`
setenv GPDK045_PDK_PATH $GPDK045HOME

setenv PEX_DISTRIBUTED_GUI 1

setenv 	LM_LICENSE_FILE 	$CDS_LIC_FILE

# Not using Assura, make sure it doesn't confuse things
unsetenv ASSURAHOME
unsetenv OA_HOME
unsetenv QRC_ENABLE_EXTRACTION


# Set Artist Netlisting Mode to Analog    #
setenv 	CDS_Netlisting_Mode 	Analog

# Set these variables in case we need to troubleshoot PVS failures

# Set variables to make Linux happy
setenv 	LANG 			en_US
#setenv 	LD_ASSUME_KERNEL 	2.4.1

# Set library path
setenv	 LD_LIBRARY_PATH 	$MMSIMHOME/tools.lnx86/ultrasim/lib:$CDSHOME/tools/lib:$CDSHOME/tools/verilog/lib:/lib:/usr/lib:/usr/dt/lib:/usr/bin/X11


# Set your program search path properly ....                   
# Build up a list of all of the options.                             
set 	localPath = (. ~/bin ~/local/bin /usr/local/pvt /usr/ucb /usr/local \
		/usr/local/bin /usr/local/Public/bin /opt/Acrobat4/bin \
		/usr/lib/openoffice/program /usr/X11R6/bin )

set 	cdsPath1 = ($CDSHOME/tools.lnx86/bin \
		$CDSHOME/tools.lnx86/dfII/bin \
    $QRC_HOME/bin \
		$MMSIMHOME/tools.lnx86/bin \
                $PVEHOME/tools.lnx86/bin \
                $PVEHOME/tools.lnx86/dfII/bin )


set 	sysPath = (/usr/ucb /usr/etc /usr/openwin/bin /sbin /usr/sbin /usr/bin /bin )

# Changing the order here since pvs executable in /usr/sbin conflicts with PVE
# installation
set path = ( $localPath $cdsPath1 $sysPath )
set	PATH = ( $localPath $cdsPath1 $sysPath )

set 	filec

setenv 	history 50

virtuoso -version
spectre -version
pvs -version
qrc -version

