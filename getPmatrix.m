function P = getPmatrix(scale)

P = zeros(128,scale*128);

    for l=1:(scale*128)
        for k=1:128
            for n=0:127
                P(k,l) = P(k,l)+exp(1i*2*pi*(n/128)*((k-1)-(l-1)/4));
            end
        end
    end
end