% POE


% SDH
q1 = 0; q2 = 0; q3 = 0; q4 = 0; q5 = 0; q6 = 0;
s = 'Rz(q1) Tz(0.399) Ry(q2) Tz(0.448) Ry(q3) Rx(q4) Tx(0.451) Ry(q5) Tx(0.082) Rx(q6)';
dh = DHFactor(s);
cmd = dh.command('ABB');
robot = eval(cmd);

% MDH
