<template>
	<div id="app">
		<router-view/>
		<footer>
			<ul class="ft-list">
				<li class="ft-item">
					<i class="iconfont icon-home"></i>
					<span>关注</span>
				</li>
				<li class="ft-item">
					<i class="iconfont icon-home"></i>
					<span>关注</span>
				</li>
				<li class="ft-item ft-add">
					<div>不一样</div>
				</li>
				<li class="ft-item">
					<i class="iconfont icon-home"></i>
					<span>关注</span>
				</li>
				<li class="ft-item">
					<i class="iconfont icon-home"></i>
					<span>关注</span>
				</li>
			</ul>
		</footer>
	</div>
</template>

<script>
	export default {
		name: 'App'
	}
</script>

<style scoped>
	* {
		margin: 0;
		padding: 0;
		font-family: 'Avenir', Helvetica, Arial, sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
	}
	ul, li {
		list-style-type: none;
	}
	footer {
		position: absolute;
		bottom: 0;
		width: 100%;
		height: 50px;
	}
	.ft-list {
		position: relative;
		width: 100%;
		height: 100%;
		background-color: #fbfbfb;
		border-top: 1px solid rgba(0, 0, 0, 0.1);
	}
	.ft-item {
		width: 20%;
		float: left;
		text-align: center;
		line-height: 50px;
	}
</style>
