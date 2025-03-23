// 天气API配置
module.exports = {
  // API密钥
  KEY: "4b419e6478ef4f97a4fbf4435647c4a7",
  
  // API基础URL
  apiBase: 'https://devapi.qweather.com/v7/weather/now',
  // 付费API
  apiPro: 'https://api.qweather.com/v7/weather/now',
  // 地理API
  apiGeo: 'https://geoapi.qweather.com/v2/city/lookup',
  
  // 地点编码列表
  locations: {
    yuexi: 101220608,
    yijiang: 101220307,
    wuxi_xinwu: 101190208
  },
  
  // 默认地点
  defaultLocation: 'wuxi_xinwu',
  
  // 语言设置
  lang: 'en',
  
  // 数据文件路径（相对于脚本目录）
  dataFileName: 'weather_data.json'
}; 