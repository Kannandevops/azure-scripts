$BASE_DIR='C:\'

$sourceFile = '\\jda-hmm\c$\AutoScripts.zip'

$targetFolder = $BASE_DIR + 'BuildConfiguration'

[System.Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem')

[System.IO.Compression.ZipFile]::ExtractToDirectory($sourceFile, $targetFolder)


$ddMMyyyy=(Get-Date).ToString('dd-MM-yyyy');

$MASTER_LOG_FILE=$BASE_DIR + "\BuildConfiguration\output" + "Master_Log-"+$ddMMyyyy +".log"

write-output "$(get-date) : initiating the configuration updates " | out-file $MASTER_LOG_FILE -Append -Force;  

cd $BASE_DIR"\BuildConfiguration"

.\configurationupdates.ps1

write-output "$(get-date) : Starting the IIS reset  " | out-file $MASTER_LOG_FILE -Append -Force;  

cd $BASE_DIR"\BuildConfiguration"

.\IISRESTART.ps1

write-output "$(get-date) : Starting the tomcat reset  " | out-file $MASTER_LOG_FILE -Append -Force;  

cd $BASE_DIR"\BuildConfiguration"

.\TomcatRestart.ps1