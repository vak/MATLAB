% MEMO: 
% 1. install MikTeX
% 2. don't forget to close the resulting pdf-report (if already open) before running this test, 
% otherwise the pdflatex call will fail to re-write the pdf-report file.

report_name = 'dummy_rep';
opts.format = 'latex';
opts.stylesheet = 'custom_mxdom2latex.xsl';
opts.showCode = false;
opts.outputDir = ['output/', mfilename];
%opts.figureSnapMethod = 'getframe';
opts.useNewFigure = false;
% addpath ../src

disp('publishing...');
publish(report_name, opts);


pdflatex_cmd = [' && pdflatex ', report_name];
cmd = ['cd ', opts.outputDir, ...
       pdflatex_cmd, ' > pass1.log', ...
       pdflatex_cmd, ' > pass2.log']; % two times to get the table of contents written on the second pass
disp(['creating pdf-report with pdflatex using this DOS commands: ', cmd]);
dos(cmd);
disp(['Done. The output pdf-report file ', report_name, '.pdf should be stored in ', opts.outputDir, ' sub-directory']);


