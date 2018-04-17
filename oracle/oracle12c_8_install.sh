set -x
sudo su - oracle <<EOF
set -x
cd /stage/database/
#
./runInstaller -silent \
  -responseFile /vagrant/orainstall.rsp \
  -waitforcompletion \
  -showProgress \
  -ignoreSysPrereqs
#
EOF
#
echo "exit code: $?"
#
echo "https://docs.oracle.com/cd/A91202_01/901_doc/em.901/a88812/oui.htm#442609"
echo "0 All installations were successful"
echo "1 All installation were successful but some optional configuration tools failed"
echo "-1 At least one installation failed"
#
echo "By adding the echo commands here, exit code from ruInstaller are ignored."

exit
/*
Oracle Universal Installer, Version 12.1.0.2.0 Production
Copyright (C) 1999, 2014, Oracle. All rights reserved.

Usage:
runInstaller  [-options] [(<CommandLineVariable=Value>)*]

Where options include:
  -clusterware oracle.crs,<crs version>
        Version of Cluster ready services installed.

  -crsLocation <Path>
        Used only for cluster installs, specifies the path to the crs home location. Specifying this overrides CRS information obtained from central inventory.

  -invPtrLoc <full path of oraInst.loc>
        Unix only. To point to a different inventory location. The orainst.loc file contains:
inventory_loc=<location of central inventory>
inst_group=<>

  -jreLoc <location>
        Path where Java Runtime Environment is installed. OUI cannot be run without it.

  -logLevel <level>
        To filter log messages that have a lesser priority level than <level>. Valid options are: severe, warning, info, config, fine, finer, finest, basic, general, detailed, trace. The use of basic, general, detailed, trace is deprecated.

  -paramFile <location of file>
        Specify location of oraparam.ini file to be used by OUI.

  -responseFile <Path>
        Specifies the response file and path to use.

  -sourceLoc  <location of products.xml>
        To specify the shiphome location.

  -patchsetBugListFile <Path>
        Specifies the patchsetBugList file and path to use.

  -globalvarxml <location of the xml containing global variable definitions> OUI will pick up global variables from this location instead of stage

  -attachHome
        For attaching homes to the OUI inventory.

  -cfs
        Indicates that the Oracle home specified is on cluster file system (shared). This is mandatory when '-local' is specified so that Oracle Universal Installer can register the home appropriately into the inventory.

  -clone
        For making an Oracle Home copy match its current environment.

  -debug
        For getting the debug information from OUI.

  -deinstall
        For deinstall operations.

  -detachHome
        For detaching homes from the OUI inventory without deleting inventory directory inside Oracle home.

  -enableRollingUpgrade
        Used in cluster environment, to enable upgrade of a product on a subset of nodes (on which the product was installed).

  -executeSysPrereqs
        Execute system pre-requisite checks and exit.

  -force
        Allowing silent mode installation into a non-empty directory.

  -help
        Displays above usage.

   -ignorePatchConflicts
        Ignore all conflicts with existing interim patches during an upgrade. The conflicting interim patches are removed from the home.

  -ignoreSysPrereqs
        For ignoring the results of the system pre-requisite checks.

  -local
        Performs the operation on the local node irrespective of the cluster nodes specified.

  -printdiskusage
        Log debug information for disk usage.

  -printmemory
        Log debug information for memory usage.

  -printtime
        Log debug information for time usage.

  -record -destinationFile <Path>
        For record mode operation, information is recorded in the destination file path.

  -relink
        For performing relink actions on the oracle home
         Usage: -relink -maketargetsxml <location of maketargetsxml> [-makedepsxml <location of makedepsxml>] [name=value]

  -removeallfiles
        For removing the home directory after deinstallation of all the components.

   -removeAllPatches
        Remove all interim patches from the home

  -silent
        For silent mode operations, the inputs can be a response file or a list of command line variable value pairs.

  -updateNodeList
        For updating node list for this home in the OUI inventory.

  -waitforcompletion
        Installer will wait for completion instead of spawning the java engine and exiting.

  -suppressPreCopyScript
        Suppress the execution of precopy script.

  -acceptUntrustedCertificates
        Accept untrusted certificates from a secure site.

  -suppressPostCopyScript
        Suppress the execution of postcopy script.

  -nobackground
         Do not show background image

  -noclusterEnabled
        No cluster nodes specified.

  -noconfig
        Do not execute config tools.

  -noconsole
        For suppressing display of messages to console. Console is not allocated.

  -nowarningonremovefiles
        To disable the warning message before removal of home directory.

  -nowait
        For windows. Do not wait for user to hit Enter on the console after the task (install etc.) is complete.

  -formCluster
        To install the Oracle clusterware in order to form the cluster.

  -remotecp <Path>
        Unix specific option. Used only for cluster installs, specifies the path to the remote copy program on the local cluster node.

  -remoteshell <Path>
        Unix specific option. Used only for cluster installs, specifies the path to the remote shell program on the local cluster node.

Command Line Variables Usage
  Command line variables are specified using <name=value>; for example:
    [ session: | compName: | compName:version: ]variableName=" valueOfVariable"]

   Session/Installer variables are specified using:
          [session:]varName=value
    Ex 1: session:ORACLE_HOME_NAME="OraHome"
    Ex 2: ORACLE_HOME_NAME="OraHome"
    The lookup order is session:varName then just varName. The session prefix is used to avoid ambiguity.

   Component variables are specified using:
          [compInternalName:[Version:]]varName
    Ex 1: oracle.comp1:1.0.1:varName="VarValue"
    Ex 2: oracle.comp1:varName="VarValue"
    The lookup order is compInternalName:Version:varName, then compInternalName:varName, then just varName.

*/