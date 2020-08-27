#https://github.com/Hyduke-Software/Microsoft-Exchange
#This script lists all of the PS1 files in current directory
#And gives gives a numerical prompt to run each script

$fileNames = Get-ChildItem |Select-Object name -ExpandProperty name #reads the files in the current directory

$fileNameArray = New-Object -TypeName "System.Collections.ArrayList"
$fileNameArray = [System.Collections.ArrayList]@()

ForEach ($file in $fileNames) {
#Finds the last four characters of file name to find the extension .ps1

  $extension = $file.Substring($file.Length - 4)
    if ($extension -eq ".ps1"){
                    [void]$fileNameArray.Add($file)               
     }
}

$count = $fileNameArray.count -1
For ($i=0; $i -le $count; $i++) {
    write-host $i $fileNameArray[$i]
}
$command = read-host "Enter number to run script"

if ($command -gt $count -or $command -lt 0){
    write-host "Error 69! Command number invalid"
    break
}
$selectedCommand = $fileNameArray[$command]
Invoke-Expression ".\$selectedCommand"

#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
#INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
#PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
#FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
#ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Last update: 27/08/20
