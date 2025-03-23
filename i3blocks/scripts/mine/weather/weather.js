const fs = require('fs');
const path = require('path');

// 导入配置文件
const config = require('./config');

// 构建API请求URL
const location = config.defaultLocation;
const locationCode = config.locations[location];
const url = `${config.apiBase}?location=${locationCode}&key=${config.KEY}&lang=${config.lang}`;

// 定义存储文件路径
const dataFilePath = path.join(__dirname, config.dataFileName);

// 读取保存的天气数据
function readSavedWeatherData() {
  try {
    if (fs.existsSync(dataFilePath)) {
      const data = fs.readFileSync(dataFilePath, 'utf8');
      return JSON.parse(data);
    }
  } catch (error) {
    console.log('loadDataErr');
  }
  return null;
}

// 保存天气数据到文件
function saveWeatherData(data) {
  try {
    fs.writeFileSync(dataFilePath, JSON.stringify(data), 'utf8');
  } catch (error) {
    console.log('saveDataErr');
  }
}

// 获取并显示天气信息
function displayWeatherInfo(data, flg) {
  if (flg === 'fetch') {
    console.log(`${data.now.text}(${data.now.temp}°C)`);
  } else {
    // current time
    const now = new Date();
    // expired time
    const expiredTime = new Date(data.updateTime);
    // minutes
    const minutes = expiredTime.getHours() - now.getHours();
    console.log(`${data.now.text}(${data.now.temp}°C, ${minutes}h ago)`);
  }
}

fetch(url)
  .then(response => response.json())
  .then(data => {

    if (data.code === '200') {
      // 保存获取到的数据
      saveWeatherData(data);
      // 显示天气信息
      displayWeatherInfo(data, 'fetch');
    } else {
      throw new Error('cant fetch weather data');
    }
  })
  .catch(error => {

    const savedData = readSavedWeatherData();
    if (savedData) {
      displayWeatherInfo(savedData, 'saved');
    }
    else {
      console.log('NoSavedData');
    }
  });

/*
{
  "code": "200",
  "updateTime": "2020-06-30T22:00+08:00",
  "fxLink": "http://hfx.link/2ax1",
  "now": {
    "obsTime": "2020-06-30T21:40+08:00",
    "temp": "24",
    "feelsLike": "26",
    "icon": "101",
    "text": "多云",
    "wind360": "123",
    "windDir": "东南风",
    "windScale": "1",
    "windSpeed": "3",
    "humidity": "72",
    "precip": "0.0",
    "pressure": "1003",
    "vis": "16",
    "cloud": "10",
    "dew": "21"
  },
  "refer": {
    "sources": [
      "QWeather",
      "NMC",
      "ECMWF"
    ],
    "license": [
      "QWeather Developers License"
    ]
  }
}
*/ 