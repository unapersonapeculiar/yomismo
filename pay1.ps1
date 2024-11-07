# Define la URL de la imagen y la ruta donde se guardará
$imageUrl = "https://images6.alphacoders.com/685/thumb-1920-685698.jpg"
$MyWallpaper = "$env:USERPROFILE\doge.jpg"

# Descarga la imagen y la guarda en la ruta especificada
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($imageUrl, $MyWallpaper)

# Define el código C# embebido para cambiar el fondo de pantalla
$code = @'
using System.Runtime.InteropServices;
namespace Win32 {
    public class Wallpaper {
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        static extern int SystemParametersInfo (int uAction, int uParam, string lpvParam, int fuWinIni);

        public static void SetWallpaper(string thePath) {
            SystemParametersInfo(20, 0, thePath, 3);
        }
    }
}
'@

# Compila el código y establece el fondo de pantalla
Add-Type $code
[Win32.Wallpaper]::SetWallpaper($MyWallpaper)
