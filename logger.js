function banner() {
  let banner = `
  ██████      ███████     ██████      ███████     ███████     ███████     ████████      ██  ██   ██    ██      ██████      ██████      ██           ███████  
  ██   ██     ██          ██   ██     ██          ██          ██             ██          ██  ██ ██    ██      ██    ██     ██   ██     ██           ██    ██ 
  ██████      █████       ██████      ███████     █████       ██             ██           ██   ██    ██       ██    ██     ██████      ██           ██    ██ 
  ██          ██          ██   ██     ██          ██          ██             ██            ██ ██ ██ ██        ██    ██     ██   ██     ██           ██    ██ 
  ██          ███████     ██   ██     ██          ███████     ███████        ██             ██    ██           ██████      ██   ██     ████████     ███████  
                                                                                                                                                    v 2.0.0                                                                                                                                                                                                                                                                                
`;

  console.log(banner);
}


function step(msg, newLine=false) {
  let message;
  if (newLine) {
    message = `\n[*] ${msg}`; 
  } else {
    message = `[*] ${msg}`;
  }
  console.log(message);
}

function subStep(subStep){
    let message = `[-] ${subStep}`;
    console.log(message);
}

export { banner, step, subStep };
