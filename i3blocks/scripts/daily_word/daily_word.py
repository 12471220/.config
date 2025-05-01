"""
每日一句
{
    "sid": "5576", 
    "tts": "https://staticedu-wps.cache.iciba.com/audio/f992e2e073f3382a9745b4b444707c41.mp3", 
    "content": "Your dreams truly matter; pursue them with relentless passion every day.", 
    "note": "你的梦想至关重要，每天都要以不懈热情追求。", 
    "love": "0", 
    "translation": "新版每日一句", 
    "picture": "https://staticedu-wps.cache.iciba.com/image/b21466a9b69b275e7947185dfd8a3788.jpg", 
    "picture2": "https://staticedu-wps.cache.iciba.com/image/3af193239cf94b24d4f42303e303dc68.png", 
    "caption": "词霸每日一句", 
    "dateline": "2025-04-30", 
    "s_pv": "0", 
    "sp_pv": "0", 
    "fenxiang_img": "https://staticedu-wps.cache.iciba.com/image/4d429568f16ac37808126914af90b035.png", 
    "picture3": "https://staticedu-wps.cache.iciba.com/image/2975bd835b0c2278654870ee4a69dfa1.jpg", 
    "picture4": "https://staticedu-wps.cache.iciba.com/image/ebb88c491723c1ab05550dc3def64f46.jpg", 
    "tags": [ ]
}
"""

import requests
import os

DALIY_WORD_API = "https://open.iciba.com/dsapi/"
def call_api():
    url = DALIY_WORD_API
    response = requests.get(url)
    return response.json()

def call_dunst():
    """
    调用 dunst 显示通知
    """
    data = call_api()
    content = data['content']
    note = data['note']
    tts = data['tts']
    # picture = data['picture']

    os.system(f"notify-send -t 10000 '{content}' '{note}' ")
    os.system(f"ffplay -nodisp -autoexit {tts} > /dev/null 2>&1")

call_dunst()