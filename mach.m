function v = mach(h, M)
    gamma = 1.4;
    R = 1716.49;
    if(h <= 40000)
        T = 518.69 - (3.5662E-3 * h);
    end
    if(h > 40000)
       T=398;
    end
    v = M*(sqrt(gamma*R*T));
end