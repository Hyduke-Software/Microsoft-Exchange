$count =0
$mailboxname = read-host "Enter username"
$mailbox = get-mailbox $mailboxname
if ($mailbox -eq $null)
{
  write-host "Invalid mailbox"
  exit
}

if ($mailbox.acceptmessagesonlyfrom -ne $null)
{
  write-host "Message block is in place"
 }
elseif ($mailbox.HiddenFromAddressListsEnabled -eq $true)
{
  write-host "Mailbox hidden in GAL"
$optionone = read-host "unhide mailbox? yes/no"
if($optionone -eq "yes"){

  set-mailbox $mailboxname -AcceptMessagesOnlyFrom $null
  set-mailbox $mailboxname -hiddenfromaddresslistsenabled $false
  set-mailbox $mailboxname -hiddenfromaddresslistsenabled $false

} 
}


$anonperm = get-mailboxfolderpermission $mailbox -user anonymous

if($anonperm.AccessRights -ne 'None'){
write-host "WARNING: Anonymous has "$anonperm.AccessRights " permission to this mailbox" -foregroundcolor Red
$optiontwo = read-host "remove anonymous permission from mailbox? yes/no"

if($optiontwo -eq "yes"){

  set-mailboxfolderpermission $mailbox -user Anonymous -accessrights None
write-host "removed permission" -Foregroundcolor Green
}
}


$defaultperm = get-mailboxfolderpermission $mailbox -user default

if($defaultperm.AccessRights -ne 'None'){
write-host "WARNING: Anonymous has "$defaultperm.AccessRights "permission to this mailbox" -foregroundcolor Red

$optionthree = read-host "remove default permission from mailbox? yes/no"
if($optionthree -eq "yes"){

set-mailboxfolderpermission $mailbox -user Default -accessrights None
write-host "removed permission" -Foregroundcolor Green
}


}
write-host "Mailbox check complete."


#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Last update: 23/01/2020
