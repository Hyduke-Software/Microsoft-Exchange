#https://github.com/Hyduke-Software/Microsoft-Exchange
#Compatible with Microsoft Exchange 2010
#A quick script to reconnect the LinkedMasterAccount on a mailbox for 2 domain environments
#The default archivewarningquota & archivequota values can be changed below


$linkedDomainAccount = "####\"+$uid                                  # Replace #### with the linked domain
$mailDomainAccount ="####\"+$uid                                     # Replace #### with your mail domain
$linkeddomaincontroller = 'linked.domain.controller'                 # Replace with your linked domain FQDN

##############################################################################################################
$db = read-host -prompt "Enter Database"
$uid =read-host -prompt "Enter Username"
clean-mailboxdatabase $db
$creds = get-credentials
$displayname = read-host -prompt "enter displayname"

Connect-Mailbox -identity $displayname -Database $db -User $mailDomainAccount -Alias $UID -LinkedMasterAccount $legacyDomain -LinkedDomainController $linkeddomaincontroller -LinkedCredential $creds

clean-mailboxdatabase $db
$archiveid = "personal archive - "+$displayname 
connect-mailbox -user $uid -archive -database $db -identity $archiveid



set-mailbox -identity $uid -archivewarningquota 2764MB -archivequota 3072MB
Set-CASMailbox $uid -ActiveSyncEnabled:$true -ImapEnabled:$False -PopEnabled:$false
Set-Mailbox $uid -SingleItemRecoveryEnabled $true -UseDatabaseRetentiondefaults $true
