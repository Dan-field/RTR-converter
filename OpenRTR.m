% Open a specific file, then read it as 16-bit unsigned integers.
filename = "PR100/estate5m-01.rtr";
fid = fopen(filename);
data = fread(fid, [512, Inf], "uint16");
fclose(fid);
% select a smaller block that is known to contain values, for experimentation
% Note: this is specific to the file
% block of 16x16 values
selection = data([1:16],[501:516]);
% take just the first line of the block (16 x 16-bit integers)
first = selection(1,:);
% create a vector containing 16 x 16-bit zeros
container = zeros(1, 16);
% cycle the first-line values into the container, taking only the
% 14 least significant bits (and leaving the two MSB's as zero)
% note bit 1 = LSB
% First, set up some counters
for(position = 1:8)
  if(position != 1)
    for(i = 1:(position-1)*2)
      container(position) = bitset(container(position), ((2*position)-1-i), bitget(first(position-1), 17-i));
    endfor
  endif
  if(position != 8)
    for(i = 1:(8-position)*2)
      container(position) = bitset(container(position), (15-i), bitget(first(position), 17-(2*position)-i));
    endfor
  endif
endfor
% display the binary values for manual checking of the result
printf("14-bit position 8: ")
%for(i = 4:8)
  bitget(container(8), [1:16])
%endfor
printf("16-bit position 7: ")
%for(i = 4:8)
  bitget(first(7), [1:16])
%endfor
