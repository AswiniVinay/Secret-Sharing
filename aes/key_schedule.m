function [result] = key_schedule(round_key_128, round)
% take the 1-D key array as input and scatter it among 4 words of 1D 
    rcon = [1, 2, 4, 8, 16, 32, 64, 128, 27, 54];
	w0 = round_key_128(1:4);
	w1 = round_key_128(5:8);
	w2 = round_key_128(9:12);
	w3 = round_key_128(13:16); 

    % 1st new column: row by row (4)
    % calculations using Rcon 
    % Generate Rot word and calculate the first 4 keys (1:4) 
    result(1) = bitxor(bitxor(sbox(w3(2)), w0(1)), rcon(round));
    result(2) = bitxor(sbox(w3(3)), w0(2));
    result(3) = bitxor(sbox(w3(4)), w0(3));
    result(4) = bitxor(sbox(w3(1)), w0(4));
    % generate other 5-16 keys and store it it 1D array of key schedule
    result(5:8)   = bitxor(result(1:4), w1);
    result(9:12)  = bitxor(result(5:8), w2);
    result(13:16) = bitxor(result(9:12), w3);

end



