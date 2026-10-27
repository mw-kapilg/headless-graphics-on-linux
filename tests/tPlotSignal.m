classdef tPlotSignal < matlab.unittest.TestCase
    % Tests for plotSignal and showSummary.

    methods (Test)
        function plotsBothLines(testCase)
            t = (0:0.1:2)';
            fig = plotSignal(t, sin(t));
            testCase.addTeardown(@close, fig);
            lines = findobj(fig, Type="line");
            testCase.verifyNumElements(lines, 2);
        end

        function exportsImage(testCase)
            import matlab.unittest.fixtures.TemporaryFolderFixture
            folder = testCase.applyFixture(TemporaryFolderFixture).Folder;
            outputFile = fullfile(folder, "signal.png");
            t = (0:0.1:2)';
            fig = plotSignal(t, cos(t), outputFile);
            testCase.addTeardown(@close, fig);
            testCase.verifyTrue(isfile(outputFile));
            info = imfinfo(outputFile);
            testCase.verifyGreaterThan(info.Width, 0);
        end

        function summaryWindowShowsStatistics(testCase)
            fig = showSummary([1; 2; 3; 6]);
            testCase.addTeardown(@delete, fig);
            meanLabel = findobj(fig, Tag="meanLabel");
            testCase.verifyEqual(string(meanLabel.Text), "Mean: 3.000");
        end
    end
end
