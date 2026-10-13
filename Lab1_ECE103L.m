%%%Question 1%%% 
    x = 1:100;
    y = find(mod(x, 2) == 0);

    fprintf("--------Question 1--------");
    fprintf("\n");

    fprintf("x:");
    fprintf("\n");
    disp(x);
    fprintf("\n");
    fprintf("y:");
    fprintf("\n");
    disp(y);
    fprintf("\n");

    clearvars;
%%%Question 2%%%
    t = [0, 0.1, 0.2, 0.3, 0.4];%Time in Seconds%
    f = [10, 15, 20]; %Frequency in Hz%

    A = zeros(5, 3);
    
    for i = 1:5 
        for j = 1:3  

            A(i,j) = 3 .* cos(2 .* pi .* t(i) .* f(j) + 0.1);

        end
    end

    fprintf("--------Question 2--------");
    fprintf("\n");

    fprintf("Frequencies: ");
    fprintf("%d ", f);
    fprintf("\n");
    fprintf("Times: ");
    fprintf("%.1f ", t);
    fprintf("\n");
    fprintf("result:");
    fprintf("\n");
    disp(A);

    clearvars;
%%%Question 3%%%

    iteration = 0.01;
    t = 0;
    A = [ 35, 40, 45; 0, 0, 0];
    Condition = 0;

    function[y] = f1(x,omega)
        y = exp(1.2) .*cos(omega.*x);
    end

    function[y] = f2(x)
        y = x.^3;
    end
     
    for i = 1:3
        while Condition < 10
            Condition = f2(t); % I would not know how to do this without knowing the functions
            if (10 > f1(t,A(1,i))) && (10 > f2(t))
                A(2,i) = t;
            end
            t = t + iteration;
        end
        Condition = 0;
        t = 0;
    end

    fprintf("--------Question 3--------");
    fprintf("\n");

    fprintf("Omega: ");
    fprintf("%d  ", A(1,:));
    fprintf("\n");
    fprintf("t max: ");
    fprintf("%.2f  ", A(2,:));
    fprintf("\n");

    clearvars;
%%%Question 4%%%

    t = linspace(0,1,15);
    
    x = 4 .* cos(2 .* pi .* t + 0.2) + 3 .* sin(pi.^2 .* t);
    
    x_avg = mean(x);
    
    x_max = max(x);
    
    x_min = min(x);
    
    fprintf("--------Question 4--------");
    fprintf("\n");

    fprintf(" Samples of 4cos(2pi *t + 2.0) + 3sin(pi^2 *t):");
    fprintf("\n");
    fprintf("%.6f   ", x);
    fprintf("\n");
    fprintf("Average of samples: %.6f",x_avg);
    fprintf("\n");
    fprintf("Max of samples: %.6f",x_max);
    fprintf("\n");
    fprintf("Min of samples: %.6f",x_min);
    fprintf("\n");
    
    clearvars;
%%%Question 5%%%

    t = 0:0.1:10;

    function[y] = s1(x)
        y = sin(2.*pi.*0.2.*x);
    end

    function[y] = s2(x)
        y = sin(2.*pi.*0.425.*x + 0.4);
    end

    function[y] = s3(x)
        y = s1(x) + s2(x);
    end

    figure(1);
    plot(t, s1(t), "Red");
    hold on
    plot(t, s2(t), "Blue");
    hold on
    plot(t, s3(t), "Green");
    legend("s1",  "s2", "s3");
    xlabel("t");
    ylabel("S(t)");
    title("Question 5");
    hold off
    
    clearvars;
%%%Question 6%%%
    
    function[y] = MySinc(x)
        if x == 0
            y = 1;
        else
            y = sin(x) ./ x;
        end
    end

    x = linspace(-2.*pi, 2.*pi);

    figure(2);
    plot(x,sinc(x), "Black");% apparently the matlab sinc uses sin(pi x)/ pi x
    hold on
    plot(x, MySinc(x), "Magenta");
    legend("sinc()","MySinc()");
    title("Question 6");