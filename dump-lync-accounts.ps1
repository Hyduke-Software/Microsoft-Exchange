#https://github.com/Hyduke-Software/Microsoft-Exchange
#Compatible with Lync Server 2013

#This will export Lync user, CAP (Common Area Phones) and Response Group telephone numbers
#into files userExtensions.csv, responseGroupexts.csv & CAPuserExtensions.csv


Get-Csuser |select-object name, LineUri|export-csv -path userExtensions.csv
write-host "created userExtensions.csv" -foregroundcolor DarkMagenta

Get-CsRgsWorkflow |select-object name, LineUri|export-csv -path responseGroupexts.csv
write-host "created responsegroupexts.csv" -foregroundcolor Yellow

get-cscommonareaphone|select-object name, LineUri|export-csv -path CAPuserExtensions.csv
write-host "created CAPuserExtensions.csv" -foregroundcolor Red

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
