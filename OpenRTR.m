% Open a specific file, then read it as a binary file.
filename = "PR100/estate5m-01.rtr";
fid = fopen(filename);
% --- EXPERIMENTAL ---
Data = fread(fid, [512, Inf], "uint16");
fclose(fid);
Selection = reshape(dec2hex(Data([1:16],[501:516])),32,32);
% plot(Data(50,:));