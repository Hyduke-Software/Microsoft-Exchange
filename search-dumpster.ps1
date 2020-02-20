#https://github.com/Hyduke-Software/Microsoft-Exchange
#Compatible with Microsoft Exchange 2010

#This script will search a user's deleted items 'dumpster' and copy to another mailbox for the purposes of extracting.
#The search-mailbox cmdlet does not allow copying the same mailbox that the results are copied into.
#Can be used in place of performing a mailbox restore from back-up tapes when time critical.

write-host "Script to search a mailbox dumpster and copy to another." -foregroundcolor darkyellow
$user = read-host "Enter mailbox to search dumpster"
$restorebox = read-host "Enter mailbox to copy items into"
write-host "Will copy to folder called DELETED-RESTORE" -FOREGROUNDCOLOR YELLOW
Search-Mailbox -IncludeUnsearchableItems -SearchDumpsterOnly -LogLevel full -TargetMailbox $restorebox -TargetFolder DELETED-RESTORE -Identity $user

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Last update: 20/02/20
