% Document Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{haunt}
\LoadClass[11pt,a4paper,twocolumn]{report}

% Include
\RequirePackage{include/bhh}

% Layout
\usepackage[a4paper,includeheadfoot,margin=1.25cm]{geometry}
\RequirePackage{indentfirst}
\setcounter{tocdepth}{1}

% Spacing
\RequirePackage{enumitem}
\setlength{\columnsep}{1cm}
\setlength{\parindent}{0em}
\setlength{\parskip}{0.25em}
\setlist{leftmargin=1em,font=\bfseries}

% Title
\RequirePackage{titlesec}
\titlespacing{\chapter}{0pt}{-2em}{2em}
\titleformat{\chapter}[hang]{\centering\normalfont\huge\bfseries}{Haunt\ \thechapter}{1em}{}

% Haunt Story
\newenvironment{HauntStory}{%
  % \setlength{\parindent}{0em}%
  \FontStory%
}{%
}

% Haunt Section
\makeatletter
\newcommand\cdotfill{%%
  \leavevmode\cleaders\hb@xt@.44em{\hss$·$\hss}\hfill\kern\z@%
}
\makeatother

\newcommand{\HauntSection}[1]{\bigbreak\noindent{\bfseries\Large#1}\smallbreak}

\newcommand{\HauntMobStatusSection}[1]{\bigbreak\noindent{\bfseries\LARGE※\cdotfill#1\cdotfill※}\null\smallbreak}
\newcommand{\HauntMobStatus}[1]{\noindent{\bfseries\hfill\large#1\hfill}\null\smallbreak}
