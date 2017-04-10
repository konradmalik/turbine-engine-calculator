function [] = make_plot( label_on_x, label_on_y, X, Y, hold_switch  )
%w komentarzach zapisywanie (coœ nie do koñca dzia³a)

figure
if hold_switch == 1
    hold on
end
f = plot(X, Y);
set (f, 'LineWidth', 2)
title(strcat(label_on_y, char(40), label_on_x, char(41)));
%title_text = strrep(strcat(label_on_y, char(40), label_on_x, char(41)),'/','');
xlabel(label_on_x);
ylabel(label_on_y);
grid on;
grid minor;
if hold_switch == 1
    hold off
end

set(gcf, 'Color', 'white'); % white bckgr
%print(title_text,'-djpeg','-noui')
end

