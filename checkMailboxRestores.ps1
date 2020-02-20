#print a list of mailboxrestore requests in a more readable format
#29/01/20 todo: add a better method of tabbing to show data in a table
write-host "Display name" "`t`t" "Username" "`t" "Restore status" "`t" "Queuedtime Number items Completeness" -foregroundcolor yellow
$var = get-mailboxrestorerequest

foreach ($restore in $var){

$name = get-mailbox $restore.targetmailbox
 $color = "cyan"
if ($restore.status -eq "Failed"){
$color = "red"
}
if ($restore.status -eq "Queued"){
$color = "darkmagenta"
}
if ($restore.status -eq "InProgress"){
$color = "darkyellow"
}
if ($restore.status -eq "Completed"){
$color = "green"
}
$stats = get-mailboxrestorerequeststatistics $restore.RequestGuid -ea silentlycontinue

$user =get-mailbox $name.name
write-host $user.displayname "`t" $name.name "`t`t" $restore.status "`t" $stats.QueuedTimestamp $stats.ItemsTransferred $stats.PercentComplete "%" -foregroundcolor $color -ea silentlycontinue

}

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Last update: 20/02/2020
