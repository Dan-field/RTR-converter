% Open a specific file, then read it as a binary file.
filename = "PR100/estate5m-01.rtr";
fid = fopen(filename);
Data = fread(fid, [32, Inf], "float");
% NOTE: have not yet determined what precision to use
fclose(fid);