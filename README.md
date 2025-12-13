# wordpack
a collection of programs that automatically makes word-related long videos  
  
there are currently 5 programs:  
1. wordrestarter, which builds a "but every next word restarts" version of your selected video  
2. wordlooper, which builds a "but every repeated word loops back to its last use" version of your selected video  
3. wordplayer, which builds a "but every next word plays a video" version of your selected video
4. firstword, which builds a "but every repeated word loops to its first use" video
5. lastwordrestarts, which builds a "but every word goes to its last use and restarts" video
  
wordplayer currently has a bug where if you don't get two videos with the same audio sample rate, it breaks, so make sure that they're not different
## REQUIREMENTS  
ffmpeg and lua  
the cmd version already has lua, so you don't need to install it yourself. just remember to replace "lua" with "lua.exe" when running one of the programs  
you can find out how to install them by googling something like "how to install ffmpeg in windows", if you don't have them  
  
## HOW TO INSTALL WORDPACK  
first, click the green code button and then click "download zip"  
then, extract the zip file  
optionally, remove the versions that you're not gonna use -- bash if you're using windows, or cmd if you're using linux/macOs 

## HOW TO LAUNCH ANY PROGRAM

### for cmd (windows)  
  
open the cmd terminal (try searching console or terminal in the search bar)  
change the directory to your chosen program, like wordrestarter, using "cd path/to/wordrestarter-cmd" (replace with your actual directory!)  
type "lua main.lua" or "lua.exe main.lua"  
  
### for bash (macOs, linux)  
  
open the bash terminal (probably your default terminal)  
change the directory to your chosen program, like wordrestarter, using "cd path/to/wordrestarter-bash" (replace with your actual directory!)   
type "lua main.lua"  

## HOW TO USE THE PROGRAMS

every program requires **matching video and word-by-word .srt caption files with no overlapping words** INSIDE their folder.  
wordplayer also needs an extra video; the one that will be played when a word is said  
if you have a video, but no captions, you can follow these 2 approaches:  
1. manually make the subtitles in a editor, like **[Aegisub](https://aegisub.org/)**
2. automatically make subtitles using a program like **[Buzz](https://github.com/chidiwilliams/buzz/releases)**, then, for maximum accuracy, fix the mistakes with an editor  
  
in wordrestarter and wordlooper, you can test them by **typing abq.mp4, and then abq.srt**  
in wordplayer, you **use eykiw.mp4, then eykiw.srt, and finally, test.mp4**
