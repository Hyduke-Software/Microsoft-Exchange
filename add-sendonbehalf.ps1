#https://github.com/Hyduke-Software/Microsoft-Exchange
#Compatible with Microsoft Exchange 2010


# adds the send on behalf of permission for multiple users to multiple mailboxes
# two text files are required for this to run
# users.txt; containing a list of user's identity such as display name or username
# mailbox.txt; containing a list of mailbox idendities
# all users receive permission to all mailboxes in the files.


$userlist = gc .\users.txt
$mblist = gc .\mailbox.txt

foreach ($mb in $mblist)
{
 foreach ($user in $userlist)
  {
    set-mailbox $mb -grantsendonbehalfto @{add="$user"}
  }
}

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Last update: 26/06/2019
