% Open a specific file, then read it as a binary file.
filename = "PR100/estate5m-01.rtr";
fid = fopen(filename);
% --- EXPERIMENTAL ---
data = fread(fid, [512, Inf], "uint16");
fclose(fid);
selection = data([1:16],[501:516]);
first = selection(1,:);
container = zeros(1, 16);
for(i = 1:14)
  container(1) = bitset(container(1), (15-i), bitget(first(1), 15-i));
endfor
for(i = 1:2)
  container(2) = bitset(container(2), (3-i), bitget(first(1), 17-i));
endfor
for(i = 1:12)
  container(2) = bitset(container(2), (15-i), bitget(first(2), 13-i));
endfor
for(i = 1:4)
  container(3) = bitset(container(3), (5-i), bitget(first(2), 17-i));
endfor
for(i = 1:10)
  container(3) = bitset(container(3), (15-i), bitget(first(3), 11-i));
endfor
printf("14-bit values: ")
bitget(container(1), [1:16])
bitget(container(2), [1:16])
bitget(container(3), [1:16])
printf("16-bit originals: ")
bitget(first(1), [1:16])
bitget(first(2), [1:16])
bitget(first(3), [1:16])
