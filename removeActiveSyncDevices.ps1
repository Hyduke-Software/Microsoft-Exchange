#https://github.com/Hyduke-Software/Microsoft-Exchange
#Compatible with Microsoft Exchange 2010, Exchange 2013
#A quick script to remove all ActiveSync devices assigned to the user

$user = read-host "Enter e-mail address of user assigned to the devices to remove" 
$devguids = Get-ActiveSyncDeviceStatistics -mailbox $user

foreach ($Guid in $devguids){

$gstring  = [string]$Guid.Guid
#write-host $Guid.Guid
remove-activesyncdevice $gstring

}
#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Last update: 19/01/2019
