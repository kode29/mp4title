# MP4Title
After realizing that many video systems read the MP4 *title* tag and represent that as a filename, I wanted to update the title tag to reflect what I was looking at (instead of countless *title00* files).

After searching and searching for a script that I could use to automatically run through a series of folders that contained MP4 videos, and realized that I needed to create one, I did.

This uses **mp4v2-utils** to access and set the MP4 metadata

## Usage
Files are set up like this:
* **Filename:** Burn Notice 01 Pilot.mp4
* **MP4 (album) title:* title00

Place it in your root folder of your videos, and let it run.

`./mp4title.sh`

If the *title* of the mp4 file is the same as the filename, it will skip it.
