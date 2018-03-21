<template>
	<div id="chart" style="width: 300px; height: 400px;"></div>
	<ul class="list-group">
		<li class="list-group-item no-radius">
			<span class="badge">14</span>
			我的关注
		</li>
		<li class="list-group-item">
			<span class="badge">14</span>
			我的粉丝
		</li>
		<li class="list-group-item">Morbi leo risus</li>
		<li class="list-group-item">Porta ac consectetur ac</li>
		<li class="list-group-item no-radius">Vestibulum at eros</li>
	</ul>
</template>

<script type="text/ecmascript-6">
	import echarts from "../../common/js/echarts"
	export default {
	    name: "personMain"
	}
	try {
		undefined();
	} catch(err) {
	    let name = "spirit";
	    console.log(err + name);
	}
	let chart = echarts.init(document.getElementById("chart"));
	chart.setOption({
		title: {
			text: 'ECharts 入门示例'
		},
		tooltip: {},
		legend: {
			data:['销量']
		},
		xAxis: {
			data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
		},
		yAxis: {},
		series: [{
			name: '销量',
			type: 'bar',
			data: [5, 20, 36, 10, 10, 20]
		}]
	})
</script>

<style scoped>
	@import "../../assets/css/common.css";
</style>
