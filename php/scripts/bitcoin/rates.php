<?php
	$jsonurl = "https://bitmarket.eu/api/ticker";
	$json = file_get_contents($jsonurl,0,null,null);
	$json_output = json_decode($json);
?>


<html>
	<head>
		<title>BTC rates</title>
		<meta http-equiv="refresh" content="60">
	</head>
	<body>
	
		<h1>BTC rates</h1>
			<h2>Bitcoin BTC/USD rates from BitMarket.eu API</h2>
			<table>
				<tr>
					<th>Buy</th>
					<td><?php echo $json_output->currencies->USD->buy; ?></td>
				</tr>
				<tr>
					<th>Sell</th>
					<td><?php echo $json_output->currencies->USD->sell; ?></td>
				</tr>
				<tr>
					<th>Last</th>
					<td><?php echo $json_output->currencies->USD->last; ?></td>
				</tr>
				<tr>
					<th>Vol</th>
					<td><?php echo $json_output->vol; ?></td>
				</tr>
			</table>

			<h2>Bitcoin BTC/EUR rates from BitMarket.eu API</h2>
			<table>
				<tr>
					<th>Buy</th>
					<td><?php echo $json_output->currencies->EUR->buy; ?></td>
				</tr>
				<tr>
					<th>Sell</th>
					<td><?php echo $json_output->currencies->EUR->sell; ?></td>
				</tr>
				<tr>
					<th>Last</th>
					<td><?php echo $json_output->currencies->EUR->last; ?></td>
				</tr>
				<tr>
					<th>Vol</th>
					<td><?php echo $json_output->vol; ?></td>
				</tr>
			</table>

<br/>
<br/>

Feel free to give BTC @ 1MDzyfk4s2KzY1N5VybfDNRDQucrBZoMA5
	</body>
</html>
