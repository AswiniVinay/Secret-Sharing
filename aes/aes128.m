clc;
clear all;
% plaintexthex of 16 bytes of data
plaintexthex=["00";"11";"22";"33";"44";"55";"66";"77";"88";"99";"aa";"bb";"cc";"dd";"ee";"ff"];
plaintext=hex2dec(plaintexthex); % plaintext in decimal

%key scheduling

keyhex=["00";"31";"22";"33";"44";"55";"66";"77";"88";"99";"aa";"cb";"cf";"ad";"ee";"0f"];
key=hex2dec(keyhex);
rndkeys128=zeros(11,16); % generate matix of 176 to store keys for each round
rndkeys128(1,:)=key; %% key generation in Row Major Order initial key being the first row
for i=1:10
  rndkeys128(i+1,:)=key_schedule(rndkeys128(i,:),i);
endfor

%Initial round
addRoundKey=bitxor(plaintext,key);

% 9 rounds for AES
for r=1:1
  substititeBytes=sbox(addRoundKey); % data present in a column
  shiftRowsResult=shiftrows(substititeBytes'); %% take data in 1 row 
  mixCol=mixcolumns(shiftRowsResult)
  newKey=rndkeys128(r+1,:);
  addRoundKey=bitxor(newKey,mixCol);
endfor

%10th round
  substititeBytes=sbox(addRoundKey);
  shiftRowsResult=shiftrows(substititeBytes');
  %mixCol=mixcolumns(shiftRowsResult);
  newKey=rndkeys128(r+1,:);
  addRoundKey=bitxor(newKey,shiftRowsResult);
  
  %%% Encrypted Text
  encryped=addRoundKey; %% data in decimal
  encrypedHex=dec2hex(encryped)
  
  %%% hex2dec converts row into column data