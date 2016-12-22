% Open a specific file, then read it as a binary file.
filename = "PR100/estate5m-01.rtr";
fid = fopen(filename);
% --- EXPERIMENTAL ---
Data = fread(fid, [512, Inf], "uint32", 1);
% result looks more like a tract if the SKIP value (4th argument) is odd
fclose(fid);
plot(Data(50,:));