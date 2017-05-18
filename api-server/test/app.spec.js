var assert = require('assert');

describe("API Server tests", () => {
	it("should run a simple test", () => {
		assert.equal(-1, [1,2,3].indexOf(4));
	});
});