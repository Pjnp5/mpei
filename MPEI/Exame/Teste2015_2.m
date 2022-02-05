%% a
H =[0.84 0.1 0 0.5 ; 0.1 0.7 0 0.1 ; 0.05 0.1 0.8 0.1 ; 0.01 0.1 0.2 0.3];
T = [1
     2
     10
     5];
T7 = H^7 * T;
fprintf("Toneladas em milhões:S\nAngola - %f\nBrasil - %f\nChile - %f\nDinamarca - %f\n",T7(1),T7(2),T7(3),T7(4));

%% b
QuantMax(H,T);

%% c
Calculo(H,T,2);


function max = QuantMax(H,T)
     % the sequence of states will be saved in the vector "state"
     % initially, the vector contains only the initial state:
     % keep moving from state to state until state "last" is reached:
     estado = T;
     max = [0; 0; 0; 0];
     for trade = 1:100
         for i = 1:4
            if (estado(i) > max(i))
                max(i) = estado(i);
            end
         end
         estado = H^trade * T;
     end
end

function max = Calculo(H,T, Value)
     % the sequence of states will be saved in the vector "state"
     % initially, the vector contains only the initial state:
     % keep moving from state to state until state "last" is reached:
     estado = T;
     max = [0; 0; 0; 0];
     trade = 0;
     while 1
            trade = trade + 1;
            if (estado(4) < Value)
                estado
               fprintf("No dia 1 do mês %d a Dinamarca ficou com menos de 2 milhões de Toneladas", trade);
               break
            end
         estado = H^trade * T;
     end
end