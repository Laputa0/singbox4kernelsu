import { exec } from 'kernelsu';

const { errno, stdout, stderr } = await exec('uname -a');

if (errno === 0){
    document.getElementById('p1').innerHTML = stdout;
}
