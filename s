<!DOCTYPE HTML>
<html>
<head> 
  <div id="app">
    <p>
      <input type="range" id="childAge" name="childAge" min="0" max="15" onchange="updateAge(this.value)">
      <input type="range" id="savings" name="savings" min="8000" max="100000" onchange="updateSavings(this.value)">
    </p>
    <p>
      <label for="childAge">Gyermekem életkora <span id="childAgeValue">10</span>;</label>
      <label for="savings">Havi megtakarítás <span id="savingsValue">46000</span></label>
    </p>
    <p>
      <button id="calculate">SZÁMOLJUK KI!</button>
    </p>
    <div id="container"></div>
  </div>
<script type="text/javascript">

    function updateAge(val){
      document.getElementById('childAgeValue').innerText = val;
    }
    
    function updateSavings(val){
      document.getElementById('savingsValue').innerText = val;
    }
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title:{
		text: "Megtakarítás folyamata",
		fontFamily: "arial black",
		fontColor: "#695A42"
	},
	axisX: {
		interval: 1,
		intervalType: "év"
	},
	axisY:{
		valueFormatString:"# millió Ft",
		gridColor: "#B6B1A8",
		tickColor: "#B6B1A8"
	},
	toolTip: {
		shared: true,
		content: toolTipContent
	},
	data: [
		{        
			type: "stackedColumn",
			showInLegend: true,
			name: "Befizetett összeg",
			color: "green",
			dataPoints: [
				{ y: 7.28, x: new Date(2010,0) },
				{ y: 9.72, x: new Date(2011,0) },
				{ y: 13.30, x: new Date(2012,0) },
				{ y: 14.9, x: new Date(2013,0) },
				{ y: 18.10, x: new Date(2014,0) },
				{ y: 18.68, x: new Date(2015,0) },
				{ y: 22.45, x: new Date(2016,0) }
			]
		},
		{        
			type: "stackedColumn",
			showInLegend: true,
			name: "Hozam",
			color: "lightgreen",
			dataPoints: [
				{ y: 8.44, x: new Date(2010,0) },
				{ y: 10.58, x: new Date(2011,0) },
				{ y: 14.41, x: new Date(2012,0) },
				{ y: 16.86, x: new Date(2013,0) },
				{ y: 10.64, x: new Date(2014,0) },
				{ y: 21.32, x: new Date(2015,0) },
				{ y: 26.06, x: new Date(2016,0) }
			]
	}]
});
chart.render();

function toolTipContent(e) {
	var str = "";
	var total = 0;
	var str2, str3;
	for (var i = 0; i < e.entries.length; i++){
		var  str1 = "<span style= \"color:"+e.entries[i].dataSeries.color + "\"> "+e.entries[i].dataSeries.name+"</span>: <strong>"+e.entries[i].dataPoint.y+"</strong> millió Ft<br/>";
		total = e.entries[i].dataPoint.y + total;
		str = str.concat(str1);
	}
	str2 = "<span style = \"color:DodgerBlue;\"><strong>"+(e.entries[0].dataPoint.x).getFullYear()+"</strong></span><br/>";
	total = Math.round(total * 100) / 100;
	str3 = "<span style = \"color:Tomato\">Összeg:</span><strong> "+total+"</strong> millió Ft<br/>";
	return (str2.concat(str)).concat(str3);
}

}
</script>
</head>
<body>
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>
