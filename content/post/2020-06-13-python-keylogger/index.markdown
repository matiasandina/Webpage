---
title: Python Keylogger 
subtitle: 
date: 2020-06-13
author: "Matias Andina"
tags: ["fun", "python"]
mathjax: true
---

I have been struggling a lot with pain in my fingers and wrists.
I have tried setting up timers for using the keyboard. 
But the only thing that seems to work is reducing the typing (aka get away from the computer and stop using the keyboard!).

Tracking hours didn't work well, so I guess a last resort to force me is counting the actual number of keys per day and trying to keep that to a minimum.

After a little google searching, I found inspiration on this post: [Design a Keylogger in Python](https://www.tutorialspoint.com/design-a-keylogger-in-python). 

I wanted something **simple**. Just count and save to file, in case future me wants to do some sort of analysis. Nothing fancy, no optimization. Most importantly something I can trust is not sending every keystroke I write over the internets.

> I will be using pynput library

You can read the [pynput docs here](https://pynput.readthedocs.io/en/latest/keyboard.html).

Of note, `pip3 install pynput` failed. If only python made it possible for people to install things ... 🤷

Anyway, mystery aside, `python -m pip install pynput` worked. I kind of trust (read blind faith) this library is safe enough. And my passwords are kinda there scrambled somewhere in the text file but I don't plan to host the file anywhere so it's reasonably safe (please don't get remote access to my computer 🙏).

The output to console (again, keep it simple) looks like this

```
Today is 2020-06-11 and the key count is: 0
...
Today is 2020-06-11 and the key count is: 12000
Today is a brand new day :)
Today is 2020-06-12 and the key count is: 0
Today is 2020-06-12 and the key count is: 1000
Today is 2020-06-12 and the key count is: 2000
...
Today is 2020-06-12 and the key count is: 13000
Today is a brand new day :)
Today is 2020-06-13 and the key count is: 0
Today is 2020-06-13 and the key count is: 1000
Today is 2020-06-13 and the key count is: 2000
```

For those of you who want to use it, you can find the code below the shameless plug.

***

<!--html_preserve--><blockquote>
<p>I write fiction and non-fiction.<br/>
I write open-source software.<br/>
I create generative art.  </p>

<p>All of these are available for free in different media.
If you like what I do, and want me to keep creating, you can contribute using the links below.</p>
</blockquote>
<!--/html_preserve--><!--html_preserve--><table style="width:100%">
  <tr>
  <th>Patreon</th>
  <td>
  <a href="https://www.patreon.com/bePatron?u=25827926" data-patreon-widget-type="become-patron-button">Become a Patron!</a><script async src="https://c6.patreon.com/becomePatronButton.bundle.js"></script>
  </td>
  <tr>
    <td>
    </td>
  </tr>
  <tr>
  <th>Paypal</th>
  <td>
  <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_donations" />
<input type="hidden" name="business" value="BWWTTZ2XSDAZ8" />
<input type="hidden" name="currency_code" value="USD" />
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" />
</form>

  </td>
  </tr>
</table>
<!--/html_preserve-->

***

```python
from pynput.keyboard import Key, Listener
import logging
import os
import datetime

# log_dir defaults to Desktop
log_dir = '/home/matias/Desktop'
# updates every 100 keystrokes
update_every = 1000
day_count = 0
today = datetime.date.today().isoformat()
   
def on_press(key):
	logging.info(str(key))

def key_count(key):
	global today, day_count, update_every
	if today == datetime.date.today().isoformat():
		if day_count % update_every == 0:
			print(f"Today is {today} and the key count is: {day_count}")
		# always update the counter
		day_count = day_count + 1
	else:
		# update today's value
		today = datetime.date.today().isoformat()
		print("Today is a brand new day :)")
		# reset the counter
		day_count = 0
	return

def main():
	logging.basicConfig(filename = (os.path.join(log_dir, "keylog.txt")),
	 level=logging.DEBUG,
	 format='%(asctime)s: %(message)s')
	with Listener(
		on_press=on_press,
		on_release=key_count) as listener:
		listener.join()

if __name__ == '__main__':
	print("Starting keylogger")
	main()
```
