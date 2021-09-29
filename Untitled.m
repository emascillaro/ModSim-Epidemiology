si = 99
ans = [];
count = 1
for count = 1:30
    sf = si - si/90;
    ans(count) = sf;
    count = count + 1;
    si = sf;
end

disp(ans)