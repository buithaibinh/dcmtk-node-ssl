const util = require('util');
const exec = util.promisify(require('child_process').exec);

(async () => {
  // test storescu command
  const { stdout, stderr } = await exec('storescu');
  console.log('stdout:', stdout);
  console.error('stderr:', stderr);
})();
