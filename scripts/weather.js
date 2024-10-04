var KEY="4b419e6478ef4f97a4fbf4435647c4a7";
var normalURL="https://devapi.qweather.com/v7/weather/now?";
var geoURL="https://geoapi.qweather.com/v2/city/lookup?";

var location=null;

process.stdin.setEncoding('utf8');
console.log("input city name：");

/*
 * 在Node.js中，process.stdin是一个 Readable 类型的流（stream），它继承自 EventEmitter 类。EventEmitter 类是Node.js中事件驱动编程的核心，它提供了许多用于注册事件监听器和触发事件的方法，其中包括 .on() 方法。
 * 因此，在 process.stdin 上调用 .on() 方法时，实际上是使用了 EventEmitter 类提供的方法。.on() 方法允许绑定事件监听器，能够在相应的事件发生时执行相应的处理逻辑。
 * on: 为指定事件注册一个监听器，接受一个字符串 event 和一个回调函数 listener。
 */

function getGeo(url){
    return fetch(url)
    .then(res=>{
        if(res.status=='200'){
            return res.json();
        }
        else{
            throw new Error('Location Not Found');
        }
    })
    .then((data)=>{
        location=data.location[0].id;
        //console.log(location);
        console.log("Selected city:",data.location[0].name)
    })
    .catch((err)=>{
        console.log(err.message)
    })
}

function getClimate(url){
    fetch(url)
    .then(res=>{
        if(res.status=='200'){
            return res.json();
        }
        else{
            throw new Error('Weather get ERROR!');
        }
    })
    .then((data)=>{
        console.log('updateTime: ',data.updateTime);
        data=data.now;
        console.log(
            'Temperature: ',data.temp+"℃",
            '\nFeels Like(体感): ',data.feelsLike+"℃",
            '\nWeather: ',data.text,
            '\nWind Direction: ',data.windDir,
            '\nWind Speed: ',data.windSpeed,
            '\nHumidity(湿度): ',data.humidity,
            '\nPressure: ',data.pressure+"kPa",
            '\nVisibility(空气可见度): ',data.vis+"km",
            '\nCloud(云量百分比): ',data.cloud+"%",
        )
    })
    .catch((err)=>{
        console.log(err.message)
    })
}

process.stdin.on('readable', () => {
    //readable 事件触发时，调用 process.stdin.read() 方法读取输入的内容
    var chunk = process.stdin.read();
    if (chunk !== null) {
        // process.stdout.write(`data: ${chunk}`);
        var city=chunk.trim();
        var url1=geoURL+"location="+city+"&key="+KEY;


        getGeo(url1)
        .then(()=>{
            console.log('cityId: ',location);
            var url2=normalURL+"location="+location+"&key="+KEY;
            getClimate(url2);
        })
    }
});
