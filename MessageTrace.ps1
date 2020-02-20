#https://github.com/Hyduke-Software/Microsoft-Exchange
#Compatible with Microsoft Exchange 2010, Exchange 2013
#A quick script to perform a message trace

$sender =read-host "Enter sender"
$recipient = read-host "enter recipient"
$start =read-host "enter start date MM/DD/YYYY"
$end  = read-host "enter end date MM/DD/YYYY"

get-transportserver|get-messagetrackinglog -recipients $recipient -sender $sender -start $start -end $end |ft timestamp, eventid, sender, messagesubject


#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Last update: 19/02/2020
