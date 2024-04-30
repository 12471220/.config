KEY="4b419e6478ef4f97a4fbf4435647c4a7"
wuhu=101220307
yuexi=101220608
location=wuhu
url='https://devapi.qweather.com/v7/weather/now?location='+location+'&key='+KEY+'&lang=en'
fetch(url)
.then(response => response.json())
.then(data => {
    console.log(`${data.now.text}(${data.now.temp}°C)`)
})
.catch(error=>console.log("noNetErr"))
