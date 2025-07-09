"""
每日一句
[
  {
    "q": "Duty makes us do things well, but love makes us do them beautifully.  ",
    "a": "Zig Ziglar",
    "h": "\u003Cblockquote\u003E&ldquo;Duty makes us do things well, but love makes us do them beautifully.  &rdquo; &mdash; \u003Cfooter\u003EZig Ziglar\u003C/footer\u003E\u003C/blockquote\u003E"
  }
]
"""

import requests
import os

DALIY_WORD_API = "https://zenquotes.io/api/today"
def call_api():
    url = DALIY_WORD_API
    response = requests.get(url)
    return response.json()[0]

def call_dunst():
    """
    调用 dunst 显示通知
    """
    data = call_api()
    content = data['q']
    author = data['a']
    
    # 这样会引起'中转义的崩溃
    # os.system(f"notify-send -t 20000 'Daily Sentence' '{content} ({author})'")

    command = f'notify-send -t 20000 "Daily Sentence" "{content} ({author})"'
    # print(command)
    os.system(command)

call_dunst()
