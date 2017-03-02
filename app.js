express = require('express');
app = express();

app.get("/", function(req, res) {
	res.send("UnComplex");
});

app.listen(3000, function() {
	console.log("Server started on port 3000");
});
