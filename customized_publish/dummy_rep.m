%%%
% <latex>
%   \begin{titlepage}
%   \author{Valery Khamenya} 
%   \title{Customize MATLAB publish with XSL-stylesheet}
%   \date{\today}
%   \maketitle
%   \end{titlepage}
% </latex>

%%
% <latex>
% \section*{Introduction}
% \addcontentsline{toc}{section}{Introduction}
% \phantomsection
% </latex>

%%
% This is a short example on how to use Matlab "publish" function to create _comprehensive_ reports.
% The information on MATLAB human-friendly markup features could be found
% <http://www.mathworks.de/de/help/matlab/matlab_prog/marking-up-matlab-comments-for-publishing.html#btfahvo-1 here.> 
%
% publish |main_rep.m| file with: 
%
%   opts.format='latex'
%   opts.stylesheet='custom_mxdom2latex.xsl'
%   publish('main_rep', opts)
%
% Does your target reading audience need to see the MATLAB source code?
% If no, consider to set |opts.showCode=false| in addition before calling |publish| function above.

%%
% The call of MATLAB <matlab:doc('publish') publish> function causes the execution of |main_rep.m|. 
% The graphs generated during the exucution are automatically saved in |html| directory, 
% beside of this, the execution creates a <http://de.wikipedia.org/wiki/Document_Object_Model DOM-object> 
% representing the syntaxical elements of |main_rep.m| file along with the results obtained during the execution.
% The DOM-object is then automatically transformed according to |custom_mxdom2latex.xsl| 
% (see also <http://de.wikipedia.org/wiki/XSL_Transformation XSL-Transformations>).
% The resulting transformation is then saved as |main_rep.tex| text file in |html| directory as well.
% The |main_rep.tex| should be then processed according to the installed LaTeX implementation.
% For example, one could trigger this like |pdflatex main_rep| as for MikTeX.


%%
% <latex>
% \newpage
% \section*{Examples}
% \addcontentsline{toc}{section}{Examples}
% \phantomsection
% </latex>



%% Graphs and their descriptions generated in a loop
% Here is an example how the report parts could be generated within a loop.
% Also, the comment sections right before the function declaration will be published 
% even if the |opts.showCode=false| . Thus, one should rather tune up the comment 
% style either for |opts.showCode=false| or for |opts.showCode=true|. 
% The same is true for the current paragraph 
% that was generated from such a comment section right before the |main| function of the |main_rep.m|.
function main
  x = -5:5
  for i=3:5
    %disp('<latex>\newline </latex>');

    %% 
    % Albeit this sentence is syntactically placed as a comment within a loop (see |main_rep.m|), 
    % it will appear only once in a final report. In oreder to get LaTeX parts to be generated within a loop, 
    % one could use MATLAB <matlab:doc('publish') disp> function.

    disp(['<latex> Here is an example of a $f(x)=x^i, i=', num2str(i) ,'$ plot and this description text generated in the loop. \newline </latex>']);
    
    %set(0, 'DefaultFigureVisible', 'off')
    %set(0, 'DefaultAxesVisible', 'off')
    % fig = figure('visible', 'off');
    %jFrame = get(fig,'JavaFrame');
    %jFrame.setMinimized(true);
    plot(x, x.^i);
    %set(fig, 'visible', 'on');
    snapnow;
    disp(['<latex> \newline \newline </latex>']);
    if i == 3
      1;
      disp(['<latex> \newline Here is an example of the conditional part of the report that is placed in the loop only if $i=3$. \newpage </latex>']);
    end
    
    % disp('<latex>\clearpage </latex>') % trailing whitespace is currently important, otherwise \clearpage will stick to the next character in .tex file.
  end

  local_sub_func

  other_file

end



%% Subcalls of the functions from the same file 
% This paragraph is generated from a comment section right before the |local_sub_func| function definition.
% It is generated independently on whether the |local_sub_func| is called or not. 
function local_sub_func
  %% 
  % The same is true even for any comment section _within_ the body of |local_sub_func|,
  % like this paragraph.
  x = 1:10;
  disp(['<latex>\newline Here is the graph of $f(x)=x^2$ and it was generated from local\_sub\_func:\newline </latex>']);
  plot(x, x .^ 2);
  snapnow
end
