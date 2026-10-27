function fig = showSummary(x)
%SHOWSUMMARY Show summary statistics of a signal in a small UI window.
%   FIG = SHOWSUMMARY(X) opens a uifigure listing the mean, minimum, and
%   maximum of X and returns the figure.

arguments
    x (:,1) double
end

fig = uifigure(Name="Signal summary");
grid = uigridlayout(fig, [3 1]);
uilabel(grid, Text=sprintf("Mean: %.3f", mean(x)), Tag="meanLabel");
uilabel(grid, Text=sprintf("Min: %.3f", min(x)), Tag="minLabel");
uilabel(grid, Text=sprintf("Max: %.3f", max(x)), Tag="maxLabel");
end
