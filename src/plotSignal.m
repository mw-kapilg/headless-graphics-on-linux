function fig = plotSignal(t, x, outputFile)
%PLOTSIGNAL Plot a signal and its moving average, optionally saving an image.
%   FIG = PLOTSIGNAL(T, X) plots X against T with a 5-sample moving average
%   and returns the figure.
%
%   FIG = PLOTSIGNAL(T, X, OUTPUTFILE) also saves the figure to OUTPUTFILE
%   (for example "signal.png").

arguments
    t (:,1) double
    x (:,1) double
    outputFile (1,1) string = ""
end

fig = figure;
ax = axes(fig);
plot(ax, t, x, DisplayName="Signal");
hold(ax, "on");
plot(ax, t, movingAverage(x, 5), LineWidth=2, DisplayName="Moving average");
hold(ax, "off");
xlabel(ax, "Time (s)");
ylabel(ax, "Amplitude");
legend(ax);

if outputFile ~= ""
    exportgraphics(ax, outputFile);
end
end
