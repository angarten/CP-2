function WI = WI(k)
for s = 1:length(k)
    if k(s) == 1
        WI(s) = 1;
    else
        WI(s) = 2;
    end
end
end