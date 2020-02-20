#https://github.com/Hyduke-Software/Microsoft-Exchange
#Works in Exchange 2010, untested in Exchange 2013 as of January 2nd 2018
#This will find and get all mailbox databases then find the disconnected mailboxes

$filepath ="ENTER FILEPATH"
#You must enter rhe filepath you want the report saving

Get-MailboxDatabase |Get-MailboxStatistics |where {$_.disconnectreason -eq "disabled"} |ft displayname, database, legacydn|ft -AutoSize |Out-File -width 350 -FilePath $filepath
write-host "deletedmail.txt created" -foregroundcolor DarkMagenta



#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Last update: 26/06/2019
