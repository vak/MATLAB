%% This section will not appear in report, because only the main report file is parsed for comments.
%

function external_sub_func
%% This section will not appear in report as well for the reason described above.
%
  x = -3:.1:3;
  disp(['<latex>\newpage \subsection*{Subcalls of the functions from other files} \addcontentsline{toc}{subsection}{Subcalls of the functions from other files} \phantomsection Here is the graph of $f(x)=sin(x)$ and it was generated from external\_sub\_func defined in the other\_file.m (this paragraph is generated using disp, because comment parsing is done only for the top-level .m-file passed to MATLAB publish function.):\newline </latex>']);
  plot(x, sin(x));
  snapnow;
end