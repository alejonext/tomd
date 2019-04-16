const express = require('express');
const child = require('child_process');
const app = express();

app.all('*', (req, res) => {
	if(req.query.commands && req.query.commands.split(',').length >= 1){
		let render = child.spawn('pandoc',  req.query.commands.split(','));
		res.pipe(render.stdout);
	} else {
		return res.send('No commands');
	}
});

app.listen(process.env.PORT || 4200, () => {
  console.log(`Listening on port ${process.env.PORT || 4200}`);
});