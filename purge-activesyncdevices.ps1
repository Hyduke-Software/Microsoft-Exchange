#Tool for removing ALL activesync devices attached to a user, such as Windows Phones, Android tablets and iPads
#Compatible with Microsoft Exchange 2010

Write-host "This will remove ALL ActiveSync devices the users has assigned" -foregroundcolor DarkMagenta
$user = read-host "Enter e-mail address of user to remove all ActiveSync devices" 

$devguids = Get-ActiveSyncDeviceStatistics -mailbox $user

foreach ($Guid in $devguids){

$gstring  = [string]$Guid.Guid
remove-activesyncdevice $gstring

}
#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Last update: 26/06/2019
#Hyduke-Software.net 2019